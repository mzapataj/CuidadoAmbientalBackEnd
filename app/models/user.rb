class User < ApplicationRecord
  has_secure_password

  has_many :scores
  has_many :water_scores

  USER_NOT_FOUND = {"message_error": "Usuario incorrecto"} 
  
  #validates :name, presence: true
  #validates :email, presence: true, uniqueness: true

end
