import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class NewsFile extends StatefulWidget {
  const NewsFile({super.key});

  @override
  State<NewsFile> createState() => _NewsFileState();
}

class _NewsFileState extends State<NewsFile> {
  List<NewsModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    const String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-11-03&sortBy=publishedAt&apiKey=a7452d9a9e9244b2bec9738eb946d042';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List articlesJson = data['articles'];

        setState(() {
          articles = articlesJson
              .map((article) => NewsModel.fromJson(article))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e); // Handle error gracefully in production
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Title'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      article.urlToImage.isNotEmpty
                          ? Image.network(article.urlToImage)
                          : const Text('No Image'), // Handle no image case
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          article.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(article.description),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Published at: ${article.publishedAt}',
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
