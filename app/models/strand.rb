# == Schema Information
#
# Table name: strands
#
#  id          :integer          not null, primary key
#  name        :string
#  position    :integer
#  project_id  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Strand < ApplicationRecord
  belongs_to :project
  validates_presence_of :project_id, :name

  acts_as_list scope: :project
end
