class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # ニックネーム入力を必須の項目にするため
         validates :nickname, presence:true
         
         has_one_attached :image
         has_many :reviews
end
