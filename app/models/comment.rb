class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :commentvotes
  belongs_to :user
end
