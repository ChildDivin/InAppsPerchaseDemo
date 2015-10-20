//
//  ViewController.h
//  InAppsPerchaseDemo
//
//  Created by Tops on 21/07/14.
//  Copyright (c) 2014 Tops. All rights reserved.
//  com.tops.audioapp.audio1 ///product id 

#import <UIKit/UIKit.h>
#import "RageIAPHelper.h"
#import <StoreKit/StoreKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *lblproductname;
    IBOutlet UILabel *lblproductDisc;
    IBOutlet UILabel *lblproductPrice;
}
-(IBAction)btnRestore:(id)sender;
-(IBAction)btnBuy:(id)sender;

@end
