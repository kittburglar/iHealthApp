//
//  AllDefine.h
//  OpenAPIDemo
//
//  Created by my on 24/7/13.
//
//

#import <Foundation/Foundation.h>
#define kAdURLSchemePrefix              @"Ad_"

#define kAdKeychainServiceNameSuffix    @"_AndonServiceName"
#define kAdKeychainAccessToken          @"AndonAccessToken"
#define kAdKeychainExpireTime           @"AndonExpireTime"
#define kAdKeychainRefreshtoken         @"AndonRefreshtoken"
#define kAdKeychainAPIName              @"AndonAPIName"
#define kAdKeychainUserID               @"AndonUserID"

 //sandbox
 #define kAuthURL @"http://sandboxapi.ihealthlabs.com/OpenApiV2/OAuthv2/userauthorization/"
 #define kBaseInfoURL @"http://sandboxapi.ihealthlabs.com/openapiv2/user/"
 


//使用者需要更改的。使用时，到网站申请应用，换成应用的SC,SV
#define mysc @"a3641c454a3d4feaafe8a192759060c0"
#define myweightsv @"aaac41ec4bb3492892d0651ba04f8395"
#define mybpsv @"57219bf03a47464aa7580fdb5d1f0dce"
#define myOXSV @"3c9a494a58b042879696e2f9806855f6"
#define myBGSV @"9d2ba22ffa93433ab444bb05f6d5110d"
#define mySleepSV @"d6fe3827a5a646b3ba7df928329b4d4a"
#define myActivitySV @"7e8e41ba8fcf40d4b09f9b6d5988a24a"
//#define myredirect_uri @"http://www.ihealthlabs.com"
#define myredirect_uri @"http://www.test.com"
//使用者需要更改的


#define BPResult @"BPResult"
#define WeightResult @"WeightResult"
#define OXResult @"OXResult"
#define BGResult @"BGResult"
#define SleepResult @"SleepResult"
#define ActivityResult @"ActivityResult"




@interface AllDefine : NSObject

@end
