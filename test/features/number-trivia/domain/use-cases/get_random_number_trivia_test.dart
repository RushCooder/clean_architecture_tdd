import 'package:clean_archetecture/core/use-case/user_case.dart';
import 'package:clean_archetecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_archetecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_archetecture/features/number_trivia/domain/use-cases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late NumberTrivia numberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetRandomNumberTrivia(mockNumberTriviaRepository);
    numberTrivia = const NumberTrivia(text: 'Test', number: 1);
  });

  test(
    'should get trivia from repository',
    () async{
      //  arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(numberTrivia));
      //  act
      final result = await useCase(NoParams());
      //  assert
      expect(result, Right(numberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
