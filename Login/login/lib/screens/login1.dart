import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  // Biến check nội dung
  // Nếu nội dung trong TextField trong rỗng thì mới hiện thị ICon
  late TextEditingController _controllerEmail;
  bool _isCheckContent = false; // ✅ Kiểm tra nếu có nội dung

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();

    // ✅ Lắng nghe khi có thay đổi trong TextField
    _controllerEmail.addListener(() {
      setState(() {
        _isCheckContent = _controllerEmail.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controllerEmail.dispose(); // ✅ Giải phóng bộ nhớ khi widget bị huỷ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var _controllerEmail = TextEditingController() ;

    // Dùng một biến khoảng cách chung
    final SizedBox spacing = SizedBox(height: 10);
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  spacing,
                  Text('Welcome',
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 7, 75, 9))),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Sign in or create an account',
                        style: GoogleFonts.poppins(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 7, 75, 9))),
                  ),
                  // Add a space
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          '''Your everyday grocery shopping is here! \nPlease enter your email address to start 
                          ''',
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color:
                                  const Color.fromARGB(255, 161, 161, 161)))),

                  // TextField
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      //textAlignVertical: TextAlignVertical.top, // ✅ Đưa hintText lên trên
                        controller:
                            _controllerEmail, // Nhớ thêm controller chổ này
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.black), 
                              borderRadius: BorderRadius.circular(11),
                            
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: const Color.fromARGB(255, 48, 250, 135)),
                              borderRadius: BorderRadius.circular(11),
                            ),

                            border: OutlineInputBorder(
                              
                            ),
                            hintText: 'Email Address',
                            labelText: 'Email Address',
                            // Can chinh
                            contentPadding: EdgeInsets.only(top: 0, left: 16, bottom: 20),
                            hintStyle: GoogleFonts.poppins(fontSize: 12),
                            suffixIcon: _isCheckContent
                                ? IconButton(
                                    onPressed: () {
                                      _controllerEmail.clear();
                                      // Sau khi clear het phai cap nhat phai trang thai bien isCheckContent la False
                                      setState(() {
                                        _isCheckContent = false;
                                      });
                                    },
                                    icon: Icon(Icons.close))
                                : null)),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Add a button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        child: Text('Continue',
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 3, 45, 4),
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 125, 198, 29)),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // 1
                  Text(
                    'or continue with',
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 103, 110, 103),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  // 2
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 149, 144, 144))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage('google-logo.png'),
                              fit: BoxFit.cover),
                          const SizedBox(
                            width: 6,
                          ),
                          Text('Continue with Google',
                              style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 3, 45, 4),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15)),
                        ],
                      )),
                  // 3
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text.rich(
                        TextSpan(
                          text:
                              'By continuing you agree to ', // Phần bình thường
                          style: GoogleFonts.openSans(
                            color: Color.fromARGB(255, 103, 110, 103),
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service', // Phần in đậm & tô màu
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 2, 49, 15),
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                            ),
                            TextSpan(
                              text:
                                  'Privacy Policy', // Phần in đậm & tô màu khác
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 9, 70, 19),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
