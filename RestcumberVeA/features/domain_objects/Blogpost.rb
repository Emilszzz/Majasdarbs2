class Blogpost
  attr_accessor :user
  attr_accessor :content
  attr_accessor :createdAt
  attr_accessor :id
  attr_accessor :title
  attr_accessor :updatedAt


  def initialize(user, title, content)
    self.user = user
    self.title = title
    self.content = content

  end

end
