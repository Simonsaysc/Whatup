# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: "ryunah@gmail.com", first_name: "Phoenix", last_name: "Wright")
User.create(email: "mtlspwr@gmail.com", first_name: "Miles", last_name: "Prower")
User.create(email: "bcs@gmail.com", first_name: "Saul", last_name: "Goodman")
User.create(email: "lalosal@gmail.com", first_name: "Eduardo", last_name: "Salamanca")
User.create(email: "jsuar@gmail.com", first_name: "Juan", last_name: "Suarez")
User.create(email: "rsal@gmail.com", first_name: "Ricardo", last_name: "Salas")
User.create(email: "mm@gmail.com", first_name: "Rock", last_name: "Light")
User.create(email: "rayblewilt@gmail.com", first_name: "Albert", last_name: "Wily")
User.create(email: "debeste@gmail.com", first_name: "Eustace", last_name: "Winner")
User.create(email: "trog@gmail.com", first_name: "Tom", last_name: "Rogers")
Chat.create(sender_id: 1, receiver_id: 2)
Chat.create(sender_id: 3, receiver_id: 4)
Chat.create(sender_id: 5, receiver_id: 6)
Chat.create(sender_id: 7, receiver_id: 8)
Chat.create(sender_id: 9, receiver_id: 10)
Chat.create(sender_id: 11, receiver_id: 12)
Chat.create(sender_id: 13, receiver_id: 14)
Chat.create(sender_id: 15, receiver_id: 16)
Chat.create(sender_id: 20, receiver_id: 1)
Chat.create(sender_id: 21, receiver_id: 3)
Message.create(chat_id: 1, user_id: 1, body: "Hola")
Message.create(chat_id: 1, user_id: 2, body: "Me reprobaron")
Message.create(chat_id: 1, user_id: 3, body: "Jaja a mi no, sos tonto")
Message.create(chat_id: 2, user_id: 5, body: "Me comi un hongo")
Message.create(chat_id: 2, user_id: 6, body: "¿Estas bien?")
Message.create(chat_id: 2, user_id: 5, body: "Termine en el hospital jaja")
Message.create(chat_id: 3, user_id: 4, body: "Me encontre una mina re buena")
Message.create(chat_id: 3, user_id: 7, body: "¿Y?")
Message.create(chat_id: 3, user_id: 4, body: "Si lo digo me banean")
Message.create(chat_id: 3, user_id: 7, body: "Aguafiestas")
