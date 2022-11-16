import 'package:clean_archetecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_archetecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_archetecture/features/number_trivia/domain/use-cases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia useCases;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late int testNumber;
  late NumberTrivia numberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCases = GetConcreteNumberTrivia(mockNumberTriviaRepository);
    testNumber = 1;
    numberTrivia = const NumberTrivia(number: 1, text: 'Test');
  });

  test(
    'should get trivia of number from repository',
    () async {
      //  arrange
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(1))
          .thenAnswer((_) async => Right(numberTrivia));

      //  act
      final result = await useCases(Params(number: testNumber));

      //  assert
      expect(result, Right(numberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(testNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
