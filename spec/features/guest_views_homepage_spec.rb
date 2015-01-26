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
		expect(page).to have_content(article.excerpt)
	end

	scenario "with articles without an excerpt" do
		article = FactoryGirl.build(:published_article)
		excerpt = article.excerpt
		article.excerpt = nil
		article.save

		visit root_path
		
		expect(page).to have_content(article.title)
		expect(page).to_not have_content(excerpt)
	end
end
