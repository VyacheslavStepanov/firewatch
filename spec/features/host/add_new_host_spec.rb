require "rails_helper"

feature "Add new host" do
  include_context "current user signed in"

  let(:host_attributes) { attributes_for(:host) }

  scenario "authorized user can add new host and start monitoring" do
    visit root_path
    fill_in "host[domain]", with: attributes_for(:host).slice(:domain)
    # fill_form(:host, FactoryGirl.attributes_for(:host).slice(:domain))
    click_button "Start monitoring"
    expect(page).to have_content(attributes_for(:host).slice(:domain))
  end
end
