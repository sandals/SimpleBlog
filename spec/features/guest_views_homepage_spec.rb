require "rails_helper"

feature "Guest views homepage" do
	scenario "with no published articles" do
		visit root_path

		expect(page).to have_content("We haven't published anything yet!")
	end

	scenario "with one or many published articles" do
		article = FactoryGirl.create(:published_article)

		visit root_path

		expect(page).to have_content(article.title)
	end
end
