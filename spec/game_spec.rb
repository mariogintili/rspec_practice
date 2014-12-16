require 'spec_helper'

describe Game do
  subject(:game) { described_class.new }
  
  describe '#call' do

    let(:message) do |example|
      example.description
    end

    it 'rock beats scissors' do |example|
      expect(subject.call('rock', 'scissors')).to eq(message)
    end

    it 'draw' do |example|
      expect(subject.call('rock', 'rock')).to eq(message)
    end
  end

  describe '#get_user_input' do

    let(:choice) { "paper \n" }

    let(:message) do
      "Please select rock, paper or scissors\n"
    end

    before do
      allow(game).to receive(:gets).and_return(choice)
    end

    it 'prompts the user with a message' do
      expect{game.get_user_input}.to output(message).to_stdout
    end
  end
end