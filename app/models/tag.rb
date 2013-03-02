class Tag < ActiveRecord::Base
  validates :name, uniqueness: { case_sensative: :false }
end
