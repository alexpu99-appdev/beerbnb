# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  airbnb_id  :integer
#  bar_id     :integer
#
class Trip < ApplicationRecord
  #direct associations
  belongs_to(:airbnb, { :required => false, :class_name => "Airbnb", :foreign_key => "airbnb_id" })
  belongs_to(:bar, { :required => false, :class_name => "Bar", :foreign_key => "bar_id" })
  has_many(:liked_trips, { :class_name => "LikedTrip", :foreign_key => "trip_id", :dependent => :destroy })

  #indirect associations
  has_many(:users, { :through => :liked_trips, :source => :user })
end
