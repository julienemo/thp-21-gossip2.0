class JoinTableMessageRecipient < ApplicationRecord
  belongs_to :message
  belongs_to :recipient, class_name: "User"
end
