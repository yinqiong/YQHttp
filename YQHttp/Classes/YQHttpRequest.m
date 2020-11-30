//
//  YQHttpRequest.m
//  adadsDemo
//
//  Created by Midas on 2020/11/26.
//

#import "YQHttpRequest.h"

@interface YQHttpRequest ()

@property (nonatomic, copy) id (^keyValueBlock)(id parameters);

@end


@implementation YQHttpRequest

- (void)setParameters:(id)parameters {
    
    if (!parameters) {
        return;
    }
    
    _parameters = parameters;
    [self keyValueOfParameters:parameters];
}

- (id)keyValueOfParameters:(id)parameters {
    return self.keyValueBlock(parameters);
}

- (YQHttpRequest *)keyValue:(id (^)(id parameters))keyValueBlock {
    self.keyValueBlock = keyValueBlock;
    return self;
}


- (YQHttpBigen *)begin {
    
    YQHttpBigen *begin = [[YQHttpBigen alloc] init];
    begin.manager = _manager;
    begin.URLString = _URLString;
    begin.parameters = _parameters;
    begin.headers = _headers;
   
    return begin;
}

- (YQHttpBigen *(^)(YQHttpResponse *response))response {
    
    return ^YQHttpBigen *(YQHttpResponse *value) {
        YQHttpBigen *begin = [self begin];
        value.instanceHttp = self.instanceHttp;
        begin.response = value;
        return begin;
    };
    
}




@end
