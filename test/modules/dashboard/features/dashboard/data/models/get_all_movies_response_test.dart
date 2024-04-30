import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';

void main() {
  group('GetAllMoviesResponse', () {
    test('should convert from JSON correctly', () {
      final result = GetAllMoviesResponse.fromJson({
        "content": [
          {
            "id": 1,
            "year": 1980,
            "title": "Movie Title 1",
            "studios": ["Studio Name 1"],
            "producers": ["Producer Name 1"],
            "winner": true
          },
          {
            "id": 2,
            "year": 1985,
            "title": "Movie Title 2",
            "studios": ["Studio Name 2"],
            "producers": ["Producer Name 2"],
            "winner": false
          },
          {
            "id": 3,
            "year": 1990,
            "title": "Movie Title 3",
            "studios": ["Studio Name 3", "Studio Name 4"],
            "producers": ["Producer Name 3"],
            "winner": true
          },
          {
            "id": 4,
            "year": 1995,
            "title": "Movie Title 4",
            "studios": ["Studio Name 5"],
            "producers": ["Producer Name 4"],
            "winner": false
          },
          {
            "id": 5,
            "year": 2000,
            "title": "Movie Title 5",
            "studios": ["Studio Name 6", "Studio Name 7"],
            "producers": ["Producer Name 5"],
            "winner": true
          },
          {
            "id": 6,
            "year": 2005,
            "title": "Movie Title 6",
            "studios": ["Studio Name 8"],
            "producers": ["Producer Name 6"],
            "winner": false
          },
          {
            "id": 7,
            "year": 2010,
            "title": "Movie Title 7",
            "studios": ["Studio Name 9", "Studio Name 10"],
            "producers": ["Producer Name 7"],
            "winner": true
          },
          {
            "id": 8,
            "year": 2015,
            "title": "Movie Title 8",
            "studios": ["Studio Name 11"],
            "producers": ["Producer Name 8"],
            "winner": false
          },
          {
            "id": 9,
            "year": 2020,
            "title": "Movie Title 9",
            "studios": ["Studio Name 12", "Studio Name 13"],
            "producers": ["Producer Name 9"],
            "winner": true
          },
          {
            "id": 10,
            "year": 2021,
            "title": "Movie Title 10",
            "studios": ["Studio Name 14"],
            "producers": ["Producer Name 10"],
            "winner": false
          },
          {
            "id": 11,
            "year": 2022,
            "title": "Movie Title 11",
            "studios": ["Studio Name 15"],
            "producers": ["Producer Name 11"],
            "winner": true
          },
          {
            "id": 12,
            "year": 2023,
            "title": "Movie Title 12",
            "studios": ["Studio Name 16"],
            "producers": ["Producer Name 12"],
            "winner": false
          },
          {
            "id": 13,
            "year": 2024,
            "title": "Movie Title 13",
            "studios": ["Studio Name 17"],
            "producers": ["Producer Name 13"],
            "winner": true
          },
          {
            "id": 14,
            "year": 2025,
            "title": "Movie Title 14",
            "studios": ["Studio Name 18"],
            "producers": ["Producer Name 14"],
            "winner": false
          },
          {
            "id": 15,
            "year": 2026,
            "title": "Movie Title 15",
            "studios": ["Studio Name 19"],
            "producers": ["Producer Name 15"],
            "winner": true
          }
        ],
        "pageable": {
          "sort": {"sorted": false, "unsorted": true},
          "pageSize": 10,
          "pageNumber": 0,
          "offset": 0,
          "paged": true,
          "unpaged": false
        },
        "totalElements": 15,
        "last": false,
        "totalPages": 2,
        "first": true,
        "sort": {"sorted": false, "unsorted": true},
        "number": 0,
        "numberOfElements": 10,
        "size": 10
      });

      expect(result.content.length, 15);
      expect(result.content[0].id, 1);
      expect(result.content[1].id, 2);
      expect(result.pageable.pageNumber, 0);
      expect(result.totalElements, 15);
      expect(result.sort.sorted, false);
    });

    test('should convert to JSON correctly', () {
      final GetAllMoviesResponse response = GetAllMoviesResponse(
        content: [
          MovieEntity(
            id: 1,
            title: 'Test Movie',
            year: 2020,
            winner: false,
            studios: [],
            producers: [],
          ),
          MovieEntity(
            id: 2,
            title: 'Another Test Movie',
            year: 2021,
            winner: true,
            studios: [],
            producers: [],
          )
        ],
        pageable: Pageable(
          sort: Sort(sorted: true, unsorted: false),
          pageSize: 10,
          pageNumber: 1,
          offset: 0,
          paged: true,
          unpaged: false,
        ),
        totalElements: 2,
        last: false,
        totalPages: 1,
        first: true,
        sort: Sort(sorted: true, unsorted: false),
        number: 1,
        numberOfElements: 2,
        size: 10,
      );

      final result = response.toJson();

      expect(result['content'][0]['id'], 1);
      expect(result['content'][1]['id'], 2);
      expect(result['pageable']['pageNumber'], 1);
      expect(result['totalElements'], 2);
      expect(result['sort']['sorted'], true);
    });
  });
}
