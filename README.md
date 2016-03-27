EncodingCorrectlyFilter
=========

Filtered invalid char

Install
--------

```
  gem 'encoding_correctly_filter'
```

Usage
--------

```
class YourController < ApplicationController
  include EncodingCorrectlyFilter::ControllersConcern

  before_action :check_valid_encoding!, only: %i(create)

  rescue_from EncodingCorrectlyFilter::InvalidEncodingError, with: :handle_400

  def handle_400(e = nil)
    render text: e.message, status: :bad_request
  end

  def create
  :
  :
```

