require 'rails_helper'

RSpec.describe Character, type: :model do
  let(:user)      { create(:user) }
  let(:project)   { create(:project, user: user) }
  let(:character) { create(:character, project: project) }

  it { should belong_to(:project) }

  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:position) }
  it { should validate_presence_of(:first_name) }

  describe 'valid Model' do
    it 'should be an instance of Character Model' do
      expect(character).to be_an_instance_of(Character)
    end
  end
end
