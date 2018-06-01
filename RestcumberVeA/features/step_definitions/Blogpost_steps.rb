Given (/^I create a blog post with title (.*)$/) do |title|
  content ="This is a post content! #{Time.now}"
  @blog_post = Blogpost.new(@test_user, title, content)
  create_post_positive(@blog_post)


  puts @blog_post.id
end
Given (/^I check if the latest post has been added$/) do
  check_if_post_added(@blog_post)

end
Given (/^I create a blog post with content (.*)$/) do |content|
  title = "Emils izveidoja postu"
  @hw_blog_post = Blogpost.new(@test_user, content, title)
  create_post_positive(@hw_blog_post)
end

And (/^I check if the new post has been added$/) do
  check_if_post_added(@hw_blog_post)
end

And (/^I change the title of the post$/) do
  @title = "Emils macas ar frameworku"
  change_blog_title(@hw_blog_post.id,@title)
end

Then (/^I delete the blog post$/) do
  delete_blog_post(@hw_blog_post.id)
end

Then (/^I check if the post has been deleted$/) do
  check_deleted_post(@hw_blog_post.id)
end
