//
//  YQHttp.m
//  adadsDemo
//
//  Created by Midas on 2020/11/26.
//

#import "YQHttp.h"
#import <objc/runtime.h>

@interface YQHttp ()

@property (nonatomic, weak) NSURLSessionDataTask *task;

@end


@implementation YQHttp

static char kYQManagerKey;

- (void)dealloc {
    [_task cancel];
}

+ (YQHttpRequest *(^)(YQHttpRequest *request))objectRequest {
    
    
    return ^YQHttpRequest *(YQHttpRequest *value) {
        YQHttp *http = [[YQHttp alloc] init];
        
        http.manager = [AFHTTPSessionManager manager];
        value.instanceHttp = YES;
        return value;
    };
}



+ (AFHTTPSessionManager *)manager {
    
    AFHTTPSessionManager *manager = objc_getAssociatedObject(self, &kYQManagerKey);
    if (!manager) {
        manager = [AFHTTPSessionManager manager];
        [self setManager:manager];
    }
    
    return manager;
}

+ (void)setManager:(AFHTTPSessionManager *)manager {
    
    objc_setAssociatedObject(self, &kYQManagerKey, manager, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (YQHttpRequest *(^)(YQHttpRequest *request))request {
    
    return ^YQHttpRequest *(YQHttpRequest *value) {
        value.manager = [self manager];
        return value;
    };
    
}

+ (YQHttpRequest *)request:(nonnull YQHttpRequest *)request {
    request.manager = [self manager];
    return request;
}

@end
