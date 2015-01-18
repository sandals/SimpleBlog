require "rails_helper"

feature "Admin creates article" do
	scenario "saves article as draft" do
		sign_in

		expect(page).to have_content "Signed in?"
	end
end
