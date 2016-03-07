require_relative 'lib/spec_helper'

SimpleCov.command_name 'tests'

describe OhMetricSlim do
  it 'has a version number' do
    expect(OhMetricSlim::VERSION).not_to be nil
  end

  it 'recover OS value' do
    expect(OhMetricSlim::OS).not_to be nil
  end

  it 'It will return cpu value from darwin system' do
    expect(OhMetricSlim::CpuUsage.value).not_to be nil
  end
end
