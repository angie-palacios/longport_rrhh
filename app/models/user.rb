class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :permissions
  belongs_to :rol

  def can?(code)
    self.permissions.where(:code => code, :apply => true).exists? || self.rol.can?(code)
  end
end
