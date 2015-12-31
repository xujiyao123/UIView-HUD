//
//  UIView+HUD.m
//  CYKJ_APP
//
//  Created by 徐继垚 on 15/12/30.
//  Copyright © 2015年 Sunny土. All rights reserved.
//

#import "UIView+HUD.h"


static char HUDKEY;

@implementation UIView (HUD) 
- (void)showMBHud {
    [self showMBHudText:nil];
}
- (void)showMBHudText:(NSString *)text {
    
    MBProgressHUD * hud = [[MBProgressHUD alloc] initWithView:self];
    if (text) {
        hud.labelText = text;
    }
    objc_setAssociatedObject(self, &HUDKEY, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addSubview:hud];
    [hud show:YES];
    
}
- (void)removeHUD {
    
    MBProgressHUD * hud = (MBProgressHUD *)objc_getAssociatedObject(self, &HUDKEY);
    
    [hud removeFromSuperview];
    
}
- (void)showAfterDelayMBHudText:(NSString *)text  {
    
    [self showAfterDelayMBHudText:text afterDelay:0.8 delegete:self];
}
- (void)showAfterDelayMBHudText:(NSString *)text afterDelay:(NSTimeInterval)delay delegete:(id <MBProgressHUDDelegate>)delegate{
    
    
    MBProgressHUD * hud = [[MBProgressHUD alloc] init];
    hud.yOffset = -90;
    hud.cornerRadius = 0;
    hud.delegate = delegate;
    [self addSubview:hud];
    
    UILabel * custom = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 190, 80)];
    custom.text = text;
    custom.font = [UIFont systemFontOfSize:20];
    custom.textColor = [UIColor whiteColor];
    custom.textAlignment = NSTextAlignmentCenter;
    hud.customView = custom;
    hud.color = UIColorFromRGB(0x000000);
    hud.opacity = 0.8;
    hud.cornerRadius = 3;
    hud.mode = MBProgressHUDModeCustomView;
    [hud show:YES];
    [hud hide:YES afterDelay:delay];
    
}
- (void)hudWasHidden:(MBProgressHUD *)hud {
    
    [hud removeFromSuperview];
    
}
@end
