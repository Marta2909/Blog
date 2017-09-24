class ContactsController < ApplicationController
  def new
    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new

    @contact = Contact.new
  end

  def create
    @lastcommentedposts =  Post.select('posts.*, max(comments.created_at) as last_commented_at').joins(:comments).group('posts.id').order('last_commented_at DESC').limit(5)
    @bestposts = Post.select('posts.*, count(comments.id) as comment_count').joins(:comments).group('posts.id').order('comment_count DESC').limit(5)
    @subscriber = Subscriber.new

    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      flash.now[:notice] = "Wiadomość została wysłana. Dziękuję :)"
      render :new
    else
      flash.now[:error] = "Nie można wysłać wiadomości."
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :body, :email, :category)
  end
end
