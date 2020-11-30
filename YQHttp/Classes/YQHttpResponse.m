//
//  YQHttpResponse.m
//  adadsDemo
//
//  Created by Midas on 2020/11/26.
//

#import "YQHttpResponse.h"
#import "YQHttpConst.h"

@interface YQHttpResponse ()

@property (nonatomic, copy) id (^objectBlock)(Class cls, NSDictionary *obj);

@property (nonatomic, copy) id (^objectArrayBlock)(Class cls, NSArray *objArray);

@property (nonatomic, copy) void (^resutBlock)(id result);

@property (nonatomic, weak) NSURLSessionDataTask * task;


@end

@implementation YQHttpResponse

- (void)dealloc {
    if (_instanceHttp && _task) {
        [_task cancel];
    }
}

- (nullable void (^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject))sucessBlock {
    
    return ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.task = task;
        // 解析 responseObject
        NSDictionary *dict;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            dict = responseObject;
        } else if ([responseObject isKindOfClass:[NSArray class]]) {
            dict = [responseObject firstObject];
        }
        // 获取状态码
        self.code = [dict[kYQCodeMap] integerValue];
        
        if ([dict[kYQCodeMap] isEqualToString: kYQSucessCodeValueMap]) {
            Class cls = [self.result class];
            id result = dict[kYQResultMap];
            // 将解析步骤分发出去
            [self objectAtClass:cls result:result];
            
        }
    };
}

- (void)objectAtClass:(Class)cls result:(id)result {
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        
      self.result = self.objectBlock(cls, result);
        
    } else if ([result isKindOfClass:[NSArray class]]) {
        
       self.result = self.objectArrayBlock(cls, result);
    }
}

- (void)setResult:(id)result {
    _result = result;
    if (_resutBlock) {
        _resutBlock(_result);
    }
}

- (YQHttpResponse *)object:(id (^)(Class cls, NSDictionary *obj))objectBlock {
    _objectBlock = objectBlock;
    return self;
}

- (YQHttpResponse *)objectArray:(id (^)(Class cls, NSArray *objArray))objectArrayBlock {
    _objectArrayBlock = objectArrayBlock;
    return self;
}

- (YQHttpResponse *)progress:(nullable void (^)(NSProgress * _Nonnull uploadProgress))uploadProgress {
    _uploadProgress = uploadProgress;
    return self;
}

- (YQHttpResponse *)sucess:(nullable void (^)(id result))sucessBlock {
    _resutBlock = sucessBlock;
    return self;
}

- (YQHttpResponse *)error:(nullable void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))errorBlock {
    _errorBlock = errorBlock;
    return self;
}



@end
