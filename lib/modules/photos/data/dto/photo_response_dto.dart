final class PhotoResponseDto {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final Src src;
  final bool liked;
  final String alt;

  const PhotoResponseDto({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory PhotoResponseDto.fromJson(Map<String, dynamic> json) {
    return PhotoResponseDto(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: Src.fromJson(json['src']),
      liked: json['liked'],
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src': src.toJson(),
      'liked': liked,
      'alt': alt,
    };
  }
}

final class Src {
  final String original;
  final String large2X;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  const Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      original: json['original'],
      large2X: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original,
      'large2x': large2X,
      'large': large,
      'medium': medium,
      'small': small,
      'portrait': portrait,
      'landscape': landscape,
      'tiny': tiny,
    };
  }
}
