describe Parser do
  let(:instance) { described_class.new(log_reader: log_reader, log_grouper: log_grouper) }
  let(:log_file_name) { 'webserver.log' }
  let(:log_reader) { double :log_reader }
  let(:log_grouper) { double :log_grouper}

  describe '#call' do
    subject { instance.call(log_file_name) }

    before { allow(log_reader).to receive(:call).with(log_file_name) }

    it { expect { subject }.not_to raise_error(StandardError) }

    context 'but the given argument was not a string' do
      let(:log_file_name) { nil }

      it { expect { subject }.to raise_error(StandardError) }
    end
  end
end
