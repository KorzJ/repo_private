//
//  HYWebServiceAFNRequestMethod.h
//  Ios_HYCom_Demo
//
//  Created by yixiaoshan on 16/2/2.
//  Copyright © 2016年 BourneYao. All rights reserved.
//

//
////========================================================================

///==================================
//网络层，基本的网络配置
///==================================


#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>
typedef NS_ENUM(NSInteger, NSRequestNetworkServiceType)
{
    GET,
    POST,
    PUT
};

typedef NS_ENUM(NSInteger, NSRequestNetworkType)
{
    NSRequestNetworkService =0,//请求
    NSRequestNetworkCaches,//缓存
    NSRequestNetworkBoth// Step1:cache Step2:request
};

@interface LKNetoworkReqHandle : NSObject

/**
 ignoreHUD:加载HUD
 ignoreFailure:失败Alert
 ignoreHTML:HTML标签
 ignoreReqJSON:JSON序列化
 */
@property (nonatomic) BOOL ignoreHUD,
                                                  ignoreFailure,
                                                  ignoreHTML,
                                                  ignoreReqJSON;

@property (nonatomic) NSRequestNetworkServiceType requestPolicy;//请求策略

+ (void)requsetUrl:(NSString *)url
                        body:(NSDictionary *)body
                        requestType:(NSRequestNetworkServiceType)type
                        ignoreHTML:(BOOL)ignoreHTML
                        ignoreJSON:(BOOL)ignoreJSON
                        success:(void (^)(id responseObject))success
                        failure:(void(^)(NSError *error,NSDictionary *errorInfo))failure;

+ (void)uploadImagesByWebServiceURL:(NSString *)url
                        params:(NSDictionary *)params
                        images:(NSArray *)imgs
                        imgKeys:(NSArray *)keys
                        success:(void (^)(id responseObject))success
                        failure:(void(^)(NSError *error,NSDictionary *errorInfo))fail;

+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

/**
 *  停止加载网络数据
 */
+ (void)cancelAllServiceOperations;
@end
