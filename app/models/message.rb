class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user # Represents the author of the message

  # --- Validations ---
  validates :body, presence: true
end
