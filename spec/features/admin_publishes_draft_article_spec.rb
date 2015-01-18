require "rails_helper"

feature "Admin publishes draft article" do
	scenario "successfully" do
		article = FactoryGirl.create(:article)
		article_title = article.title.titleize

		visit admin_root_path
		click_on article_title
		click_on "Publish"

		expect(page).to have_content(article_title)
		expect(page).to_not have_content("draft #{article_title}")
	end
end
