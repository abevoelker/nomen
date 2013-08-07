require File.dirname(__FILE__) + '/spec_helper'

describe Nomen::Formatters do
  context 'formatter lookup' do
    it 'should return formatter object reference' do
      expect(Nomen::Formatters.lookup(:full)).to eq(Nomen::Formatters::Full)
    end

    it 'should raise an error if a formatter cannot be found' do
      expect{Nomen::Formatters.lookup(:unknown)}.to raise_error
    end
  end
end
