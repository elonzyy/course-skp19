# 课件链接

<a href="https://elonzyy.github.io/course-skp19">https://elonzyy.github.io/course-skp19</a>

## 课件源代码

book-src/

课件部分使用的是<a href="https://github.com/rust-lang-nursery/mdBook" target="_blank">mdBook</a>.

# 课程辅助工具箱代码

plugin-src/

# 快速安装课程辅助工具

将以下代码复制粘贴至Ruby Console并执行

```ruby
require 'net/http'; require 'uri'; require 'tempfile'
url = URI.parse('https://raw.githubusercontent.com/elonzyy/course-skp19/master/rbz/op_course_helpers.rbz')
dlg = ::UI::HtmlDialog.new
dlg.set_html('<html><head></head><body><span id="msg">Installing...</span></body></html>')
dlg.show
set_msg = lambda {|s| dlg.execute_script("document.getElementById('msg').innerHTML = '#{s}'")}

Thread.new {
  begin
    tmpfile = Tempfile.new(['op_course_helpers', '.zip']).tap { |f| f.binmode }

    Net::HTTP.new(url.host, url.port).tap {|o| o.use_ssl = true}.request_get(url.path) do |response|
      done, total = 0, response['Content-Length'].to_f

      response.read_body do |fragment|
        done += fragment.length
        set_msg["Downloading: #{"%.2f" % (done / total * 100)}%"]

        tmpfile.write(fragment)
      end
      throw "#{response.code} #{response.message}" unless response.code.match(/^2/)
    end

    tmpfile.close
    throw "Installation failed" unless Sketchup.install_from_archive(tmpfile.path)
    set_msg['Done!']
  rescue => e
    dlg.set_html(e.to_s)
  ensure
    tmpfile.unlink
  end
}
```
