class Novel < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :story, presence: true, length: { maximum: 1000 }
  
  has_many :episodes, dependent: :destroy
  
  has_many :likenovels, through: :favorites, source: :user
end
