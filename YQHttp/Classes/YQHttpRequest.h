//
//  YQHttpRequest.h
//  adadsDemo
//
//  Created by Midas on 2020/11/26.
//

#import <Foundation/Foundation.h>
#import "YQHttpResponse.h"
#import "YQHttpBigen.h"
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef Class ObjectClass;

@interface YQHttpRequest<ObjectType>: NSObject

@property (nonatomic, weak) AFHTTPSessionManager *manager;

/// YQHttp  是否是实例 发起的请求
@property (nonatomic, assign) BOOL instanceHttp;

@property (nonatomic, copy) NSString *URLString;

@property (nonatomic, strong, nullable) ObjectType parameters;

@property (nonatomic, strong, nullable) NSDictionary<NSString *, NSString *> *headers;

/// 子类可以重写这个方法 来给 parameters 赋值参数模型转后的字典
/// @param parameters 请求参数模型
- (id)keyValueOfParameters:(id)parameters;

- (YQHttpRequest *)keyValue:(ObjectType (^)(id parameters))keyValueBlock;

- (YQHttpBigen *(^)(YQHttpResponse *response))response;

@end

NS_ASSUME_NONNULL_END
