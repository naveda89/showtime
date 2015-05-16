class Episode < ActiveRecord::Base
  # Associations
  belongs_to :season

  # Validations
  validates_presence_of :num
  validates_numericality_of :num
  validates_uniqueness_of :num, scope: :season_id
end
