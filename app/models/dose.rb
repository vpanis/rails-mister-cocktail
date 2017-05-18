class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, :ingredient, :cocktail, presence: true
  validates :ingredient, :uniqueness => { :scope => :cocktail }
end
