class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	def render_body
		context = {
			# NOTE this is would clearly not work in production and I don't really
			# know how I would include Emoji's in production
			:asset_root => "http://0.0.0.0:3000/assets",
			:base_url => "http://0.0.0.0:3000"
		}

		pipeline = HTML::Pipeline.new [
			HTML::Pipeline::MarkdownFilter,
			HTML::Pipeline::EmojiFilter
		], context

		pipeline.call(body)[:output].to_s
	end
end
