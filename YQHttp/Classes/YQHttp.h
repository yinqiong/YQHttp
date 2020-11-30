//
//  YQHttp.h
//  adadsDemo
//
//  Created by Midas on 2020/11/26.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "YQHttpRequest.h"
#import "YQHttpResponse.h"
#import "YQHttpConst.h"


NS_ASSUME_NONNULL_BEGIN

@interface YQHttp: NSObject


@property (nonatomic, strong) AFHTTPSessionManager *manager;

/// get manager
+ (AFHTTPSessionManager *)manager;

/// set manager
/// @param manager 实例对象
+ (void)setManager:(AFHTTPSessionManager *)manager;


/// 开始请求
+ (YQHttpRequest *(^)(YQHttpRequest *request))request;

/// 实例 开始请求
+ (YQHttpRequest *(^)(YQHttpRequest *request))objectRequest;


@end

NS_ASSUME_NONNULL_END
