//
//  YQHttpBigen.m
//  adadsDemo
//
//  Created by Midas on 2020/11/27.
//

#import "YQHttpBigen.h"

@implementation YQHttpBigen


- (YQHttpResponse *)GET {
    
    
    [_manager GET:_URLString parameters:_parameters headers:_headers progress:^(NSProgress * _Nonnull downloadProgress) {
        if (self.response.uploadProgress) {
            self.response.uploadProgress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.response.sucessBlock) {
            self.response.sucessBlock(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.response.errorBlock) {
            self.response.errorBlock(task, error);
        }
    }];
    
    return _response;
    
}

- (YQHttpResponse *)POST {
    
    [_manager POST:_URLString parameters:_parameters headers:_headers progress:^(NSProgress * _Nonnull downloadProgress) {
        if (self.response.uploadProgress) {
            self.response.uploadProgress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.response.sucessBlock) {
            self.response.sucessBlock(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.response.errorBlock) {
            self.response.errorBlock(task, error);
        }
    }];
    
    
    return _response;
    
}


@end
