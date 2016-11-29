require 'rails_helper'

RSpec.describe Scene, type: :model do
  let(:user)     { create(:user) }
  let(:project)  { create(:project, user: user) }
  let(:chapter)  { create(:chapter, project: project) }
  let(:scene)    { create(:scene, chapter: chapter) }

  it { should belong_to(:chapter) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:chapter_id) }
  it { should validate_presence_of(:position) }

  describe 'valid Model' do
    it 'should be an instance of Chapter Model' do
      expect(chapter).to be_an_instance_of(Chapter)
    end
  end
end
