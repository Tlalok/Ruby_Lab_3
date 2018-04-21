class Trip < ApplicationRecord
  belongs_to :plane
  belongs_to :airport_from, class_name: "Airport"
  belongs_to :airport_to, class_name: "Airport"

  has_and_belongs_to_many :users

  validate :out_after_int
  validates :time_out, :time_in, presence: true

private
  def out_after_int
    return if time_in.blank? || time_out.blank?
   
    if time_out > time_in
      errors.add(:time_in, "must be after the time out.#{time_in}.#{time_out}") 
    end 
   end
end
