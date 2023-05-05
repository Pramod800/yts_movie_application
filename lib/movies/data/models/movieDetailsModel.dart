import 'package:hive_flutter/hive_flutter.dart';
part 'movieDetailsModel.g.dart';

@HiveType(typeId: 0)
class MovieDetailsModel extends HiveObject {
  @HiveField(0)
  final Data data;

  MovieDetailsModel({
    required this.data,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        data: Data.fromJson(json["data"]),
      );
  
  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

@HiveType(typeId: 1)
class Data extends HiveObject {
  @HiveField(0)
  final Movie movie;

  Data({
    required this.movie,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        movie: Movie.fromJson(json["movie"]),
      );

  Map<String, dynamic> toJson() => {
        "movie": movie.toJson(),
      };
}

@HiveType(typeId: 2)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int year;

  @HiveField(3)
  final int downloadCount;

  @HiveField(4)
  final int likeCount;

  @HiveField(5)
  final String descriptionIntro;

  @HiveField(6)
  final String largeCoverImage;

  @HiveField(7)
  List<Cast>? cast;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    // required this.rating,
    required this.downloadCount,
    required this.likeCount,
    required this.descriptionIntro,
    this.cast,
    required this.largeCoverImage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"] ?? '',
        year: json["year"] ?? '',
        // rating: json["rating"] ?? '',
        downloadCount: json["download_count"] ?? '',
        likeCount: json["like_count"] ?? '',
        descriptionIntro: json["description_intro"] ?? '',
        largeCoverImage: json["large_cover_image"] ?? "",
        cast: json["cast"] == null
            ? []
            : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        // "rating": rating,
        "download_count": downloadCount,
        "like_count": likeCount,
        "description_intro": descriptionIntro,
        "large_cover_image": largeCoverImage,
        "cast": cast == null
            ? []
            : List<dynamic>.from(cast!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 3)
class Cast extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? characterName;

  @HiveField(2)
  String? urlSmallImage;

  @HiveField(3)
  String? imdbCode;

  Cast({
    this.name,
    this.characterName,
    this.urlSmallImage,
    this.imdbCode,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        name: json["name"],
        characterName: json["character_name"],
        urlSmallImage: json["url_small_image"],
        imdbCode: json["imdb_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "character_name": characterName,
        "url_small_image": urlSmallImage,
        "imdb_code": imdbCode,
      };
}


// class Torrent {
//   final String url;
//   final String hash;
//   final String quality;
//   final String type;
//   final int seeds;
//   final int peers;
//   final String size;
//   final int sizeBytes;
//   final DateTime dateUploaded;
//   final int dateUploadedUnix;

//   Torrent({
//     required this.url,
//     required this.hash,
//     required this.quality,
//     required this.type,
//     required this.seeds,
//     required this.peers,
//     required this.size,
//     required this.sizeBytes,
//     required this.dateUploaded,
//     required this.dateUploadedUnix,
//   });

//   factory Torrent.fromJson(Map<String, dynamic> json) => Torrent(
//         url: json["url"],
//         hash: json["hash"],
//         quality: json["quality"],
//         type: json["type"],
//         seeds: json["seeds"],
//         peers: json["peers"],
//         size: json["size"],
//         sizeBytes: json["size_bytes"],
//         dateUploaded: DateTime.parse(json["date_uploaded"]),
//         dateUploadedUnix: json["date_uploaded_unix"],
//       );
// }
