class Comment < ActiveRecord::Base

  validates_presence_of :post, :body

  belongs_to :post

end
