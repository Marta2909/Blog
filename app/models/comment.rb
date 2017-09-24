class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  validates :author, :body, :email, presence: true
  validates_email_format_of :email, :message => "nieprawidłowy format emaila"
end
