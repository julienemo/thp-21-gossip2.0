class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true
  validates :password, length: {in: 6..12}
  validates :email, uniqueness: true

  belongs_to :city
  has_many :gossips
  has_many :sent_messages,
    foreign_key: 'sender_id',
    class_name: "Message"
  has_many :received_messages,
    foreign_key: 'recipient_id',
    class_name: "JoinTableMessageRecipient"
  has_many :comments,
    foreign_key: 'author_id',
    class_name: 'Comment'
  has_many :biscomments,
    foreign_key: 'author_id',
    class_name: 'Biscomment'
  has_many :biscomments,
    through: :comments
  has_many :sessions

end
