require 'spec_helper'

describe BlackBox::Base do

  describe '.instance' do

    let(:instance)  { described_class.instance }
    let(:exception) { NotImplementedError }
    let(:exception_text) do
      "#{described_class} is an abstract class and cannot be instantiated."
    end

    it 'should raise NotImplementedError' do
      expect { instance }.to raise_error exception, exception_text
    end

  end

  context 'subclass' do

    subject { Class.new BlackBox::Base }

    describe '.instance' do

      let(:instance) { subject.instance }

      it 'should not raise error' do
        expect { instance }.to_not raise_error
      end

    end

  end

end
