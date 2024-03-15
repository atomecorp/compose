Opal.modules["authentication/login_form"] = function(Opal) {/* Generated by Opal 1.8.2 */
  var $send = Opal.send, $eqeq = Opal.eqeq, $truthy = Opal.truthy, $def = Opal.def, $rb_plus = Opal.rb_plus, self = Opal.top, $nesting = [], $$ = Opal.$r($nesting), nil = Opal.nil;

  Opal.add_stubs('box,touch,==,target,delete,text,component,message,puts,inspect,[],key?,setItem,global,empty?,strip,data,nil?,+,encode,connect,getItem,identity_generator');
  return $def(self, '$authent_form', function $$authent_form() {
    var self = this, dark_grey = nil, dark_grey_transparent = nil, grey = nil, light_grey = nil, eastern_blue = nil, view = nil, form = nil, cancel = nil, email_box = nil, email_bordure_bas = nil, email_text = nil, password_box = nil, password_bordure_bas = nil, password_text = nil, connection = nil, creation = nil;

    
    dark_grey = (new Map([["red", 0.125], ["green", 0.125], ["blue", 0.125]]));
    dark_grey_transparent = (new Map([["red", 0.125], ["green", 0.125], ["blue", 0.125], ["alpha", 0.7]]));
    grey = (new Map([["red", 0.208], ["green", 0.208], ["blue", 0.208]]));
    light_grey = (new Map([["red", 0.5], ["green", 0.5], ["blue", 0.5]]));
    eastern_blue = (new Map([["red", 0.118], ["green", 0.596], ["blue", 0.596]]));
    view = self.$box((new Map([["id", "poipoi"], ["left", 0], ["right", 0], ["top", 0], ["bottom", 0], ["height", "auto"], ["width", "auto"], ["color", dark_grey_transparent]])));
    form = view.$box((new Map([["width", 500], ["height", 350], ["center", true], ["color", grey], ["smooth", 10]])));
    cancel = form.$box((new Map([["width", 25], ["height", 25], ["top", 25], ["left", 450]])));
    $send(view, 'touch', [true], function $$1(event){
      
      if (event == null) event = nil;
      if ($eqeq(event.$target(), view)) {
        return view.$delete(true)
      } else {
        return nil
      };});
    $send(cancel, 'touch', [true], function $$2(){
      return view.$delete(true)});
    email_box = form.$box((new Map([["width", 400], ["height", 50], ["center", true], ["top", 50], ["color", grey], ["id", "email_box"]])));
    email_bordure_bas = email_box.$box((new Map([["width", "inherit"], ["height", 2], ["bottom", 0], ["top", "auto"], ["color", eastern_blue]])));
    email_text = email_box.$text((new Map([["data", "Email"], ["left", 10], ["component", (new Map([["size", 16]]))], ["color", "white"], ["edit", true], ["id", "email_text_id"]])));
    password_box = form.$box((new Map([["width", 400], ["height", 50], ["center", true], ["top", 150], ["color", grey], ["id", "password"]])));
    password_bordure_bas = password_box.$box((new Map([["width", "inherit"], ["height", 2], ["bottom", 0], ["top", "auto"], ["color", eastern_blue]])));
    password_text = password_box.$text((new Map([["data", "Password"], ["edit", true], ["left", 10], ["component", (new Map([["size", 16]]))], ["color", "white"], ["id", "password_text_id"]])));
    connection = form.$box((new Map([["width", 100], ["height", 50], ["left", 50], ["top", 250], ["color", "white"], ["smooth", 5], ["border", (new Map([["thickness", 2], ["color", eastern_blue], ["pattern", "solid"]]))], ["text", (new Map([["int8", (new Map([["francais", "Se connecter"], ["english", "Login"]]))], ["color", "black"], ["center", (new Map([["x", 30], ["y", -1]]))]]))], ["id", "connection_btn"]])));
    $send(email_box, 'touch', [true], function $$3(){
      return email_text.$component((new Map([["selected", true]])))});
    $send(password_box, 'touch', [true], function $$4(){
      return password_text.$component((new Map([["selected", true]])))});
    
    $def(self, '$connect', function $$connect(mail, pass) {
      var self = this;

      
      $send($$('A'), 'message', [(new Map([["action", "authentication"], ["data", (new Map([["table", "user"], ["particles", (new Map([["email", mail]]))]]))]]))], function $$5(response){var self = $$5.$$s == null ? this : $$5.$$s, mail_message = nil, mail_response = nil;

        
        if (response == null) response = nil;
        self.$puts("Full authentication response: " + (response.$inspect()));
        if (($truthy(response['$key?']("mail_authorized")) && ($eqeq(response['$[]']("mail_authorized"), true)))) {
          
          self.$puts("response mail authorized: " + (response['$[]']("mail_authorized")));
          mail_message = $$('JS').$global()['$[]']("localStorage").$setItem("logged", response['$[]']("mail_authorized"));
          mail_response = response['$[]']("mail_authorized");
          self.$puts("mail_response : " + (mail_response));
          return $$('JS').$global()['$[]']("localStorage").$setItem("current_user", response['$[]']("user_id"));
        } else {
          return nil
        };}, {$$s: self});
      return $send($$('A'), 'message', [(new Map([["action", "authorization"], ["data", (new Map([["table", "user"], ["particles", (new Map([["password", pass]]))]]))]]))], function $$6(response){var self = $$6.$$s == null ? this : $$6.$$s, authorized = nil, $ret_or_1 = nil, password_message = nil, password_response = nil;

        
        if (response == null) response = nil;
        self.$puts("authorization : " + (response));
        if ($truthy(response['$key?']("password_authorized"))) {
          
          authorized = ($truthy(($ret_or_1 = response['$[]']("password_authorized"))) && ($ret_or_1));
          self.$puts("response password : " + (response['$[]']("password_authorized")));
          password_message = $$('JS').$global()['$[]']("localStorage").$setItem("logged", response['$[]']("password_authorized"));
          password_response = response['$[]']("password_authorized");
          self.$puts("password_response : " + (password_response));
          return $$('JS').$global()['$[]']("localStorage").$setItem("current_user", response['$[]']("user_id"));
        } else {
          return nil
        };}, {$$s: self});
    });
    $send(connection, 'touch', [true], function $$7(){var self = $$7.$$s == null ? this : $$7.$$s, mail = nil, pass = nil, mail_message = nil, mail_response = nil, password_message = nil, password_response = nil;

      if ((($truthy(email_text.$data()['$nil?']()) || ($truthy(email_text.$data().$strip()['$empty?']()))) && (($truthy(password_text.$data()['$nil?']()) || ($truthy(password_text.$data().$strip()['$empty?']())))))) {
        return self.$puts("Veuillez renseigner votre adresse email et votre mot de passe.")
      } else if (($truthy(email_text.$data()['$nil?']()) || ($truthy(email_text.$data().$strip()['$empty?']())))) {
        return self.$puts("Veuillez renseigner votre adresse email.")
      } else if (($truthy(password_text.$data()['$nil?']()) || ($truthy(password_text.$data().$strip()['$empty?']())))) {
        return self.$puts("Veuillez renseigner votre mot de passe.")
      } else {
        
        mail = email_text.$data();
        self.$puts($rb_plus("mail : ", mail));
        pass = $$('Black_matter').$encode(password_text.$data());
        self.$puts($rb_plus("pass : ", pass));
        mail_message = false;
        mail_response = nil;
        password_message = false;
        password_response = nil;
        return self.$connect(mail, pass);
      }}, {$$s: self});
    creation = form.$box((new Map([["width", 110], ["height", 50], ["left", 340], ["top", 250], ["color", grey], ["smooth", 5], ["border", (new Map([["thickness", 2], ["color", eastern_blue], ["pattern", "solid"]]))], ["text", (new Map([["int8", (new Map([["francais", "Crer un compte"], ["english", "Create account"]]))], ["left", 10], ["color", "white"]]))], ["id", "creation_btn"]])));
    return $send(creation, 'touch', [true], function $$8(){var self = $$8.$$s == null ? this : $$8.$$s, mail = nil, pass = nil, anon_id = nil;

      if ((($truthy(email_text.$data()['$nil?']()) || ($truthy(email_text.$data().$strip()['$empty?']()))) && (($truthy(password_text.$data()['$nil?']()) || ($truthy(password_text.$data().$strip()['$empty?']())))))) {
        return self.$puts("Veuillez renseigner votre adresse email et votre mot de passe.")
      } else if (($truthy(email_text.$data()['$nil?']()) || ($truthy(email_text.$data().$strip()['$empty?']())))) {
        return self.$puts("Veuillez renseigner votre adresse email.")
      } else if (($truthy(password_text.$data()['$nil?']()) || ($truthy(password_text.$data().$strip()['$empty?']())))) {
        return self.$puts("Veuillez renseigner votre mot de passe.")
      } else {
        
        mail = email_text.$data();
        self.$puts($rb_plus("mail : ", mail));
        pass = $$('Black_matter').$encode(password_text.$data());
        self.$puts($rb_plus("pass : ", pass));
        anon_id = $$('JS').$global()['$[]']("localStorage").$getItem("anonymous_id");
        $$('A').$message((new Map([["action", "insert"], ["data", (new Map([["table", "user"], ["particles", (new Map([["email", mail], ["password", pass], ["user_id", anon_id]]))]]))]])));
        self.$connect(mail, pass);
        return $$('JS').$global()['$[]']("localStorage").$setItem("anonymous_id", self.$identity_generator());
      }}, {$$s: self});
  })
};

