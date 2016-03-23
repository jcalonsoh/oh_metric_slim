require_relative 'lib/spec_helper'

describe OhMetricSlim do
  it 'has a version number' do
    expect(OhMetricSlim::VERSION).not_to be nil
  end

  it 'recover OS value' do
    expect(Gem::Platform.local.os).not_to be nil
  end

  it 'It will return cpu value from darwin system' do
    allow(Gem::Platform.local).to receive(:os).and_return('darwin')
    expect(OhMetricSlim::CpuUsage.value).not_to be nil
  end

  it 'It will return cpu value from linux system' do
    allow(Gem::Platform.local).to receive(:os).and_return('linux')
    expect(OhMetricSlim::CpuUsage.value).not_to be nil
  end
end
