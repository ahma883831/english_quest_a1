import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'main.dart';

const int kDailyReminderNotificationId = 1001;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static bool _initialized = false;

  // ------------------------------------------------------------
  // INITIALIZATION
  // ------------------------------------------------------------

  static Future<void> init() async {
    if (_initialized) return;

    tzdata.initializeTimeZones();

    // Try to determine the device timezone.
    try {
      final String timeZoneName =
          DateTime.now().timeZoneName;

      tz.setLocalLocation(
        tz.getLocation(timeZoneName),
      );
    } catch (_) {
      // Keep timezone package default location.
    }

    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosInit =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidInit,
        iOS: iosInit,
      ),
    );

    // Android 13+ notification permission.
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // iOS notification permission.
    await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    _initialized = true;
  }

  // ------------------------------------------------------------
  // SAVED SETTINGS
  // ------------------------------------------------------------

  static bool isEnabled() {
    return AppStorage.getInt(
          'reminder_enabled',
          0,
        ) ==
        1;
  }

  static int savedHour() {
    return AppStorage.getInt(
      'reminder_hour',
      20,
    );
  }

  static int savedMinute() {
    return AppStorage.getInt(
      'reminder_minute',
      0,
    );
  }

  // ------------------------------------------------------------
  // SCHEDULE
  // ------------------------------------------------------------

  static Future<void> scheduleDaily({
    required int hour,
    required int minute,
  }) async {
    // Make absolutely sure the plugin is initialized.
    if (!_initialized) {
      await init();
    }

    await AppStorage.saveInt(
      'reminder_enabled',
      1,
    );

    await AppStorage.saveInt(
      'reminder_hour',
      hour,
    );

    await AppStorage.saveInt(
      'reminder_minute',
      minute,
    );

    final tz.TZDateTime scheduledDate =
        _nextInstanceOf(hour, minute);

    await _plugin.zonedSchedule(
      kDailyReminderNotificationId,
      'وقت تمرین انگلیسیه! 🚀',
      'چند دقیقه وقت بذار و درس امروزت رو کامل کن، استریکت رو نگه دار 🔥',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder_channel',
          'یادآوری روزانه',
          channelDescription:
              'یادآوری روزانه برای تمرین انگلیسی',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode:
          AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents:
          DateTimeComponents.time,
    );
  }

  // ------------------------------------------------------------
  // CANCEL
  // ------------------------------------------------------------

  static Future<void> cancelDaily() async {
    if (!_initialized) {
      await init();
    }

    await AppStorage.saveInt(
      'reminder_enabled',
      0,
    );

    await _plugin.cancel(
      kDailyReminderNotificationId,
    );
  }

  // ------------------------------------------------------------
  // RESCHEDULE
  // ------------------------------------------------------------

  static Future<void> rescheduleFromSavedSettings() async {
    if (!isEnabled()) return;

    await scheduleDaily(
      hour: savedHour(),
      minute: savedMinute(),
    );
  }

  // ------------------------------------------------------------
  // NEXT NOTIFICATION TIME
  // ------------------------------------------------------------

  static tz.TZDateTime _nextInstanceOf(
    int hour,
    int minute,
  ) {
    final tz.TZDateTime now =
        tz.TZDateTime.now(tz.local);

    tz.TZDateTime scheduled =
        tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(
        const Duration(days: 1),
      );
    }

    return scheduled;
  }
}

// ============================================================
// REMINDER SETTINGS PAGE
// ============================================================

class ReminderSettingsPage extends StatefulWidget {
  const ReminderSettingsPage({super.key});

  @override
  State<ReminderSettingsPage> createState() =>
      _ReminderSettingsPageState();
}

