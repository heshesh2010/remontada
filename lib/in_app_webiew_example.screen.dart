
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewExampleScreen extends StatefulWidget {
  @override
  _InAppWebViewExampleScreenState createState() =>
      new _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
  InAppWebViewController webView;
  ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  GlobalKey<ScaffoldState> scaffoldKey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
          child: progress < 1.0
              ? LinearProgressIndicator(value: progress)
              : Container()),
      Expanded(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          child: InAppWebView(
              contextMenu: contextMenu,
              initialUrl: "https://remontada.com.sa",
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                debuggingEnabled: false,
                javaScriptEnabled: true,
                mediaPlaybackRequiresUserGesture: false,
              )),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
                print("onWebViewCreated");
              },
              onLoadStart: (InAppWebViewController controller, String url) {
                print("onLoadStart $url");
                setState(() {
                  this.url = url;
                });
              },
              shouldOverrideUrlLoading:
                  (controller, shouldOverrideUrlLoadingRequest) async {
                print("shouldOverrideUrlLoading");
                return ShouldOverrideUrlLoadingAction.ALLOW;
              },
              onLoadStop:
                  (InAppWebViewController controller, String url) async {},
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
              onUpdateVisitedHistory: (InAppWebViewController controller,
                  String url, bool androidIsReload) {
                print("onUpdateVisitedHistory $url");
                setState(() {
                  this.url = url;
                });
              }),
        ),

      ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  if (webView != null) {
                    webView.goBack();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  if (webView != null) {
                    webView.goForward();
                  }
                },
              ),
              RaisedButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  if (webView != null) {
                    webView.reload();
                  }
                },
              ),
            ],
          ),
    ]));
  }
}
