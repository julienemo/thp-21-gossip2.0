class Gossip < ApplicationRecord
  validates :title, length:{in: 3..14}
  validates :content, length: {in: 3..140}
  belongs_to :user

  has_many :join_table_gossip_tags, dependent: :destroy
  has_many :tags, through: :join_table_gossip_tags
  has_many :comments
  has_many :biscomments, through: :comments
end
