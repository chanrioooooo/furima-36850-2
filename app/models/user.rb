class User < ApplicationRecord
  validates :nickname,        presence: true
  validates :last_name,       presence: true
  validates :first_name,      presence: true
  validates :last_name_kana,  presence: true
  validates :first_name_kana, presence: true
  validates :date_of_birth,   presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  LAST_NAME_KANA_REGEX = /\A[ァ-ヴー]+\z/u
  validates_format_of :last_name_kana, with: LAST_NAME_KANA_REGEX

  FIRST_NAME_KANA_REGEX = /\A[ァ-ヴー]+\z/u
  validates_format_of :first_name_kana, with: FIRST_NAME_KANA_REGEX

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
end