class User < ApplicationRecord
  has_secure_password

  has_many :scores

  #validates :name, presence: true
  #validates :email, presence: true, uniqueness: true

  def type_user(user)
    if user.name == nill then

    else

    end
  end
end
