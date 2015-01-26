require "rails_helper"

feature "Guest views all articles" do
	scenario "successfully" do
		article = FactoryGirl.create(:published_article)

		visit articles_path

		expect(page).to have_content(article.title)
	end
end
