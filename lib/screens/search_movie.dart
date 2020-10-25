import 'package:flutter/material.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color.fromRGBO(27, 33, 47, 1),
      appBar: AppBar(
        title: Text(
          "Search",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.w700, fontSize: 28),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: TextFormField(
                style: TextStyle(fontSize: 20, color: Colors.white),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    iconSize: 28,
                    onPressed: () {
                      print(searchText);
                    },
                  ),
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 5, minWidth: 35),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  hintText: "Search Movies",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white30),
                  filled: true,
                  fillColor: const Color(0xFF273347),
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                      gapPadding: 2),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
