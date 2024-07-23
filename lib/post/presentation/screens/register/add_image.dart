import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sortir/core/domain/model/register/register_response.dart';
import 'package:sortir/core/infraestructure/impl/service.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/layout/layout_forms.dart';
import 'package:sortir/post/presentation/screens/register/registration_provider.dart';
import 'package:sortir/core/domain/use cases/use_case.dart';

class ImagePickerScreen extends StatelessWidget {
  final UseCase useCase = Service();
  final _profileImageController = ValueNotifier<File?>(null);
  final _coverImageController = ValueNotifier<File?>(null);

  ImagePickerScreen({super.key});

  Future<File?> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      code: 0,
      title: 'Select Images',
      children: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildImagePicker(context, _profileImageController, 'Profile Image', (value) {
                  Provider.of<RegistrationProvider>(context, listen: false).updateFile(value);
                }),
                _buildImagePicker(context, _coverImageController, 'Cover Image', (value) {
                  Provider.of<RegistrationProvider>(context, listen: false).updateFrontPage(value);
                }),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            Align(
              alignment: Alignment.bottomCenter,
              child: ActionButton(
                navigateTo: 'phone_number',
                content: 'CONTINUE',
                color: Color(0xff9747FF),
                txtColor: Colors.white,
                onPressed: () async {
                  final profileImage = _profileImageController.value?.path;
                  final coverImage = _coverImageController.value?.path;
                  if (profileImage != null && coverImage != null) {
                    Provider.of<RegistrationProvider>(context, listen: false).updateFile(profileImage);
                    Provider.of<RegistrationProvider>(context, listen: false).updateFrontPage(coverImage);
                    print(Provider.of<RegistrationProvider>(context, listen: false).registrationData);
                    final response = await useCase.register(
                      Provider.of<RegistrationProvider>(context, listen: false).registrationData,
                    );
                    if (response is RegisterResponse) {
                      Navigator.pushNamed(context, 'login');
                    }
                  }
                },
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buildImagePicker(BuildContext context, ValueNotifier<File?> controller, String title, Function(String) updateFunction) {
    return Column(
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff828693))),
          ValueListenableBuilder<File?>(
            valueListenable: controller,
            builder: (context, file, _) {
              return GestureDetector(
                onTap: () async {
                  final imageFile = await _pickImage(context);
                  if (imageFile != null) {
                    updateFunction(imageFile.path);
                    controller.value = imageFile;
                  }
                },
                child: Container(
                  width: 160,
                  height: 500 * 9 / 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff828693)),
                  ),
                  child: file != null
                      ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: FileImage(file),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                      : const Center(child: Text('Tap to select image', style: TextStyle(color: Color(0xff828693)))),
                ),
              );
            },
          ),
        ],
      );
  }
}