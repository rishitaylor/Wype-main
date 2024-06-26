// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:wype_user/add_remove_service/new_add_remove_servise.dart';

import 'package:wype_user/common/extra_service.dart';
import 'package:wype_user/common/primary_button.dart';
import 'package:wype_user/common/wype_plus_container.dart';
import 'package:wype_user/common/wype_plus_row.dart';
import 'package:wype_user/constants.dart';
import 'package:wype_user/model/promo_code_model.dart';
import 'package:wype_user/add_remove_service/old_add_remove_service.dart';
import 'package:wype_user/provider/language.dart';

class ExtraServices extends StatefulWidget {
  LatLng coordinates;
  String address;
  int selectedVehicleIndex;
  int selectedPackageIndex;
  Services? promoCode;
  bool saveLocation;

  ExtraServices(
      {super.key,
      required this.coordinates,
      required this.address,
      required this.selectedPackageIndex,
      required this.selectedVehicleIndex,
      required this.saveLocation,
      this.promoCode});

  @override
  State<ExtraServices> createState() => _ExtraServicesState();
}

class _ExtraServicesState extends State<ExtraServices> {
  int selectedWashIndex = 0;
  Map<String, dynamic> pricingMap = {};
  int washCount = 1;
  num selectedPrice = 100;
  List<MapEntry<String, dynamic>> pricingEntries = [];

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    pricingMap = subscriptionPackage[widget.selectedPackageIndex].pricing ?? {};

    pricingEntries = pricingMap.entries.toList();
  }

  @override
  Widget build(BuildContext context) {
    var userLang = Provider.of<UserLang>(context, listen: true);

    return Scaffold(
      backgroundColor: whiteColor,
      body: FadeIn(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: height(context) * 0.07,
            ),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => popNav(context),
                  child: Icon(
                    Icons.chevron_left,
                    size: 29,
                    color: lightGradient,
                  ),
                ),
                10.width,
                Expanded(
                  child: Text(
                    "${subscriptionPackage[widget.selectedPackageIndex].name ?? "N/A"} -${userLang.isAr ? "خدمات إضافية" : "Extra Services"}",
                    style: GoogleFonts.readexPro(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: lightGradient),
                  ),
                ),
              ],
            ),
            25.height,
            ListView.builder(
                shrinkWrap: true,
                itemCount: pricingEntries.length,
                itemBuilder: (_, index) {
                  MapEntry<String, dynamic> entry = pricingEntries[index];
                  String washType = entry.key;
                  num price = entry.value;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        selectedWashIndex = index;
                        washCount = int.parse(washType.substring(0, 2).trim());
                        selectedPrice = price;
                        setState(() {});
                      },
                      child: ExtraServiceContainer(
                          noOfWash: washType,
                          isSelected: selectedWashIndex == index,
                          price: price.toString()),
                    ),
                  );
                }),
            40.height,
            Align(
              alignment: Alignment.center,
              child: PrimaryButton(
                text: userLang.isAr ? "يكمل" : "Continue",
                onTap: () => AddRemoveService(
                  saveLocation: widget.saveLocation,
                  promoCode: widget.promoCode,
                  coordinates: widget.coordinates,
                  address: widget.address,
                  selectedPackageIndex: widget.selectedPackageIndex,
                  selectedVehicleIndex: widget.selectedVehicleIndex,
                  washCount: washCount,
                  price: selectedPrice,
                ).launch(context, pageRouteAnimation: PageRouteAnimation.Fade),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WypePlusPlans extends StatefulWidget {
  const WypePlusPlans({super.key});

  @override
  State<WypePlusPlans> createState() => _WypePlusPlansState();
}

class _WypePlusPlansState extends State<WypePlusPlans> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Wype Plus - Number of Washes',
          style: myFont28_600,
        ),
      ),
      body: FadeIn(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            PlusContainer(
              isSelected: false,
              img: 'assets/images/1.png',
              priceTitle: '69',
              washTitle: '1 type wash',
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'monthly subscriptions'.toUpperCase(),
                  style: const TextStyle(color: gray),
                ),
              ],
            ),
            20.height,
            Expanded(
              child: ListView.separated(
                physics: const ScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: PlusContainer(
                      isSelected: selectedIndex != null
                          ? false
                          : selectedIndex == index,
                      img: 'assets/images/4.png',
                      washTitle: '4 Wype Washes',
                      priceTitle: '220',
                      disPrice: '276',
                      per: '20',
                    ),
                  );
                },
              ),
            ),

            wypePlusRow('Cart Total', '220', () {
              const CustomService()
                  .launch(context, pageRouteAnimation: PageRouteAnimation.Fade);
            }),
            30.height
            // const Text('220 QAR')
          ],
        ),
      )),
    ));
  }
}
