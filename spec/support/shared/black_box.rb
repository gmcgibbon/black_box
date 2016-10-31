shared_examples 'black_box' do |options = {}|

  options[:class]      ||= Hash
  options[:attributes] ||= %i(red green blue)
  options[:methods]    ||= %i(size any? empty?)

  let(:klass) { options[:class] }

  let(:instance) { described_class.instance }

  describe '.subject' do

    before do
      described_class.subject klass
    end

    it 'should assign box_class' do
      expect(described_class.box_class).to eq klass
    end

    context 'instance' do

      describe '#subject' do

        it 'should be an instance of subject' do
          expect(instance.subject).to be_a klass
        end
      end
    end
  end

  describe '.accept' do

    let(:attributes) { options[:attributes] }

    before do
      described_class.subject klass
      described_class.box_methods.clear
      described_class.accept *attributes
    end

    it 'should push attributes to box_attributes' do
      expect(described_class.box_attributes).to eq attributes
    end

    it 'should have accessors for attributes' do
      attributes.each do |attribute|
        expect(described_class).to respond_to attribute
        expect(described_class).to respond_to :"#{attribute}="
      end
    end

    context 'duplicate keys' do

      let(:attributes) { options[:attributes] + options[:attributes].first(1) }

      it 'should push unique attributes to box_attributes' do
        expect(described_class.box_attributes).to_not eq attributes
        expect(described_class.box_attributes).to eq attributes.uniq
      end
    end

    context 'instance' do

      it 'should have accessors for attributes' do
        attributes.each do |attribute|
          expect(instance).to respond_to attribute
          expect(instance).to respond_to :"#{attribute}="
        end
      end
    end
  end

  describe '.expose' do

    let(:methods) { options[:methods] }

    before do
      described_class.subject klass
      described_class.box_attributes.clear
      described_class.expose *methods
    end

    it 'should push methods to box_methods' do
      expect(described_class.box_methods).to eq methods
    end

    it 'should delegate methods' do
      methods.each do |method|
        expect(described_class).to delegate_method(method).to :instance
      end
    end

    context 'duplicate keys' do

      let(:methods) { options[:methods] + options[:methods].first(1) }

      it 'should push unique methods to box_methods' do
        expect(described_class.box_methods).to_not eq methods
        expect(described_class.box_methods).to eq methods.uniq
      end
    end

    context 'instance' do

      it 'should delegate methods' do
        methods.each do |method|
          expect(instance).to delegate_method(method).to :subject
        end
      end
    end
  end

  describe '.configure' do

    before do
      described_class.subject klass
      described_class.box_attributes.clear
      described_class.box_methods.clear
    end

    context 'with block' do

      it 'should yield self' do
        expect do |block|
          described_class.configure &block
        end.to yield_with_args(described_class)
      end
    end

    context 'no block' do

      it 'should not raise error' do
        expect { described_class.configure }.to_not raise_error
      end
    end
  end

end
