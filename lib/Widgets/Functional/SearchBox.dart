import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function onSearchButtonTapped;
  final Function onChanged;
  final TextEditingController control;
  final bool searchOntype;
  final EdgeInsetsGeometry margin;

  const SearchBox(
      {Key key,
      this.onSearchButtonTapped,
      this.onChanged,
      this.control,
      this.searchOntype,
      this.margin})
      : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool isTapped = false;

  void searchButtonTapped() {
    if (widget.searchOntype) {
      //todo: focus input when button is tapped...
    } else {
      widget.onSearchButtonTapped();
    }
  }

  void _textChanged(String value) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: searchButtonTapped,
        child: Container(
            height: 40,
            margin: widget.margin ?? const EdgeInsets.fromLTRB(20, 0, 20, 20),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(children: [
              Expanded(
                  child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 18, letterSpacing: 1),
                      controller: widget.control,
                      onChanged: (String value) => _textChanged(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                          border: InputBorder.none,
                          hintText: "search..",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 10, color: Colors.grey)))),
              Container(
                  height: 48,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Icon(Icons.search,
                      size: 19, color: Theme.of(context).iconTheme.color))
            ])));
  }
}
