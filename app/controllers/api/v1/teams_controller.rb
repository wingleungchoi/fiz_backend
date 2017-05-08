module Api
  module V1
    class TeamsController < BaseController
      def winning_chance
        name = team_params['name']
        win_predictor = WinPredictor.new({team_name: 'Virtus Pro & Ninjas in Pyjamas'})
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
