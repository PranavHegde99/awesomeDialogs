import 'package:flutter/material.dart';

class VerticalStackDialog extends StatelessWidget {
  final String title;
  final String desc;
  final Widget btnOk;
  final Widget btnCancel;
  final Widget header;
  final Widget body;
  final bool isDense;
  final AlignmentGeometry aligment;
  final EdgeInsetsGeometry padding;
  const VerticalStackDialog({
    Key key,
    @required this.title,
    @required this.desc,
    this.btnOk,
    this.btnCancel,
    this.body,
    this.aligment,
    this.isDense,
    @required this.header,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      child: Stack(
        children: <Widget>[
          Container(
            padding: isDense
                ? EdgeInsets.only(
                    top: 65.0, left: 15.0, right: 15.0, bottom: 10.0)
                : EdgeInsets.only(
                    top: 65.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 0.5,
              color: Theme.of(context).cardColor,
              child: Container(
                padding: padding,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: header != null ? 50.0 : 15,
                    ),
                    body ??
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Text(
                                  desc,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                    SizedBox(
                      height: 16.0,
                    ),
                    if (btnOk != null || btnCancel != null)
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            btnCancel != null
                                ? Expanded(
                                    child: btnCancel ?? Container(),
                                  )
                                : Container(),
                            (btnCancel != null && btnOk != null)
                                ? SizedBox(
                                    width: 10,
                                  )
                                : Container(),
                            btnOk != null
                                ? Expanded(
                                    child: btnOk,
                                  )
                                : Container(),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          if (header != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  radius: 55.0,
                  child: header,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
