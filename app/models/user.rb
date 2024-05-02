class User < ApplicationRecord
    has_secure_password
    has_many :gossips
    has_many :tags
    has_many :recipients
    has_many :messages, through: :recipients
    belongs_to :city, optional: true
    validates :password, length: { in: 6..10 }, on: :create
    validates :email, presence: true, uniqueness: true
end
