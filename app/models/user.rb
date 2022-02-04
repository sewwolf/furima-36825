class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください', allow_blank: true}
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: 'は全角で入力してください', allow_blank: true}
    validates :kana_first_name, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角で入力してください', allow_blank: true}
    validates :kana_last_name, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角で入力してください', allow_blank: true}
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password ,{with: PASSWORD_REGEX, message: "は英数字を含む必要があります", allow_blank: true}

 
  
end
