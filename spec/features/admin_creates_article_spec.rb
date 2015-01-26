require "rails_helper"

feature "Admin creates article" do
	before(:each) do
		sign_in
	end

	scenario "with excerpt" do
		visit admin_root_path

		click_on "New Article"
		fill_in "Title", with: "Title"
		fill_in "Excerpt", with: "This is a cool post"
		fill_in "Body", with: "Amazing content lmao"
		click_on "Publish"

		visit root_path
		expect(page).to have_content("Title")
		expect(page).to have_content("This is a cool post")
	end

	scenario "saves as draft" do
		visit admin_root_path

		click_on "New Article"
		fill_in "Title", with: "Example Title"
		fill_in "Body", with: "Amazing article content"
		click_on "Save as Draft"

		expect(page).to have_content("draft Example Title")
	end

	scenario "publishes" do
		visit admin_root_path
		
		click_on "New Article"
		fill_in "Title", with: "Example"
		fill_in "Body", with: "Hello"
		click_on "Publish"

		expect(page).to have_content("Example")
		expect(page).to_not have_content("draft Example")
	end
end
