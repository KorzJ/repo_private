//
//  HYWebServiceAFNRequestMethod+Block.h
//  CloudBusiness
//
//  Created by ZhouX on 16/2/25.
//  Copyright © 2016年 HYcompany. All rights reserved.
//

#import "LKNetoworkReqHandle.h"
#import <AFHTTPSessionManager.h>

typedef void(^requestSuccess_block)(id reponse);
typedef void(^requestFail_block)(id reponse);

@interface LKNetoworkReqHandle (block)

/**
 统一添加请求头报文
 */
+ (NSMutableDictionary *)formatedicKeyAndValue:(NSDictionary *)dicKeyAndValue;
/**
 统一添加URL
 */
+ (NSString *)formateServiceURL;

- (void)getDictionaryByURL:(NSString *)url requestType:(NSRequestNetworkServiceType)type parameters:(NSDictionary *)parameters success:(requestSuccess_block)success failure:(requestFail_block)failure;

- (void)uploadImagesByURL:(NSString *)url parameters:(NSDictionary *)parameters images:(NSArray *)imgs imgKeys:(NSArray *)keys success:(requestSuccess_block)success failure:(requestFail_block)failure;

@end
