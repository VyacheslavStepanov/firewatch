require "rails_helper"

feature "see hosts" do
  include_context "current user signed in"
  let(:host) { create(:host, domain: "mail.ru", user: current_user) }

  scenario "user can see his host on dashboard page" do
    visit root_path
    expect(page).to have_content(host.domain)
  end
end
