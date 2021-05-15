import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ft_hangout/cubit/profile_cubit.dart';
import 'package:ft_hangout/src/ui/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _searchButtonDisabled = true;
  bool _loading = false;
  String? _error;
  String _username = "";
  void _validateSearch(String value) {
    if (value.isNotEmpty) {
      if (_searchButtonDisabled) {
        setState(() {
          _searchButtonDisabled = false;
        });
      }
    } else {
      if (!_searchButtonDisabled) {
        setState(() {
          _searchButtonDisabled = true;
        });
      }
    }
  }

  void _searchUser(String value) {
    BlocProvider.of<ProfileCubit>(context).fetchTodos(_username);
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        setState(() {
          _loading = false;
        });
        if (state is ProfileLoaded) {
          Navigator.pushNamed(context, "/profile", arguments: state.user);
        }
        if (state is ProfileNotFound) {
          setState(() {
            _error = state.error;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.grey.shade900,
                  title: const Align(
                      child: Text(
                    "Error",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
                  content: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        _error!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            _error = null;
                            _username = "";
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                );
              });
        }
      },
      child: Scaffold(
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 150),
                  child: Text(
                    "Swifty companion",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 215,
                  child: TextField(
                    onChanged: (value) {
                      value = value.trim();
                      _username = value;
                      _validateSearch(value);
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blue.shade500,
                      )),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white38,
                      border: const OutlineInputBorder(),
                      hintText: "Enter a username",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Opacity(
                    opacity: _searchButtonDisabled ? 0.4 : 1,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade900)),
                      onPressed: _searchButtonDisabled
                          ? null
                          : () => _searchUser(_username),
                      child: !_loading
                          ? const Text(
                              "Search",
                              style: TextStyle(color: Colors.white),
                            )
                          : SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
