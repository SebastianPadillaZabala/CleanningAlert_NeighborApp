import 'package:cleanning_alert_neighbor/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;

User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
