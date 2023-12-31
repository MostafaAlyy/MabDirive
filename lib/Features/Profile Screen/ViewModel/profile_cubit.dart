import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/Database/Firebse/my_database.dart';
import '../../Auth/Login/Models/user.dart' as MyUser;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  MyUser.UserModel? currentUser;

  Future<MyUser.UserModel?> getUserFromDataBase() async {
    var user =
        await MyDataBase.readUser(FirebaseAuth.instance.currentUser?.uid ?? "");
    currentUser = user;
    return user;
  }
}
