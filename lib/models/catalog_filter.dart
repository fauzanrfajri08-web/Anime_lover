class CatalogFilter {
  final String searchQuery;
  final String selectedGenre;
  final bool isGridView;

  const CatalogFilter({
    this.searchQuery = '',
    this.selectedGenre = 'Semua',
    this.isGridView = true,
  });

  CatalogFilter copyWith({
    String? searchQuery,
    String? selectedGenre,
    bool? isGridView,
  }) {
    return CatalogFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      isGridView: isGridView ?? this.isGridView,
    );
  }
}