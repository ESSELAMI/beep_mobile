import 'package:beep_mobile/app/controllers/home.dart';
// import 'package:beep_mobile/app/views/screens/online_requests/sick_leave/components/pick_image_bottom_sheet.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HistoryWidget extends GetView<HomeController> {
  const HistoryWidget({Key? key}) : super(key: key);

// Create a key
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          title: Text(LocaleKeys.label_history.tr,
              textAlign: TextAlign.center,
              style: AppTheme.getTextStyle(
                  AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
                  fontWeight: 600)),
        ),
        body: controller.scannedProducts.isEmpty
            ? Center(
                child: Text(
                LocaleKeys.error_no_results.tr,
                style: const TextStyle(fontSize: 24),
              ))
            : ListView.builder(
                itemCount: controller.scannedProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Card(
                      child: ListTile(
                        title: Text(
                            controller.scannedProducts[index].codeBarre ?? ''),
                        subtitle: Text(
                            controller.scannedProducts[index].nomAr.toString()),
                        trailing: ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Copy button
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.copy),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text: controller
                                        .scannedProducts[index].codeBarre));
                              },
                            ),
                            // Remove button
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.trash,
                                  color: Colors.red),
                              onPressed: () {
                                controller.deleteProduct(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
