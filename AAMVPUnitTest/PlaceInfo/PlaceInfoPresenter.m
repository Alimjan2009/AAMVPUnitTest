//
//  PlaceInfoPresenter.m
//  AAMVPUnitTest
//
//  Created by Alimjan on 16/5/4.
//  Copyright © 2016年 Alimjan. All rights reserved.
//

#import "PlaceInfoPresenter.h"
#import "AFNetworking.h"

@implementation PlaceInfoPresenter


- (instancetype)initWithView:(id<PlaceInfoViewImpl>) view
{
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}
-(void)loadDate:(NSString*)placeName{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json",@"text/plain", @"text/html",@"text/json",@"text/javascript", nil];
    //2.设置登录参数
    NSDictionary *dict = @{ @"a":placeName};
    
    //3.请求
    [manager GET:@"http://gc.ditu.aliyun.com/geocoding" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *parseError = nil;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&parseError];
        
        if(_view!=nil)
            [_view showResult:[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]];
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
@end
