require "rails_helper"

feature "Sign Up" do
  include_context "current user signed in"

  let(:user_attributes) { attributes_for(:user) }

  scenario "User signs up" do
    visit root_path
    click_link "Sign up"

    expect(page).to have_content("Sign up")
    fill_form(:user, :edit, attributes_for(:user))
    click_button "Sign up"

    expect(page).to have_content("Dashboard")
    expect(page).to have_content(user.attributes[full_name])
  end
end
