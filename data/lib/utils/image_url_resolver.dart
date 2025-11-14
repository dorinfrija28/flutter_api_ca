class ImageUrlResolver {
  static const String baseUrl = 'https://test-api-jlbn.onrender.com';

  /// Resolves image URLs to absolute URLs
  /// If the URL is already absolute (starts with http:// or https://), returns as-is
  /// If the URL is relative, prepends the base URL
  static String resolve(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return '';
    }

    // If already absolute URL, return as-is
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }

    // If starts with /, it's an absolute path on the server
    if (imageUrl.startsWith('/')) {
      return '$baseUrl$imageUrl';
    }

    // Otherwise, it's a relative path
    return '$baseUrl/$imageUrl';
  }

  /// Resolves a list of image URLs
  static List<String> resolveList(List<String>? imageUrls) {
    if (imageUrls == null || imageUrls.isEmpty) {
      return [];
    }
    return imageUrls.map((url) => resolve(url)).toList();
  }
}
