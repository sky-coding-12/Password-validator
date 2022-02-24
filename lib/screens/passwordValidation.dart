import 'package:flutter/material.dart';
import 'package:password_validator/screens/success_login.dart';

class PasswordValidation extends StatefulWidget {
  const PasswordValidation({Key? key}) : super(key: key);

  @override
  State<PasswordValidation> createState() => _PasswordValidationState();
}

class _PasswordValidationState extends State<PasswordValidation> {
  bool _isVisible = false;
  bool _isPasswordEightChar = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordSpecialChar = false;

  bool _isDisable = true;

  onPasswordChanged(String password) {
    setState(() {
      final nuberRegex = RegExp(r'[0-9]');
      final specialCharRegex = RegExp(r'[_!\-=@,\.;$%^&*~/#]');

      _isPasswordEightChar = false;
      if (password.length >= 8) {
        _isPasswordEightChar = true;
      }

      _hasPasswordOneNumber = false;
      if (nuberRegex.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }

      _hasPasswordSpecialChar = false;
      if (specialCharRegex.hasMatch(password)) {
        _hasPasswordSpecialChar = true;
      }

      _isDisable = true;
      if (password.length >= 8 &&
          nuberRegex.hasMatch(password) &&
          specialCharRegex.hasMatch(password)) {
        _isDisable = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          children: const [
            Text(
              "Password Validation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Text(
              "Made by THE SKY",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 15.0,
              ),
            )
          ],
        ),
        elevation: 15.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
        shadowColor: Colors.red.shade400,
        centerTitle: true,
        toolbarHeight: 65.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 25.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Set a Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Please create secure password including the criteria below",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.red.shade300,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  // onChanged: (password) => onPasswordChanged(password),
                  onChanged: (password) {
                    onPasswordChanged(password);
                  },
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey.shade700,
                  ),
                  obscureText: !_isVisible,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 15.0,
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: _isPasswordEightChar &&
                                _hasPasswordOneNumber &&
                                _hasPasswordSpecialChar
                            ? Colors.green
                            : Colors.red,
                        width: 1.5,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: _isVisible
                          ? Icon(
                              Icons.visibility,
                              color: _isPasswordEightChar &&
                                      _hasPasswordOneNumber &&
                                      _hasPasswordSpecialChar
                                  ? Colors.green
                                  : Colors.red,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: _isPasswordEightChar &&
                                      _hasPasswordOneNumber &&
                                      _hasPasswordSpecialChar
                                  ? Colors.green.shade500
                                  : Colors.red.shade300,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: _isPasswordEightChar
                            ? Colors.green.shade500
                            : Colors.red.shade500,
                        border: _isPasswordEightChar
                            ? Border.all(color: Colors.green.shade500)
                            : Border.all(color: Colors.red.shade600),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: Icon(
                          _isPasswordEightChar ? Icons.check : Icons.cancel,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Contains at least 8 characters",
                      style: TextStyle(
                        color: _isPasswordEightChar
                            ? Colors.green.shade500
                            : Colors.red.shade500,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: _hasPasswordOneNumber
                            ? Colors.green.shade500
                            : Colors.red.shade500,
                        border: _hasPasswordOneNumber
                            ? Border.all(color: Colors.green.shade500)
                            : Border.all(
                                color: Colors.red.shade600,
                              ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: Icon(
                          _hasPasswordOneNumber ? Icons.check : Icons.cancel,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Contains at least 1 number",
                      style: TextStyle(
                        color: _hasPasswordOneNumber
                            ? Colors.green.shade500
                            : Colors.red.shade500,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: _hasPasswordSpecialChar
                            ? Colors.green.shade500
                            : Colors.red.shade500,
                        border: _hasPasswordSpecialChar
                            ? Border.all(color: Colors.green.shade500)
                            : Border.all(
                                color: Colors.red.shade600,
                              ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: Icon(
                          _hasPasswordSpecialChar ? Icons.check : Icons.cancel,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Contains at least 1 special character",
                      style: TextStyle(
                        color: _hasPasswordSpecialChar
                            ? Colors.green.shade500
                            : Colors.red.shade500,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MaterialButton(
                  onPressed: !_isDisable
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessfulLogin()),
                          );
                        }
                      : null,
                  disabledColor: const Color.fromARGB(97, 0, 0, 0),
                  disabledTextColor: Colors.white24,
                  disabledElevation: 1.0,
                  splashColor: Colors.white,
                  minWidth: double.infinity,
                  height: 50.0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
