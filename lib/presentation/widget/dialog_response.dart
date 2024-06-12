import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

enum DialogType { success, failed, loading, info }

class DialogResponse {
  final String? message;
  final DialogType? dialogType;
  final BuildContext context;
  ProgressDialog pr;

  DialogResponse({
    this.message,
    this.dialogType,
    required this.context,
  }) : pr = ProgressDialog(context) {
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal,
        isDismissible: dialogType == DialogType.loading ? false : true,
        showLogs: true);
  }
  Future<bool> show() async {
    pr.style(
      message: DialogType.loading == dialogType ? "Loading..." : message ?? '',
      borderRadius: 10.0,
      progressWidget: DialogType.loading == dialogType
          ? const CircularProgressIndicator()
          : DialogType.success == dialogType
              ? const Icon(Icons.check_circle, color: Colors.green, size: 50)
              : const Icon(Icons.error, color: Colors.red, size: 50),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: const TextStyle(
          color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600),
    );
    return await pr.show();
  }

  Future<bool> hide() async {
    if (pr.isShowing()) {
      return await pr.hide();
    }
    return false;
  }
}
