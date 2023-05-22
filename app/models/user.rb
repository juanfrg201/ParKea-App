class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role

  def is_root? 
    if self.role_user.name == "root" && self.role_user.present?
      true
    else
      false
    end
  end

  def is_admin?
    if self.role_user.name == "admin" && self.role_user.present?
      true
    else
      false
    end
  end

  def is_client? 
    if self.role_user_id == nil
      true
    else
      false
    end
  end
end
