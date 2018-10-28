class User < ApplicationRecord
  after_initialize :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #devise :omniauthable, :omniauth_providers => [:facebook]

  enum role:[:user,:owner,:admin]
  has_many :properties, :foreign_key => 'owner_id' 

  def set_default_role
  	self.role ||= :user
  end
end
