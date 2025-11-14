import 'package:cooking_app/presentation/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServeAndItemsDisplay extends StatelessWidget {
  final String serves;
  final String items;

  const ServeAndItemsDisplay({super.key, required this.serves, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SvgPicture.asset(
                AppIcons.serveIcon,
                width: 17,
                height: 17,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8.0),
              Text(
                serves,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            items,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Colors.grey,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}