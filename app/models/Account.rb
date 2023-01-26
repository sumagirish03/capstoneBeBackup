class Account < ApplicationRecord
    has_secure_password
    validates :password, presence: true
end