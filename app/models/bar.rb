# == Schema Information
#
# Table name: bars
#
#  id         :integer          not null, primary key
#  location   :string
#  name       :string
#  photo      :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bar < ApplicationRecord
  has_many(:trips, { :class_name => "Trip", :foreign_key => "bar_id", :dependent => :destroy })
end
