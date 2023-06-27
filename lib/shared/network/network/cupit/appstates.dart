import 'package:shope_app_mansour/model/login_model.dart';

import '../../../../model/favorit_model.dart';
import '../../../../model/rejestermodel.dart';

abstract class appstate {}

class initialstate extends appstate {}

class lodingstate extends appstate {}

class loginsucsice extends appstate {
  final shopeloginmodel shoplogin;

  loginsucsice(this.shoplogin);
}

class logineror extends appstate {
  final String eror;

  logineror(this.eror);
}

class visipltystate extends appstate {}

class changebottomendex extends appstate {}

class homestate extends appstate {}

class sucsesshomestate extends appstate {}

class erorhomestate extends appstate {}

class categorystate extends appstate {}

class sucsesscategorystate extends appstate {}

class erorcategorystate extends appstate {}

class sucsessfavoritstate extends appstate {
 final favoritmodel model;

  sucsessfavoritstate(this.model);
}

class sucsessfavoritchange extends appstate {}

class erorfavoritstate extends appstate {}

class sucsessfavoritmodelchange extends appstate {}

class erorfavoritmodelstate extends appstate {}
class lodefavoritmodelstate extends appstate {}


class sucsessprofile extends appstate {}

class erorprofilestate extends appstate {}
class lodeprofilestate extends appstate {}
class sucsessregester extends appstate {
 final shopeloginmodel  rejestermod;

  sucsessregester(this.rejestermod);




}

class erorregesterstate extends appstate {}
class loderegesterstate extends appstate {}
