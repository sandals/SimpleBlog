require "rails_helper"

feature "Guest views article" do
	scenario "successfully" do
		article = FactoryGirl.create(:published_article)

		visit root_path
		click_link article.title

		expect(page).to have_content(article.title)
		expect(page).to have_content(article.body)
	end

	scenario "article with markdown" do
		article = FactoryGirl.build(:published_article)
		article.body = "This [is](https://www.google.com) markdown yo."
		article.save

		visit root_path
		click_link article.title

		expect(page).to have_link("is", href: "https://www.google.com")
	end
end
