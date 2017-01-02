//
//  HYWebServiceAFNRequestMethod+Block.m
//  CloudBusiness
//
//  Created by ZhouX on 16/2/25.
//  Copyright © 2016年 HYcompany. All rights reserved.
//

#import "LKNetoworkReqHandle+block.h"

@implementation LKNetoworkReqHandle (block)

- (void)getDictionaryByURL:(NSString *)url requestType:(NSRequestNetworkServiceType)type parameters:(NSDictionary *)parameters success:(requestSuccess_block)success failure:(requestFail_block)failure;
{
    if (!self.ignoreHUD)[SVProgressHUD show];  //等待界面
    /**
     *  检验参数是否为空
     */
    if (![parameters bk_all:^BOOL(id key, id obj) {
        //obj !字符串 不做校验
        if (![obj isKindOfClass:[NSString class]]) return YES;
        if (![obj isEqualToString:@""])return YES;
        return NO;
    }]){
        [SVProgressHUD showErrorWithStatus:K_SERVICE_REQUEST_ERROR];
        return;
    };
    
    //清除占位符
    parameters = [parameters bk_reject:^BOOL(id key, id obj) {
        if ([obj isKindOfClass:[NSString class]] && [obj isEqualToString:K_PLACEHOLDER_NULL])return YES;
        return NO;
    }];
    
    [LKNetoworkReqHandle requsetData:url body:parameters requestType:type ignoreHTML:self.ignoreHTML ignoreJSON:self.ignoreReqJSON success:^(id responseObject) {
        if ([SVProgressHUD isVisible])[SVProgressHUD dismiss];
        if (success) success(responseObject[@"data"]);
    } failure:^(NSError *error, NSDictionary *errorInfo) {
        //关闭等待界面
        if ([SVProgressHUD isVisible])[SVProgressHUD dismiss];
        NSLog(@"Failure == %@", error);
        if (!self.ignoreReqJSON){
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (error) {
                    [SVProgressHUD showErrorWithStatus:K_SERVICE_RESPONSE_ERROR];
                }else{
                    if ([errorInfo.allKeys containsObject:@"msg"] &&errorInfo[@"msg"])[SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",errorInfo[@"msg"]]];
                    if (![errorInfo.allKeys containsObject:@"msg"] || !errorInfo[@"msg"])[SVProgressHUD showErrorWithStatus:K_SERVICE_RESPONSE_ERROR];
                }
            });
        }
        failure(errorInfo);
    }];
}

- (void)uploadImagesByURL:(NSString *)url parameters:(NSDictionary *)parameters images:(NSArray *)imgs imgKeys:(NSArray *)keys success:(requestSuccess_block)success failure:(requestFail_block)failure{
    [LKNetoworkReqHandle uploadImagesByWebServiceURL:url params:parameters images:imgs imgKeys:keys success:success failure:^(NSError *error, NSDictionary *errorInfo) {}];
}

- (NSString *)fullURL:(NSString*)baseUrl params:(NSDictionary*)params
{
    if (!params || params.count == 0) return baseUrl;
    
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

- (void)logServiceInfo:(BOOL)succeed httpType:(NSRequestNetworkServiceType)type fullURL:(NSString*)fullURL
{
    // 打印网络请求日志
    NSString *httpMethod = nil;
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
    NSLog(@"[%@][%@]: %@", succeed?@"succeed":@"fail", httpMethod, fullURL);
}

+ (NSMutableDictionary *)formatedicKeyAndValue:(NSDictionary *)dicKeyAndValue{
    NSMutableDictionary *parames = [NSMutableDictionary dictionaryWithDictionary:dicKeyAndValue];
    return parames;
}

+ (NSString *)formateServiceURL{
    return [NSString stringWithFormat:@"%@%@%@",K_SERVICE_HOST,K_SERVICE_PORT,K_SERVICE_PATH];
}
@end
