require 'rails_helper'

RSpec.describe Strand, type: :model do
  let(:user)    { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:strand) { create(:strand, project: project) }

  it { should respond_to(:name) }
  it { should respond_to(:position) }
  it { should respond_to(:description) }

  it { should belong_to(:project) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:project_id) }

  describe 'valid Model' do
    it 'should be an instance of Strand Model' do
      expect(strand).to be_an_instance_of(Strand)
    end
  end
end
