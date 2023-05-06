class User < ApplicationRecord
    has_secure_password

    has_and_belongs_to_many :categories
    has_many :acticles
    has_many :comments
      
    PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}/

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? },
              format: { with: PASSWORD_REGEX }

 

end
