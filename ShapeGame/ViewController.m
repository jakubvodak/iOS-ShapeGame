//
//  ViewController.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/25/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "ViewController.h"
#import "CarStore.h"

@interface ViewController ()

@property (nonatomic, retain) UIView *bottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    [arr addObject:@"a"];
    
    CarStore *superStore = [[CarStore alloc] init];
    
    [superStore setInventory:arr];
    
    [arr release];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    
    
    NSLog(@"%@", superStore.inventory);
    [superStore release];
   
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 50, 80)];
    
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _bottomView.backgroundColor = [UIColor greenColor];
    _bottomView.tag = 1;
    [_bottomView addGestureRecognizer:tapRecognizer];
    
    [self.view addSubview:_bottomView];
}

- (void)dealloc
{
    [super dealloc];
    
    [_bottomView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSLog(@"memory warning");
}


- (IBAction)click:(id)sender
{
    NSLog(@"aaaa");
    
    UIView *view = [self.view viewWithTag:1];
    
    [view removeFromSuperview];

}

@end
