class User < ApplicationRecord

  attr_accessor :remember_token

  before_save {self.email = email.downcase}

  has_secure_password

  validates :password, presence: true
  validates :password, length: {in: 6..12}
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true

  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :likes, dependent: :destroy
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

  # 2 class methods
  def self.digest(string)
    if ActiveModel::SecurePassword.min_cost
      cost = BCrypt::Engine::MIN_COST
    else
      cost = BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # instance methods
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # theoritically we can modifiy manually
  # whatever is stored in the cookies,
  # which means if we know the user id of someone else
  # we could have manually entered the id to cookies.
  # but we couldn't have get the remember token,
  # which is verified by the following authentication method
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_token, nil)
  end
end
