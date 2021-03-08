describe LogOutput do
  let(:instance) { described_class.new }

  describe '#call' do
    subject { instance.call(logs, header) }

    let(:logs) do
      [
        ["/index", ["111.111", "222.222", "333.333", "444.444"]],
        ["/about", ["111.111", "222.222"]],
        ["/contact", ["111.111"]],
        ["/home", ["111.111"]]
      ]
    end
    let(:header) { 'list of webpages with most page views ordered from most pages views to less page views e.g.:' }
    let(:expected_result) do
      <<~MESSAGE
        list of webpages with most page views ordered from most pages views to less page views e.g.:
        /index 4 visits
        /about 2 visits
        /contact 1 visits
        /home 1 visits
      MESSAGE
    end

    it { expect { subject }.to output(expected_result).to_stdout  }
  end
end
