class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :messages
  has_many :sent_chats, class_name: "Chat", foreign_key: "sender_id"
  has_many :received_chats, class_name: "Chat", foreign_key: "receiver_id"
  def all_chats
    Chat.where("sender_id = :id OR receiver_id = :id", id: self.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_name
    full_name.blank? ? email : full_name
  end
end
