import 'package:eventzone/core/domain/entities/event_details.dart';
import 'package:eventzone/core/utils/functions.dart';
import 'package:eventzone/events/data/models/cast_model.dart';
import 'package:eventzone/events/data/models/event_model.dart';
import 'package:eventzone/events/data/models/review_model.dart';

// ignore: must_be_immutable
class EventDetailsModel extends MediaDetails {
  EventDetailsModel({
    required super.tmdbID,
    required super.title,
    required super.posterUrl,
    required super.backdropUrl,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.trailerUrl,
    required super.cast,
    required super.reviews,
    required super.similar,
  });

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsModel(
      tmdbID: json['id'],
      title: json['title'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getBackdropUrl(json['backdrop_path']),
      releaseDate: getDate(json['release_date']),
      genres: getGenres(json['genres']),
      runtime: getLength(json['runtime']),
      overview: json['overview'] ?? '',
      voteAverage:
          double.parse((json['vote_average'] as double).toStringAsFixed(1)),
      voteCount: getVotesCount(json['vote_count']),
      trailerUrl: getTrailerUrl(json),
      cast: List<CastModel>.from(
          (json['credits']['cast'] as List).map((e) => CastModel.fromJson(e))),
      reviews: List<ReviewModel>.from((json['reviews']['results'] as List)
          .map((e) => ReviewModel.fromJson(e))),
      similar: List<EventModel>.from((json['similar']['results'] as List)
          .map((e) => EventModel.fromJson(e))),
    );
  }
}