//
//  HttpHelper.h
//  HttpTool
//
//  Created by yanwu wei on 2017/4/6.
//  Copyright © 2017年 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpHelper : NSObject

+(void)log:(id)responseObject url:(NSString *)url;

+(void)logError:(NSError *)error url:(NSString *)url;

@end
