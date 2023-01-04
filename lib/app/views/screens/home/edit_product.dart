import 'package:beep_mobile/app/controllers/home.dart';
// import 'package:beep_mobile/app/views/screens/online_requests/sick_leave/components/pick_image_bottom_sheet.dart';
import 'package:beep_mobile/app/views/widgets/widgets.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductEditWidget extends GetView<HomeController> {
  const ProductEditWidget({Key? key}) : super(key: key);

  _pickDate(BuildContext context, int index) async {
    await showDatePicker(
      fieldLabelText: "mm/dd/yyyy",
      fieldHintText: "mm/dd/yyyy",
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((value) {
      // controller.changePickedDate(value!, index);
    });
  }

// Create a key
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          leading: InkWell(
            onTap: () async {
              // final thenTo = Get.rootDelegate.currentConfiguration!
              //     .currentPage!.parameters?['then'];
              // Get.rootDelegate.toNamed(thenTo ?? Routes.HOME);

              Navigator.pop(context);
            },
            child: Icon(
              Get.locale.toString() == "ar"
                  ? MdiIcons.chevronRight
                  : MdiIcons.chevronLeft,
            ),
          ),
          title: Text(LocaleKeys.label_product_info.tr,
              textAlign: TextAlign.center,
              style: AppTheme.getTextStyle(
                  AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
                  fontWeight: 600)),
        ),
        body: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              Navigator.pop(context);
            }
          },
          child: ListView(
            padding: FxSpacing.fromLTRB(20, 24, 20, 20),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          LocaleKeys.label_information.tr,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .subtitle2,
                              fontWeight: 700),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller.editBarcodeController,
                          // initialValue: product!.barcode,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              // height: 2,
                              letterSpacing: 0.1,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            // prefixText: "+91 ",
                            hintStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                letterSpacing: 0.1,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                                fontWeight: 500),
                            hintText: LocaleKeys.label_qrcode.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_qrcode.tr,
                            labelStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                fontWeight: 800,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground),
                            prefixStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
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
                            fillColor: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .background,
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
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          // initialValue: product!.codeBarre,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "null";
                          //   }
                          // },
                          // controller: controller.numberOfDaysController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              // height: 2,
                              letterSpacing: 0.1,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            // prefixText: "+91 ",
                            hintStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                letterSpacing: 0.1,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                                fontWeight: 500),
                            hintText: LocaleKeys.label_brand.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_brand.tr,
                            labelStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                fontWeight: 800,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground),
                            prefixStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
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
                            fillColor: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .background,
                            prefixIcon: Icon(
                              MdiIcons.store,
                              size: 22,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(200),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(0),
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller.editNomFrController,
                          // initialValue: product!.productName,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "null";
                          //   }
                          // },
                          // controller: controller.numberOfDaysController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              // height: 2,
                              letterSpacing: 0.1,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            // prefixText: "+91 ",
                            hintStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                letterSpacing: 0.1,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                                fontWeight: 500),
                            hintText: LocaleKeys.label_product_name.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_product_name.tr,
                            labelStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                fontWeight: 800,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground),
                            prefixStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
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
                            fillColor: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .background,
                            prefixIcon: Icon(
                              MdiIcons.tagOutline,
                              size: 22,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(200),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(0),
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller.editNomArController,
                          // initialValue: product!.genericName,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "null";
                          //   }
                          // },
                          // controller: controller.numberOfDaysController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              // height: 2,
                              letterSpacing: 0.1,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            // prefixText: "+91 ",
                            hintStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                letterSpacing: 0.1,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                                fontWeight: 500),
                            hintText: LocaleKeys.label_product_arabic_name.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_product_arabic_name.tr,
                            labelStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                fontWeight: 800,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground),
                            prefixStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
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
                            fillColor: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .background,
                            prefixIcon: Icon(
                              MdiIcons.tag,
                              size: 22,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(200),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(0),
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller.editQuantityController,
                          // initialValue: product!.categorie!.nomFr,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "null";
                          //   }
                          // },
                          // controller: controller.numberOfDaysController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              // height: 2,
                              letterSpacing: 0.1,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            // prefixText: "+91 ",
                            hintStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                letterSpacing: 0.1,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                                fontWeight: 500),
                            hintText: LocaleKeys.label_quantity.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_quantity.tr,
                            labelStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                fontWeight: 800,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground),
                            prefixStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
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
                            fillColor: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .background,
                            prefixIcon: Icon(
                              MdiIcons.viewList,
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
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller.editCostController,
                          // initialValue:
                          //     controller.scannedProduct.unite!.abreviation,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              // height: 2,
                              letterSpacing: 0.1,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            // prefixText: "+91 ",
                            hintStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                letterSpacing: 0.1,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                                fontWeight: 500),
                            hintText: LocaleKeys.label_cost.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_cost.tr,
                            labelStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                fontWeight: 800,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground),
                            prefixStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
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
                            fillColor: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .background,
                            prefixIcon: Icon(
                              MdiIcons.tapeMeasure,
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
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller.editPriceController,
                          // initialValue:
                          //     controller.scannedProduct.unite!.abreviation,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              // height: 2,
                              letterSpacing: 0.1,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            // prefixText: "+91 ",
                            hintStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                letterSpacing: 0.1,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                                fontWeight: 500),
                            hintText: LocaleKeys.label_price.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_price.tr,
                            labelStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
                                fontWeight: 800,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground),
                            prefixStyle: AppTheme.getTextStyle(
                                AppTheme.getThemeFromThemeMode()
                                    .textTheme
                                    .subtitle2,
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
                            fillColor: AppTheme.getThemeFromThemeMode()
                                .colorScheme
                                .background,
                            prefixIcon: Icon(
                              MdiIcons.tapeMeasure,
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
                    ],
                  ),
                ),
              ),
              FxSpacing.height(24),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FxButton(
                        backgroundColor: AppTheme.getThemeFromThemeMode()
                            .colorScheme
                            .primary,
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          controller.saveProduct();
                        },
                        child: Text(
                          LocaleKeys.label_save.tr,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText1,
                              fontWeight: 600,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
