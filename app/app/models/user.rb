class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

  has_many :comments
  has_many :replies
=======
>>>>>>> 69ca9d308a567597f01d8c01fcc91edab9198c85
end
