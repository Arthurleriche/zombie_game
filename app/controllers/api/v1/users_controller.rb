class Api::V1::UsersController < ApplicationController
      skip_before_action :verify_authenticity_token
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { error: user.errors.messages}, status: 422
    end
  end

      def destroy
        user = User.find(id = params[:id])

        if user.destroy
          head :no_content
        else
          render json: {error: user.errors.messages}, status: 422
        end
      end

  private

  def user_params
    params.require(:user).permit(:name, :coin, :level)
  end
end
