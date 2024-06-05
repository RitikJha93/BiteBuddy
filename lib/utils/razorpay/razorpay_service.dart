import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService extends GetxService {
  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }

  void openCheckout(
      {required double amount,
      required String contact,
      required String email}) {
    var options = {
      'key':
          dotenv.env['RAZORPAY_TEST_KEY'], // Replace with your Razorpay API key
      'amount': (amount * 100).toInt(), // Amount in paise
      'name': 'Test Payment',
      'description': 'Payment for the order',
      'prefill': {
        'contact': contact,
        'email': email,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    HelperFunctions.showSnackbar(
        'payment Success , Payment ID : ${response.paymentId}',
        TColors.successColor);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    HelperFunctions.showSnackbar('Payment Cancelled', TColors.errorColor);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar('External Wallet', 'Wallet Name: ${response.walletName}');
  }
}
