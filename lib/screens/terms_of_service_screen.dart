import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Terms of Service',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
                // Isi dari Terms of Service disini
                "Welcome to Secure Notes! These terms of service ('Terms') govern your use of the Secure Notes mobile application (the 'App'). By accessing or using the App, you agree to be bound by these Terms and all applicable laws and regulations. If you do not agree with these Terms, please do not access or use the App.\n\nTerms of Service \nIntroduction\nWelcome to Secure Notes! These terms of service ('Terms') govern your use of the Secure Notes mobile application (the 'App'). By accessing or using the App, you agree to be bound by these Terms and all applicable laws and regulations. If you do not agree with these Terms, please do not access or use the App.\nUse of the App\nYou must be at least 18 years old to use the App.\nYou agree to use the App only for lawful purposes and in accordance with these Terms. You are responsible for maintaining the confidentiality of your account and password. Intellectual Property Rights The App and its original content, features, and functionality are owned by Secure Notes and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.\n\nLimitation of Liability\nIn no event shall Secure Notes, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.\nGoverning Law\nThese Terms shall be governed and construed in accordance with the laws of [your jurisdiction], without regard to its conflict of law provisions.\nChanges to These Terms\nWe may revise these Terms from time to time. The most current version will always be posted on this page. By continuing to access or use the App after revisions become effective, you agree to be bound by the revised Terms.\n\nContact Us\nIf you have any questions about these Terms, please contact us at contact@example.com."
                // Lanjutkan dengan konten Terms of Service sesuai dengan format yang telah dibuat sebelumnya
                ),
          ],
        ),
      ),
    );
  }
}
