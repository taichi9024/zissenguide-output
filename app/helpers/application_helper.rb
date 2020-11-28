module ApplicationHelper
    def full_title
        if @title.present?
            "#{@title} | BAUKIS"
        else
            "BAUKIS"
        end
    end
end
