# == Schema Information
#
# Table name: characters
#
#  id             :integer          not null, primary key
#  first_name     :string
#  last_name      :string
#  main_character :boolean
#  position       :integer
#  project_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Character < ApplicationRecord
  belongs_to :project

  validates_presence_of :project_id, :position, :first_name

  acts_as_list scope: :project

  def full_name
    return if first_name.nil? || last_name.nil?
    first_name + " " + last_name
  end
end
