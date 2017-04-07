//
//  HttpTool.m
//  HttpTool
//
//  Created by yanwu wei on 2017/4/6.
//  Copyright © 2017年 Ivan. All rights reserved.
//

#import "HttpTool.h"
#import "HttpHelper.h"

@implementation HttpTool

+ (AFHTTPSessionManager *)manager
{
    static AFHTTPSessionManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
    });
    return _manager;
}


+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理者
    AFHTTPSessionManager *mgr = [HttpTool manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript", @"text/plain", nil];
    // 2.发送请求
    [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
            [HttpHelper log:responseObject url:url];
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
            [HttpHelper logError:error url:url];
            
        }
    }];
}

+ (void)getData:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理者
    AFHTTPSessionManager *mgr = [HttpTool manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 2.发送请求
    [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
            //[HttpHelper log:responseObject url:url];
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
            //[HttpHelper logError:error url:url];
            
        }
    }];
}




+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理者
    AFHTTPSessionManager *mgr = [HttpTool manager];
    
    // 2.发送请求
    [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
            [HttpHelper log:responseObject url:url];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
            [HttpHelper logError:error url:url];
            
        }
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理者
    AFHTTPSessionManager *mgr = [HttpTool manager];
    
    // 2.发送请求
    [mgr POST:url parameters:params constructingBodyWithBlock:block progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
            [HttpHelper log:responseObject url:url];
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
            [HttpHelper logError:error url:url];
            
        }
    }];
}

@end
