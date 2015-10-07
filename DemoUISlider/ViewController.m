//
//  ViewController.m
//  DemoUISlider
//
//  Created by TienVV on 10/7/15.
//  Copyright (c) 2015 TienVV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *sliderMain;
@property (weak, nonatomic) IBOutlet UISlider *sliderTransform;
@property (weak, nonatomic) IBOutlet UILabel *lbTransform;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segThumbColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segTintColor;

@end

@implementation ViewController
{
    NSTimer* timer;
    UIColor* defaultThumbColor;
    UIColor* defaultTintColor;
    float valueSlider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Get default color
    defaultThumbColor = _sliderMain.thumbTintColor;
    defaultTintColor = _sliderMain.tintColor;
    // Initiate default status
    valueSlider = 0.0;
    _sliderTransform.value = 0;
    _lbTransform.text = [NSString stringWithFormat:@"Transform: %d", (int) _sliderTransform.value];
    
    // Start timer change value of slider
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (IBAction)onValueChangedSliderTransform:(id)sender {
    _sliderMain.transform = CGAffineTransformMakeRotation(_sliderTransform.value * M_PI / 180.0);
    _lbTransform.text = [NSString stringWithFormat:@"Transform: %d", (int) _sliderTransform.value];
}

- (IBAction)onSelectedThumbColor:(id)sender {
    switch (_segThumbColor.selectedSegmentIndex) {
        case 0:
            _sliderMain.thumbTintColor = defaultThumbColor;
            break;
        case 1:
            _sliderMain.thumbTintColor = [UIColor redColor];
            break;
        case 2:
            _sliderMain.thumbTintColor = [UIColor greenColor];
            break;
        case 3:
            _sliderMain.thumbTintColor = [UIColor blueColor];
            break;
        case 4:
            _sliderMain.thumbTintColor = [UIColor yellowColor];
            break;
        default:
            break;
    }
}

- (IBAction)onSelectedTintColor:(id)sender {
    switch (_segTintColor.selectedSegmentIndex) {
        case 0:
            _sliderMain.tintColor = defaultTintColor;
            break;
        case 1:
            _sliderMain.tintColor = [UIColor redColor];
            break;
        case 2:
            _sliderMain.tintColor = [UIColor greenColor];
            break;
        case 3:
            _sliderMain.tintColor = [UIColor blueColor];
            break;
        case 4:
            _sliderMain.tintColor = [UIColor yellowColor];
            break;
        default:
            break;
    }
}

- (void) onTimer {
    valueSlider = valueSlider + 0.01;
    if (valueSlider > 1) {
        valueSlider = 0;
    }
    _sliderMain.value = valueSlider;
}

@end
