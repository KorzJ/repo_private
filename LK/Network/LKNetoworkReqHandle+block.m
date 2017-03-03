//
//  HYWebServiceAFNRequestMethod+Block.m
//  CloudBusiness
//
//  Created by ZhouX on 16/2/25.
//  Copyright © 2016年 HYcompany. All rights reserved.
//

#import "LKNetoworkReqHandle+block.h"

#import <YYCache.h>
@implementation LKNetoworkReqHandle (block)

- (void)fetchJSONByURL:(NSString *)url
           requestType:(NSRequestNetworkServiceType)type
            parameters:(NSDictionary *)parameters
               success:(ServiceSuccess)success
               failure:(ServiceFail)failure
{
    if (!self.ignoreHUD)
        [SVProgressHUD show];  //等待界面
    
    /**
     *  检验参数是否为空
     */
    if (![parameters bk_all:^BOOL(id key, id obj) {
        //obj !字符串 不做校验
        if (![obj isKindOfClass:[NSString class]])
            return YES;
        if (![obj isEqualToString:@""])
            return YES;
        return NO;
    }]){
        [SVProgressHUD showErrorWithStatus:K_SERVICE_REQUEST_ERROR];
        return;
    };
    
    //清除占位符
    parameters = [parameters bk_reject:^BOOL(id key, id obj) {
        if ([obj isKindOfClass:[NSString class]] && [obj isEqualToString:K_PLACEHOLDER_NULL])
            return YES;
            return NO;
    }];
    
    [LKNetoworkReqHandle
                                requsetUrl:[LKNetoworkReqHandle formateServiceURL:url]
                                body:[LKNetoworkReqHandle formatedicKeyAndValue:parameters]
                                requestType:type
                                ignoreHTML:self.ignoreHTML
                                ignoreJSON:self.ignoreReqJSON
                                success:^(id responseObject) {

                                    if ([SVProgressHUD isVisible])
                                        [SVProgressHUD dismiss];
                                    if (success)
                                        success(responseObject[@"data"]);
                                    [self logServiceInfo:NO httpType:type fullURL:[self fullURL:url params:parameters]reponse:responseObject];
                                }
                                failure:^(NSError *error, NSDictionary *errorInfo) {
    
                                    if ([SVProgressHUD isVisible])
                                        [SVProgressHUD dismiss];
                                    NSLog(@"Failure == %@", error);
                                    if (!self.ignoreReqJSON)
                                    {
                                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                            if (error){
                                                [SVProgressHUD showErrorWithStatus:K_SERVICE_RESPONSE_ERROR];
                                            }else{
                                                if ([errorInfo.allKeys containsObject:@"msg"] &&errorInfo[@"msg"])
                                                    [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",errorInfo[@"msg"]]];
                                                if (![errorInfo.allKeys containsObject:@"msg"] || !errorInfo[@"msg"])
                                                    [SVProgressHUD showErrorWithStatus:K_SERVICE_RESPONSE_ERROR];
                                            }
                                        });
                                    }
                                    [self logServiceInfo:NO httpType:type fullURL:[self fullURL:url params:parameters]reponse:errorInfo];
                                    failure(errorInfo);
                                    }];
}

- (void)uploadImagesByURL:(NSString *)url
               parameters:(NSDictionary *)parameters
                   images:(NSArray *)imgs
                  imgKeys:(NSArray *)keys
                  success:(ServiceSuccess)success
                  failure:(ServiceFail)failure
{
    [LKNetoworkReqHandle uploadImagesByWebServiceURL:url
                                              params:parameters
                                              images:imgs
                                              imgKeys:keys
                                              success:success
                                              failure:^(NSError *error, NSDictionary *errorInfo) {
                                                  failure(errorInfo);
                                              }];
}

#pragma mark -
#pragma mark PRIVATE METHOD

- (NSString *)fullURL:(NSString*)baseUrl params:(NSDictionary*)params
{
    if (!params || params.count == 0)
        return baseUrl;
    
    NSMutableString *urlPath = [NSMutableString stringWithFormat:@"%@?",baseUrl];
    
    NSMutableArray *sortedParamKeys = [NSMutableArray arrayWithArray:params.allKeys];
    [sortedParamKeys sortUsingSelector:@selector(compare:)];
    [sortedParamKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *key = obj;
        id valueObj = params[key];
        NSString *value = nil;
        if ([valueObj isKindOfClass:[NSString class]]) {
            value = valueObj;
        } else if ([valueObj isKindOfClass:[NSNumber class]]) {
            value = [(NSNumber *)valueObj stringValue];
        } else {
            value = @"";
        }
        [urlPath appendFormat:@"%@=%@&", key, value];
    }];
    return urlPath;
}

- (void)logServiceInfo:(BOOL)succeed httpType:(NSRequestNetworkServiceType)type fullURL:(NSString*)fullURL reponse:(id)reponseObject
{
    // 打印网络请求日志
    NSString *httpMethod;
    switch (type) {
        case GET:
            httpMethod = @"GET";
            break;
        case POST:
            httpMethod = @"POST";
            break;
        case PUT:
            httpMethod = @"PUT";
            break;
        default:
            break;
    }
    NSLog(@"\n[%@] \n[%@]: %@ \n%@", succeed?@"succeed":@"fail", httpMethod, fullURL,reponseObject);
}

//根据标识符取缓存
- (id)cachesByIdentify:(NSString *)identify{
    YYCache *cache = [self cachesbyindentify:identify];
    id cacheObject = [cache objectForKey:identify];
    if (cacheObject)
        return nil;
    return cacheObject;
}

//根据标识符缓存
- (void)cachesToDb:(id)reponse byIdentify:(NSString *)identify{
    YYCache *cache = [self cachesbyindentify:identify];
    [cache setObject:reponse forKey:identify];
}

+ (NSMutableDictionary *)formatedicKeyAndValue:(NSDictionary *)dicKeyAndValue{
    NSMutableDictionary *parames = [NSMutableDictionary dictionaryWithDictionary:dicKeyAndValue];
    [parames setObject:@"" forKey:@""];
    return parames;
}

+ (NSString *)formateServiceURL:(NSString *)path{
    return[NSString stringWithFormat:@"%@:%@/%@%@/",K_SERVICE_HOST,K_SERVICE_PORT,K_SERVICE_PATH,path];
}

#pragma mark-
#pragma mark GET

- (YYCache *)cachesbyindentify:(NSString *)identify{
    YYCache *cache = [[YYCache alloc] initWithName:[identify stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    cache.memoryCache.shouldRemoveAllObjectsOnMemoryWarning = YES;
    cache.memoryCache.shouldRemoveAllObjectsWhenEnteringBackground = YES;
    return cache;
}

@end
