//
//  ViewController.m
//  NavigationTitleDemo
//
//  Created by Abhishek on 13/11/14.
//  Copyright (c) 2014 Abhishek Sheth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavigationBar];
    [self showFirstView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setNavigationBar {
    [self setUpTwoLineNavigationTitle];
    NSString *titleString = @"Title";
    NSString *subTitlteString = @"Subtitle";
    [self setHeaderTitle:titleString andSubtitle:subTitlteString];
}

-(void)setUpTwoLineNavigationTitle {
    CGFloat width = 0.95 * self.view.frame.size.width;
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
    contentView.backgroundColor = [UIColor clearColor];
    
    CGRect titleRect = contentView.frame;
    titleRect.origin.y = 4;
    titleRect.size.height = 20;
    
    UILabel *titleView = [[UILabel alloc] initWithFrame:titleRect];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont systemFontOfSize:14.0];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.textColor = [UIColor blackColor];
    titleView.text = @"";
    [contentView addSubview:titleView];
    
    CGRect subTitleRect = contentView.frame;
    subTitleRect.origin.y = 24;
    subTitleRect.size.height = subTitleRect.size.height - 24;
    //CGRect subtitleFrame = CGRectMake(0, 24, 220, 44-24);
    UILabel *subtitleView = [[UILabel alloc] initWithFrame:subTitleRect];
    subtitleView.backgroundColor = [UIColor clearColor];
    subtitleView.font = [UIFont systemFontOfSize:11.0];
    subtitleView.textAlignment = NSTextAlignmentCenter;
    subtitleView.textColor = [UIColor blackColor];
    subtitleView.text = @"";
    [contentView addSubview:subtitleView];
    
    contentView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.navigationItem.titleView = contentView;
}

-(void)setHeaderTitle:(NSString*)headerTitle andSubtitle:(NSString*)headerSubtitle {
    assert(self.navigationItem.titleView != nil);
    UIView* headerTitleSubtitleView = self.navigationItem.titleView;
    UILabel* titleView = [headerTitleSubtitleView.subviews objectAtIndex:0];
    UILabel* subtitleView = [headerTitleSubtitleView.subviews objectAtIndex:1];
    assert((titleView != nil) && (subtitleView != nil) && ([titleView isKindOfClass:[UILabel class]]) && ([subtitleView isKindOfClass:[UILabel class]]));
    titleView.text = headerTitle;
    subtitleView.text = headerSubtitle;
}

- (void)showFirstView {
    UIViewController *firstViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
    [self addChildViewControllerContainment:firstViewController toView:_containerView];
}

- (void)addChildViewControllerContainment:(UIViewController *)childController toView:(UIView *)view
{
    if (childController.parentViewController == self && childController.view.superview == view)
        return;
    
    [self addChildViewController:childController];
    [view addSubview:childController.view];
    childController.view.frame = view.bounds;
    [childController didMoveToParentViewController:self];
}

@end
