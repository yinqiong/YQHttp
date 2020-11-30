//
//  YQHttpResponse.h
//  adadsDemo
//
//  Created by Midas on 2020/11/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef Class modelClass;

@interface YQHttpResponse<ObjectType> : NSObject

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) ObjectType result;

/// YQHttp  是否是实例 发起的请求
@property (nonatomic, assign) BOOL instanceHttp;

@property (nonatomic, copy, nullable) void (^uploadProgress)( NSProgress * _Nonnull uploadProgress);

@property (nonatomic, copy, nullable) void (^sucessBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);

@property (nonatomic, copy, nullable) void (^errorBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error);


/// 子类可以重写这个方法，避免每一个请求都要调用
/// object: 或者 objectArray: 方法
/// @param cls ObjectType 类
/// @param result 数据源
- (void)objectAtClass:(Class)cls result:(id)result;

- (YQHttpResponse *)object:(ObjectType (^)(Class cls, NSDictionary *obj))objectBlock;

- (YQHttpResponse *)objectArray:(ObjectType (^)(Class cls, NSArray *objArray))objectArrayBlock;

- (YQHttpResponse *)progress:(nullable void (^)(NSProgress * _Nonnull uploadProgress))uploadProgress;

- (YQHttpResponse *)sucess:(nullable void (^)(ObjectType result))sucessBlock;

- (YQHttpResponse *)error:(nullable void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))errorBlock;


@end

NS_ASSUME_NONNULL_END
