//
//  PlaceInfoPresenter.h
//  AAMVPUnitTest
//
//  Created by Alimjan on 16/5/4.
//  Copyright © 2016年 Alimjan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlaceInfoViewImpl
-(void)showResult:(NSString*)res;
@end

@protocol PlaceInfoPresenterImpl
-(void)loadDate:(NSString*)placeName;
@end

@interface PlaceInfoPresenter : NSObject<PlaceInfoPresenterImpl>
@property (nonatomic, strong) id<PlaceInfoViewImpl> view;

- (instancetype)initWithView:(id<PlaceInfoViewImpl>) view;
@end
