//
//  STContainerView.m
//  STPopup
//
//  Created by Milan Mendpara on 22/11/22.
//

#import "STContainerView.h"

@implementation STContainerView
 

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.draggable = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.draggable) {
        [super touchesBegan:touches withEvent:event];
        return;
    }
    
    UITouch *touch = [touches anyObject];
    if (!_moving) {
        _moving = YES;
        _movingStartY = [touch locationInView:self.window].y;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.draggable) {
        [super touchesMoved:touches withEvent:event];
        return;
    }
    
    if (_moving) {
        UITouch *touch = [touches anyObject];
        float offset = [touch locationInView:self.window].y - _movingStartY;
        if ([self.containerDelegate respondsToSelector:@selector(popupContainerView:touchDidMoveWithOffset:)]) {
            [self.containerDelegate popupContainerView:self touchDidMoveWithOffset:offset];
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.draggable) {
        [super touchesCancelled:touches withEvent:event];
        return;
    }
    
    if (_moving) {
        UITouch *touch = [touches anyObject];
        float offset = [touch locationInView:self.window].y - _movingStartY;
        [self movingDidEndWithOffset:offset];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.draggable) {
        [super touchesEnded:touches withEvent:event];
        return;
    }
    
    if (_moving) {
        UITouch *touch = [touches anyObject];
        float offset = [touch locationInView:self.window].y - _movingStartY;
        [self movingDidEndWithOffset:offset];
    }
}

- (void)movingDidEndWithOffset:(float)offset
{
    _moving = NO;
    if ([self.containerDelegate respondsToSelector:@selector(popupContainerView:touchDidEndWithOffset:)]) {
        [self.containerDelegate popupContainerView:self touchDidEndWithOffset:offset];
    }
}
@end
