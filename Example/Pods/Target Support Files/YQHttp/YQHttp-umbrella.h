#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YQHttp.h"
#import "YQHttpBigen.h"
#import "YQHttpConst.h"
#import "YQHttpRequest.h"
#import "YQHttpResponse.h"

FOUNDATION_EXPORT double YQHttpVersionNumber;
FOUNDATION_EXPORT const unsigned char YQHttpVersionString[];

