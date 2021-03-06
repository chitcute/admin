// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:kozarni_ecome/screen/home_screen.dart';
//
// class OnBoardingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => SafeArea(
//     child: IntroductionScreen(
//       pages: [
//         PageViewModel(
//           title: "",
//           body: ''' ๐บ   ๐๐ข๐ง๐๐ฒ Branded Export Fashion   ๐บ ''',
//           image: buildImage('assets/logo.png'),
//           decoration: getPageDecoration(),
//         ),
//
//         PageViewModel(
//           title: "๐บ   ๐๐ข๐ง๐๐ฒ Branded Export Fashion   ๐บ",
//           body: '''
//           ๐บ ๐๐ข๐ง๐๐ฒ แแญแฏแแฌ ๐บ
//           ๐ฟ ๏ธแแแบแแฑแแฏแแบ แกแฑแธแแผแแแบ...
//           ๐ฟ ๏ธแแฑแซแทแแซแธแแแบ..
//           ๐ฟ ๏ธแแแบแแฑแฌแแทแบแแแบแแฌแแพแญแแแบ...
//           ๐ฟ ๏ธแแญแฏแธแแพแแบแธแแฝแฌแแพแแแแบ...
//           ๐ฟ ๏ธแแฑแฌแแบแธแแฎแแฒแทแแแบแแแบ
//           ๐ฟ แแแแบแแฒแทแแแบแแแบแแพแแฑแแแบ..
//           ๐ฟ ๏ธแแแบแแฑแแฌแแฝแฌแธแแฝแฌแธ
//           ๐ฟ แแแบแแญแฏแทแแแฑแแแแบ...
//           ๐ฟ ๏ธแแฑแธแแพแฏแแบแธแแแบแแฌแแแบ...''',
//           image: buildImage('assets/logo.png'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: '๐บ EVERYTIME YOU WILL NEED MY ๐๐ข๐ง๐๐ฒ ๐บ',
//           body: '''
//           ๐ฟ  แแแฎแธแแฝแแบแแผแแฒแทแกแแซ...
//           ๐ฟ  Shopping แแฝแแญแแผแแฒแทแกแแซ...
//           ๐ฟ  แแฏแแทแบแแฝแแบแแฌแธแแผแแฒแทแกแแซ...
//           ๐ฟ แแปแพแฑแฌแแบแแแบแแฒแทแกแแซแแญแฏแแบแธ
//           โ   Chit Cute แแญแฏ แแแญแแแญแฏแแบแแซแแฑแฌแบ  โ ''',
//           image: buildImage('assets/logo.png'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: "๐บ EVERYTIME YOU WILL NEED MY ๐๐ข๐ง๐๐ฒ ๐บ",
//           body: '''
//           ๐ง  แแญแฏแธแแฑแธแแแฒแแฝแฌ....
//           ๐จ  แแฑแแฑแธแแแฒแแญแฏแแบ....
//           ๐ค  แแฌแแแบแแผแฎแธ แกแแผแแบแแฝแแบแแแแฒแแฑแฌแบ โ''',
//           image: buildImage('assets/logo.png'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: '๐บ   HAPPY AND ONLY MY ๐๐ข๐ง๐๐ฒ   ๐บ',
//           body: ''' โ  แกแแผแฒแแแบแธ แแฝแแบแแแบแแฑแซแทแแซแธแแฑแแฑแแญแฏแท
//               ๐๐ข๐ง๐๐ฒ แแแบแแผแแญแฏแท  โ ''',
//           footer: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ButtonWidget(
//               text: "LET'S GET STARTED",
//               onClicked: () => goToHome(context),
//             ),
//           ),
//           image: buildImage('assets/logo.png'),
//           decoration: getPageDecoration(),
//         ),
//       ],
//       done: Text("", style: TextStyle(fontWeight: FontWeight.w600)),
//       onDone: () => goToHome(context),
//       showSkipButton: true,
//       skip: Text('SKIP', style: TextStyle(fontSize: 16, color: Colors.orange),),
//       onSkip: () => goToHome(context),
//       next: Icon(Icons.forward_outlined, size: 30, color: Colors.orange),
//       dotsDecorator: getDotDecoration(),
//       onChange: (index) => print('Page $index selected'),
//       globalBackgroundColor: Colors.white,
//       skipFlex: 0,
//       nextFlex: 0,
//       // isProgressTap: false,
//       // isProgress: false,
//       // showNextButton: true,
//       // freeze: true,
//       // animationDuration: 1000,
//     ),
//   );
//
//   void goToHome(context) => Navigator.of(context).pushReplacement(
//     MaterialPageRoute(builder: (_) => HomeScreen()),
//   );
//
//   Widget buildImage(String path) =>
//       Center(child: Image.asset(path, width: 350));
//
//   DotsDecorator getDotDecoration() => DotsDecorator(
//     color: Colors.indigo,
//     activeColor: Colors.orange,
//     size: Size(10, 10),
//     activeSize: Size(22, 10),
//     activeShape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(24),
//     ),
//   );
//
//   PageDecoration getPageDecoration() => PageDecoration(
//     titleTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//     titlePadding: EdgeInsets.only(top: 20),
//     descriptionPadding: EdgeInsets.only(top: 30).copyWith(bottom: 0),
//     imagePadding: EdgeInsets.only(top: 30),
//     pageColor: Colors.white,
//   );
// }
//
//
// class ButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onClicked;
//
//   const ButtonWidget({
//     Key? key,
//     required this.text,
//     required this.onClicked,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => RaisedButton(
//     onPressed: onClicked,
//     color: Colors.orange,
//     shape: StadiumBorder(),
//     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//     child: Text(text,
//       style: TextStyle(color: Colors.white, fontSize: 16),
//     ),
//   );
// }