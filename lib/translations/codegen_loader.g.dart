// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> hu = {
  "common": {
    "continue": "TODO",
    "dismiss": "TODO",
    "search": "TODO",
    "no_items": "TODO",
    "retry": "TODO",
    "error_title": "TODO",
    "error_subtitle": "TODO",
    "save": "TODO",
    "edit": "TODO",
    "are_you_sure": "TODO",
    "cancel": "TODO"
  },
  "games": {
    "title": "TODO",
    "hot_games": "TODO"
  },
  "onboarding": {
    "headline": "TODO",
    "cta_title": "TODO",
    "welcome": "TODO"
  },
  "plays": {
    "title": "TODO",
    "game_picker_headline": "TODO",
    "date_picker_headline": "TODO",
    "add_player_x": "TODO {}",
    "add_player_hint": "TODO",
    "player_picker_headline": "TODO",
    "empty_title": "TODO",
    "empty_cta_title": "TODO",
    "past_plays": "TODO",
    "detail_x_min": "{} TODO",
    "detail_date": "TODO",
    "delete_play": "TODO",
    "delete_disclaimer": "TODO",
    "score_edit_hint": "TODO",
    "score_add_hint": "TODO",
    "detail_players": "TODO",
    "detail_edit_score": "TODO",
    "detail_tap_to_add": "TODO",
    "detail_you": "TODO",
    "you": "TODO",
    "add_new": "TODO"
  },
  "settings": {
    "title": "TODO",
    "your_name": "TODO",
    "name_updated": "TODO"
  }
};
static const Map<String,dynamic> en = {
  "common": {
    "continue": "Continue",
    "dismiss": "Dismiss",
    "search": "Search",
    "no_items": "No matching items.",
    "retry": "Retry",
    "error_title": "Oops, something went wrong",
    "error_subtitle": "Please try again later.",
    "save": "Save",
    "edit": "Edit",
    "are_you_sure": "Are you sure?",
    "cancel": "Cancel"
  },
  "games": {
    "title": "Games",
    "hot_games": "Hot Games"
  },
  "onboarding": {
    "headline": "How should we call you?",
    "cta_title": "Get started",
    "welcome": "Welcome to BoardBit!"
  },
  "plays": {
    "title": "Plays",
    "game_picker_headline": "Which game did you play?",
    "date_picker_headline": "When did you play?",
    "add_player_x": "Add player named \"{}\"",
    "add_player_hint": "Start typing to add new player",
    "player_picker_headline": "Who did you play with?",
    "empty_title": "Played any games yet?",
    "empty_cta_title": "Add play",
    "past_plays": "Past Plays",
    "detail_x_min": "{} min",
    "detail_date": "Date",
    "delete_play": "Delete",
    "delete_disclaimer": "This will delete the play and all associated data.",
    "score_edit_hint": "Edit or delete score",
    "score_add_hint": "Add score",
    "detail_players": "Players",
    "detail_edit_score": "Edit score",
    "detail_tap_to_add": "Tap to add scores",
    "detail_you": " (You)",
    "you": "You",
    "add_new": "Add new"
  },
  "settings": {
    "title": "Settings",
    "your_name": "Your name",
    "name_updated": "Name updated."
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"hu": hu, "en": en};
}
