class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  scope :for_user, ->(user) {
    where("sender_id = :user_id OR receiver_id = :user_id", user_id: user.id)
  }
  has_many :messages
  validate :sender_cannot_be_receiver
  def display_name
    "Chat between #{sender&.display_name || 'N/A'} and #{receiver&.display_name || 'N/A'}"
  end
  def get_messages
    Message.where("chat_id = :id", id: self.id)
  end
  private

  def sender_cannot_be_receiver
    if sender_id.present? && receiver_id.present? && sender_id == receiver_id
      errors.add(:receiver_id, "cannot be the same as the sender")
    end
  end
end
