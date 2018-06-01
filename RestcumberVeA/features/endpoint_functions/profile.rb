def get_profile_info
 response = API.get("http://195.13.194.180:8090/api/profile",
                      headers: @test_user.authorization_header,
                      cookies:{})

#Check if 200 received
assert_equal(200, response.code, "Failed to fetch response info! Response : #{response}")

response_hash = JSON.parse(response)

 assert_equal(@test_user.id, response_hash ['id'], "User id's dont match!")
  assert_equal(@test_user.firstName, response_hash ['firstName'], "User firstName dont match!")
  assert_equal(@test_user.lastName, response_hash ['lastName'], "User lastName dont match!")
  assert_equal(@test_user.email, response_hash ['email'], "User email dont match!")

 puts response
end
def check_if_profile_not_accessible
  response =  API.post('http://195.13.194.180:8090/api/profile',
                       headers: @test_user.authorization_header,
                       cookies:{})
puts response
assert_equal(403,response.code, "Wrong erro received Response:#{response}")
end
