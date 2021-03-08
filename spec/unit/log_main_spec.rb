describe LogMain do
  let(:instance) { described_class.new(log_reader: log_reader, log_grouper: log_grouper, log_sorter: log_sorter, log_output: log_output) }
  let(:log_file_name) { 'webserver.log' }
  let(:log_reader) { double :log_reader }
  let(:log_grouper) { double :log_grouper }
  let(:log_sorter) { double :log_sorter }
  let(:log_output) { double :log_output }

  describe '#call' do
    subject { instance.call(log_file_name) }

    it 'calls all injected services' do
      expect(log_reader).to receive(:call).with(log_file_name).once.and_return([])
      expect(log_grouper).to receive(:call).with([], group_by_column: 0, uniqueness: false).and_return([])
      expect(log_grouper).to receive(:call).with([], group_by_column: 0, uniqueness: true).and_return([])
      expect(log_sorter).to receive(:call).with([], direction: :asc, sort_by_column: 1).twice.and_return([])
      expect(log_output).to receive(:call).twice
      subject
    end
  end
end
