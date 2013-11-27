class Post
  attr_accessor :title, :contents, :date

  def initialize(infohash)
    @title = infohash[:title]
    @contents = infohash[:contents]
    @date = infohash[:date]
  end
end
