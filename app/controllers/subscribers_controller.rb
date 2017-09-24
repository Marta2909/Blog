class SubscribersController < ApplicationController
  def index
  
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      cookies[:saved_subscriber] = true
      redirect_to root_path, notice: "Zapisano do newslettera"
    else
      redirect_to root_path, notice: "nie zapisano do newslettera"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :city)
  end
end
