require 'rails_helper'

RSpec.describe "User Pages" do
  
  subject { page }
  
  describe "signup" do
    before { visit signup_path }
    it { should have_title 'Sign up' }
  end
end
