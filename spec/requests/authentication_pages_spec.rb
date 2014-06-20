require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do
  
  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
    
    it { should have_title 'Sign in' }
    it { should have_link  'Sign in' }
    it { should have_selector 'h1', text: 'Sign in' }
    
    describe "invalid sign in" do
      before { click_button "Sign in" }
      
      it { should have_title 'Sign in' }
      it { should have_link  'Sign in', href: signin_path }
      it { should have_error_message }
    end
    
    describe "valid sign in" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      
      it { should have_title user.name }
      it { should have_link 'Profile',  href: user_path(user) }
      it { should have_link 'Sign out', href: signout_path }
      it { should_not have_link  'Sign in', href: signin_path }
      
      describe "followed be signout" do
        before { click_link 'Sign out' }
        it { should have_link 'Sign in' }
      end
    end
  end
end
