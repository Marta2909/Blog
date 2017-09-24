class PostsController < ApplicationController

  def index # displays all posts (the newest posts first)

    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new

    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
    @posts = @posts.order(created_at: :DESC).page(params[:page]).per(7)

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new
    @comments = @post.comments.order(created_at: :DESC).page(params[:page]).per(7)
  end

  def new
    @post = Post.new
    @post.comments_count = 0
  end

  def search_results
    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new
    @found_posts = Post.search(params[:search_keywords])
    if @found_posts
      render action: "search_results"
  end
  end

end
