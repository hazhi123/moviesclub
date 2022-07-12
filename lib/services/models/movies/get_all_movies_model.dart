// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

import 'movies_model.dart';

GetAllMoviesModel getAllMoviesModelFromJson(String str) =>
    GetAllMoviesModel.fromJson(json.decode(str));

String getAllMoviesModelToJson(GetAllMoviesModel data) =>
    json.encode(data.toJson());

class GetAllMoviesModel {
  GetAllMoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalMovieModels,
  });

  final int? page;
  final List<MovieModel>? results;
  final int? totalPages;
  final int? totalMovieModels;

  factory GetAllMoviesModel.fromJson(Map<String, dynamic> json) =>
      GetAllMoviesModel(
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalMovieModels: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalMovieModels,
      };
}
