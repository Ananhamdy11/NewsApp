import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
	final String? articleId;
	final String? title;
	final String? link;
  final String? imageUrl;
	final String? description;
	final String? pubDate;

	

	const NewsModel({
		this.articleId, 
		this.title, 
		this.link, 
	
		this.description, 
		this.pubDate, 
		this.imageUrl, 
	
	});

	factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
				articleId: json['article_id'] as String?,
				title: json['title'] as String?,
				link: json['link'] as String?,
				
				description: json['description'] as String?,
				pubDate: json['pubDate'] as String?,
				imageUrl: json['image_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'article_id': articleId,
				'title': title,
				'link': link,
				
				'description': description,
				'pubDate': pubDate,
				'image_url': imageUrl,
				
			};

	@override
	List<Object?> get props {
		return [
				articleId,
				title,
				link,
			
				description,
				pubDate,
				imageUrl,
    ];
	}
}
class NewsResponse {
  final List<NewsModel> articles;

  NewsResponse({required this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      articles: (json['results'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList(),
    );
  }
}
