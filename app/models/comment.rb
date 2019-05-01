class Comment < ApplicationRecord
  validates :content, length: {minimum: 1}
  belongs_to :author, class_name: "User"
  belongs_to :gossip

  has_many :biscomments
end
