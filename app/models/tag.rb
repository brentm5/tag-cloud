class Tag < ActiveRecord::Base
  validates :name, uniqueness: { case_sensative: :false }, presence: :true

  has_many :mapped_values

  def name=(val)
    write_attribute(:name, val.downcase.gsub(/ /,'-')) if val
  end
end
