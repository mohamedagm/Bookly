import 'package:bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> previewBook(context, String url) async {
  final uri = Uri.parse(url);
  final canLaunch = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!canLaunch) {
    customSnackBar(context, 'Could not launch link:$url');
  }
}
