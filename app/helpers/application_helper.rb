module ApplicationHelper

    def nav_tab(title, url, options = {})
        current_page = options.delete :current_page
        css_class = current_page == title ? 'btn-outline-success' : 'btn-outline-secondary'
        options[:class] =   if options[:class]
                            options[:class] + " #{css_class}"
                            else
                            css_class
                            end
        link_to title, url, options
    end

    def currently_at(current_page = '')
        render partial: 'application/nav', locals: { current_page: current_page }
    end

    def full_title(page_title = '')
      if page_title.present?
        "#{page_title} | PetToDo"
      else
        'PetToDo'
      end
    end
end
