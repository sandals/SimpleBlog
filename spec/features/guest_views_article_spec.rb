require "rails_helper"

feature "Guest views article" do
	scenario "successfully" do
		article = FactoryGirl.create(:published_article)

		visit root_path
		click_link article.title

		expect(page).to have_content(article.title)
		expect(page).to have_content(article.body)
	end
end
