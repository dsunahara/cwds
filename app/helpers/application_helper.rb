module ApplicationHelper
  
  def full_title(page_title='')
    base_title = "Child Welfare Digital Services"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end

module ActionView
  module Helpers
    class FormBuilder 
      def datetime_select(method, options = {}, html_options = {})
        existing_time = @object.send(method) 
        formatted_time = existing_time.to_time.strftime("%F %I:%M %p") if existing_time.present?
        @template.content_tag(:div, :class => "input-group") do    
          text_field(method, :value => formatted_time, :class => "form-control", :"data-date-format" => "YYYY-MM-DD hh:mm A") +
          @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
        end
      end
    end
  end
end


