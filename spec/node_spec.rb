require 'rspec'
require './node'

describe Node do

  let(:node) { Node.new('1') }
  let(:infinite) { -1 }

  context 'when is new node instance' do
    it 'has a name' do
      expect(node.name).to eql '1'
    end

    it 'has an infinite distance' do
      expect(node.distance).to eql infinite
    end

    it 'does not have edges' do
      expect(node.edges).to eql []
    end

    it 'is unvisited' do
      expect(node.unvisited?).to be
    end
  end
end