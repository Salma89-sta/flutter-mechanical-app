// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:untitled9/pages/login.dart';
// import 'package:untitled9/pages/signUp.dart';
//
// class LogSignButton extends StatefulWidget {
//   dynamic color;
//   LogSignButton(this.color);
//
//   @override
//   State<LogSignButton> createState() => _LogSignButtonState();
// }
//
// class _LogSignButtonState extends State<LogSignButton> {
//   late bool isLogin=true;
//   late Function fun1;
//   late Function fun2;
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(30.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
//                     color: widget.color,
//                   ),
//                   child: TextButton(
//                     onPressed: (){
//                         setState(() {
//                           isLogin = true;
//                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Firts()));
//                         });
//                     },
//                       child: Text(
//                     'Log in',
//                     style: TextStyle(fontSize: 25, color: Colors.teal[900]),
//                   )),
//                 ),
//               ),
//             ),
//
//             Expanded(
//               child: Container(
//                 child: TextButton(
//                   onPressed: (){
//                     setState(() {
//                       isLogin = false;
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()),);
//                     });
//                   },
//                   child: Text(
//                     'Sign up',
//                     style: TextStyle(fontSize: 25, color: Colors.teal[900]),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(topRight:Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
//                   color: widget.color,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
