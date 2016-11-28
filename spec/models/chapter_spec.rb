require 'rails_helper'

RSpec.describe Chapter, type: :model do
  let(:user)     { create(:user) }
  let(:project)  { create(:project, user: user) }
  let(:chapter)  { create(:chapter, project: project) }

  it { should belong_to(:project) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:position) }

  describe 'valid Model' do
    it 'should be an instance of Chapter Model' do
      expect(chapter).to be_an_instance_of(Chapter)
    end
  end
end
