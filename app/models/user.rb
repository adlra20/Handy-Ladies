class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :customer_jobs, class_name: 'Job', foreign_key: 'customer_id'
  has_many :handylady_jobs, class_name: 'Job', foreign_key: 'handylady_id'

  def messages(user)
    Message.where(sender: self, receiver: user).or(Message.where(sender: user, receiver: self))
  end
end