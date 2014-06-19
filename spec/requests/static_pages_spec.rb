require 'rails_helper'

RSpec.describe "StaticPages" do
  subject { page }
  
  describe "home page" do
    before { visit root_url }
    it { should have_title "Też wywal" }
    it { should have_selector "h1", text: "Też wywal" }
  end
end
