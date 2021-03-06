require 'browser/http'

describe Browser::HTTP do
  let :path do
    '/http'
  end

  describe '.get' do
    async 'fetches a path' do
      Browser::HTTP.get(path) {|req|
        req.on :success do |resp|
          run_async {
            resp.text.should == 'lol'
          }
        end

        req.on :failure do
          run_async {
            fail
          }
        end
      }
    end
  end

  describe '.get!' do
    it 'fetches a path' do
      Browser::HTTP.get!(path).text.should == 'lol'
    end
  end

  describe '.post' do
    async 'sends parameters properly' do
      Browser::HTTP.post(path, lol: 'wut') {|req|
        req.on :success do |resp|
          run_async {
            resp.text.should == 'ok'
          }
        end

        req.on :failure do
          run_async {
            fail
          }
        end
      }
    end
  end

  describe '.post!' do
    it 'sends parameters properly' do
      Browser::HTTP.post!(path, lol: 'wut').text.should == 'ok'
    end
  end

  describe '.put' do
    async 'sends parameters properly' do
      Browser::HTTP.put(path, lol: 'wut') {|req|
        req.on :success do |resp|
          run_async {
            resp.text.should == 'ok'
          }
        end

        req.on :failure do
          run_async {
            fail
          }
        end
      }
    end
  end

  describe '.put!' do
    it 'sends parameters properly' do
      Browser::HTTP.put!(path, lol: 'wut').text.should == 'ok'
    end
  end

  describe '.delete' do
    async 'fetches a path' do
      Browser::HTTP.delete(path) {|req|
        req.on :success do |resp|
          run_async {
            resp.text.should == 'lol'
          }
        end

        req.on :failure do
          run_async {
            fail
          }
        end
      }
    end
  end

  describe '.delete!' do
    it 'fetches a path' do
      Browser::HTTP.delete!(path).text.should == 'lol'
    end
  end
end
