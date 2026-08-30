// ============================================================
// UPDATE SERVICE
// On app startup, asks GitHub's public API for the latest
// Release of this repo (created automatically by the CI workflow
// on every successful build — see build_flutter_apk.yml) and
// compares its tag to the build number baked into this very APK
// (app_version.dart, generated fresh by that same workflow).
// If they differ, a newer build exists: show a dialog with a
// direct link to download and install it.
//
// Never throws into the UI — any network/parse failure is
// swallowed, since a failed update check must never crash or
// block the app.
// ============================================================
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'app_version.dart';

// Change this if the repo ever moves or is renamed.
const String _kReleasesApi =
    'https://api.github.com/repos/ahma883831/english_quest_a1/releases/latest';

Future<void> checkForUpdateAndPrompt(BuildContext context) async {
  try {
    final res = await http
        .get(Uri.parse(_kReleasesApi), headers: {'Accept': 'application/vnd.github+json'})
        .timeout(const Duration(seconds: 8));
    if (res.statusCode != 200) return;

    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final latestTag = data['tag_name'] as String?;
    if (latestTag == null || latestTag == kAppVersion) return; // already up to date

    final assets = (data['assets'] as List?) ?? [];
    if (assets.isEmpty) return;
    final apkUrl = assets.first['browser_download_url'] as String?;
    if (apkUrl == null) return;

    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF10182E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Directionality(
          textDirection: TextDirection.rtl,
          child: Text('🚀 نسخه‌ی جدید موجوده!'),
        ),
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            'یک نسخه‌ی جدیدتر از اپ ($latestTag) منتشر شده. می‌خوای الان دانلودش کنی و نصب کنی؟',
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('بعداً', style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await launchUrl(Uri.parse(apkUrl), mode: LaunchMode.externalApplication);
            },
            child: const Text('دانلود و نصب'),
          ),
        ],
      ),
    );
  } catch (_) {
    // offline, rate-limited, malformed response, etc — fail silently.
  }
}
