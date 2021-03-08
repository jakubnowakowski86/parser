describe Parser do
  let(:instance) { described_class.new(log_file_name) }
  let(:log_file_name) { 'webserver.log' }

  describe '#call' do
    subject { instance.call }

    it { is_expected.to eq log_file_name }
  end
end
