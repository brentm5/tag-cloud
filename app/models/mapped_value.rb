class MappedValue < ActiveRecord::Base
  validates :value, presence: :true
  belongs_to :tag
end
