class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages

  validate :sender_cannot_be_receiver

  # Helper for select boxes
  def display_name
    # Uses display_name defined in User model
    "Chat between #{sender&.display_name || 'N/A'} and #{receiver&.display_name || 'N/A'}"
  end

  private

  def sender_cannot_be_receiver
    # Only run validation if both IDs are present to avoid duplicate errors
    if sender_id.present? && receiver_id.present? && sender_id == receiver_id
      errors.add(:receiver_id, "cannot be the same as the sender")
      # Alternatively, add error to :base if it's not specific to one field
      # errors.add(:base, "Sender and receiver cannot be the same user")
    end
  end
end
