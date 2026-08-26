// ============================================================
// DAILY REMINDER — local notification each day at a chosen time,
// nudging the user to open the app and keep their streak alive.
// Uses flutter_local_notifications + timezone for exact daily scheduling.
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'main.dart'; // AppStorage, NeonBackground

const int kDailyReminderNotificationId = 1001;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    tzdata.initializeTimeZones();
    // Falls back to UTC if the device zone can't be resolved; scheduling
    // still works, it just uses the device's local clock via tz.local below
    // once a valid location is set by the platform.
    try {
      tz.setLocalLocation(tz.getLocation(DateTime.now().timeZoneName));
    } catch (_) {
      // Leave default location; zonedSchedule still uses TZDateTime.now(tz.local).
    }

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      const InitializationSettings(android: androidInit, iOS: iosInit),
    );

    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    await _plugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    _initialized = true;
  }

  static bool isEnabled() => AppStorage.getInt('reminder_enabled', 0) == 1;
  static int savedHour() => AppStorage.getInt('reminder_hour', 20);
  static int savedMinute() => AppStorage.getInt('reminder_minute', 0);

  /// Re-applies whatever the user last saved, e.g. after an app restart
  /// (Android notification schedules survive reboot only if re-armed,
  /// and this keeps behavior consistent across platforms).
  static Future<void> rescheduleFromSavedSettings() async {
    if (isEnabled()) {
      await scheduleDaily(hour: savedHour(), minute: savedMinute());
    }
  }

  static Future<void> scheduleDaily({required int hour, required int minute}) async {
    await AppStorage.saveInt('reminder_enabled', 1);
    await AppStorage.saveInt('reminder_hour', hour);
    await AppStorage.saveInt('reminder_minute', minute);

    await _plugin.zonedSchedule(
      kDailyReminderNotificationId,
      'وقت تمرین انگلیسیه! 🚀',
      'چند دقیقه وقت بذار و درس امروزت رو کامل کن، استریکت رو نگه دار 🔥',
      _nextInstanceOf(hour, minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder_channel',
          'یادآوری روزانه',
          channelDescription: 'یادآوری روزانه برای تمرین انگلیسی',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // repeats daily at this clock time
    );
  }

  static Future<void> cancelDaily() async {
    await AppStorage.saveInt('reminder_enabled', 0);
    await _plugin.cancel(kDailyReminderNotificationId);
  }

  static tz.TZDateTime _nextInstanceOf(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}

// ============================================================
// UI — let the user turn the reminder on/off and pick a time
// ============================================================
class ReminderSettingsPage extends StatefulWidget {
  const ReminderSettingsPage({super.key});
  @override
  State<ReminderSettingsPage> createState() => _ReminderSettingsPageState();
}

class _ReminderSettingsPageState extends State<ReminderSettingsPage> {
  late bool enabled;
  late TimeOfDay time;
  bool saving = false;

  @override
  void initState() {
    super.initState();
    enabled = NotificationService.isEnabled();
    time = TimeOfDay(hour: NotificationService.savedHour(), minute: NotificationService.savedMinute());
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFF00E5FF),
                surface: const Color(0xFF10182E),
              ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => time = picked);
  }

  Future<void> _save() async {
    setState(() => saving = true);
    if (enabled) {
      await NotificationService.scheduleDaily(hour: time.hour, minute: time.minute);
    } else {
      await NotificationService.cancelDaily();
    }
    setState(() => saving = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(enabled ? 'یادآوری روزانه فعال شد ✅' : 'یادآوری روزانه خاموش شد'),
          ),
        ),
      );
    }
  }

  String _formatTime(TimeOfDay t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Directionality(textDirection: TextDirection.rtl, child: Text('یادآوری روزانه')),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          const NeonBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('🔔', style: TextStyle(fontSize: 50)),
                  const SizedBox(height: 10),
                  const Text('یادت نره تمرین کنی!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  const Text(
                    'هر روز، سر یه ساعت مشخص یه اعلان بهت میدیم تا درست رو فراموش نکنی.',
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                  const SizedBox(height: 26),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.035),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.18)),
                    ),
                    child: SwitchListTile(
                      value: enabled,
                      onChanged: (v) => setState(() => enabled = v),
                      activeColor: const Color(0xFF00E5FF),
                      title: const Text('یادآوری روزانه فعال باشه', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AnimatedOpacity(
                    opacity: enabled ? 1 : .35,
                    duration: const Duration(milliseconds: 200),
                    child: IgnorePointer(
                      ignoring: !enabled,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: _pickTime,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.035),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: const Color(0xFF00E5FF).withOpacity(.18)),
                          ),
                          child: Row(children: [
                            const Icon(Icons.schedule_rounded, color: Color(0xFF00E5FF)),
                            const SizedBox(width: 12),
                            const Expanded(child: Text('ساعت اعلان', style: TextStyle(fontWeight: FontWeight.w600))),
                            Text(_formatTime(time), style: const TextStyle(fontSize: 18, color: Color(0xFF00E5FF), fontWeight: FontWeight.bold)),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: saving ? null : _save,
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                      child: saving
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Text('ذخیره', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      );
}
