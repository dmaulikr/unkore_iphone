//
//  iAdLayer.m
//  nakajima
//
//  Created by Nakajima Daichi on 12/12/06.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "iAdLayer.h"


@implementation iAdLayer

@synthesize bannerView;

+(iAdLayer *)sharedInstance{
    static iAdLayer *sharedHelper;
    
    if(!sharedHelper){
        sharedHelper = [[self alloc] init];
    }
    return sharedHelper;
}

-(void) createAdView{
    static NSString * const kADBannerViewClass = @"ADBannerView";
    
    if (NSClassFromString(kADBannerViewClass)!= nil) {
        self.bannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        [self.bannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait, nil]];
        self.bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
        [self.bannerView setDelegate: (id)self];

        [navControllers.view addSubview:self.bannerView];
        [self moveBannerOffScreen];
    }
}
// バナーの呼び出しに成功した場合、moveBannerOnScreenへ移動する
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    [self moveBannerOnScreen];
}

// 完全にロードされたらまずはじめに画面に呼び出される
-(void) moveBannerOffScreen{
    CGSize windowsize = [[CCDirector sharedDirector] winSize];
    //#warning the size of the ads needs to be used according iphone or ipad windowのサイズで変更される
    [self.bannerView bringSubviewToFront:bannerView];

    //bannerView.frame = CGRectMake(0.0, windowsize.height - 50, bannerView.frame.size.width, bannerView.frame.size.height);
    bannerView.frame = CGRectMake(0.0, windowsize.height - 88, bannerView.frame.size.width, 88);
    //NSLog(@"bannerがスクリーンに表示される");
}

// スクリーンに表示される
-(void) moveBannerOnScreen{
    [UIView beginAnimations:@"BannerViewIntro" context:NULL];
    //NSLog(@"bannerがスクリーンに表示されます２");
}

// ユーザーがバナーをおしたときに起動される
-(BOOL) bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    //NSLog(@"banner全画面で表示されます");
    return YES;
}

// バナーを閉じた後、画面はポーズされていて、それがまた動き出す
-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    // NSLog(@"iAd banner is closed");
}

// バナーをロードできなかったら、バナーをスクリーンから非表示にする必要がある（appleが必要としている）
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    // NSLog(@"banner got error");
    [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
    [self moveBannerOffScreen];
}

@end
