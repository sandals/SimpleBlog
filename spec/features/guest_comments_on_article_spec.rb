require "rails_helper"

feature "Guest comments on article" do
	scenario "without a comment" do
		article = FactoryGirl.create(:published_article)

		visit article_path(article)
		fill_in "Author", with: nil
		fill_in "Body", with: nil
		click_button "Post Comment" 

		expect(page).to have_content("Comment body is required")
	end
	
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
