# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string
#  language   :string
#  fabula     :text
#  premise    :text
#  setting    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :user
  has_many :strands
  validates_presence_of :user_id, :title

end
