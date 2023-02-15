# executa o teste de cobertura e gera o arquivo coverage/lcov.info
flutter test --coverage
# remove os arquivos gerados automaticamente da cobertura
lcov --remove coverage/lcov.info 'lib/*.g.dart' -o coverage/lcov.info
