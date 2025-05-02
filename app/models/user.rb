class User < ApplicationRecord
  validates :first_name, presence: true # Good practice to validate these too
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :messages
  has_many :sent_chats, class_name: "Chat", foreign_key: "sender_id"
  has_many :received_chats, class_name: "Chat", foreign_key: "receiver_id"
  def chats
    Chat.where("sender_id = :id OR receiver_id = :id", id: self.id)
    # Or if you prefer using the associations:
    # sent_chats + received_chats # This returns an array, not an ActiveRecord Relation
  end

  # Helper for forms/display
  def full_name
    "#{first_name} #{last_name}"
  end

  # Helper for select boxes, uses full_name or email if name is blank
  def display_name
    full_name.blank? ? email : full_name
  end
end
