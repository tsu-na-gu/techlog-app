class User < ApplicationRecord

  has_many :posts
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # :confirmable を削除
  validate :custom_name_validation


  def custom_name_validation
    errors.add(:base, '名前は必須項目です。') if name.blank?
  end


end
