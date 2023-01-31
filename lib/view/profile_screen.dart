import 'package:movies4u/constant/api_constant.dart';
import 'package:movies4u/constant/color_const.dart';
import 'package:movies4u/constant/string_const.dart';
import 'package:movies4u/utils/widgethelper/widget_helper.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    var homeIcon = IconButton(
        icon: Icon(
          Icons.arrow_back_ios, //menu,//dehaze,
          color: ColorConst.WHITE_ORIG_COLOR,
        ),
        onPressed: () => Navigator.of(_context).pop());
    return Scaffold(
        backgroundColor: ColorConst.WHITE_BG_COLOR,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: homeIcon,
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _context = context;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          ProfileHeader(
            avatar: NetworkImage(ApiConstant.demoImg),
            coverImage: NetworkImage(ApiConstant.demoImg),
            title: StringConst.DEEPAK_SHARMA,
            subtitle: StringConst.WEBADDICTED,
            actions: <Widget>[
              MaterialButton(
                color: ColorConst.BLACK_COLOR,
                shape: CircleBorder(),
                elevation: 0,
                child: Icon(
                  Icons.edit,
                  color: ColorConst.WHITE_COLOR,
                ),
                onPressed: () => showSnackBar(_context, 'Comming Soon'),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          UserInfo(),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "User Information",
              style: TextStyle(
                color: ColorConst.BLACK_COLOR,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            leading: Icon(Icons.email),
                            title: getTxt(msg: "Email"),
                            subtitle: getTxt(
                                msg:
                                    " chaipasong.vongphansy2001@gmail.com \n 205n001419@nuol.edu.la \n khounpaserd.dev@gmail.com \n yaisaengvixai1752@gmail.com \n laryaiphommaphai@gmail.com"),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: getTxt(msg: "Phone"),
                            subtitle: getTxt(
                                msg:
                                    " +856-20-5457-3377 \n +856-20-7854-6204 \n +856-20-7748-4730 \n +856-20-5809-0852 \n +856-20-5857-8322"),
                          ),
                          ListTile(
                            leading: Icon(Icons.my_location),
                            title: getTxt(msg: "Location"),
                            subtitle: getTxt(msg: " Vientiane, Laos"),
                          ),
                          ListTile(
                            leading: Icon(Icons.web),
                            title: getTxt(msg: "Website"),
                            subtitle:
                                getTxt(msg: " https://www.tookcomsci.live/"),
                          ),
                          ListTile(
                            leading: Icon(Icons.calendar_view_day),
                            title: getTxt(msg: "Joined Date"),
                            subtitle: getTxt(msg: " 21 January 2016"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: getTxt(msg: "About Us"),
                            subtitle: getTxt(
                                msg:
                                    "We are the part of students in National University of Laos, This Project we have inspiration from Deepak Sharma on Github. Thank you for seeing this project."),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final coverImage;
  final avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const ProfileHeader(
      {required this.coverImage,
      required this.avatar,
      required this.title,
      this.subtitle = "",
      required this.actions});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(image: coverImage, fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 250,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 210),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.grey.shade300,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              getTxtBlackColor(
                msg: title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                getTxtColor(
                    msg: subtitle, fontSize: 17, txtColor: ColorConst.GREY_800),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;

  Avatar(
      {this.image,
      this.borderColor = Colors.grey,
      required this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image,
        ),
      ),
    );
  }
}
