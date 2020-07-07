class City < ApplicationRecord
  def self.select2(q)
    select_scope = "id, code"
    where_scope = "LOWER(code) LIKE '%#{q.downcase}%'"
    select(select_scope).where(where_scope)
  end
end
