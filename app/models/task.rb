class Task < ApplicationRecord
belongs_to :user
belongs_to :category
validates :title, presence: true
validates :description, presence: true
enum priority: { low: 0, medium: 1, high: 2 }
end

