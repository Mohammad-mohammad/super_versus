import 'package:decidable/core/services/api.dart';
import 'package:decidable/core/services/fake_api.dart';
import 'package:decidable/core/services/http_api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

const bool USE_FAKE_IMPLEMENTATION = true;

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider<Api>.value(value: USE_FAKE_IMPLEMENTATION ? FakeApi() : HttpApi()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];


