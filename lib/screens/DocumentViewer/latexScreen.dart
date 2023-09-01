import 'dart:convert';
import 'package:evaltech_mobile/Constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class LatexScreen extends StatefulWidget {
  @override
  _LatexScreenState createState() => _LatexScreenState();
}

class _LatexScreenState extends State<LatexScreen> {
  String _latexContent = '';

  @override
  void initState() {
    super.initState();
    loadLatexContent();
  }

  void loadLatexContent() async {
    final jsonFile = await DefaultAssetBundle.of(context)
        .loadString('assets/latex_content.json');
    final jsonData = json.decode(jsonFile);
    setState(() {
      _latexContent = json.encode(latex_content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Latex Screen'),
        ),
        body: const Center(
          child: const TeXView(
            child: TeXViewColumn(children: [
              TeXViewInkWell(
                id: "id_0",
                child: TeXViewColumn(children: [
                  TeXViewDocument(
                    r"""<h2>Flutter \( \rm\\TeX \)</h2>""",
                  ),
                  TeXViewContainer(
                    child: TeXViewImage.network(
                        'https://raw.githubusercontent.com/shah-xad/flutter_tex/master/example/assets/flutter_tex_banner.png'),
                    style: TeXViewStyle(
                      margin: TeXViewMargin.all(10),
                      borderRadius: TeXViewBorderRadius.all(20),
                    ),
                  ),
                  TeXViewDocument(r"""<p>                                
                       When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                       $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""",
                      style: TeXViewStyle.fromCSS(
                          'padding: 15px; color: white; background: green'))
                ]),
              )
            ]),
            style: TeXViewStyle(
              elevation: 10,
              borderRadius: TeXViewBorderRadius.all(25),
              border: const TeXViewBorder.all(TeXViewBorderDecoration(
                  borderColor: Colors.blue,
                  borderStyle: TeXViewBorderStyle.solid,
                  borderWidth: 5)),
              backgroundColor: Colors.white,
            ),
          ),
        ));
  }
}
