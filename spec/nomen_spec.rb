require File.dirname(__FILE__) + '/spec_helper'

describe Nomen do
  context 'initialization' do
    it 'should accept no parameters' do
      expect{Nomen.new}.not_to raise_error
    end

    it 'should ignore non-name segment hash parameters' do
      name = Nomen.new(first: 'Katya', foo: 'bar')
      expect(name).to eq(Nomen.new(first: 'Katya'))
    end

    it 'should only accept one parameter' do
      expect{Nomen.new({last: 'Voelker'}, 'foo')}.to raise_error
    end
  end

  context 'equality' do
    it 'should match equality based on name segment matching' do
      a = Nomen.new(first: 'Katya',  middle: 'Verenice', last: 'Voelker')
      b = Nomen.new(last: 'Voelker', middle: 'Verenice', first: 'Katya')
      expect(a).to eq(b)
      expect(b).to eq(a)
      a.suffix = "M.D."
      expect(a).not_to eq(b)
      expect(b).not_to eq(a)
    end
  end

  context 'formatting' do
    it 'should defer formatting to the proper format object' do
      a = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      expect(a.format(:inverted)).to eq(Nomen::Formatters::Inverted.format(a))
    end

    it 'should default to the :full formatter' do
      a = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      expect(a.format).to eq(a.format(:full))
    end
  end

  context 'to_h' do
    it 'should convert to hash using FRAGMENTS' do
      full = Nomen.new(first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.')
      expect(full.to_h).to eq({first: 'Katya', middle: 'Verenice', last: 'Voelker', suffix: 'M.D.'})
    end

    it 'should save empty fragments as null values' do
      first = Nomen.new(first: 'Katya')
      expect(first.to_h).to eq({first: 'Katya', middle: nil, last: nil, suffix: nil})
    end
  end
end
