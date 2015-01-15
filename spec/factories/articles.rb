FactoryGirl.define do
  factory :article do
    title "Riding the Railz"
		body "Exploring the tubez with my friends."
		published false
  end

	factory :published_article, class: Article do
		title "Software as a Service"
		body "Seriously kewl article content, you know you like this."
		published true
	end
end
