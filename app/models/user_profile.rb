# == Schema Information
#
# Table name: user_profiles
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class UserProfile < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  #direct
  has_many(:liked_trips, { :class_name => "LikedTrip", :foreign_key => "user_id", :dependent => :destroy })

  #indirect
  has_many(:stays, { :through => :liked_trips, :source => :trip })

  #validations
  validates(:last_name, { :presence => { :message => "Please enter your last name" } })
  validates(:first_name, { :presence => { :message => "Please enter your first name" } })
end
