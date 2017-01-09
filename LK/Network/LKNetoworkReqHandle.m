//
//  HYWebServiceAFNRequestMethod.m
//  Ios_HYCom_Demo
//
//  Created by yixiaoshan on 16/2/2.
//  Copyright © 2016年 BourneYao. All rights reserved.
//

#import "LKNetoworkReqHandle.h"
@implementation LKNetoworkReqHandle

+ (void)requsetUrl:(NSString *)url body:(NSDictionary *)body requestType:(NSRequestNetworkServiceType)type ignoreHTML:(BOOL)ignoreHTML ignoreJSON:(BOOL)ignoreJSON success:(void (^)(id responseObject))success failure:(void(^)(NSError *error,NSDictionary *errorInfo))failure
{
    AFHTTPSessionManager *manager = [self manger];
    if (!ignoreJSON) manager.requestSerializer = [AFJSONRequestSerializer serializer];

    switch (type) {
        case GET:
            [self GETtypeWithSessionManger:manager URL:url body:body Success:success Failure:failure];
            break;
        case POST:
            [self POSTtypeWithSessionManger:manager URL:url body:body Success:success Failure:failure];
            break;
        case PUT:
            [self PUTtypeWithSessionManger:manager URL:url body:body Success:success Failure:failure];
            break;
        default:
            break;
    }
}

+ (void)uploadImagesByWebServiceURL:(NSString *)url
                             params:(NSDictionary *)params
                             images:(NSArray *)imgs
                            imgKeys:(NSArray *)keys
                            success:(void (^)(id responseObject))success
                            failure:(void(^)(NSError *error,NSDictionary *errorInfo))fail{
    
    AFHTTPSessionManager *manager = [self manger];

    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSInteger imgCount = 0;
        
        for (UIImage *img in imgs) {
            if (![img isKindOfClass:[UIImage class]]){
                imgCount++;
                continue;
            }
            UIImage *newImg = img;
            if (img.size.width > [UIScreen mainScreen].bounds.size.width)
                newImg = [self imageCompressForWidth:newImg targetWidth:[UIScreen mainScreen].bounds.size.height];
            NSData *imageData = UIImagePNGRepresentation(newImg);
            NSString *fileName = [NSString stringWithFormat:@"%@%@.png",[self date],@(imgCount)];
            [formData appendPartWithFileData:imageData name:keys[imgCount] fileName:fileName mimeType:@"image/png"];
            imgCount++;
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"code"] isEqualToString:K_SERVICE_SUCCESS]) {
            [self successHandle:responseObject success:success fail:fail];
        }else{
            [self failHandle:responseObject fail:fail];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:K_SERVICE_RESPONSE_ERROR];
    }];
}

/**
 *  停止加载网络数据
 */

+ (void)cancelAllServiceOperations{
    [[AFHTTPSessionManager manager].operationQueue cancelAllOperations];
}

+ (AFHTTPSessionManager *)manger{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 60;
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    manager.responseSerializer = response;
    return manager;
}

+ (void)GETtypeWithSessionManger:(AFHTTPSessionManager *)manger URL:(NSString *)url body:(id)body Success:(void (^)(id response))success Failure:(void(^)(NSError *error,NSDictionary *errorInfo))failure{
    [manger GET:url parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self successHandle:responseObject success:success fail:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failHandle:error fail:failure];
    }];
}

+ (void)POSTtypeWithSessionManger:(AFHTTPSessionManager *)manger URL:(NSString *)url body:(id)body Success:(void (^)(id response))success Failure:(void(^)(NSError *error,NSDictionary *errorInfo))failure{
    [manger POST:url parameters:body progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self successHandle:responseObject success:success fail:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failHandle:error fail:failure];
    }];
}

+ (void)PUTtypeWithSessionManger:(AFHTTPSessionManager *)manger URL:(NSString *)url body:(id)body Success:(void (^)(id response))success Failure:(void(^)(NSError *error,NSDictionary *errorInfo))failure{
    [manger PUT:url parameters:body success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self successHandle:responseObject success:success fail:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failHandle:error fail:failure];
    }];
}

#pragma mark -
#pragma mark 图片压缩
+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth,  targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (void)successHandle:(id)responseObject success:(void (^)(id responseObject))webServiceSuccess fail:(void(^)(NSError *error,NSDictionary *errorInfo))webServiceFailure{
    NSString *reponseStatus = responseObject[@"code"];
    if (webServiceSuccess && [reponseStatus isEqualToString:K_SERVICE_SUCCESS]){
        webServiceSuccess(responseObject);
        return;};
    if ([reponseStatus isEqualToString:K_SERVICE_INVAILD])
        [[NSNotificationCenter defaultCenter] postNotificationName:@"" object:nil];
    if (webServiceFailure)
        webServiceFailure(nil,responseObject);
}

+ (void)failHandle:(NSError *)error fail:(void(^)(NSError *error,NSDictionary *errorInfo))webServiceFailure{
    if (webServiceFailure)webServiceFailure(error,nil);
}

+ (NSString *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmssSSS";
    return [formatter stringFromDate:[NSDate date]];
}

#pragma mark -
#pragma mark 处理json格式的字符串中的换行符、回车符
- (NSString *)deleteSpecialCodeWithStr:(NSString *)str {
    NSString *string = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"(" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@")" withString:@""];
    return string;
}

@end
