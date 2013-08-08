require File.dirname(__FILE__) + '/formatters_helper'

describe Nomen::Formatters::Full do
  context 'formatting a name' do

    # name segment combinations were generated with
    # f = Nomen::Name::FRAGMENTS; f.size.downto(1).map{|i| f.combination(i).to_a}.flatten(1)

    context 'with [:first, :middle, :last, :suffix]' do
      before do
        @name = Nomen::Name.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya Verenice Voelker M.D.')
      end
    end

    context 'with [:first, :middle, :last]' do
      before do
        @name = Nomen::Name.new(first: 'Katya', middle: 'Verenice', last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya Verenice Voelker')
      end
    end

    context 'with [:first, :middle, :suffix]' do
      before do
        @name = Nomen::Name.new(first: 'Katya', middle: 'Verenice', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya Verenice M.D.')
      end
    end

    context 'with [:first, :last, :suffix]' do
      before do
        @name = Nomen::Name.new(first: 'Katya', last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya Voelker M.D.')
      end
    end

    context 'with [:middle, :last, :suffix]' do
      before do
        @name = Nomen::Name.new(middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Verenice Voelker M.D.')
      end
    end

    context 'with [:first, :middle]' do
      before do
        @name = Nomen::Name.new(first: 'Katya', middle: 'Verenice')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya Verenice')
      end
    end

    context 'with [:first, :last]' do
      before do
        @name = Nomen::Name.new(first: 'Katya', last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya Voelker')
      end
    end

    context 'with [:first, :suffix]' do
      before do
        @name = Nomen::Name.new(first: 'Katya', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya M.D.')
      end
    end

    context 'with [:middle, :last]' do
      before do
        @name = Nomen::Name.new(middle: 'Verenice', last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Verenice Voelker')
      end
    end

    context 'with [:middle, :suffix]' do
      before do
        @name = Nomen::Name.new(middle: 'Verenice', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Verenice M.D.')
      end
    end

    context 'with [:last, :suffix]' do
      before do
        @name = Nomen::Name.new(last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Voelker M.D.')
      end
    end

    context 'with [:first]' do
      before do
        @name = Nomen::Name.new(first: 'Katya')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya')
      end
    end

    context 'with [:middle]' do
      before do
        @name = Nomen::Name.new(middle: 'Verenice')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Verenice')
      end
    end

    context 'with [:last]' do
      before do
        @name = Nomen::Name.new(last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Voelker')
      end
    end

    context 'with [:suffix]' do
      before do
        @name = Nomen::Name.new(suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('M.D.')
      end
    end
  end
end
