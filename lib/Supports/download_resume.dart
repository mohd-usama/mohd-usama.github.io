import 'download_resume_mobile.dart'
if (dart.library.html) 'download_resume_web.dart';

Future<void> downloadResume() async {
  return downloadResumeImpl();
}
