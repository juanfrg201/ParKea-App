class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :user_role

  def is_root? 
    if self.user_role.name == "root" && self.user_role_id.present?
      true
    else
      false
    end
  end

  def is_admin?
    if self.user_role.name == "admin" && self.user_role_id.present?
      true
    else
      false
    end
  end

  def is_client? 
    if self.user_role_id == nil
      true
    else
      false
    end
  end
end
