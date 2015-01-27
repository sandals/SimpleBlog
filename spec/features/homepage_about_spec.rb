require "rails_helper"

feature "Homepage about aside" do
	scenario "with content" do
		about = FactoryGirl.create(:user_settings)

		visit root_path

		expect(page).to have_content(about.bio)
		expect(page).to have_css('.about_image')
	end
end
