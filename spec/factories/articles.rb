FactoryGirl.define do
  factory :article do
    title "Riding the Railz"
		excerpt "A short visit to Railz"
		body "Exploring the tubez with my friends."
		published false
  end

	factory :published_article, class: Article do
		title "Software as a Service"
		excerpt "SaaS is like srsly kewl m8"
		body "Seriously kewl article content, you know you like this."
		published true
	end
end
