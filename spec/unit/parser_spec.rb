describe Parser do
  let(:instance) { described_class.new(log_file_name) }
  let(:log_file_name) { 'webserver.log' }

  describe '#call' do
    subject { instance.call }

    it { expect { subject }.not_to raise_error(StandardError) }

    context 'but the given argument was not a string' do
      let(:log_file_name) { nil }
      it { expect { subject }.to raise_error(StandardError) }
    end
  end
end
