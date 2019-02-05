class User < ApplicationRecord
  # has_secure_password adds two additional properties to the User model. :password and :password_confirmation.
  #Remember we only created email and password_digest when creating the model. has_secure_password works because of
  #the gem bcrypt we have added in the gem file.
  has_secure_password
  # we also add validation to the fields. That validates the email, looks and the uniqueness from the database and checks if all field
  #is entered.
  validates  :username, :email, uniqueness: true, presence: true

  has_many :post
end
