import 'package:flutter/material.dart';
import 'package:sortir/core/domain/model/login/login_request.dart';
import 'package:sortir/core/domain/model/login/login_response.dart';
import 'package:sortir/core/domain/use%20cases/use_case.dart';
import 'package:sortir/core/infraestructure/impl/service.dart';
import 'package:sortir/core/infraestructure/store/user_store.dart';
import 'package:sortir/post/presentation/components/action_button.dart';
import 'package:sortir/post/presentation/components/text_form_inut.dart';
import '../../layout/layout_forms.dart';


class Login extends StatefulWidget {
  Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String emailValue = '';
  String passwordValue = '';
  final UseCase useCase = Service();
  UserStore userStore = UserStore();


  @override
  Widget build(BuildContext context) {
    return LayoutForms(
      title: 'Login',
      children:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 46),
          TextFormInput(
            hintText: 'Email',
            type: 'email',
            width: 0.9,
            onChanged: (value){
              setState(() {
                emailValue = value;
              });
              print(emailValue);}
            ,),
          const SizedBox(height: 46),
          TextFormInput(
            hintText: 'Password',
            type: 'password',
            width: 0.9,
            onChanged: (value){
              setState(() {
                passwordValue = value;
              });
              print(passwordValue);}
            ,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ActionButton(
            navigateTo: 'login',
            content: 'CONTINUE',
            color: Color(0xff9747FF),
            txtColor: Colors.white,
            onPressed: () async {
              if(emailValue == '' || passwordValue == ''){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Login Failed'),
                      content: Text('Please fill all the fields.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                return;
              }else{
                LoginResponse loginResponse = await useCase.login(emailValue, passwordValue);
                print(loginResponse.jwtToken);
                if(loginResponse.jwtToken != ''){
                  try{
                    await userStore.setJwtToken(loginResponse.jwtToken);
                    await userStore.setId(loginResponse.id);
                  }catch(e){
                    print(e);
                  }
                  Navigator.pushNamed(context, 'init');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Login Failed'),
                        content: Text('Invalid email or password.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },),
        ],
      ),
    );
  }
}