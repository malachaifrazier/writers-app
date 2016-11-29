# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
#  title      :string
#  position   :integer
#  reason     :text
#  note       :text
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chapter < ApplicationRecord
  has_many :scenes, -> { order(position: :asc) }
  belongs_to :project

  validates_presence_of :project_id, :title, :position

  acts_as_list scope: :project
end
