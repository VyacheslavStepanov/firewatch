require "rails_helper"

feature "see statuses of host" do
  include_context "current user signed in"
  let(:host) { create(:host, domain: "mail.ru", user: current_user) }

  scenario "user can see statuses list of his host" do
    visit status_history_host_path(host)
    expect(page).to have_content("Host status history")
    expect(page).to have_content(host.name)
  end
end
