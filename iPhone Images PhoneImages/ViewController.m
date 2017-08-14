//
//  ViewController.m
//  iPhone Images PhoneImages
//
//  Created by Hirad on 2017-08-14.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://imgur.com/CoQ8aNl.png"];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDownloadTask *newTask = [mySession downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
            NSLog(@"%@",error.localizedDescription);
        }
        
        NSData *myData = [NSData dataWithContentsOfURL:location];
        UIImage *newImage = [UIImage imageWithData:myData];
//        self.iPhoneImageView.image = newImage;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iPhoneImageView.image = newImage;
        }];
    }];
    
    [newTask resume];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
