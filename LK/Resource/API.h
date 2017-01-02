//
//  API.h
//  TakeGoods
//
//  Created by KorzJ on 16/8/16.
//  Copyright © 2016年 靳鹏飞. All rights reserved.
//

#ifndef API_h
#define API_h

#ifdef DEBUG
#define K_SERVICE_PORT  @"2000/"
#else
#define K_SERVICE_PORT  @"2000/"
#endif

/**
 *  URL
 */
#ifdef DEBUG
#define K_SERVICE_HOST  @"http://114.55.74.245:"//开发IP
#else
#define K_SERVICE_HOST  @"http://120.27.198.26:"//测试IP
#endif
#define K_SERVICE_PATH  @"jiuhao-buy/"

/**
 *  RESPONSE STATUS
 *
 *  @return  0:SUCCESS
 */
#define K_RESPONSE_STATUS  0
/**
 *  服务器 返回状态 ErrCode
 */
#define K_SERVICE_SUCCESS  @"SUCCESS"//成功
#define K_SERVICE_FAIL @"FAIL"//失败
#define K_SERVICE_INVAILD @"FAIL_AUTH"// Token失效
#define K_SERVICE_ERROR @"NACK"// 系统错误 服务器默认code
#define K_SERVICE_RESPONSE_ERROR @"系统错误，请重试"// 系统错误
#define K_SERVICE_REQUEST_ERROR @"输入有误"// 参数错误
/**
 * SERVICE API
 */

#endif /* API_h */
