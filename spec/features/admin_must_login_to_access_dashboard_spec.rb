require "rails_helper"

feature "Admin must login to access dashboard" do
	scenario "without logging in" do
		visit admin_root_path

		expect(page).to have_content("Sign in")
	end

	scenario "as logged in" do
		sign_in
		visit admin_root_path

		expect(page).to have_content("New Article")
	end
end
