//
//  HYWebServiceAFNRequestMethod+Block.h
//  CloudBusiness
//
//  Created by ZhouX on 16/2/25.
//  Copyright © 2016年 HYcompany. All rights reserved.
//

#import "LKNetoworkReqHandle.h"
#import <AFHTTPSessionManager.h>

typedef void(^ServiceSuccess)(id reponse);
typedef void(^ServiceFail)(id reponse);

@interface LKNetoworkReqHandle (block)

- (void)fetchJSONByURL:(NSString *)url
                            requestType:(NSRequestNetworkServiceType)type
                            parameters:(NSDictionary *)parameters
                            success:(ServiceSuccess)success
                            failure:(ServiceFail)failure;

- (void)uploadImagesByURL:(NSString *)url
                            parameters:(NSDictionary *)parameters
                            images:(NSArray *)imgs
                            imgKeys:(NSArray *)keys
                            success:(ServiceSuccess)success
                            failure:(ServiceFail)failure;

/**
 *头报文
 */
+ (NSMutableDictionary *)formatedicKeyAndValue:(NSDictionary *)dicKeyAndValue;
/**
 *URL
 */
+ (NSString *)formateServiceURL:(NSString *)path;
@end
