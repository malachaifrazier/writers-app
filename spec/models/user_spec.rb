require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user)    { create(:user) }

  it { should_not allow_value('blah').for(:email) }
  it { should allow_value('bigballscaptain@testicles.me').for(:email) }

  it { should respond_to(:full_name) }

  skip { should have_one(:profile) }

  describe "validation of username" do
    subject { User.new }
    it { should validate_presence_of(:password) }
  end

  describe 'valid Model' do
    it 'should be an instance of User Model' do
      expect(user).to be_an_instance_of(User)
    end

    it 'should have a password length btwn 6..40' do
      expect(user.password.length).to be > 6
      expect(user.password.length).to be < 40
    end

    it 'should validate_uniqueness_of email' do
      faked_password = Faker::Internet.password
      expect {
        create(:user, email: user.email, password: faked_password,
         password_confirmation: faked_password)
        }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'roles' do
    it 'add_role :admin method should work' do
      user.add_role :admin
      expect(user.has_role?(:admin)).to be(true)
    end

    it 'add_role :vendor method should work' do
      user.add_role :vendor
      expect(user.has_role?(:vendor)).to be(true)
    end

    it 'add_role :app_user method should work' do
      user.add_role :app_user
      expect(user.has_role?(:app_user)).to be(true)
    end
  end

end