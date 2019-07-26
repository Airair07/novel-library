class Episode < ApplicationRecord
  belongs_to :novel
  
  validates :subtitle, presence: true, length: { maximum: 100 }
  validates :number, presence: true,
                     numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 255 }
  validates :text, presence: true, length: { maximum: 10000 }
end
