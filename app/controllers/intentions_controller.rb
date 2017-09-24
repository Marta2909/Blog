class IntentionsController < ApplicationController

  def index
    @lastcommentedposts = Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new

    @intentions = Intention.order(created_at: :DESC)
    @intention = Intention.new
  end

  def create
    @lastcommentedposts = Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new

    @intention = Intention.new(intention_params)
    if @intention.save
      flash[:notice] = "Intencja dodana"
      redirect_to intentions_path
    else
      flash[:notice] = "Wystąpił błąd. Wpisz ponownie intencję lub zgłoś błąd poprzez formularz kontaktowy"
      redirect_to intentions_path
    end
  end

  private
  def intention_params
    params.require(:intention).permit(:name)
  end

end
