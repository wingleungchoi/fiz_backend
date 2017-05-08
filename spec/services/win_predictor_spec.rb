require "rails_helper"

RSpec.describe WinPredictor do
  describe "#calculateChange" do
    it "returns correct number" do
      win_predictor = WinPredictor.new({team_name: 'Virtus Pro & Ninjas in Pyjamas'})
      expect(win_predictor.calculateChange).to eq(24)
    end
  end

  describe "#count" do
    it "returns correct object" do
      win_predictor = WinPredictor.new({team_name: 'Virtus Pro & Ninjas in Pyjamas'})
      win_predictor.count
      expect(win_predictor.defeats_count).to eq([0, 0, 0, 0, 3, 1, 3])
    end
  end

  describe "#add_sequential_pair_of_digits" do
    it "returns correct number" do
      win_predictor = WinPredictor.new({team_name: 'Virtus Pro & Ninjas in Pyjamas'})
      expect(win_predictor.add_sequential_pair_of_digits([0, 0, 0, 0, 3, 1, 3])).to eq([0, 0, 0, 3, 4, 4])
    end
  end

  describe "#convert_to_digital_array" do
    it "returns correct number" do
      win_predictor = WinPredictor.new({team_name: 'Virtus Pro & Ninjas in Pyjamas'})
      expect(win_predictor.convert_to_digital_array([0, 0, 0, 0, 3, 13])).to eq([0, 0, 0, 0, 3, 1, 3])
      expect(win_predictor.convert_to_digital_array([0, 0, 0, 0, 3, 1, 3])).to eq([0, 0, 0, 0, 3, 1, 3])
    end
  end
end
