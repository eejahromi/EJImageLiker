//
//  ViewController.m
//  EJImageLiker
//
//  Created by Ehsan Jahromi on 10/18/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "ImgLiker.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ImgLiker *liker = [[ImgLiker alloc]initWithFrame:CGRectMake(100,200, 200, 200) andImage:[UIImage imageNamed:@"fall"]];
    [self.view addSubview:liker];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

