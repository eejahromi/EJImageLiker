//
//  EJImagLiker.h
//  
//
//  Created by Ehsan Jahromi on 10/17/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimationStyle) {
    AnimationStyleFade = 0,
    AnimationStyleReverseFade,
    AnimationStyleMoveToCorner,
    AnimationStyleStayOnBottom,
    AnimationStyleBlink
};

typedef NS_ENUM(NSUInteger, LikerColor) {
    LikerColorWhite = 0,
    LikerColorBlack
};

@interface ImgLiker : UIImageView

@property (nonatomic) enum AnimationStyle animationStyle;
@property (nonatomic) enum LikerColor likerImageColor;


-(instancetype)initWithFrame:(CGRect)frame andImage:(UIImage *)image;

@end
