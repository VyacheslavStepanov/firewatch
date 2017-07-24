require "rails_helper"

feature "monitoring host" do
  include_context "current_user_is_signed"

  scenario "authorized user can start and stop monitoring of host" do
    visit root_path

    expected(page).to have_content(host.domain)
    expected(page).to have_content("Paused")
    click_link "Play"

    expected(page).to have_content("Running")
    click_link "Stop"

    expected(page).to have_content("Paused")
  end
end
