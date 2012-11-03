module ApplicationHelper
  def title
    @title || "Mightbuy for Business"
  end

  def active_tab_class(current_tab)
    if current_tab == controller_name
      'active'
    else
      ''
    end
  end
end
