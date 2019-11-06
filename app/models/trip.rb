class Trip < ApplicationRecord
  belongs_to :user

  validates_presence_of :origin
  validates_presence_of :destination

  def seconds_to_hours(seconds)
    ((seconds.to_f)/3600).ceil
  end
end
