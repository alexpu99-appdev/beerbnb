# == Schema Information
#
# Table name: airbnbs
#
#  id         :integer          not null, primary key
#  location   :string
#  photo      :string
#  price      :float
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Airbnb < ApplicationRecord
  has_many(:trips, { :class_name => "Trip", :foreign_key => "airbnb_id", :dependent => :destroy })
end
