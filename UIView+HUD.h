//
//  UIView+HUD.h
//  CYKJ_APP
//
//  Created by 徐继垚 on 15/12/30.
//  Copyright © 2015年 Sunny土. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>


@interface UIView (HUD) <MBProgressHUDDelegate>
- (void)showMBHud;
- (void)showMBHudText:(NSString *)text ;
- (void)removeHUD;

- (void)showAfterDelayMBHudText:(NSString *)text ;
- (void)showAfterDelayMBHudText:(NSString *)text afterDelay:(NSTimeInterval)delay delegete:(id <MBProgressHUDDelegate>)delegat;
@end
