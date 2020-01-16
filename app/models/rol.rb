class Rol < ApplicationRecord

    has_and_belongs_to_many :permissions

    def self.select2(q)
        select_scope = "id, name"
        where_scope = "LOWER(name) LIKE '%#{q.downcase}%'"
        select(select_scope).where(where_scope)
    end

    def can?(code)
        self.permissions.where(:code => code, :apply => true).exists?
    end
end
