Feature: Blog posts
  Test the functionality of posting and deleting posts

  Scenario: BlogPost - add a post
  Given I have logged in as regular user
  Then I create a blog post with title Studentsnemacas!
  And I check if the latest post has been added

 Scenario: BlogPost - create post,change title and delete post
    Given I have logged in as regular user
    Then I create a blog post with content Macas
    And I check if the new post has been added
    Then I change the title of the post
    Then I delete the blog post
    And I check if the post has been deleted