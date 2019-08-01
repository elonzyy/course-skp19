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
require 'tempfile'

dlg = UI::HtmlDialog.new
dlg.add_action_callback("loaded") { |ctx, bytes|
  msg = nil
  begin
    tmpfile = Tempfile.new(['op_course_helpers', '.zip'])
    tmpfile.binmode; tmpfile.write(bytes.pack('C*')); tmpfile.close
    Sketchup.install_from_archive(tmpfile.path)
    msg = 'Done'
  rescue => e
    puts e.inspect
    puts e.backtrace
  ensure
    dlg.execute_script("set_msg('#{msg || 'Error'}');")
    tmpfile.unlink
  end
}

js = <<-JAVASCRIPT
  var set_msg = function(s) { document.getElementById('msg').innerHTML = s; };
  var http = new XMLHttpRequest();
  http.onerror = function(e) { set_msg(JSON.stringify(e, null, 2)); };
  http.onprogress = function(e) { set_msg("Downloading: " + (e.loaded / e.total * 100).toFixed(2) + "%"); };
  http.onload = function(e) {
    if (http.status >= 300) {
      set_msg(http.status.toString() + ': ' + http.statusText)
    } else {
      set_msg('Installing RBZ...');
      sketchup.loaded(Array.from(new Uint8Array(http.response)));
    }
  };
  http.open('GET', 'https://github.com/elonzyy/course-skp19/raw/master/rbz/op_course_helpers.rbz');
  http.responseType = 'arraybuffer';
  http.send();
JAVASCRIPT

dlg.set_html(<<-HTML)
<html>
  <head></head>
  <body>
    <div><span id="msg">Installing...</span></div>
    <script>#{js}</script>
  </body>
</html>
HTML

dlg.show
```
