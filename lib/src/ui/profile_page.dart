import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ft_hangout/data/model/user.dart';

// class ProfilePage extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   ProfilePage({Key? key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                heightFactor: 1,
                alignment: Alignment.centerLeft,
                child: IconButton(
                    tooltip: "Back",
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey.shade400,
                      size: 33,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ),
              Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Card(
                        margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                        color: Colors.black45,
                        child: SizedBox(
                            height: 180.0,
                            width: 330,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "${user.firstname} ${user.lastname}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  Text(
                                    user.username,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 84.0),
                                          child: Text(
                                            "Wallet : ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            "${user.wallet}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 23.0),
                                          child: Text(
                                            "Evaluation point : ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            "${user.evaluationPoint}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 87.0),
                                          child: Text(
                                            "Email : ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            user.email,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 84.0),
                                          child: Text(
                                            "Grade : ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            user.grade,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Positioned(
                        top: .0,
                        left: .0,
                        right: .0,
                        child: Center(
                          child: CircleAvatar(
                            radius: 45.0,
                            backgroundImage: NetworkImage(user.image),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 330,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3.0)),
                          child: LinearProgressIndicator(
                            value: user.level % 1,
                            backgroundColor: Colors.black87,
                            minHeight: 25,
                            valueColor:
                                AlwaysStoppedAnimation(Colors.green.shade800),
                            semanticsLabel: "Level progress indicator",
                          ),
                        ),
                      ),
                    ),
                    Center(
                      heightFactor: 1.5,
                      child: Text(
                        "level ${user.level.toStringAsFixed(2).replaceFirst(".", " - ")}%",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: 250,
                  width: 330,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(3.0)),
                  child: Column(
                    children: [
                      const Align(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Project",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: user.projects.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              title: Text(
                                " ${user.projects[index].name}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 2, 0),
                                      child: Text(
                                        !user.projects[index].inProgress
                                            ? "${user.projects[index].note}"
                                            : "",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    if (user.projects[index].inProgress)
                                      const Padding(
                                        padding: EdgeInsets.only(top: 1),
                                        child: Icon(
                                          Icons.loop,
                                          color: Colors.orange,
                                        ),
                                      )
                                    else
                                      user.projects[index].validated!
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.only(top: 1),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              ),
                                            ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.white24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(3.0)),
                    child: Column(
                      children: [
                        const Align(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Skills",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: user.skills.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                title: Text(
                                  user.skills[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: Wrap(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 2, 0),
                                      child: Text(
                                        "${user.skills[index].score}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.white24,
                            ),
                          ),
                        )
                      ],
                    ),
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
