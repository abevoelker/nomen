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
        @name = Nomen.new(first: 'John', middle: 'Jacob', last: 'Smith', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith, John Jacob M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :middle, :last]' do
      before do
        @name = Nomen.new(first: 'John', middle: 'Jacob', last: 'Smith')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith, John Jacob')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :middle, :suffix]' do
      before do
        @name = Nomen.new(first: 'John', middle: 'Jacob', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('John Jacob M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :last, :suffix]' do
      before do
        @name = Nomen.new(first: 'John', last: 'Smith', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith, John M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle, :last, :suffix]' do
      before do
        @name = Nomen.new(middle: 'Jacob', last: 'Smith', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith, Jacob M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :middle]' do
      before do
        @name = Nomen.new(first: 'John', middle: 'Jacob')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('John Jacob')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :last]' do
      before do
        @name = Nomen.new(first: 'John', last: 'Smith')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith, John')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first, :suffix]' do
      before do
        @name = Nomen.new(first: 'John', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('John M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle, :last]' do
      before do
        @name = Nomen.new(middle: 'Jacob', last: 'Smith')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith, Jacob')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle, :suffix]' do
      before do
        @name = Nomen.new(middle: 'Jacob', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Jacob M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:last, :suffix]' do
      before do
        @name = Nomen.new(last: 'Smith', suffix: 'M.D.')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith, M.D.')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:first]' do
      before do
        @name = Nomen.new(first: 'John')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('John')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:middle]' do
      before do
        @name = Nomen.new(middle: 'Jacob')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Jacob')
        expect(Nomen::Formatters::Inverted.format(nils(@name))).to   eq(Nomen::Formatters::Inverted.format(@name))
        expect(Nomen::Formatters::Inverted.format(blanks(@name))).to eq(Nomen::Formatters::Inverted.format(@name))
      end
    end

    context 'with [:last]' do
      before do
        @name = Nomen.new(last: 'Smith')
      end

      it 'should format correctly' do
        expect(Nomen::Formatters::Inverted.format(@name)).to         eq('Smith')
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
