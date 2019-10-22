class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :tweets
  has_many :followers, class_name: 'User',
                        foreign_key: 'follower_id'
  belongs_to :follower, class_name: 'User', optional: true

  has_many :followees, class_name: 'User',
                        foreign_key: 'followee_id' #through: :followers, source: :followers

  belongs_to :followee, class_name: 'User', optional: true
  
  def timeline
    (tweets.where(user_id: followees) + tweets).sort
  end

   def followee?(user)
    followees.include?(user)
  end
end
