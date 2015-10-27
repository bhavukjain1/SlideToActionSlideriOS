//
//  CustomSliderView.h
//  StackOverFlow
//
//  Created by Rahul Sharma on 27/10/15.
//  Copyright © 2015 Bhavuk Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSliderViewDelegate <NSObject>

-(void)sliderAction;

@end

@interface CustomSliderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *sliderImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sliderImageXConstraint;

@property(weak, nonatomic) id <CustomSliderViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *sliderTitle;
@end
