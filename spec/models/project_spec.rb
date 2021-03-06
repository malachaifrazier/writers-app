require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user)    { create(:user) }
  let(:project) { create(:project, user: user) }

  it { should respond_to(:title) }
  it { should respond_to(:language) }
  it { should respond_to(:setting) }
  it { should respond_to(:premise) }
  it { should respond_to(:fabula) }

  it { should belong_to(:user) }
  it { should have_many(:strands) }
  it { should have_many(:locations) }
  it { should have_many(:chapters) }
  it { should have_many(:characters) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }

  describe 'valid Model' do
    it 'should be an instance of Project Model' do
      expect(project).to be_an_instance_of(Project)
    end
  end
end
