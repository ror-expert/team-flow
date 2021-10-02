class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :company_name
  
  belongs_to :organisation, optional: true

  def full_name
    first_name.to_s + " " + last_name.to_s
  end
end
