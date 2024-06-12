import 'package:flutter/material.dart';

enum SnackType { success, failed, loading, info }

Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
    snackBarResponse(
        {required BuildContext context,
        required SnackType snackType,
        int? duration,
        String? message}) async {
  ScaffoldMessenger.of(context).clearSnackBars();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
        child: (snackType == SnackType.success)
            ? successDialog(message)
            : (snackType == SnackType.failed)
                ? failedDialog(message)
                : (snackType == SnackType.loading)
                    ? loadingDialog(message)
                    : infoDialog(message),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      duration: Duration(
          seconds: duration ?? (snackType == SnackType.loading ? 120 : 2)),
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Row infoDialog(String? message) {
  return Row(
    children: [
      const Icon(
        Icons.info_outline_rounded,
        color: Colors.orange,
        size: 12,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: snackText(message ?? 'Info'),
      ),
    ],
  );
}

Row loadingDialog(String? message) {
  return Row(
    children: [
      const SizedBox(
        height: 12,
        width: 12,
        child: Center(child: CircularProgressIndicator()),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: snackText('Loading'),
      ),
    ],
  );
}

Row failedDialog(String? message) {
  return Row(
    children: [
      const Icon(
        Icons.cancel_outlined,
        color: Colors.red,
        size: 12,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: snackText(message ?? 'Failed'),
      ),
    ],
  );
}

Text snackText(String message) {
  return Text(
    message,
    overflow: TextOverflow.clip,
    maxLines: 3,
    style: const TextStyle(fontSize: 12),
  );
}

Row successDialog(String? message) {
  return Row(
    children: [
      const Icon(
        Icons.check_circle_outline_rounded,
        color: Colors.green,
        size: 12,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: snackText(message ?? 'Success'),
      ),
    ],
  );
}
