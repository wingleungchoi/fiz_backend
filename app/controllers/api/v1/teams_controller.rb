module Api
  module V1
    class TeamsController < BaseController
      skip_before_action :verify_authenticity_token
      def winning_chance
        name = team_params['name']
        win_predictor = WinPredictor.new({team_name: name})
        chance = win_predictor.calculateChange
        render json: { winning_chance: chance }, status: :ok
      end
    private
      def team_params
        params.require(:team).permit(:name)
      end
    end
  end
end
