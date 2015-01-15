require "rails_helper"

feature "Guest views article" do
	scenario "from homepage" do
		article = FactoryGirl.create(:article)

		visit root_path
		click_link article.title

		expect(page).to have_content(article.title)
		expect(page).to have_content(article.body)
	end
end
