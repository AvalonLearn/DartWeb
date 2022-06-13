// 加载远程数据 https://dart.dev/tutorials/web/fetch-data#using-getString-function

import 'dart:async';
import 'dart:convert';
import 'dart:html';

final UListElement wordList = querySelector('#wordList') as UListElement;

void main() {
  querySelector('#getWords')!.onClick.listen(makeRequest);
}

Future<void> makeRequest(Event _) async {
  const path = 'portmanteaux.json';
  const url =
      'https://github.com/YN3011140075/02_DartWeb/blob/main/web/portmanteaux.json';
  const testurl = 'https://dart.cn/f/portmanteaux.json';

  try {
    final jsonString = await HttpRequest.getString(testurl);
    processResponse(jsonString);
  } catch (e) {
    print("Couldn't open $testurl");
    wordList.children.add(LIElement()..text = 'Request failed.');
  }
}

void processResponse(String jsonString) {
  Set<String> wordSet = Set();
  for (final portmanteau in json.decode(jsonString) as List<dynamic>) {
    wordSet.add(portmanteau as String);
  }
  wordSet.forEach((element) {
    wordList.children.add(LIElement()..text = element);
  });
}
