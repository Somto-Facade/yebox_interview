import 'package:flutter/material.dart';
import 'package:yebox_interview/di/get_it.dart';

import '../constants/sizes_constants.dart';
import 'navigation.dart';

abstract class DialogServices {
  Future<void> errorMessageDialog({required String errorMessage});
}

class DialogServicesImpl implements DialogServices {

  @override
  Future<void> errorMessageDialog({required String errorMessage}) async {
    await showDialog(
        context: getItInstance<NavigationServiceImpl>().navigationKey.currentContext!,
        barrierDismissible: true,
        builder: (context) => Dialog(
          insetPadding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: Container(
            padding: const EdgeInsets.all(40.0),
            height: 280,
            width: 250,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: SizedBox(
                      width: 180,
                      child: Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                ),
                GestureDetector(
                  onTap: (){
                    getItInstance<NavigationServiceImpl>().pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    height: Sizes.dimen_35,
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
