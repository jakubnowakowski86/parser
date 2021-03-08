describe LogReader do
  let(:instance) { described_class.new }
  let(:file_name) { 'spec/fixtures/webserver_test.log' }

  describe '#call' do
    subject { instance.call(file_name) }

    let(:expected_result) do
      [
        '/help_page/1 126.318.035.038',
        '/contact 184.123.665.067',
        '/home 184.123.665.067',
        '/about/2 444.701.448.104',
        '/help_page/1 929.398.951.889',
        '/index 444.701.448.104',
        '/help_page/1 722.247.931.582',
        '/about 061.945.150.735',
        '/help_page/1 646.865.545.408'
      ]
    end

    it { is_expected.to eq expected_result }

    context 'but the file_name is wrong' do
      let(:file_name) { 'path_to_non_existing_file.log' }

      it { expect { subject }.to output("Something went wrong...\n").to_stderr }
    end
  end
end
