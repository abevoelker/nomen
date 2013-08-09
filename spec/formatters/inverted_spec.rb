require File.dirname(__FILE__) + '/formatters_helper'

describe Nomen::Formatters::Inverted do
  context 'formatting a name' do

    # transforms #<Nomen @first="Bob"> into #<Nomen @first="Bob", @middle=nil, @last=nil, suffix=nil>
    def nils(nomen)
      Nomen.new(nomen.to_h)
    end

    # transforms #<Nomen @first="Bob"> into #<Nomen @first="Bob", @middle="", @last="", suffix="">
    def blanks(nomen)
      Nomen.new(nomen.to_h.inject({}){|a,(k,v)| a[k] = (v.nil? ? '' : v); a })
    end

    # name segment combinations were generated with
    # f = Nomen::FRAGMENTS; f.size.downto(1).map{|i| f.combination(i).to_a}.flatten(1)

    context 'with [:first, :middle, :last, :suffix]' do
      before do
        @name = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker, Katya Verenice M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :middle, :last]' do
      before do
        @name = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker, Katya Verenice')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :middle, :suffix]' do
      before do
        @name = Nomen.new(first: 'Katya', middle: 'Verenice', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Katya Verenice M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :last, :suffix]' do
      before do
        @name = Nomen.new(first: 'Katya', last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker, Katya M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle, :last, :suffix]' do
      before do
        @name = Nomen.new(middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker, Verenice M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :middle]' do
      before do
        @name = Nomen.new(first: 'Katya', middle: 'Verenice')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Katya Verenice')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :last]' do
      before do
        @name = Nomen.new(first: 'Katya', last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker, Katya')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :suffix]' do
      before do
        @name = Nomen.new(first: 'Katya', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Katya M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle, :last]' do
      before do
        @name = Nomen.new(middle: 'Verenice', last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker, Verenice')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle, :suffix]' do
      before do
        @name = Nomen.new(middle: 'Verenice', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Verenice M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:last, :suffix]' do
      before do
        @name = Nomen.new(last: 'Voelker', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker, M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first]' do
      before do
        @name = Nomen.new(first: 'Katya')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Katya')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle]' do
      before do
        @name = Nomen.new(middle: 'Verenice')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Verenice')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:last]' do
      before do
        @name = Nomen.new(last: 'Voelker')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Voelker')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:suffix]' do
      before do
        @name = Nomen.new(suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end
  end
end
