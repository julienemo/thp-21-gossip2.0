class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"

  has_many :join_table_message_recicipents
  has_many :recipicents, through: :join_table_message_recicipents
end
