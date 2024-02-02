Opal.modules["authentication/login_form"] = function(Opal) {/* Generated by Opal 1.8.2 */
  var $send = Opal.send, self = Opal.top, $nesting = [], $$ = Opal.$r($nesting), nil = Opal.nil, form = nil, email_box = nil, email_text = nil, password_box = nil, password_text = nil, validation = nil;

  Opal.add_stubs('box,color,text,touch,message,data');
  
  form = self.$box((new Map([["width", 500], ["height", 350], ["left", 550], ["top", 200], ["color", "green"], ["border", (new Map([["thickness", 2], ["color", self.$color("blue")], ["pattern", "solid"]]))]])));
  email_box = form.$box((new Map([["data", "hello"], ["width", 400], ["height", 50], ["left", 50], ["top", 50], ["color", "white"], ["border", (new Map([["thickness", 1], ["color", self.$color("black")], ["pattern", "solid"]]))], ["id", "email_box"]])));
  email_text = email_box.$text((new Map([["data", "Email"], ["left", 25], ["edit", true], ["id", "email_text_id"]])));
  password_box = form.$box((new Map([["width", 400], ["height", 50], ["left", 50], ["top", 150], ["color", "white"], ["border", (new Map([["thickness", 1], ["color", self.$color("black")], ["pattern", "solid"]]))], ["id", "password"]])));
  password_text = password_box.$text((new Map([["data", "Password"], ["left", 25], ["edit", true], ["id", "password_text_id"]])));
  validation = form.$box((new Map([["width", 100], ["height", 50], ["left", 350], ["top", 250], ["color", "blue"], ["border", (new Map([["thickness", 1], ["color", self.$color("black")], ["pattern", "solid"]]))], ["text", (new Map([["data", "Valider"], ["left", 10]]))], ["id", "validation"]])));
  return $send(validation, 'touch', [true], function $$1(){
    return $$('A').$message((new Map([["action", "authentification"], ["value", (new Map([["mail", email_text.$data()], ["pass", password_text.$data()]]))]])))});
};

Opal.queue(function(Opal) {/* Generated by Opal 1.8.2 */
  var $send = Opal.send, self = Opal.top, nil = Opal.nil, c = nil;

  Opal.add_stubs('require,box,touch,message');
  
  self.$require("authentication/login_form");
  c = self.$box((new Map([["color", "yellow"], ["left", 333]])));
  return $send(c, 'touch', [true], function $$1(){
    return c.$message("****************************************")});
});
