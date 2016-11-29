# == Schema Information
#
# Table name: scenes
#
#  id          :integer          not null, primary key
#  title       :string
#  position    :integer
#  description :text
#  chapter_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Scene < ApplicationRecord
  belongs_to :chapter
  validates_presence_of :chapter_id, :title, :position

  acts_as_list scope: :chapter
end
