class Biscomment < ApplicationRecord
  validates :content, length: {minimum: 1}

  belongs_to :comment
  belongs_to :author, class_name: "User"
end
