require "rails_helper"

describe Article, ".render_body" do
	it "returns the processed markdown of the raw article body" do
		article = FactoryGirl.build(:article)
		article.body = "This is **some** seriously kewl *md*."
		article.save

		rendered_md = article.render_body

		expect(rendered_md).to eq("<p>This is <strong>some</strong> seriously kewl <em>md</em>.</p>")
	end
end
