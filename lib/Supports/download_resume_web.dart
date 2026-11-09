import 'dart:html' as html;

Future<void> downloadResumeImpl() async {
  const url = 'assets/assets/mohd_usama_resume.pdf';

  html.AnchorElement(href: url)
    ..setAttribute("download", "mohd_usama_resume.pdf")
    ..click();
}
