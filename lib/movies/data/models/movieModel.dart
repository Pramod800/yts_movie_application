// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

class MovieModel {
  MovieModel({
    required this.data,
  });

  final Data data;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.movies,
  });

  final List<Movie> movies;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );
}

class Movie {
  Movie({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    // required this.genres,
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    // required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    // required this.state,
    // required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  // final List<String> genres;
  final String summary;
  final String descriptionFull;
  final String synopsis;
  final String ytTrailerCode;
  final String language;
  // final MpaRating mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  // final Stat state;
  // final List<Torrent> torrents;
  final DateTime dateUploaded;
  final int dateUploadedUnix;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        url: json["url"],
        imdbCode: json["imdb_code"],
        title: json["title"],
        titleEnglish: json["title_english"],
        titleLong: json["title_long"],
        slug: json["slug"],
        year: json["year"],
        rating: json["rating"]?.toDouble(),
        runtime: json["runtime"],
        // genres: List<String>.from(json["genres"].map((x) => x)),
        summary: json["summary"],
        descriptionFull: json["description_full"],
        synopsis: json["synopsis"],
        ytTrailerCode: json["yt_trailer_code"],
        language: json["language"],
        // mpaRating: mpaRatingValues.map[json["mpa_rating"]]!,
        backgroundImage: json["background_image"],
        backgroundImageOriginal: json["background_image_original"],
        smallCoverImage: json["small_cover_image"],
        mediumCoverImage: json["medium_cover_image"],
        largeCoverImage: json["large_cover_image"],
        // state: statValues.map[json["state"]]!,
        // torrents: List<Torrent>.from(
        //     json["torrents"].map((x) => Torrent.fromJson(x))),
        dateUploaded: DateTime.parse(json["date_uploaded"]),
        dateUploadedUnix: json["date_uploaded_unix"],
      );
}

enum MpaRating { EMPTY, PG, PG_13 }

// final mpaRatingValues = EnumValues(
//     {"": MpaRating.EMPTY, "PG": MpaRating.PG, "PG-13": MpaRating.PG_13});

// enum Stat { OK }

// final statValues = EnumValues({"ok": Stat.OK});

// class Torrent {
//   Torrent({
//     required this.url,
//     required this.hash,
//     // required this.quality,
//     required this.type,
//     required this.seeds,
//     required this.peers,
//     required this.size,
//     required this.sizeBytes,
//     required this.dateUploaded,
//     required this.dateUploadedUnix,
//   });

//   final String url;
//   final String hash;
//   // final Quality quality;
//   final Type type;
//   final int seeds;
//   final int peers;
//   final String size;
//   final int sizeBytes;
//   final DateTime dateUploaded;
//   final int dateUploadedUnix;

//   factory Torrent.fromJson(Map<String, dynamic> json) => Torrent(
//         url: json["url"],
//         hash: json["hash"],
//         // quality: qualityValues.map[json["quality"]]!,
//         // type: typeValues.map[json["type"]]!,
//         seeds: json["seeds"],
//         peers: json["peers"],
//         size: json["size"],
//         sizeBytes: json["size_bytes"],
//         dateUploaded: DateTime.parse(json["date_uploaded"]),
//         dateUploadedUnix: json["date_uploaded_unix"],
//       );
// }

// enum Quality { THE_720_P, THE_1080_P }

// final qualityValues =
//     EnumValues({"1080p": Quality.THE_1080_P, "720p": Quality.THE_720_P});

// enum Type { WEB, BLURAY }

// final typeValues = EnumValues({"bluray": Type.BLURAY, "web": Type.WEB});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
