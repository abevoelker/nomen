require File.dirname(__FILE__) + '/formatters_helper'

describe Nomen::Formatters::Full do
  context 'formatting a name' do

    # name segment combinations were generated with
    # f = Nomen::FRAGMENTS; f.size.downto(1).map{|i| f.combination(i).to_a}.flatten(1)

    context 'with [:first, :middle, :last, :suffix]' do
      before do
        @name = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to eq('Katya Verenice Voelker M.D.')
      end
    end

    context 'with [:first, :middle, :last]' do
      before do
        @name   = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker')
        @nils   = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: nil)
        @blanks = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Katya Verenice Voelker')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:first, :middle, :suffix]' do
      before do
        @name   = Nomen.new(first: 'Katya', middle: 'Verenice', suffix: 'M.D.')
        @nils   = Nomen.new(first: 'Katya', middle: 'Verenice', suffix: 'M.D.', last: nil)
        @blanks = Nomen.new(first: 'Katya', middle: 'Verenice', suffix: 'M.D.', last: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Katya Verenice M.D.')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:first, :last, :suffix]' do
      before do
        @name   = Nomen.new(first: 'Katya', last: 'Voelker', suffix: 'M.D.')
        @nils   = Nomen.new(first: 'Katya', last: 'Voelker', suffix: 'M.D.', middle: nil)
        @blanks = Nomen.new(first: 'Katya', last: 'Voelker', suffix: 'M.D.', middle: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Katya Voelker M.D.')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:middle, :last, :suffix]' do
      before do
        @name   = Nomen.new(middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
        @nils   = Nomen.new(middle: 'Verenice', last: 'Voelker', suffix: 'M.D.', first: nil)
        @blanks = Nomen.new(middle: 'Verenice', last: 'Voelker', suffix: 'M.D.', first: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Verenice Voelker M.D.')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:first, :middle]' do
      before do
        @name   = Nomen.new(first: 'Katya', middle: 'Verenice')
        @nils   = Nomen.new(first: 'Katya', middle: 'Verenice', last: nil, suffix: nil)
        @blanks = Nomen.new(first: 'Katya', middle: 'Verenice', last: '',  suffix: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Katya Verenice')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:first, :last]' do
      before do
        @name   = Nomen.new(first: 'Katya', last: 'Voelker')
        @nils   = Nomen.new(first: 'Katya', last: 'Voelker', middle: nil, suffix: nil)
        @blanks = Nomen.new(first: 'Katya', last: 'Voelker', middle: '',  suffix: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Katya Voelker')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:first, :suffix]' do
      before do
        @name   = Nomen.new(first: 'Katya', suffix: 'M.D.')
        @nils   = Nomen.new(first: 'Katya', suffix: 'M.D.', middle: nil, last: nil)
        @blanks = Nomen.new(first: 'Katya', suffix: 'M.D.', middle: '',  last: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Katya M.D.')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:middle, :last]' do
      before do
        @name   = Nomen.new(middle: 'Verenice', last: 'Voelker')
        @nils   = Nomen.new(middle: 'Verenice', last: 'Voelker', first: nil, suffix: nil)
        @blanks = Nomen.new(middle: 'Verenice', last: 'Voelker', first: '', suffix: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Verenice Voelker')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:middle, :suffix]' do
      before do
        @name   = Nomen.new(middle: 'Verenice', suffix: 'M.D.')
        @nils   = Nomen.new(middle: 'Verenice', suffix: 'M.D.', first: nil, last: nil)
        @blanks = Nomen.new(middle: 'Verenice', suffix: 'M.D.', first: '',  last: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Verenice M.D.')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:last, :suffix]' do
      before do
        @name   = Nomen.new(last: 'Voelker', suffix: 'M.D.')
        @nils   = Nomen.new(last: 'Voelker', suffix: 'M.D.', first: nil, middle: nil)
        @blanks = Nomen.new(last: 'Voelker', suffix: 'M.D.', first: '',  middle: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Voelker M.D.')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:first]' do
      before do
        @name   = Nomen.new(first: 'Katya')
        @nils   = Nomen.new(first: 'Katya', middle: nil, last: nil, suffix: nil)
        @blanks = Nomen.new(first: 'Katya', middle: '',  last: '',  suffix: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Katya')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:middle]' do
      before do
        @name   = Nomen.new(middle: 'Verenice')
        @nils   = Nomen.new(middle: 'Verenice', first: nil, last: nil, suffix: nil)
        @blanks = Nomen.new(middle: 'Verenice', first: '',  last: '',  suffix: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Verenice')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:last]' do
      before do
        @name   = Nomen.new(last: 'Voelker')
        @nils   = Nomen.new(last: 'Voelker', middle: nil, first: nil, suffix: nil)
        @blanks = Nomen.new(last: 'Voelker', middle: '', first: '',  suffix: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('Voelker')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end

    context 'with [:suffix]' do
      before do
        @name   = Nomen.new(suffix: 'M.D.')
        @nils   = Nomen.new(suffix: 'M.D.', middle: nil, first: nil, last: nil)
        @blanks = Nomen.new(suffix: 'M.D.', middle: '',  first: '',  last: '')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Full.format(@name)).to   eq('M.D.')
        expect(Nomen::Formatters::Full.format(@nils)).to   eq(Nomen::Formatters::Full.format(@name))
        expect(Nomen::Formatters::Full.format(@blanks)).to eq(Nomen::Formatters::Full.format(@name))
      end
    end
  end
end
