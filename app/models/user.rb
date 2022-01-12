class User < ApplicationRecord
  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name,      presence: true
  validates :last_name_kana,  presence: true
  validates :first_name_kana, presence: true
  validates :date_of_birth,   presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid'

  LAST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]/
  validates_format_of :last_name, with: LAST_NAME_REGEX

  FIRST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]/
  validates_format_of :first_name, with: FIRST_NAME_REGEX

  LAST_NAME_KANA_REGEX = /\A[ァ-ヴー]+\z/u
  validates_format_of :last_name_kana, with: LAST_NAME_KANA_REGEX

  FIRST_NAME_KANA_REGEX = /\A[ァ-ヴー]+\z/u
  validates_format_of :first_name_kana, with: FIRST_NAME_KANA_REGEX

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  has_many :purchases
end