require "rails_helper"

feature "Guest comments on article" do
	scenario "anonymously" do
		article = FactoryGirl.create(:published_article)
		
		visit article_path(article)
		fill_in "Author", with: nil
		fill_in "Body", with: "Great article!"
		click_button "Post Comment"

		expect(page).to have_content "Anonymous"
		expect(page).to have_content "Great article!"
	end

	scenario "with a name" do
		article = FactoryGirl.create(:published_article)

		visit article_path(article)
		fill_in "Author", with: "Special Snowflake 98"
		fill_in "Body", with: "Amazing work :^ )"
		click_button "Post Comment"

		expect(page).to have_content "Special Snowflake 98"
		expect(page).to have_content "Amazing work :^ )"
	end
end
