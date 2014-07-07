//
//  HighlightBgViewButton.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "HighlightBgViewButton.h"


@interface HighlightBgViewButton ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation HighlightBgViewButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)initBgView:(UIView *)bgView
{
    _bgView = bgView;
    
    if (_bgView)
    {
        _bgView.backgroundColor = RGBA(50.0f, 50.0f, 50.0f, (self.selected ? 0.3f : 0.0f));
    }else{}
}

- (void)setSelected:(BOOL)selected
{
    if (_bgView)
    {
        _bgView.backgroundColor = RGBA(50.0f, 50.0f, 50.0f, (selected ? 0.3f : 0.0f));
    }else{}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_bgView)
    {
        _bgView.backgroundColor = RGBA(50.0f, 50.0f, 50.0f, 0.3f);
    }else{}
    
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_bgView)
    {
        _bgView.backgroundColor = RGBA(50.0f, 50.0f, 50.0f, (self.selected ? 0.3f : 0.0f));
    }else{}
    
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_bgView)
    {
        _bgView.backgroundColor = RGBA(50.0f, 50.0f, 50.0f, (self.selected ? 0.3f : 0.0f));
    }else{}
    
    [super touchesCancelled:touches withEvent:event];
}
















@end
