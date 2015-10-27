//
//  CustomSliderView.m
//  StackOverFlow
//
//  Created by Rahul Sharma on 27/10/15.
//  Copyright © 2015 Bhavuk Jain. All rights reserved.
//

#import "CustomSliderView.h"

@implementation CustomSliderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

float oldX, oldY;
BOOL dragging;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    if (CGRectContainsPoint(_sliderImage.frame, touchLocation)) {
        
        dragging = YES;
        oldX = touchLocation.x;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    if (dragging) {
        
        _sliderImageXConstraint.constant = _sliderImageXConstraint.constant + touchLocation.x - oldX;
        
        if (_sliderImageXConstraint.constant < 0) {
            _sliderImageXConstraint.constant = 0;
        }
        
        if (_sliderImageXConstraint.constant + _sliderImage.frame.size.width > self.frame.size.width) {
            
            _sliderImageXConstraint.constant = self.frame.size.width - _sliderImage.frame.size.width;
        }
    }
    
    oldX = touchLocation.x;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (_sliderImageXConstraint.constant == self.frame.size.width - _sliderImage.frame.size.width) {
        if (_delegate && [_delegate respondsToSelector:@selector(sliderAction)]) {
            [_delegate sliderAction];
        }

    }
        [UIView animateWithDuration:0.5 animations:^{
            _sliderImageXConstraint.constant = 0;
            
            [self layoutIfNeeded];
            
        }];
    dragging = NO;
}

@end
