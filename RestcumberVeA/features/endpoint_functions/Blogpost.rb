def create_post_positive(blog_post)
payload={
  'title' => blog_post.title,
  'content' => blog_post.content
}.to_json

response = API.post("http://195.13.194.180:8090/api/post",
                     headers: @test_user.authorization_header,
                     payload: payload,
                     cookies:{})
  puts response
  #Check if 200 received
  assert_equal(200, response.code, "Failed to fetch response info! Response : #{response}")
  response_hash = JSON.parse(response)

  assert_equal(blog_post.title, response_hash['title'], "Blog post title is not correct!")
  assert_equal(blog_post.content, response_hash['content'], "Blog post content is not correct!")
  assert_equal(blog_post.user.id.to_s, response_hash['author']['id'].to_s, "Author is not correct")

  blog_post.id = response_hash['id']
  blog_post.createdAt = response_hash['createdAt']
  blog_post.updatedAt = response_hash['updatedAt']
end
def check_if_post_added(blog_post)
  response = API.get("http://195.13.194.180:8090/api/post?id=#{blog_post.id}",
                       headers: @test_user.authorization_header,
                       cookies:{})
assert_equal(200, response.code, "Failed to fetch blog post! Response : #{response}")
response_hash = JSON.parse(response)
assert_equal(blog_post.title, response_hash['title'], "Blog post title is not correct!")
assert_equal(blog_post.content, response_hash['content'], "Blog post content is not correct!")
assert_equal(blog_post.user.id.to_s, response_hash['author']['id'].to_s, "Author is not correct")
assert_equal(blog_post.id, response_hash['id'], 'Post id is not correct!')
puts response
end
def change_blog_title(id, newtitle)
  payload = {
    'title' => newtitle
  }.to_json
  response = API.put("http://195.13.194.180:8090/api/post?post_id=#{id}",
                    headers: @test_user.authorization_header,
                    cookies: {},
                    payload: payload
                  )
  #Check if 200 received
  assert_equal(200, response.code, "Failed to fetch blog post! Response : #{response}")
  response_hash = JSON.parse(response)
  puts response

  assert_equal(id, response_hash['id'], "Bad ID")
  assert_equal(newtitle, response_hash['title'], "Wrong Title")
  # Change the local object 
  puts response_hash['title']
@hw_blog_post.title = newtitle

end

def delete_blog_post(id)
  response = API.delete("http://195.13.194.180:8090/api/post?post_id=#{id}",
                      headers: @test_user.authorization_header,
                      cookies: {}
                    )
    #Check if 200 received                
  assert_equal(204, response.code, "Failed to fetch blog post! Response : #{response}")
end

def check_deleted_post(id)
  response = API.get("http://195.13.194.180:8090/api/post?id=#{id}",
                      headers: @test_user.authorization_header,
                      cookies: {}
                    )
  # #Check if 404 received
  assert_equal(404, response.code, "Wrong response code: #{response}")
end

