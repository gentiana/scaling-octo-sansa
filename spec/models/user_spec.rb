require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.build(:user) }
  subject { user }
  
  user_methods = [:name, :email]
  
  it "should have specified interface" do
    user_methods.each do |method|
      should respond_to method
    end
  end
  
  context 'shoulda matchers' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should ensure_length_of(:name).is_at_most(50) }
    it { should have_secure_password }
    it { should ensure_length_of(:password).is_at_least(6) }
  end
  
  describe "when email differs only in letters case" do
    before do
      same_email_user = user.dup
      same_email_user.email = user.email.upcase
      same_email_user.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when password is blank" do
    before { user.password = user.password_confirmation = '  ' }
    it { should_not be_valid }
  end
  
  describe "when password is different than confirmation" do
    before { user.password_confirmation = 'asdfgh' }
    it { should_not be_valid }
  end

end
