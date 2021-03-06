require "rails_helper"

feature "Admin updates articles" do
	before(:each) do
		sign_in
	end

	scenario "publishing drafts" do
		article = FactoryGirl.create(:article)
		article_title = article.title.titleize

		visit admin_root_path
		click_on article_title
		click_on "Publish"

		expect(page).to have_content(article_title)
		expect(page).to_not have_content("draft #{article_title}")
	end

	scenario "updating content" do
		article = FactoryGirl.create(:article)
		old_article_title = article.title.titleize

		visit admin_root_path
		click_on old_article_title
		within('.edit_article') do
			fill_in "Title", with: "New Title"
		end
		click_on "Save"

		expect(page).to have_content("New Title")
		expect(page).to_not have_content(old_article_title)
	end

	scenario "updating excerpt" do
		article = FactoryGirl.create(:article)
		old_excerpt = article.excerpt

		visit admin_root_path
		click_on article.title.titleize
		within('.edit_article') do
			fill_in "Excerpt", with: "New Excerpt"
		end
		click_on "Publish"
		visit root_path

		expect(page).to have_content("New Excerpt")
		expect(page).to_not have_content(old_excerpt)
	end
end
