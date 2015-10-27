//
//  ViewController.m
//  SlideToActionSlideriOS
//
//  Created by Rahul Sharma on 27/10/15.
//  Copyright © 2015 Bhavuk Jain. All rights reserved.
//

#import "ViewController.h"
#import "CustomSliderView.h"

@interface ViewController ()<CustomSliderViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (strong, nonatomic) CustomSliderView *customSliderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _customSliderView = [[[NSBundle mainBundle] loadNibNamed:@"NewSliderView" owner:self options:nil] lastObject];
    _customSliderView.delegate = self;
    _customSliderView.sliderTitle.text = @"Slide To Action";
    CGRect frame = _customSliderView.frame;
    frame.size.width = _sliderView.frame.size.width;
    frame.size.height = _sliderView.frame.size.height;
    _customSliderView.frame = frame;
    [_sliderView addSubview:_customSliderView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomSliderView Delegate

-(void)sliderAction {
    
   UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Alert!" message:@"Action" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [controller addAction:okAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}

@end
