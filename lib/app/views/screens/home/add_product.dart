import 'package:beep_mobile/app/controllers/scanner.dart';
// import 'package:beep_mobile/app/views/screens/online_requests/sick_leave/components/pick_image_bottom_sheet.dart';
import 'package:beep_mobile/app/views/widgets/widgets.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductInfoWidget extends GetView<ScannerController> {
  const ProductInfoWidget(this.product, {Key? key}) : super(key: key);
  final Product? product;
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
    print(product!.toJson());
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
              await controller.cameraController!.resumeCamera();
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
          // actions: <Widget>[
          //   Container(
          //       margin: EdgeInsets.only(right: MySize.size8!),
          //       child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             Container(
          //               margin: EdgeInsets.only(
          //                   left: MySize.size8!, right: MySize.size8!),
          //               child: IconButton(
          //                 icon: Icon(MdiIcons.sort, size: MySize.size22),
          //                 onPressed: () {
          //                   showModalBottomSheet(
          //                       context: context,
          //                       builder: (BuildContext buildContext) {
          //                         return const SortBottomSheetTest();
          //                       });
          //                 },
          //               ),
          //             ),
          //             Container(
          //               margin: EdgeInsets.only(
          //                   left: MySize.size8!, right: MySize.size8!),
          //               child: IconButton(
          //                 icon:
          //                     Icon(MdiIcons.filter, size: MySize.size22),
          //                 onPressed: () {
          //                   _key.currentState!.openEndDrawer();
          //                   // controller.loadData();
          //                 },
          //               ),
          //             )
          //           ]))
          // ],
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
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 8),
                      //   width: double.infinity,
                      //   child: TextFormField(
                      //     onTap: () => _pickDate(context, 0),
                      //     readOnly: true,
                      //     controller: controller.startingDateController,
                      //     style: AppTheme.getTextStyle(
                      //         AppTheme.getThemeFromThemeMode()
                      //             .textTheme
                      //             .bodyText2,
                      //         height: 2,
                      //         letterSpacing: 0.1,
                      //         color: AppTheme.getThemeFromThemeMode()
                      //             .colorScheme
                      //             .onBackground,
                      //         fontWeight: 500),
                      //     decoration: InputDecoration(
                      //       labelText: LocaleKeys.label_starting_date.tr,
                      //       floatingLabelBehavior: FloatingLabelBehavior.auto,
                      //       labelStyle: AppTheme.getTextStyle(
                      //           AppTheme.getThemeFromThemeMode()
                      //               .textTheme
                      //               .subtitle2,
                      //           fontWeight: 800,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground),
                      //       // prefixText: "+91 ",
                      //       hintStyle: AppTheme.getTextStyle(
                      //           AppTheme.getThemeFromThemeMode()
                      //               .textTheme
                      //               .subtitle2,
                      //           letterSpacing: 0.1,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground,
                      //           fontWeight: 500),
                      //       hintText: LocaleKeys.label_starting_date.tr,
                      //       prefixStyle: AppTheme.getTextStyle(
                      //           AppTheme.getThemeFromThemeMode()
                      //               .textTheme
                      //               .subtitle2,
                      //           letterSpacing: 0.1,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground,
                      //           fontWeight: 500),
                      //       border: const OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(8.0),
                      //           ),
                      //           borderSide: BorderSide.none),
                      //       enabledBorder: const OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(8.0),
                      //           ),
                      //           borderSide: BorderSide.none),
                      //       focusedBorder: const OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(8.0),
                      //           ),
                      //           borderSide: BorderSide.none),
                      //       filled: true,
                      //       fillColor: AppTheme.getThemeFromThemeMode()
                      //           .colorScheme
                      //           .background,
                      //       prefixIcon: Icon(
                      //         MdiIcons.calendarStart,
                      //         size: 22,
                      //         color: AppTheme.getThemeFromThemeMode()
                      //             .colorScheme
                      //             .onBackground
                      //             .withAlpha(200),
                      //       ),
                      //       isDense: true,
                      //       contentPadding: const EdgeInsets.all(0),
                      //     ),
                      //     keyboardType: TextInputType.number,
                      //     textCapitalization: TextCapitalization.sentences,
                      //   ),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 8),
                      //   width: double.infinity,
                      //   child: TextFormField(
                      //     onTap: () => _pickDate(context, 1),
                      //     readOnly: true,
                      //     controller: controller.endingDateController,
                      //     style: AppTheme.getTextStyle(
                      //         AppTheme.getThemeFromThemeMode()
                      //             .textTheme
                      //             .bodyText2,
                      //         height: 2,
                      //         letterSpacing: 0.1,
                      //         color: AppTheme.getThemeFromThemeMode()
                      //             .colorScheme
                      //             .onBackground,
                      //         fontWeight: 500),
                      //     decoration: InputDecoration(
                      //       // prefixText: "+91 ",
                      //       hintStyle: AppTheme.getTextStyle(
                      //           AppTheme.getThemeFromThemeMode()
                      //               .textTheme
                      //               .subtitle2,
                      //           letterSpacing: 0.1,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground,
                      //           fontWeight: 500),
                      //       hintText: LocaleKeys.label_ending_date.tr,
                      //       floatingLabelBehavior: FloatingLabelBehavior.auto,
                      //       labelText: LocaleKeys.label_ending_date.tr,
                      //       labelStyle: AppTheme.getTextStyle(
                      //           AppTheme.getThemeFromThemeMode()
                      //               .textTheme
                      //               .subtitle2,
                      //           fontWeight: 800,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground),
                      //       prefixStyle: AppTheme.getTextStyle(
                      //           AppTheme.getThemeFromThemeMode()
                      //               .textTheme
                      //               .subtitle2,
                      //           letterSpacing: 0.1,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground,
                      //           fontWeight: 500),
                      //       border: const OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(8.0),
                      //           ),
                      //           borderSide: BorderSide.none),
                      //       enabledBorder: const OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(8.0),
                      //           ),
                      //           borderSide: BorderSide.none),
                      //       focusedBorder: const OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(8.0),
                      //           ),
                      //           borderSide: BorderSide.none),
                      //       filled: true,
                      //       fillColor: AppTheme.getThemeFromThemeMode()
                      //           .colorScheme
                      //           .background,
                      //       prefixIcon: Icon(
                      //         MdiIcons.calendarEnd,
                      //         size: 22,
                      //         color: AppTheme.getThemeFromThemeMode()
                      //             .colorScheme
                      //             .onBackground
                      //             .withAlpha(200),
                      //       ),
                      //       isDense: true,
                      //       contentPadding: const EdgeInsets.all(0),
                      //     ),
                      //     keyboardType: TextInputType.number,
                      //     textCapitalization: TextCapitalization.sentences,
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          initialValue: product!.barcode,
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
                          initialValue: product!.brands,
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
                          initialValue: product!.productName,
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
                          initialValue: product!.genericName,
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
                          initialValue: product!.categories.toString(),
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
                            hintText: LocaleKeys.label_category.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_category.tr,
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
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: TextFormField(
                          initialValue: product!.quantity.toString(),
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
                            hintText: LocaleKeys.label_unity.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_unity.tr,
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
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),

                      // Visibility(
                      //   visible: controller.isHospitalisation == "1",
                      //   child: Container(
                      //     width: double.infinity,
                      //     margin: const EdgeInsets.symmetric(vertical: 8),
                      //     child: TextFormField(
                      //       onTap: () => showModalBottomSheet(
                      //           context: context,
                      //           builder: (BuildContext buildContext) {
                      //             controller.fileToUpload = "hospitalisation";
                      //             return const PickImageBottomSheet();
                      //           }),
                      //       readOnly: true,
                      //       controller:
                      //           controller.hospitalisationFileController,
                      //       style: AppTheme.getTextStyle(
                      //           AppTheme.getThemeFromThemeMode()
                      //               .textTheme
                      //               .bodyText2,
                      //           height: 2,
                      //           letterSpacing: 0.1,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground,
                      //           fontWeight: 500),
                      //       decoration: InputDecoration(
                      //         // prefixText: "+91 ",
                      //         hintStyle: AppTheme.getTextStyle(
                      //             AppTheme.getThemeFromThemeMode()
                      //                 .textTheme
                      //                 .subtitle2,
                      //             letterSpacing: 0.1,
                      //             color: AppTheme.getThemeFromThemeMode()
                      //                 .colorScheme
                      //                 .onBackground,
                      //             fontWeight: 500),
                      //         hintText: LocaleKeys.label_hospital_file.tr,

                      //         labelText: LocaleKeys.label_hospital_file.tr,
                      //         floatingLabelBehavior: FloatingLabelBehavior.auto,
                      //         labelStyle: AppTheme.getTextStyle(
                      //             AppTheme.getThemeFromThemeMode()
                      //                 .textTheme
                      //                 .subtitle2,
                      //             fontWeight: 800,
                      //             color: AppTheme.getThemeFromThemeMode()
                      //                 .colorScheme
                      //                 .onBackground),
                      //         prefixStyle: AppTheme.getTextStyle(
                      //             AppTheme.getThemeFromThemeMode()
                      //                 .textTheme
                      //                 .subtitle2,
                      //             letterSpacing: 0.1,
                      //             color: AppTheme.getThemeFromThemeMode()
                      //                 .colorScheme
                      //                 .onBackground,
                      //             fontWeight: 500),
                      //         border: const OutlineInputBorder(
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(8.0),
                      //             ),
                      //             borderSide: BorderSide.none),
                      //         enabledBorder: const OutlineInputBorder(
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(8.0),
                      //             ),
                      //             borderSide: BorderSide.none),
                      //         focusedBorder: const OutlineInputBorder(
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(8.0),
                      //             ),
                      //             borderSide: BorderSide.none),
                      //         filled: true,
                      //         fillColor: AppTheme.getThemeFromThemeMode()
                      //             .colorScheme
                      //             .background,
                      //         prefixIcon: Icon(
                      //           MdiIcons.fileImage,
                      //           size: 22,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground
                      //               .withAlpha(200),
                      //         ),
                      //         suffixIcon: Icon(
                      //           MdiIcons.fileUpload,
                      //           size: 22,
                      //           color: AppTheme.getThemeFromThemeMode()
                      //               .colorScheme
                      //               .onBackground
                      //               .withAlpha(200),
                      //         ),
                      //         isDense: true,
                      //         contentPadding: const EdgeInsets.all(0),
                      //       ),
                      //       keyboardType: TextInputType.number,
                      //       textCapitalization: TextCapitalization.sentences,
                      //     ),
                      //   ),
                      // ),
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
                            // controller.showConfirmDialog();
                          },
                          child: Text(
                            LocaleKeys.label_add.tr,
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
