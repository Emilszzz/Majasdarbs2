def sign_up_positive
   payload ={
     'email'=> 's7_zabalu_e@venta.lv',
     'password'=>'parole',
     'firstName'=> 'string',
     'lastName' => 'string'
   }.to_json
   puts payload

   response =  API.post('http://195.13.194.180:8090/api/sign-up',
                        headers: {'Content-Type' => 'application/json'},
                        cookies:{},
                        payload:payload)

puts response.code
puts response
end
