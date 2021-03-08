describe LogSorter do
  let(:instance) { described_class.new }

  describe '#call' do
    subject { instance.call(logs, options) }
    let(:logs) do
      {
        '/index' => ['111.111', '222.222', '333.333', '444.444'],
        '/contact' => ['111.111'],
        '/home' => ['111.111'],
        '/about' => ['111.111', '222.222']
      }
    end

    context 'options[:direction] = :asc AND options[:sort_by_column] = 0' do
      let(:options) { { direction: :asc, sort_by_column: 0 } }
      let(:expected_result) do
        [
          ['/about', ['111.111', '222.222']],
          ['/contact', ['111.111']],
          ['/home', ['111.111']],
          ['/index', ['111.111', '222.222', '333.333', '444.444']]
        ]
      end

      it { is_expected.to eq expected_result }
    end

    context 'options[:direction] = :desc AND options[:sort_by_column] = 0' do
      let(:options) { { direction: :desc, sort_by_column: 0 } }
      let(:expected_result) do
        [
          ['/index', ['111.111', '222.222', '333.333', '444.444']],
          ['/home', ['111.111']],
          ['/contact', ['111.111']],
          ['/about', ['111.111', '222.222']]
        ]
      end

      it { is_expected.to eq expected_result }
    end

    context 'options[:direction] = :asc AND options[:sort_by_column] = 1' do
      let(:options) { { direction: :asc, sort_by_column: 1 } }
      let(:expected_result) do
        [
          ['/contact', ['111.111']],
          ['/home', ['111.111']],
          ['/about', ['111.111', '222.222']],
          ['/index', ['111.111', '222.222', '333.333', '444.444']]
        ]
      end

      it { is_expected.to eq expected_result }
    end

    context 'options[:direction] = :desc AND options[:sort_by_column] = 1' do
      let(:options) { { direction: :desc, sort_by_column: 1 } }
      let(:expected_result) do
        [
          ['/index', ['111.111', '222.222', '333.333', '444.444']],
          ['/about', ['111.111', '222.222']],
          ['/contact', ['111.111']],
          ['/home', ['111.111']]
        ]
      end

      it { is_expected.to eq expected_result }
    end
  end
end
