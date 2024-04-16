import 'package:cocomu/app/enum/community.dart';
import 'package:cocomu/data/providers/dcinside/dcinside_category.dart';
import 'package:cocomu/data/providers/dcinside/dcinside_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:beautiful_soup_dart/beautiful_soup.dart';

class DcinsideAPI extends GetConnect implements GetxService {
  String get endpoint => DcinsideEndpoint.endpoint;

  getArticle(String category, int page) async {
    final response = await get('https://gall.dcinside.com/$category/$page');
    String html = response.body;
    BeautifulSoup bs = BeautifulSoup(html);

    Community community = Community.dcinside;
    String title = bs.find('span', class_: 'title_subject')!.text;
    String author = bs.find('span', class_: 'nickname')!.text;

    String numViews = bs.find('span', class_: 'gall_count')!.text;
    String numRecommendations = bs.find('span', class_: 'gall_reply_num')!.text;
    String numReviews = bs.find('span', class_: 'gall_comment')!.text;
    String createdAt = bs.find('span', class_: 'gall_date')!.text;
    Bs4Element content = bs.find('div', class_: 'write_div')!;

    // print('title: $title');
    // print('author: $author');
    // print('numViews: $numViews');
    // print('numRecommendations: $numRecommendations');
    // print('numReviews: $numReviews');
    // print('createdAt: $createdAt');
    print('content: ${content.outerHtml}');
    print('scripts: ${extractScriptFromHtml(content.outerHtml)} ');

    if (response.status.hasError) {
      return Future.error({response.statusText});
    } else {}
  }

  String extractScriptFromHtml(String htmlContent) {
    RegExp scriptRegex = RegExp(r'<script[^>]*>([\s\S]*?)<\/script>');
    Iterable<Match> matches = scriptRegex.allMatches(htmlContent);
    String scriptContent = '';

    for (Match match in matches) {
      scriptContent += match.group(1)!;
    }

    return scriptContent;
  }
}
