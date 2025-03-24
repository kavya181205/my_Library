import 'dart:async';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isButtonDisabled = true;
  int _timerSeconds = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        setState(() {
          _isButtonDisabled = false;
        });
        _timer.cancel();
      }
    });
  }

  void _submitOtp() {
    if (_otpController.text.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Verified Successfully!')),
      );
      // TODO: Implement actual OTP verification logic here
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the 6-digit OTP sent to your mobile/email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // OTP Input Field
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter OTP',
                counterText: '',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Submit OTP Button
            ElevatedButton(
              onPressed: _submitOtp,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Verify OTP'),
            ),
            const SizedBox(height: 20),

            // Resend OTP Section
            TextButton(
              onPressed: _isButtonDisabled
                  ? null
                  : () {
                      setState(() {
                        _isButtonDisabled = true;
                        _timerSeconds = 30;
                      });
                      _startResendTimer();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('New OTP Sent!')),
                      );
                    },
              child: Text(
                _isButtonDisabled
                    ? 'Resend OTP in $_timerSeconds seconds'
                    : 'Resend OTP',
                style: TextStyle(
                  color: _isButtonDisabled ? Colors.grey : Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
