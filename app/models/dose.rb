class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates_presence_of :description, :ingredient_id, :cocktail_id
  validates :ingredient, :uniqueness => { :scope => :cocktail }
end
