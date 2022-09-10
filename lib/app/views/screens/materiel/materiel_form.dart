import 'package:beep_mobile/app/controllers/materiel.dart';
import 'package:beep_mobile/app/views/widgets/container/container.dart';
import 'package:beep_mobile/app/views/widgets/text/text.dart';
import 'package:beep_mobile/utils/spacing.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:beep_mobile/app/models/materiel/materiel.dart';

class MaterielForm extends GetView<MaterielController> {
  MaterielForm({Key? key}) : super(key: key);
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  var theme = AppTheme.shoppingTheme;
  Widget _buildSingleProduct(Materiel materiel) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: FxContainer(
        onTap: () {
          // controller.goToProductScreen(material);
        },
        borderRadiusAll: 4,
        paddingAll: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxContainer(
              paddingAll: 0,
              borderRadiusAll: 2,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  const Hero(
                    tag: "material_image_",
                    child: Image(
                      image: AssetImage('assets/images/doctor3.png'),
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(6),
            Hero(
              tag: "dazdazd",
              child: FxText.b1(
                "name",
                fontWeight: 600,
              ),
            ),
            FxSpacing.height(2),
            Hero(
              tag: "dazdaa",
              child: FxText.b1(
                '\$' + "500.00",
                fontWeight: 700,
              ),
            ),
            FxSpacing.height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: "azdazd",
                  child: FxContainer(
                    borderRadiusAll: 4,
                    padding: FxSpacing.xy(8, 4),
                    color: theme.colorScheme.primary,
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.star,
                          color: theme.colorScheme.onPrimary,
                          size: 12,
                        ),
                        FxSpacing.width(6),
                        FxText.b2(
                          "ratings",
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
                FxContainer.bordered(
                  paddingAll: 2,
                  borderRadiusAll: 6,
                  child: Icon(
                    MdiIcons.plus,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            // controller.changePage();
            // Navigator.of(context).pop();
          },
          icon: Icon(
            Get.locale.toString() == "ar"
                ? MdiIcons.chevronRight
                : MdiIcons.chevronLeft,
          ),
        ),
        title: Text(
          "materiel",
          style: AppTheme.getTextStyle(
              AppTheme.getThemeFromThemeMode().textTheme.subtitle1,
              fontWeight: 600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 2,
          child: Container(),
        ),
      ),
    );
  }
}
