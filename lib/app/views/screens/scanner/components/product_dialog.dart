import 'package:beep_mobile/app/controllers/home.dart';
import 'package:beep_mobile/app/views/widgets/button/button.dart';

import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductDialog extends GetView<HomeController> {
  final Product? product;
  const ProductDialog(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Card(
        child: Container(
          padding: FxSpacing.all(20),
          decoration: BoxDecoration(
            color: AppTheme.getThemeFromThemeMode().backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        LocaleKeys.label_search_product.tr,
                        style: AppTheme.getTextStyle(
                            AppTheme.getThemeFromThemeMode()
                                .textTheme
                                .bodyText1,
                            fontWeight: 600),
                      ),
                    ),
                  ),
                  Icon(
                    MdiIcons.shieldCheck,
                    color: AppTheme.getThemeFromThemeMode().colorScheme.primary,
                  )
                ],
              ),
              Divider(
                color:
                    AppTheme.getThemeFromThemeMode().colorScheme.onBackground,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: TextFormField(
                  autofocus: true,
                  controller: controller.searchBarcodeController,
                  // initialValue: product!.barcode,
                  style: AppTheme.getTextStyle(
                      AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
                      // height: 2,
                      letterSpacing: 0.1,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground,
                      fontWeight: 700),
                  decoration: InputDecoration(
                    // prefixText: "+91 ",
                    hintStyle: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
                        letterSpacing: 0.1,
                        color: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .onBackground,
                        fontWeight: 700),
                    hintText: LocaleKeys.label_qrcode.tr,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: LocaleKeys.label_qrcode.tr,
                    labelStyle: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                        fontWeight: 800,
                        color: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .onBackground),
                    prefixStyle: AppTheme.getTextStyle(
                        AppTheme.getThemeFromThemeMode().textTheme.subtitle2,
                        letterSpacing: 0.1,
                        color: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .onBackground,
                        fontWeight: 500),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none),
                    filled: true,
                    // fillColor: AppTheme.getThemeFromThemeMode()
                    //     .colorScheme
                    //     .onBackground,
                    prefixIcon: Icon(
                      MdiIcons.barcode,
                      size: 22,
                      color: AppTheme.getThemeFromThemeMode()
                          .colorScheme
                          .onBackground
                          .withAlpha(200),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              Container(
                  margin: FxSpacing.top(24),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FxButton(
                          backgroundColor: AppTheme.getThemeFromThemeMode()
                              .colorScheme
                              .primary,
                          borderRadiusAll: 4,
                          elevation: 0,
                          onPressed: () {
                            controller.getProduct(
                                controller.searchBarcodeController.text);
                            Navigator.pop(context);
                          },
                          child: Text(
                            LocaleKeys.label_search.tr,
                            style: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .bodyText1,
                                fontWeight: 600,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onPrimary),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
