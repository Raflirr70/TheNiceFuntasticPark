import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/data/dprofile.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();

 
  TextEditingController namaController = TextEditingController();
  TextEditingController umurController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  
@override
  void initState() {
    super.initState();
    // Set the initial values of the text fields
    namaController.text = profile.isi[0];
    umurController.text = profile.isi[1];
    alamatController.text = profile.isi[2];
  }

  // Function to handle save button
  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        // Update the profile with the new values
        profile.isi[0] = namaController.text;
        profile.isi[1] = umurController.text;
        profile.isi[2] = alamatController.text;
        Navigator.pop(context,true);
      });

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama field
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Umur field
              TextFormField(
                controller: umurController,
                decoration: const InputDecoration(
                  labelText: 'Umur',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Umur is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Alamat field
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Save button
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.red,
                ),
                child: const Text("Save Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}