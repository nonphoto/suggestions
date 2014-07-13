//
//  ViewController.h
//  Suggestions
//
//  Created by Jonas Luebbers on 7/7/14.
//  Copyright (c) 2014 Jonas Luebbers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLSuggestionGenerator.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *outputTextView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
