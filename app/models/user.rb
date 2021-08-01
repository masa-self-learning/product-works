class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :works, dependent: :destroy
  with_options presence: true do
    validates :name
    validates :user_no
    validates :email
  end
end
