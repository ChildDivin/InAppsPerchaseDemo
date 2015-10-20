//
//  ViewController.m
//  InAppsPerchaseDemo
//
//  Created by Tops on 21/07/14.
//  Copyright (c) 2014 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_products;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:IAPHelperProductPurchasedNotification object:nil];
    
    [self reload];
    
}
-(IBAction)btnRestore:(id)sender
{
    [[RageIAPHelper sharedInstance] restoreCompletedTransactions];
}
-(IBAction)btnBuy:(id)sender
{
    //UIButton *buyButton = (UIButton *)sender;
    if (!_products.count==0)
    {
        SKProduct *product = _products[1];
        
        NSLog(@"Buying %@...", product.productIdentifier);
        [[RageIAPHelper sharedInstance] buyProduct:product];
    }
    
    
}
- (void)reload {
    _products = nil;
   [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success)
        {
            _products = products;
            SKProduct * product = (SKProduct *) _products[1];
            lblproductname.text = product.localizedTitle;
            lblproductPrice.text = [NSString stringWithFormat:@"%@",product.price];
        }
   }];
}
- (void)productPurchased:(NSNotification *)notification {
    
    NSString * productIdentifier = notification.object;
    NSLog(@"completeTransaction...Thanks for perchase ");
    
}

//- (BOOL)productPurchased:(NSString *)productIdentifier
//{
//    return [_purchasedProductIdentifiers containsObject:productIdentifier];
//}
- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
