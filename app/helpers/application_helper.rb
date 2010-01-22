# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def version
    "Version 0.2 (Smashed)"
  end
  
  def header(&block)
    concat(content_tag(:div, :class => "header") do
        capture(&block)
        
    end + content_tag(:p, :class => "notify") do flash[:notice] end)
  end
  
end
