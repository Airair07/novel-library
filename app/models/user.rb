class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :novels, dependent: :destroy
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :novel
  
  def favorite(favorite_novel)
    unless self.novels.find_by(id: favorite_novel.id) == favorite_novel
      self.favorites.find_or_create_by(novel_id: favorite_novel.id)
    end
  end
  
  def unfavorite(favorite_novel)
    favorite = self.favorites.find_by(novel_id: favorite_novel.id)
    favorite.destroy if favorite
  end
  
  def like?(favorite_novel)
    self.likes.include?(favorite_novel)
  end
  
end
