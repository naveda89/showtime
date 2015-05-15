class Content < ActiveRecord::Base
  # Validations
  validates_presence_of :title, :plot
  validates_uniqueness_of :title
end
