import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
                // Isi dari Privacy Policy disini
                "Welcome to Secure Notes! We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the 'App'). Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy, please do not access the application.\n\nIntroduction\nWelcome to Secure Notes! We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the 'App'). Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy, please do not access the application.\n\nInformation We Collect\nWe may collect certain information about you when you use the App, including:\n\nPersonal Information: Name, email address, password (stored securely).\nNon-Personal Information: Usage data such as app interactions, preferences, and settings.\nHow We Use Your Information\nWe use the information we collect in the following ways:\nTo provide and maintain the App's functionality.\nTo improve user experience and customer service.\nTo personalize user experience and deliver content relevant to your interests.\nTo send periodic emails regarding updates or other information related to the App.\nSharing Your Information\nWe do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our app, conducting our business, or servicing you, as long as those parties agree to keep this information confidential.\n\nSecurity of Your Information\nWe implement reasonable security measures to protect the security of your information. However, no method of transmission over the internet or electronic storage is completely secure, so we cannot guarantee absolute security.\n\nChanges to This Privacy Policy\nWe may update this privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on this page. You are advised to review this privacy policy periodically for any changes.\n\nContact Us\nIf you have any questions about this privacy policy, please contact us at contact@example.com."),
          ],
        ),
      ),
    );
  }
}
