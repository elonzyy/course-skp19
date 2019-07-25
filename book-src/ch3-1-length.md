## 长度 Length

API文档: <a href="http://ruby.sketchup.com/Length.html" target="_blank">http://ruby.sketchup.com/Length.html</a>

### 从数值类型创建长度
```ruby
100.to_l
```
```ruby
100.mm
```

### 从字符串类型创建长度
```ruby
'100mm'.to_l
```
```ruby
Sketchup.parse_length('100mm')
```

### SketchUp 单位

* mm
* cm
* m
* km
* inch (")
* feet (')
* yard
* mile

### 长度单位换算

* 数值类型默认单位：inch


```ruby
100.mm.to_inch
```

### API
|关键字|描述|文档链接|
|---|---|---|
|Length|长度类型|<a href="http://ruby.sketchup.com/Length.html" target="_blank">doc</a>
|to_l|转换至长度|<a href="http://ruby.sketchup.com/Numeric.html#to_l-instance_method" target="_blank">doc</a>
|parse_length|将字符串转换至长度|<a href="http://ruby.sketchup.com/Sketchup.html#parse_length-class_method" target="_blank">doc</a>
|mm|从数值创建单位为mm的长度|<a href="http://ruby.sketchup.com/Numeric.html#mm-instance_method" target="_blank">doc</a>
|cm|从数值创建单位为cm的长度|<a href="http://ruby.sketchup.com/Numeric.html#cm-instance_method" target="_blank">doc</a>
|m|从数值创建单位为m的长度|<a href="http://ruby.sketchup.com/Numeric.html#m-instance_method" target="_blank">doc</a>
|km|从数值创建单位为km的长度|<a href="http://ruby.sketchup.com/Numeric.html#km-instance_method" target="_blank">doc</a>
|inch|从数值创建单位为inch的长度|<a href="http://ruby.sketchup.com/Numeric.html#inch-instance_method" target="_blank">doc</a>
|feet|从数值创建单位为feet的长度|<a href="http://ruby.sketchup.com/Numeric.html#feet-instance_method" target="_blank">doc</a>
|yard|从数值创建单位为yard的长度|<a href="http://ruby.sketchup.com/Numeric.html#yard-instance_method" target="_blank">doc</a>
|mile|从数值创建单位为mile的长度|<a href="http://ruby.sketchup.com/Numeric.html#mile-instance_method" target="_blank">doc</a>
|to_mm|将长度转换为数值，数值意义所隐含的单位为mm|<a href="http://ruby.sketchup.com/Numeric.html#to_mm-instance_method" target="_blank">doc</a>
|to_cm|将长度转换为数值，数值意义所隐含的单位为cm|<a href="http://ruby.sketchup.com/Numeric.html#to_cm-instance_method" target="_blank">doc</a>
|to_m|将长度转换为数值，数值意义所隐含的单位为m|<a href="http://ruby.sketchup.com/Numeric.html#to_m-instance_method" target="_blank">doc</a>
|to_km|将长度转换为数值，数值意义所隐含的单位为km|<a href="http://ruby.sketchup.com/Numeric.html#to_km-instance_method" target="_blank">doc</a>
|to_inch|将长度转换为数值，数值意义所隐含的单位为inch|<a href="http://ruby.sketchup.com/Numeric.html#to_inch-instance_method" target="_blank">doc</a>
|to_feet|将长度转换为数值，数值意义所隐含的单位为feet|<a href="http://ruby.sketchup.com/Numeric.html#to_feet-instance_method" target="_blank">doc</a>
|to_yard|将长度转换为数值，数值意义所隐含的单位为yard|<a href="http://ruby.sketchup.com/Numeric.html#to_yard-instance_method" target="_blank">doc</a>
|to_mile|将长度转换为数值，数值意义所隐含的单位为mile|<a href="http://ruby.sketchup.com/Numeric.html#to_mile-instance_method" target="_blank">doc</a>
