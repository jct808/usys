class Api::V1::SessionsController < ApiController
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.valid_password?(params[:password])
            sign_in "user", @user
            render json: {
                messages: "Signed In Successfully",
                is_success: true,
                data: {user: @user}
            }, status: :ok
            else
            render json: {
                messages: "Signed In Failed - Unauthorized",
                is_success: false,
                data: {}
            }, status: :unauthorized
        end
    end

    def destroy
        sign_out "user", current_user
    end
end  