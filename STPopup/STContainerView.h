//
//  STContainerView.h
//  STPopup
//
//  Created by Milan Mendpara on 22/11/22.
//

#import <UIKit/UIKit.h>

@protocol STContainerViewTouchEventDelegate <NSObject>

- (void)popupContainerView:(UIView *)navigationBar touchDidMoveWithOffset:(CGFloat)offset;
- (void)popupContainerView:(UIView *)navigationBar touchDidEndWithOffset:(CGFloat)offset;

@end

@interface STContainerView : UIView{
    BOOL _moving;
    CGFloat _movingStartY;
}

@property (nonatomic, weak) id<STContainerViewTouchEventDelegate> containerDelegate;
@property (nonatomic, assign) BOOL draggable;

@end

