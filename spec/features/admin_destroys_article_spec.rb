require "rails_helper"

feature "Admin removes an article:" do
	before(:each) do
		sign_in
	end
	
	scenario "successfully" do
		article = FactoryGirl.create(:article)
		article_title = article.title.titleize

		visit admin_root_path
		click_on article_title
		within("#remove_article_confirmation") do
			fill_in "article_title", with: article.title
		end
		click_button "Remove"

		expect(page).to_not have_content(article_title)
	end

	scenario "without confirming" do
		article = FactoryGirl.create(:article)
		article_title = article.title.titleize

		visit admin_root_path
		click_on article_title
		within("#remove_article_confirmation") do
			fill_in "article_title", with: ""
		end
		click_button "Remove"

		expect(page).to have_content(article_title)
	end
end