class _ReminderSettingsPageState
    extends State<ReminderSettingsPage> {
  late bool enabled;
  late TimeOfDay time;

  bool saving = false;

  @override
  void initState() {
    super.initState();

    enabled =
        NotificationService.isEnabled();

    time = TimeOfDay(
      hour: NotificationService.savedHour(),
      minute: NotificationService.savedMinute(),
    );
  }

  // ------------------------------------------------------------
  // PICK TIME
  // ------------------------------------------------------------

  Future<void> _pickTime() async {
    final TimeOfDay? picked =
        await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:
                Theme.of(context)
                    .colorScheme
                    .copyWith(
                      primary:
                          const Color(0xFF00E5FF),
                      surface:
                          const Color(0xFF10182E),
                    ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        time = picked;
      });
    }
  }

  // ------------------------------------------------------------
  // SAVE
  // ------------------------------------------------------------

  Future<void> _save() async {
    setState(() {
      saving = true;
    });

    try {
      if (enabled) {
        await NotificationService.scheduleDaily(
          hour: time.hour,
          minute: time.minute,
        );
      } else {
        await NotificationService.cancelDaily();
      }

      if (!mounted) return;

      setState(() {
        saving = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              enabled
                  ? 'یادآوری روزانه فعال شد ✅'
                  : 'یادآوری روزانه خاموش شد',
            ),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        saving = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          duration:
              const Duration(seconds: 6),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'خطا در تنظیم یادآوری:\n$e',
            ),
          ),
        ),
      );
    }
  }

  // ------------------------------------------------------------
  // FORMAT TIME
  // ------------------------------------------------------------

  String _formatTime(TimeOfDay t) {
    final String h =
        t.hour.toString().padLeft(2, '0');

    final String m =
        t.minute.toString().padLeft(2, '0');

    return '$h:$m';
  }

  // ------------------------------------------------------------
  // UI
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            'یادآوری روزانه',
          ),
        ),
        backgroundColor:
            Colors.transparent,
      ),
      body: Stack(
        children: [
          const NeonBackground(),

          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.all(20),
              child: Directionality(
                textDirection:
                    TextDirection.rtl,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🔔',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const Text(
                      'یادت نره تمرین کنی!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.w900,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    const Text(
                      'هر روز، سر یه ساعت مشخص یه اعلان بهت میدیم تا درست رو فراموش نکنی.',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(
                      height: 26,
                    ),

                    Container(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration:
                          BoxDecoration(
                        color: Colors.white
                            .withOpacity(.035),
                        borderRadius:
                            BorderRadius
                                .circular(18),
                        border: Border.all(
                          color: const Color(
                            0xFF00E5FF,
                          ).withOpacity(.18),
                        ),
                      ),
                      child:
                          SwitchListTile(
                        value: enabled,
                        onChanged:
                            (bool value) {
                          setState(() {
                            enabled =
                                value;
                          });
                        },
                        activeColor:
                            const Color(
                          0xFF00E5FF,
                        ),
                        title:
                            const Text(
                          'یادآوری روزانه فعال باشه',
                          style: TextStyle(
                            fontWeight:
                                FontWeight
                                    .w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    AnimatedOpacity(
                      opacity:
                          enabled ? 1.0 : .35,
                      duration:
                          const Duration(
                        milliseconds: 200,
                      ),
                      child: IgnorePointer(
                        ignoring: !enabled,
                        child: InkWell(
                          borderRadius:
                              BorderRadius
                                  .circular(18),
                          onTap: _pickTime,
                          child:
                              Container(
                            width:
                                double.infinity,
                            padding:
                                const EdgeInsets
                                    .all(18),
                            decoration:
                                BoxDecoration(
                              color: Colors
                                  .white
                                  .withOpacity(
                                .035,
                              ),
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                18,
                              ),
                              border:
                                  Border.all(
                                color:
                                    const Color(
                                  0xFF00E5FF,
                                ).withOpacity(
                                  .18,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons
                                      .schedule_rounded,
                                  color:
                                      Color(
                                    0xFF00E5FF,
                                  ),
                                ),

                                const SizedBox(
                                  width: 12,
                                ),

                                const Expanded(
                                  child: Text(
                                    'ساعت اعلان',
                                    style:
                                        TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .w600,
                                    ),
                                  ),
                                ),

                                Text(
                                  _formatTime(
                                    time,
                                  ),
                                  style:
                                      const TextStyle(
                                    fontSize: 18,
                                    color:
                                        Color(
                                      0xFF00E5FF,
                                    ),
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      width:
                          double.infinity,
                      child:
                          ElevatedButton(
                        onPressed:
                            saving
                                ? null
                                : _save,
                        style:
                            ElevatedButton
                                .styleFrom(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                            vertical: 14,
                          ),
                        ),
                        child: saving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    CircularProgressIndicator(
                                  strokeWidth:
                                      2,
                                ),
                              )
                            : const Text(
                                'ذخیره',
                                style:
                                    TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
