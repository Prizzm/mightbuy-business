require "redcarpet"

module ApplicationHelper
  def title
    @title || "Mightbuy for Business"
  end

  def md2html(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                   :autolink => true, :space_after_headers => true)
    markdown.render(text)
  end

  def active_tab_class(current_tab)
    if current_tab == controller_name
      'active'
    else
      ''
    end
  end
end
