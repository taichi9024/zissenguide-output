class Staff::AccountsController < Staff::Base
    before_action :staff_member_set
    def show
    end

    def edit
    end

    def update
    end

        private 
        def staff_member_set
          if current_staff_member
            @staff_member = @current_staff_member
          else
            @current_staff_member = nil
          end
        end
end
