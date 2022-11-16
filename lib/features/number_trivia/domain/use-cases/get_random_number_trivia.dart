import 'package:clean_archetecture/core/error/failures.dart';
import 'package:clean_archetecture/core/use-case/user_case.dart';
import 'package:clean_archetecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_archetecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failures, NumberTrivia>?> call(NoParams params) async {
    return repository.getRandomNumberTrivia();
  }


}
