def log_in_positive(user)
payload ={
  'email' => user.email,
  'password' => user.password
}.to_json

response =  API.post('http://195.13.194.180:8090/api/login',
                     headers: {'Content-Type' => 'application/json'},
                     cookies:{},
                     payload:payload)
#Check if 200 OK is received
assert_equal(200, response.code, "Fail to log in! Response : #{response}")
response_hash = JSON.parse(response)
#Check if user email is the correct Content
assert_equal(user.email,response_hash['email'], 'User email not exist')


user.id = response_hash['id']
user.firstName = response_hash['firstName']
user.lastName = response_hash['lastName']
user.authorization_header['Authorization'] = response.headers[:authorization]
end

def log_in_without_password(user)
  payload ={
    'email' => user.email,
  }.to_json

  response =  API.post('http://195.13.194.180:8090/api/login',
                       headers: {'Content-Type' => 'application/json'},
                       cookies:{},
                     payload:payload)
assert_equal(401,response.code, "Wrong error has been returned! Response #{response}")
response_hash = JSON.parse(response)
assert_equal('Login failed!', response_hash['status'], "Error massege is not correct!")
                       puts response
                       puts response.code
user.authorization_header['Authorization'] = response.headers[:authorization]

end
def change_firstname()
  payload ={
    'firstName' => 'Emils1'
  }.to_json
  response =  API.put('http://195.13.194.180:8090/api/profile',
                       headers: @test_user.authorization_header,
                       cookies:{},
                       payload:payload)
  assert_equal(200, response.code, "Error! Respon : #{response}")
  response_hash = JSON.parse(response)
  assert_equal('Emils1', response_hash['firstName'],'firstName not changed')
  @test_user.firstName = 'Emils1'
end
def check_firstname()
  response = API.get("http://195.13.194.180:8090/api/profile",
                       headers: @test_user.authorization_header,
                       cookies:{})
    assert_equal(200, response.code, "Error! Respon : #{response}")
    response_hash = JSON.parse(response)
    assert_equal(@test_user.firstName,response_hash['firstName'],'firstName not correct')
    puts response
  end
