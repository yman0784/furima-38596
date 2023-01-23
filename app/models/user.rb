class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name_kanji, :first_name_kanji, :family_name_kana,
            :first_name_kana, :birthday, 
            presence: true

  validates :family_name_kanji, :first_name_kanji, 
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Input full-width characters' }

  validates :family_name_kana, :first_name_kana, 
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters' }

  validates :password, 
            format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
end
