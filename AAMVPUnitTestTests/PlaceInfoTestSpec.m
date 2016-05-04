//
//  PlaceInfoTestSpec.m
//  AAMVPUnitTest
//
//  Created by Alimjan on 16/5/4.
//  Copyright 2016年 Alimjan. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "PlaceInfoViewController.h"
#import "PlaceInfoPresenter.h"
SPEC_BEGIN(PlaceInfoTestSpec)

describe(@"PlaceInfoTest", ^{
    it(@"place info presenter test", ^{
        //
        // mock the view and stub the showResult method
        id viewMock = [KWMock mockForProtocol:@protocol(PlaceInfoViewImpl)];
        [ [viewMock should] conformToProtocol:@protocol(PlaceInfoViewImpl)];
        
        [viewMock stub:@selector(showResult:) ];
        
        // init presenter
        PlaceInfoPresenter *presenter = [[PlaceInfoPresenter alloc]initWithView:viewMock];
        
        // send asnc request
        [presenter loadDate:@"北京"];
        
        //wait until the show result called
        [[viewMock shouldEventuallyBeforeTimingOutAfter(3.0)] receive:@selector(showResult:) withCount:1];
        

    });
});

SPEC_END
