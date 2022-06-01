Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framewrok :rspec
    with.library :rails
  end
end
