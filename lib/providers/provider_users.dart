import 'package:auto_test_app/data/client.dart';
import 'package:auto_test_app/models/services_model.dart';
import 'package:auto_test_app/models/users_model.dart';


class DataProvider{
    Future<List<User>> getValuePerson() async {
        List<User> _user = [];
        await Future.delayed(const Duration(seconds: 10));
        for (var item in dataPerson) {
            _user.add(User.fromJson(item));
        }
        return _user;
    }

    Future<List<Service>> getValueServices() async {
        List<Service> _services = [];
        await Future.delayed(const Duration(seconds: 2));
        for (var item in dataPersonService) {
            _services.add(Service.fromJson(item));
        }
        return _services;
    }


}

