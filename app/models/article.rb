class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	def render_body
		pipeline = HTML::Pipeline.new [
			HTML::Pipeline::MarkdownFilter
		]

		pipeline.call(body)[:output]
	end
end
