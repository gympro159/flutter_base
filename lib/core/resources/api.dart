import 'package:flutter_dotenv/flutter_dotenv.dart';

String urlTest = dotenv.env['HOST'] ?? '';
