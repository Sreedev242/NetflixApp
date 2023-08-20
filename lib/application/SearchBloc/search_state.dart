part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
required List<Downloads> idleList,
required List<SearchResultData> searchResultList,
required bool isLoading,
required bool isError
      }) = _SearchState;
factory SearchState.initial()=>const SearchState(
  idleList: [], 
  searchResultList: [], 
  isLoading: false, 
  isError: false,);
}
