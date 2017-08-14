//
//  ViewController.m
//  iPhone Images PhoneImages
//
//  Created by Hirad on 2017-08-14.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property NSIndexPath *rand;
@property (strong, nonatomic) NSArray *urls;
@property int rand;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url1 = [NSURL URLWithString:@"http://imgur.com/bktnImE.png"];
    NSURL *url2 = [NSURL URLWithString:@"http://imgur.com/zdwdenZ.png"];
    NSURL *url3 = [NSURL URLWithString:@"http://imgur.com/CoQ8aNl.png"];
    NSURL *url4 = [NSURL URLWithString:@"http://imgur.com/2vQtZBb.png"];
    NSURL *url5 = [NSURL URLWithString:@"http://imgur.com/y9MIaCS.png"];
    self.urls = [NSArray arrayWithObjects:url1,url2, url3,url4,url5, nil];
    
    

//    NSURL *url = self.urls[self.rand];
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:config];
//    NSURLSessionDownloadTask *newTask = [mySession downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error) {
//            
//            NSLog(@"%@",error.localizedDescription);
//        }
//        
//        NSData *myData = [NSData dataWithContentsOfURL:location];
//        UIImage *newImage = [UIImage imageWithData:myData];
////        self.iPhoneImageView.image = newImage;
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.iPhoneImageView.image = newImage;
//        }];
//    }];
//    
//    [newTask resume];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)random:(id)sender {
    
    [self randomInt];
    [self setImage:self.rand];
}

- (int) randomInt {
    
    self.rand = arc4random_uniform(5);
    NSLog(@"%i this is the number", self.rand);
    return self.rand;



};

- (void) setImage: (int) loadImage {
    
    NSURL *url = self.urls[loadImage];
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


@end
