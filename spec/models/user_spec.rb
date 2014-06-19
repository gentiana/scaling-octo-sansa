require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.build(:user) }
  subject { user }
  
  it { should respond_to :name }
  it { should respond_to :email }
  
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should ensure_length_of(:name).is_at_most(50) }
  
  describe "with email differing only in letters case" do
    before do
      same_email_user = user.dup
      same_email_user.email = user.email.upcase
      same_email_user.save
    end
    
    it { should_not be_valid }
  end
end
