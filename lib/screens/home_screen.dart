import 'package:covid/constants.dart';
import 'package:covid/screens/detail_screen.dart';
import 'package:covid/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                InfoCard(
                  title: "Casos Confirmados",
                  iconColor: Color(0xFFFF8C00),
                  effectedNum: 1062,
                  press: () {},
                ),
                InfoCard(
                  title: "Numero de mortes",
                  iconColor: Color(0xFFFF2D55),
                  effectedNum: 75,
                  press: () {},
                ),
                InfoCard(
                  title: "Numero de curados",
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: 75,
                  press: () {},
                ),
                InfoCard(
                  title: "Novos casos",
                  iconColor: Color(0xFF5856D6),
                  effectedNum: 75,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prevenções",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  buildPreventations(),
                  SizedBox(height: 40),
                  buildHelpCard(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildPreventations() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard(
          svgSrc: 'assets/icons/hand_wash.svg',
          title: "Lave as mãos",
        ),
        PreventionCard(
          svgSrc: 'assets/icons/use_mask.svg',
          title: "Use mascara",
        ),
        PreventionCard(
          svgSrc: 'assets/icons/Clean_Disinfect.svg',
          title: "Clean Dsinfect",
        ),
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .4,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Disque 190 por \najuda medica\n',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                      text: 'Caso algum sintoma apareça',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset('assets/icons/virus.svg'),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor.withOpacity(.03),
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: null,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        )
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;

  const PreventionCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
