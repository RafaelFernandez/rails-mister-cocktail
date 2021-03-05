class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  validate :cocktail_photo?
  #validates :photo,
  #          size: { less_than: 2.kilobytes , message: 'must be less than 2MB in size' }
  
  private

  def cocktail_photo?
    errors.add(:photo,'Please upload a photo.') unless photo.attached?
  end
end
