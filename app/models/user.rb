class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :permissions
  belongs_to :rol
  belongs_to :business
  has_many :payroll_discount

  def self.select2(q)
    select_scope = "id, documentation, name, analytical_account"
    where_scope = "LOWER(documentation) LIKE '%#{q}%'"
    select(select_scope).where(where_scope)
  end

  def can?(code)
    self.permissions.where(:code => code, :apply => true).exists? || self.rol.can?(code)
  end
end
