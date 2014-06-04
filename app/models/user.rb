class User < ActiveRecord::Base
  has_many :landings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  before_save :username_to_downcase
  
  validates :username, :full_name, presence: true
   

  protected
  def username_to_downcase
    username.downcase!
  end
end
