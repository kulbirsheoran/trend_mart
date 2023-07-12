import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore fireStore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;


const userCollection = 'users';
const productsCollection = 'products';
const cartCollection ='cart';
const chatsCollection ='chats';
const messageCollection ='messages';