class ApplicationRecord < ActiveRecord::Base
  scope :recent, -> { unscope(:order).order(id: :desc) }
  scope :sampler, ->(s=true) { s ? unscope(:order).order("RANDOM()") : nil }
  self.abstract_class = true
end
