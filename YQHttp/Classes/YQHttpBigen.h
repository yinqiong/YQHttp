//
//  YQHttpBigen.h
//  adadsDemo
//
//  Created by Midas on 2020/11/27.
//

#import <Foundation/Foundation.h>
#import "YQHttpResponse.h"
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface YQHttpBigen : NSObject

@property (nonatomic, weak) AFHTTPSessionManager *manager;

@property (nonatomic, copy) NSString *URLString;

@property (nonatomic, strong, nullable) id parameters;

@property (nonatomic, strong, nullable) NSDictionary<NSString *, NSString *> *headers;

@property (nonatomic, strong, nullable) YQHttpResponse *response;

- (YQHttpResponse *)GET;

- (YQHttpResponse *)POST;

@end

NS_ASSUME_NONNULL_END
