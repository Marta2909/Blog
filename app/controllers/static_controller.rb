class StaticController < ApplicationController
  def about
    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new
  end

  def contact
    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new
  end

  def terms
    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new
  end
end
