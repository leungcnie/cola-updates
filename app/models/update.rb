class Update < ApplicationRecord
  validates :user_id, uniqueness: true
end
