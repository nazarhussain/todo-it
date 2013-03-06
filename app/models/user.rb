class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name
  before_save :ensure_authentication_token

  has_many :lists

  def name
    n = [first_name,last_name].join(' ')
    n.blank? ? email : n
  end

  def registered?
    !self.new_record?
  end
end
