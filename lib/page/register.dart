import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/dprofile.dart';
import 'package:the_nice_funstantic_park/page/utama.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();
  TextEditingController cpassControler = TextEditingController();

  bool cekPass() {
    return passControler.text == cpassControler.text;
  }

  void daftar() {
    if(emailControler.text.isEmpty || passControler.text.isEmpty || cpassControler.text.isEmpty)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak Boleh Ada yang Kosong'),duration: Duration(seconds: 2)),
      );
    }else{
       if (cekPass()) {
      setState(() {
        profile.isi[0]=emailControler.text;
         profile.isi[4]=passControler.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Berhasil Daftar'),duration: Duration(seconds: 2)),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Utama();
      },));

      
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password dan Confirm Password tidak sama'),duration: Duration(seconds: 2)),
      );
    }
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(  
        child: Column(
          children: [
            SizedBox(
               width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height- MediaQuery.of(context).size.height/5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10), // Space
                    TextField(
                      controller: emailControler,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.alternate_email_outlined),
                        prefixIconColor: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10), // Space
                    TextField(
                      controller: passControler,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        prefixIconColor: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Konfirmasi Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10), // Space
                    TextField(
                      controller: cpassControler,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Konfirmasi Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        prefixIconColor: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 50), // Space
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: daftar,  // Call the daftar function
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Daftar",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30), // Space
                    const Center(child:  Text(
                      "Daftar Dengan",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),),
                    const SizedBox(height: 10), // Space
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text("Google"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text("Facebook"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Space
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
