class MappedValue < ActiveRecord::Base
  validates :value, :tag, presence: :true
  belongs_to :tag
end
