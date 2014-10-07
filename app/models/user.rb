class User < ActiveRecord::Base
  has_many :transactions, dependent: :destroy
  has_many :budgets, dependent: :destroy

  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
