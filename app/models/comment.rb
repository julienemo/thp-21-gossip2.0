class Comment < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {minimum: 1}
  belongs_to :author, class_name: "User"
  belongs_to :gossip

  has_many :biscomments, dependent: :destroy
end
