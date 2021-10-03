class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :company_name

  validates_presence_of :company_name, :first_name, :last_name

  belongs_to :organisation, optional: true
  before_create :create_organisation

  def full_name
    first_name.to_s + " " + last_name.to_s
  end

  private
    def create_organisation
      self.organisation = Organisation.create(name: company_name)
    end
end
