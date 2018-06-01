class User
attr_accessor :email
attr_accessor :id
attr_accessor :password
attr_accessor :firstName
attr_accessor :lastName
attr_accessor :authorization_header

 def initialize(email, password)
   self.email = email
   self.password = password
   self.authorization_header = {'Content-Type' => 'application/json'}
 end
end
