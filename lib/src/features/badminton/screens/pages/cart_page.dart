import 'dart:math';

import 'package:batminton_shop/src/features/badminton/models/badminton_model.dart';
import 'package:batminton_shop/src/features/badminton/models/product_specifications.dart';
import 'package:flutter/material.dart';

import '../../services/badminton_service.dart';

class CartPage extends StatelessWidget{
  final BadmintonService badmintonService = BadmintonService();
  List<String> colors=["Back","Red","White","Blue","Pink","Yellow"];
  List<String> names=[
    "Yonex Astrox 99",
    "Yonex Astrox 88D Pro",
    "Yonex Astrox 100ZZ",
    "Yonex Duora 10",
    "Yonex Nanoflare 700",
    "Li-Ning TurboCharging 75",
    "Li-Ning Aeronaut 9000",
    "Li-Ning Windstorm 72",
    "Li-Ning 3D Calibar 900",
    "Li-Ning Tectonic 7",
    "Victor Thruster F",
    "Victor Jetspeed S12",
    "Victor DriveX 9X",
    "Victor Brave Sword 12",
    "Victor Auraspeed 90S",
    "Adidas Wucht P8",
    "Adidas Spieler P09.1",
    "Adidas Kalkul A5",
    "Adidas Uberschall F5",
    "Adidas P360",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: (){
            ProductSpecification spec= ProductSpecification(
             balance: "d",
              description: "d",
              frameStructure: "dc",
              handle: "c",
              hardness: "c",
              joint: "s",
              weight: "s"
            );
            Badminton badminton=Badminton(
                id: "id",
                name: "name",
                color: "color",
                price: 10,
                priceAfterDiscount: 100,
                discountPercent: 123,
                linkImage: "linkImage",
                specification: spec);
            badmintonService.updateBadminton(badminton);

          },
          child: Text("Update Val")
      ),

    );
  }

}