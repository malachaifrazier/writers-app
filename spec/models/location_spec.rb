require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:user)     { create(:user) }
  let(:project)  { create(:project, user: user) }
  let(:location) { create(:location, project: project) }

  it { should belong_to(:project) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:position) }

  describe 'valid Model' do
    it 'should be an instance of Location Model' do
      expect(location).to be_an_instance_of(Location)
    end
  end
end
