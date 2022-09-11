import 'package:beep_mobile/app/controllers/home.dart';
// import 'package:beep_mobile/app/views/screens/online_requests/sick_leave/components/pick_image_bottom_sheet.dart';
import 'package:beep_mobile/app/views/widgets/widgets.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductInfoWidget extends GetView<HomeController> {
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
    return controller.obx(
      (state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          leading: InkWell(
            onTap: () {
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
          title: Text(LocaleKeys.label_new_sick_leave_request.tr,
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
                              height: 2,
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
                            hintText: LocaleKeys.label_number_of_days.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: LocaleKeys.label_number_of_days.tr,
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
                              MdiIcons.numeric1BoxMultiple,
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
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: DropdownSearch<String>(
                            dropdownButtonProps: DropdownButtonProps(
                              icon: Icon(
                                MdiIcons.menuDown,
                                color: AppTheme.getThemeFromThemeMode()
                                    .colorScheme
                                    .onBackground,
                              ),
                            ),
                            dropdownBuilder: (context, selectedItem) => Text(
                                selectedItem.toString(),
                                style: AppTheme.getTextStyle(
                                    AppTheme.getThemeFromThemeMode()
                                        .textTheme
                                        .subtitle2,
                                    height: 1.2)),
                            popupProps: PopupProps.menu(
                              itemBuilder: (context, item, isSelected) =>
                                  Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 16),
                                child: Text(
                                  item.toString(),
                                  style: AppTheme.getTextStyle(
                                      AppTheme.getThemeFromThemeMode()
                                          .textTheme
                                          .bodyText1,
                                      color: isSelected
                                          ? AppTheme.getThemeFromThemeMode()
                                              .colorScheme
                                              .primary
                                          : AppTheme.getThemeFromThemeMode()
                                              .colorScheme
                                              .onBackground,
                                      height: 2),
                                ),
                              ),
                            ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
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
                                hintText: LocaleKeys.label_work_accident.tr,
                                labelText: LocaleKeys.label_work_accident.tr,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                  FontAwesomeIcons.userInjured,
                                  size: 22,
                                  color: AppTheme.getThemeFromThemeMode()
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(200),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                            items: [
                              // LocaleKeys.label_work_accident.tr,
                              LocaleKeys.label_yes.tr,
                              LocaleKeys.label_no.tr,
                            ],
                            onChanged: (value) {
                              // controller.changeIsAWorkAccident(value!);
                            },
                            selectedItem: LocaleKeys.label_work_accident.tr),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (BuildContext buildContext) {
                                print('object');
                                // controller.fileToUpload = "sickLeave";
                                return Container();
                                // return const PickImageBottomSheet();
                              }),
                          readOnly: true,
                          // controller: controller.sickLeaveFileController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              height: 2,
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
                            hintText: LocaleKeys.label_sickleave_document.tr,

                            labelText: LocaleKeys.label_sickleave_document.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                              MdiIcons.fileImage,
                              size: 22,
                              color: AppTheme.getThemeFromThemeMode()
                                  .colorScheme
                                  .onBackground
                                  .withAlpha(200),
                            ),
                            suffixIcon: Icon(
                              MdiIcons.fileUpload,
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          LocaleKeys.label_address_during_sickleave.tr,
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
                          initialValue: product!.categories,
                          // controller: controller.addressController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              height: 2,
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

                            hintText: LocaleKeys.label_address.tr,

                            labelText: LocaleKeys.label_address.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                              MdiIcons.mapMarkerAccount,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 8,
                          ),
                          // DropdownSearch<Commune?>(
                          //   dropDownButton: Icon(
                          //     MdiIcons.menuDown,
                          //     color: AppTheme.getThemeFromThemeMode()
                          //         .colorScheme
                          //         .onBackground,
                          //   ),
                          //   onChanged: (value) => controller
                          //       .changeCommune(value!.code.toString()),
                          //   showSearchBox: true,
                          //   dropdownBuilder: (context, selectedItem) => Text(
                          //       selectedItem.toString(),
                          //       style: AppTheme.getTextStyle(
                          //           AppTheme.getThemeFromThemeMode()
                          //               .textTheme
                          //               .subtitle2,
                          //           height: 1.2)),
                          //   popupItemBuilder: (context, item, isSelected) =>
                          //       Container(
                          //     margin: const EdgeInsets.symmetric(
                          //         vertical: 5, horizontal: 16),
                          //     child: item != null
                          //         ? Text(
                          //             item.toString(),
                          //             style: AppTheme.getTextStyle(
                          //                 AppTheme.getThemeFromThemeMode()
                          //                     .textTheme
                          //                     .bodyText1,
                          //                 color: isSelected
                          //                     ? AppTheme.getThemeFromThemeMode()
                          //                         .colorScheme
                          //                         .primary
                          //                     : AppTheme.getThemeFromThemeMode()
                          //                         .colorScheme
                          //                         .onBackground,
                          //                 height: 2),
                          //           )
                          //         : null,
                          //   ),
                          //   maxHeight: 200,
                          //   mode: Mode.MENU,
                          //   items: controller.communesByWilaya,
                          //   itemAsString: (item) => item.toString(),
                          //   dropdownSearchDecoration: InputDecoration(
                          //     // prefixText: "+91 ",
                          //     hintStyle: AppTheme.getTextStyle(
                          //         AppTheme.getThemeFromThemeMode()
                          //             .textTheme
                          //             .subtitle2,
                          //         letterSpacing: 0.1,
                          //         color: AppTheme.getThemeFromThemeMode()
                          //             .colorScheme
                          //             .onBackground,
                          //         fontWeight: 500),

                          //     hintText: LocaleKeys.label_commune.tr,

                          //     labelText: LocaleKeys.label_commune.tr,
                          //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                          //     labelStyle: AppTheme.getTextStyle(
                          //         AppTheme.getThemeFromThemeMode()
                          //             .textTheme
                          //             .subtitle2,
                          //         fontWeight: 800,
                          //         color: AppTheme.getThemeFromThemeMode()
                          //             .colorScheme
                          //             .onBackground),
                          //     prefixStyle: AppTheme.getTextStyle(
                          //         AppTheme.getThemeFromThemeMode()
                          //             .textTheme
                          //             .subtitle2,
                          //         letterSpacing: 0.1,
                          //         color: AppTheme.getThemeFromThemeMode()
                          //             .colorScheme
                          //             .onBackground,
                          //         fontWeight: 500),
                          //     border: const OutlineInputBorder(
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(8.0),
                          //         ),
                          //         borderSide: BorderSide.none),
                          //     enabledBorder: const OutlineInputBorder(
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(8.0),
                          //         ),
                          //         borderSide: BorderSide.none),
                          //     focusedBorder: const OutlineInputBorder(
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(8.0),
                          //         ),
                          //         borderSide: BorderSide.none),
                          //     filled: true,
                          //     fillColor: AppTheme.getThemeFromThemeMode()
                          //         .colorScheme
                          //         .background,
                          //     prefixIcon: Icon(
                          //       MdiIcons.selectMarker,
                          //       size: 22,
                          //       color: AppTheme.getThemeFromThemeMode()
                          //           .colorScheme
                          //           .onBackground
                          //           .withAlpha(200),
                          //     ),
                          //     isDense: true,
                          //     contentPadding: const EdgeInsets.all(0),
                          //   ),
                          //   // showSelectedItems: controller.communes.isNotEmpty,
                          //   selectedItem: controller.communesByWilaya.isEmpty
                          //       ? controller.emptyCommune
                          //       : controller.communesByWilaya.first,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              FxSpacing.height(24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          LocaleKeys.label_doctor_details.tr,
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
                          // controller: controller.doctorsLastNameController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              height: 2,
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

                            hintText: LocaleKeys.label_doctor_lastname.tr,

                            labelText: LocaleKeys.label_doctor_lastname.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                              MdiIcons.doctor,
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
                          // controller: controller.doctorsFirstNameController,
                          style: AppTheme.getTextStyle(
                              AppTheme.getThemeFromThemeMode()
                                  .textTheme
                                  .bodyText2,
                              height: 2,
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

                            hintText: LocaleKeys.label_doctor_firstname.tr,

                            labelText: LocaleKeys.label_doctor_firstname.tr,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                              MdiIcons.doctor,
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
                            controller.showConfirmDialog();
                          },
                          child: Text(
                            LocaleKeys.label_continue.tr,
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
