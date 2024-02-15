class User < ApplicationRecord
    has_secure_password
    has_many :gossips
    has_many :private_messages, foreign_key: 'sender_id'
    has_many :recipients
    has_many :received_messages, through: :recipients, source: 'private_message'
    has_many :likes
  end