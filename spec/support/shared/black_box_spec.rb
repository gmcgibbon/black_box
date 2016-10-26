shared_examples 'black_box' do

  let(:klass) { Hash }

  let(:instance) { subject.instance }

  describe '.subject' do

    before { subject.subject klass }

    it 'should assign box_class' do
      expect(subject.box_class).to eq klass
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

    let(:attributes) { %i(red green blue) }

    before { subject.accept *attributes }

    it 'should push attributes to box_attributes' do
      expect(subject.box_attributes).to eq attributes
    end

    it 'should have accessors for attributes' do
      attributes.each do |attribute|
        expect(subject).to respond_to attribute
        expect(subject).to respond_to :"#{attribute}="
      end
    end

    context 'duplicate keys' do

      let(:attributes) { %i(red red green blue) }

      it 'should push unique attributes to box_attributes' do
        expect(subject.box_attributes).to_not eq attributes
        expect(subject.box_attributes).to eq attributes.uniq
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

end
