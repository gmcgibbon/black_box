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

end
