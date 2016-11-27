# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string
#  nation      :string
#  state       :string
#  city        :string
#  description :text
#  position    :integer
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ApplicationRecord
  belongs_to :project
  validates_presence_of :project_id, :name, :state, :city, :position

  acts_as_list scope: :project
end
