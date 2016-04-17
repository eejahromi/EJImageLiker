//
//  ImgLiker.m
//  SimpleImageLiker
//
//  Created by Ehsan Jahromi on 10/17/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "EEJImageLiker.h"

@interface EEJImageLiker ()

@property (strong,nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation EEJImageLiker

-(instancetype)initWithFrame:(CGRect)frame{
    
    return [self initWithFrame:frame andImage:nil];
}

-(instancetype)initWithFrame:(CGRect)frame andImage:(UIImage *)image{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = image;
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];        
        self.tapGestureRecognizer.numberOfTapsRequired = 2;
        [self addGestureRecognizer:self.tapGestureRecognizer];
    }
    
    return self;
}



-(void)handleTap:(UITapGestureRecognizer *)sender{
    NSString *likerImageColor;

    // Color of the heart
    switch (self.likerImageColor) {
        case LikerColorWhite:
            likerImageColor = @"Favorite";
            break;
        case LikerColorBlack:
            likerImageColor = @"Favorite-black";
        default:
            break;
    }
    
    UIImageView *likePic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:likerImageColor]];
    likePic.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    
    switch (self.animationStyle) {
        case AnimationStyleFade:{
            likePic.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
            [UIView animateWithDuration:1.0 animations:^{
                likePic.transform = CGAffineTransformMakeScale(7.0, 7.0);
                likePic.alpha = 0.0;
                
            }];
            break;
        }
            
        case AnimationStyleReverseFade: {
            likePic.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
            likePic.alpha = 0.0;
            likePic.transform = CGAffineTransformMakeScale(7.0, 7.0);
            [UIView animateWithDuration:1.0 animations:^{
                likePic.transform = CGAffineTransformMakeScale(1.0, 1.0);
                likePic.alpha = 1.0;
                
            } completion:^(BOOL finished) {
                likePic.alpha = 0.0;
            }];
            break;
        }
            
        case AnimationStyleMoveToCorner:{
            likePic.alpha = 0.0;
            [UIView animateWithDuration:1.0 animations:^{
                likePic.center = CGPointMake((self.bounds.origin.x) + 20, (self.bounds.origin.y) + 20);
                likePic.transform = CGAffineTransformMakeScale(self.frame.size.width * 0.006, self.frame.size.height * 0.006);
                likePic.alpha = 1.0;
            } completion:^(BOOL finished) {
                likePic.alpha = 0.0;
            }];
            
            break;
        }
            
        case AnimationStyleStayOnBottom:{
            [UIView animateWithDuration:1.0 animations:^{
                likePic.center = CGPointMake(self.bounds.size.width / 2, (self.bounds.size.height) - 20);
                likePic.transform = CGAffineTransformMakeScale(self.frame.size.width * 0.006, self.frame.size.height * 0.006);
            } completion:^(BOOL finished) {
                likePic.alpha = 0.0;
            }];
            
            break;
        }
        
        case AnimationStyleBlink:{
            likePic.alpha = 1.0;
            likePic.transform = CGAffineTransformMakeScale(self.frame.size.width * 0.006, self.frame.size.height * 0.006);
            [UIView animateWithDuration:0.2
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse
                             animations:^{
                                 likePic.alpha = 0.0;
    
            }completion:^(BOOL finished){}];
            break;
        }
            
        default:
            break;
    }
    
    
    [self addSubview:likePic];
    
}

@end
