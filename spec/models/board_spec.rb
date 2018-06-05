require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'abilities' do
    
    it 'has a name' do
      board = Board.create(name: "Test Board 1", priority: 1)
      expect(board.name).to eq('Test Board 1')
    end
  
    it 'moves up when directed' do
      board = Board.create(name: "Test Board 1", priority: 3)
      board.shift_up
      expect(board.priority).to eq(2)
    end

    it 'moves down when directed' do
      board = Board.create(name: "Test Board 1", priority: 3)
      board.shift_down
      expect(board.priority).to eq(4)
    end
    
  end
end
