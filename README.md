# YQHttp

[![CI Status](https://img.shields.io/travis/yinqiong/YQHttp.svg?style=flat)](https://travis-ci.org/yinqiong/YQHttp)
[![Version](https://img.shields.io/cocoapods/v/YQHttp.svg?style=flat)](https://cocoapods.org/pods/YQHttp)
[![License](https://img.shields.io/cocoapods/l/YQHttp.svg?style=flat)](https://cocoapods.org/pods/YQHttp)
[![Platform](https://img.shields.io/cocoapods/p/YQHttp.svg?style=flat)](https://cocoapods.org/pods/YQHttp)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

```Object-C
[[YQHttp.request(request).response(response).POST sucess:^(id  _Nonnull result) {

    // 200 处理
    // 如果201 处理也可以再自定义 201 的链式
        
}] error:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
    // 错误处理
        
}];
```

## Installation

YQHttp is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YQHttp'
```

## Author

yinqiong, yinqiong04@163.com

## License

YQHttp is available under the MIT license. See the LICENSE file for more info.
