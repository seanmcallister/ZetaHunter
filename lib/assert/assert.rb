module Assert
  class AssertionFailureError < Exception
  end

  def assert test, msg="", *args
    unless test
      if block_given?
        yield
      end

      raise Assert::AssertionFailureError, msg % args, caller
    end
  end

  def assert_file fname
    self.assert File.exists?(fname),
                "File '%s' does not exist.",
                fname
  end

  def assert_keys hash, *keys
    assert hash.respond_to? :[]

    assert keys.all? { |key| hash[key] },
           "Not all keys are present"
  end
end
