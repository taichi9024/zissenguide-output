class ApplicationController < ActionController::Base
    layout :set_layout

    class Forbidden < ActionController::ActionControllerError; end
    class IpAddressRejected < ActionController::ActionControllerError; end
    class ParameterMissing < ActionController::ActionControllerError; end

    include ErrorHandlers

    private def set_layout
        if params[:controller].match(%r{\A(staff|admin|customer)/})
          Regexp.last_match[1]
        end
    end
end
