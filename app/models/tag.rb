class Tag < ActiveRecord::Base
  validates :name, uniqueness: { case_sensative: :false }, presence: :true

  def name=(val)
    write_attribute(:name, val.downcase.gsub(/ /,'-')) if val
  end
end
