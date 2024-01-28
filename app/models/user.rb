class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments,  dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable, :recoverable, :rememberable, :registerable

  # :confirmable を削除
  validate :custom_name_validation


  def custom_name_validation
    errors.add(:base, '名前は必須項目です。') if name.blank?
  end


end
