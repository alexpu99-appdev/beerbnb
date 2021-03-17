# == Schema Information
#
# Table name: liked_trips
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trip_id    :integer
#  user_id    :integer
#
class LikedTrip < ApplicationRecord
  belongs_to(:trip, { :required => false, :class_name => "Trip", :foreign_key => "trip_id" })
  belongs_to(:user, { :required => false, :class_name => "UserProfile", :foreign_key => "user_id" })

end
