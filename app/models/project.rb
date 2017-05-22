class Project < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :scenes

  accepts_nested_attributes_for :characters, allow_destroy: true
  accepts_nested_attributes_for :scenes, allow_destroy: true
  validates_presence_of :user, :title

  def step1_complete
    self.sentence_summary.present?
  end

  def step2_complete
    step1_complete and self.paragraph_summary.present?
  end

  def step3_complete
    step2_complete and self.characters.present?
  end

  def step4_complete
    step3_complete and self.page_summary.present?
  end

  def step5_complete
    step4_complete and self.characters.where.not(long_synopsis: nil).length > 0
  end

  def step6_complete
    step5_complete and self.long_summary.present?
  end

  def step7_complete
    step6_complete and self.characters.where.not(additional_information: nil).length > 0
  end

  def step8_complete
    step7_complete and self.scenes.present?
  end
end
