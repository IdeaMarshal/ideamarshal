class String
  def markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    markdown.render(self)
  end
end