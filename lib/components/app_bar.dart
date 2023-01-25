import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mops_dapp/pages/nfts.dart';
import 'package:mops_dapp/pages/token.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}



class _CustomAppBarState extends State<CustomAppBar> {

@override
  void initState() {
    
    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell),
            iconSize: 25,
            color: Colors.white,
          ),
          centerTitle: true,
          toolbarHeight: kToolbarHeight,
          title: SizedBox(
            //height: kToolbarHeight,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 2),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12, // Creates border
              ),
              child: TabBar(
                //labelPadding: const EdgeInsets.only(left: 30),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.blue[400],
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context)
                      .scaffoldBackgroundColor, // Creates border
                ),
                tabs: [
                  Tab(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Tokens',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  Tab(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'NFT',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/sliders-h-solid.svg',
                color: Colors.white,
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const TabBarView(
          children: [
            Token(),
            NFTs(),
          ],
        ),
      ),
    );
  }
}
