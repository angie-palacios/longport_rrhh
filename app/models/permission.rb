class Permission < ApplicationRecord
  def self.can?(code)
    # where(:code => code,).
  end
end
