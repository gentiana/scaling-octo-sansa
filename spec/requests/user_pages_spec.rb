require 'rails_helper'

RSpec.describe "User Pages" do
  
  subject { page }
  
  describe "signup" do
    before { visit signup_path }
    it { should have_title 'Sign up' }
    
    describe "valid registration" do
      let(:user) { FactoryGirl.build(:user) }
      before do
        fill_in "Name",     with: user.name
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        fill_in "Password confirmation", with: user.password
      end
      it "should increment users count" do
        expect { click_button 'Create account' }.to change(User, :count).by(1)
      end
    end
    
    describe "submitting invalid form" do
      it "shouldn't increment users count" do
        expect { click_button 'Create account' }.not_to change(User, :count)
      end
      
      it "should display errors" do
        click_button 'Create account'
        within 'form#new_user' do
          should have_content "can't be blank"
          should have_selector '.errors'
        end
      end
    end
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_content user.name }
  end
end
