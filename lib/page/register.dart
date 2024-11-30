import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back),color: Colors.black,)
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
          Expanded(
            //TAMPILAN UATAMA

            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 40, right: 40),

                // CONTAINER UTAMA

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10), //Buat Jarak

                    // BOX EMAIL
                    TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon:
                              const Icon(Icons.alternate_email_outlined),
                          prefixIconColor: Colors.black38),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10), //Buat Jarak

                    // BOX PASSWORD
                    TextField(
                      controller: TextEditingController(),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          prefixIconColor: Colors.black38),
                    ),

                    const SizedBox(height: 30), //Buat Jarak

                    const Text(
                      "Konfirmasi Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10), //Buat Jarak

                    // BOX CONFIRM PASSWORD
                    TextField(
                      controller: TextEditingController(),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Konfirmasi Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          prefixIconColor: Colors.black38),
                    ),

                    const SizedBox(height: 50), //Buat Jarak

                    //TOMBOL DAFTAR
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
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

                    const SizedBox(height: 100), //Buat Jarak

                    //CONTAINER 2
                    Expanded(
                        child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            "Daftar Dengan",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),

                          const SizedBox(height: 10), //Buat Jarak

                          //WADAH TOMBOL
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //TOMBOL GOGGLE
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                child: const Text("Goggle"),
                              ),

                              //TOMBOL FACEBOOK
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                child: const Text("Facebook"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
