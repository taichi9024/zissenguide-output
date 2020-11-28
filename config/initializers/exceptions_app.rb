Rails.application.configure do
    config.exceptions_app = ->(env) do
        request = ActionDispatch::Request.new(env)

        action = 
          case request.path_info
          when "/404"; :not_found
          when "/422"; :unprocessable_entity
          end
          ErrorsController.action(:action).call(env)
    end
end