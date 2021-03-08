describe LogGrouper do
  let(:instance) { described_class.new }

  describe '#call' do
    subject { instance.call(logs, options) }
    let(:logs) do
      [
        '/index 111.111',
        '/contact 111.111',
        '/home 111.111',
        '/about 111.111',
        '/index 222.222',
        '/index 333.333',
        '/index 444.444',
        '/about 222.222',
        '/index 111.111'
      ]
    end

    context 'options[:group_by_column] = 1' do
      let(:options) { { group_by_column: 1 } }
      let(:expected_result) do
        {
          '111.111' => ['/index', '/contact', '/home', '/about', '/index'],
          '222.222' => ['/index', '/about'],
          '333.333' => ['/index'],
          '444.444' => ['/index']
        }
      end

      it { is_expected.to eq expected_result }
    end

    context 'options[:group_by_column] = 0' do
      let(:options) { { group_by_column: 0 } }
      let(:expected_result) do
        {
          '/index' => ['111.111', '222.222', '333.333', '444.444', '111.111'],
          '/contact' => ['111.111'],
          '/home' => ['111.111'],
          '/about' => ['111.111', '222.222']
        }
      end

      it { is_expected.to eq expected_result }
    end
    context 'options is empty' do
      let(:options) { {} }
      let(:expected_result) do
        {
          '111.111' => ['/index', '/contact', '/home', '/about', '/index'],
          '222.222' => ['/index', '/about'],
          '333.333' => ['/index'],
          '444.444' => ['/index']
        }
      end

      it { is_expected.to eq expected_result }
    end
  end
end
