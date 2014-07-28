//
//  SecondTabViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/22.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "SecondTabViewController.h"
#import "FastAnimationWithPop.h"
#import <POP.h>
#import "UIButton+SpringTouch.h"

@interface SecondTabViewController ()

@property (nonatomic, weak) IBOutlet UIButton *animationBtn;
@property (nonatomic, weak) IBOutlet UIView *animationView;
@property (nonatomic, weak) IBOutlet UIView *popView;
@property (nonatomic, weak) IBOutlet UIButton *springWithPOPBtn;


@end

@implementation SecondTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.springWithPOPBtn initSpringTouch];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAnimationBtn:(id)sender
{
    
//    self.animationView.animationType = @"Shake";
//    self.animationView.animationParams[@"velocity"] = @-1000;
//    // You can also set params like this
//    // [view setValue:@-7000 forKeyPath:kShakeVelocity];
//    [self.animationView startFAAnimation];

    
    
    
//    // 1. Pick a Kind Of Animation //  POPBasicAnimation  POPSpringAnimation POPDecayAnimation
//    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
//    
//    // 2. Decide weather you will animate a view property or layer property, Lets pick a View Property and pick kPOPViewFrame
//    // View Properties - kPOPViewAlpha kPOPViewBackgroundColor kPOPViewBounds kPOPViewCenter kPOPViewFrame kPOPViewScaleXY kPOPViewSize
//    // Layer Properties - kPOPLayerBackgroundColor kPOPLayerBounds kPOPLayerScaleXY kPOPLayerSize kPOPLayerOpacity kPOPLayerPosition kPOPLayerPositionX kPOPLayerPositionY kPOPLayerRotation kPOPLayerBackgroundColor
//    basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
//    
//    // 3. Figure Out which of 3 ways to set toValue
//    //  anim.toValue = @(1.0);
//    //  anim.toValue =  [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)];
//    //  anim.toValue =  [NSValue valueWithCGSize:CGSizeMake(40, 40)];
//    basicAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(100, 320, 200, 150)];
//    
//    basicAnimation.springBounciness=14;    // value between 0-20 default at 4
//    basicAnimation.springSpeed=2;
//    
//    // 4. Create Name For Animation & Set Delegate
////    basicAnimation.name=@"AnyAnimationNameYouWant";
////    basicAnimation.delegate=self;
//    
//    // 5. Add animation to View or Layer, we picked View so self.tableView and not layer which would have been self.tableView.layer
//    [self.popView pop_addAnimation:basicAnimation forKey:@"animationWithPOP"];
   
    
    
//    NSInteger height = CGRectGetHeight(self.view.bounds);
//    NSInteger width = CGRectGetWidth(self.view.bounds);
//    
//    CGFloat centerX = arc4random() % width;
//    CGFloat centerY = arc4random() % height;
//    
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
//    
//    anim.springBounciness=10;    // value between 0-20 default at 4
//    anim.springSpeed=6;
//    
//    [self.popView pop_addAnimation:anim forKey:@"animationWithPOP"];
    
    static int sTimes = 0;
    sTimes++;
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    basicAnimation.property = [POPAnimatableProperty propertyWithName: kPOPLayerRotation];
    basicAnimation.toValue= @(sTimes * M_PI/4); //2 M_PI is an entire rotation
    
//    basicAnimation.springBounciness=10;    // value between 0-20 default at 4
//    basicAnimation.springSpeed=6;
    
    [self.popView.layer pop_addAnimation:basicAnimation forKey:@"animationWithPOP"];
}





































@end