Opal.modules["templates/templat"] = function(Opal) {/* Generated by Opal 1.8.2 */
  var $eqeq = Opal.eqeq, $not = Opal.not, $rb_plus = Opal.rb_plus, $send = Opal.send, self = Opal.top, $nesting = [], $$ = Opal.$r($nesting), nil = Opal.nil, current_user = nil, anonymous_id = nil, box1 = nil, navigation_button = nil, logout_button = nil;

  Opal.add_stubs('current_user,puts,getItem,[],global,==,clear,!,setItem,box,center,text,+,creator,touch,color,circle,authent_form');
  
  current_user = $$('Universe').$current_user();
  self.$puts("current_user : " + (current_user));
  anonymous_id = $$('JS').$global()['$[]']("localStorage").$getItem("anonymous_id");
  self.$puts("anonymous_id : " + (anonymous_id));
  current_user = $$('JS').$global()['$[]']("localStorage").$getItem("current_user");
  self.$puts("current_user : " + (current_user));
  if ($eqeq(current_user, anonymous_id)) {
    
    $$('JS').$global()['$[]']("localStorage").$clear();
    self.$puts("local storage cleared!");
  };
  if ($not(anonymous_id)) {
    
    anonymous_id = $$('Universe').$current_user();
    self.$puts("new anonymous_id : " + (anonymous_id));
    $$('JS').$global()['$[]']("localStorage").$setItem("anonymous_id", anonymous_id);
  };
  if ($not(current_user)) {
    
    current_user = $$('Universe').$current_user();
    self.$puts("new current_user : " + (current_user));
    $$('JS').$global()['$[]']("localStorage").$setItem("current_user", current_user);
  };
  box1 = self.$box((new Map([["creator", current_user], ["width", 300]])));
  box1.$text("Creer un atome").$center(true);
  self.$puts($rb_plus("createur : ", box1.$creator()));
  $send(box1, 'touch', [true], function $$1(){var self = $$1.$$s == null ? this : $$1.$$s, c = nil;

    
    box1.$color("red");
    current_user = $$('JS').$global()['$[]']("localStorage").$getItem("current_user");
    c = self.$circle((new Map([["creator", current_user], ["color", "green"], ["top", 200], ["left", 200], ["width", 250], ["height", 80]])));
    c.$text($rb_plus("creator : ", current_user));
    return self.$puts($rb_plus("createur de c : ", c.$creator()));}, {$$s: self});
  navigation_button = self.$box((new Map([["creator", current_user], ["width", 300], ["height", 100], ["top", 500], ["left", 50]])));
  navigation_button.$text("Aller au formulaire d'inscription").$center(true);
  $send(navigation_button, 'touch', [true], function $$2(){var self = $$2.$$s == null ? this : $$2.$$s;

    
    self.$require("templates/templat.rb"+ '/../' + "../authentication/login_form");
    return self.$authent_form();}, {$$s: self});
  logout_button = self.$box((new Map([["width", 150], ["height", 80], ["top", 50], ["left", 500], ["color", "red"]])));
  logout_button.$text((new Map([["text", "Log out"], ["color", "black"]])));
  return $send(logout_button, 'touch', [true], function $$3(){
    
    $$('JS').$global()['$[]']("localStorage").$setItem("logged", "false");
    return $$('JS').$global()['$[]']("localStorage").$setItem("current_user", anonymous_id);});
};

Opal.queue(function(Opal) {/* Generated by Opal 1.8.2 */
  var self = Opal.top, nil = Opal.nil;

  Opal.add_stubs('require');
  return self.$require("templates/templat")
});
