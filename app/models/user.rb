class User < ApplicationRecord
    has_secure_password
    has_many :gossips
    has_many :tags
    has_many :recipients
    has_many :messages, through: :recipients
    belongs_to :city, optional: true
end
