class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum role: { user: 0, admin: 1 }

  has_many :projects
  
  def admin?
    role == "admin"
  end

  validates :username, presence: true, uniqueness: true
end
