// import 'package:dio/dio.dart';
// import 'package:elyx_task_regres/cache_manager.dart';
// import 'package:elyx_task_regres/main.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   final VoidCallback onClickedSignIn;

//   const SignUpPage({
//     Key? key,
//     required this.onClickedSignIn,
//   }) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(height: 40),
//               TextFormField(
//                 controller: emailController,
//                 cursorColor: Colors.white,
//                 textInputAction: TextInputAction.next,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (email) =>
//                     email != null && !EmailValidator.validate(email)
//                         ? "Enter a valid email"
//                         : null,
//               ),
//               const SizedBox(height: 4),
//               TextFormField(
//                 controller: passwordController,
//                 cursorColor: Colors.black,
//                 textInputAction: TextInputAction.done,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) => value != null && value.length < 6
//                     ? "Enter a min. 6 characters"
//                     : null,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size.fromHeight(50),
//                 ),
//                 onPressed: signUp,
//                 icon: const Icon(
//                   Icons.lock_open,
//                   size: 34,
//                 ),
//                 label: const Text(
//                   'Sign Up',
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               RichText(
//                 text: TextSpan(
//                     style: const TextStyle(color: Colors.black, fontSize: 20),
//                     text: "Already have an account?  ",
//                     children: [
//                       TextSpan(
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = widget.onClickedSignIn,
//                         text: "Log in",
//                         style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           color: Theme.of(context).colorScheme.secondary,
//                         ),
//                       ),
//                     ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future signUp() async {
//     final isValid = formKey.currentState!.validate();
//     if (!isValid) return;
//     final String email = emailController.text.trim();
//     final String password = passwordController.text.trim();

//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const Center(child: CircularProgressIndicator()),
//     );

//     try {
//       final Response response = await Dio().post(
//         "https://reqres.in/api/register",
//         data: {
//           "email": email,
//           "password": password,
//         },
//       ).catchError((onError) {
//         print(onError.toString());
//       });
//       print(response.statusCode);

//       if (response.statusCode == 200) {
//         CacheManager.setToken(response.data["token"]);
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const MainPage(),
//           ),
//           (route) => false,
//         );
//       } else {
//         print('');
//       }
//     } catch (e) {
//       print(e);
//       // Utils.showSnackBar(e.message);
//     }
//     // Utils.getBack();
//   }

// }

