class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :questions
  has_many :answers
  has_many :comments
  def full_name
    first_name + " " + last_name
  end

  def followees
    Follow.where(:follower_id => current_user.id)
  end
end
