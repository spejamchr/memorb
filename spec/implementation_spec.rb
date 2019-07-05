RSpec.shared_examples 'an implementation' do |klass|
  describe '#initialize' do
    it 'retains its original behavior' do
      imp = klass.new
      expect(imp.counter).to eq(123)
    end
    it 'initializes the memorb cache' do
      imp = klass.new
      cache = imp.memorb
      expect(cache).to be_an_instance_of(Memorb::Cache)
    end
  end
  describe 'memorb cache' do
    it 'is not shared across instances' do
      cache1 = klass.new.memorb
      cache2 = klass.new.memorb
      expect(cache1).not_to equal(cache2)
    end
  end
  describe 'ancestors' do
    it '...' do
      puts klass.ancestors.inspect
    end
  end
end

RSpec.shared_examples 'a registered integration' do |klass|
  it 'registers #increment' do
    mixin = Memorb::Mixin.for(klass)
    expect(mixin.public_instance_methods).to include(:increment)
  end
end

RSpec.describe SimpleImplementation do
  it_behaves_like 'an implementation', SimpleImplementation
end

RSpec.describe ChildImplementation do
  it_behaves_like 'an implementation', ChildImplementation
end

RSpec.describe DuplicateImplementation do
  it_behaves_like 'an implementation', DuplicateImplementation

  describe 'ancestors' do
    it 'includes its memorb implementation once' do
      ancestors = DuplicateImplementation.ancestors
      valid = "Memorb(#{ DuplicateImplementation.name })"
      implementations = ancestors.map(&:inspect).select { |a| a == valid }
      expect(implementations).to match_array([valid])
    end
  end
end

RSpec.describe EnumerativeWithBracketsImplementation do
  klass = EnumerativeWithBracketsImplementation
  it_behaves_like 'an implementation', klass
  it_behaves_like 'a registered integration', klass
end

RSpec.describe EnumerativeWithParenthesesImplementation do
  klass = EnumerativeWithParenthesesImplementation
  it_behaves_like 'an implementation', klass
  it_behaves_like 'a registered integration', klass
end
