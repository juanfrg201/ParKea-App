class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :creditcards

  before_save :client_assignation

  def is_root? 
    if self.role.name == "root" && self.role.present?
      true
    else
      false
    end
  end

  def is_admin?
    if self.role.name == "admin" && self.role.present?
      true
    else
      false
    end
  end

  def is_client? 
    if self.role_id == 3
      true
    else
      false
    end
  end

  def client_assignation 
    self.role_id = 3 if !role_id.present?
  end
end
