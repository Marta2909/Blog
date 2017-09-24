class Post < ApplicationRecord
  has_many :comments

  def self.search(keywords)
    keywords = "%" + keywords + "%"
    Post.where("title LIKE ? OR body LIKE ?", keywords, keywords)
  end
end
