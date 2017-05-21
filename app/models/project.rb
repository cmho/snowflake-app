class Project < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :scenes

  accepts_nested_attributes_for :characters, :scenes
end
