//
//  JLSuggestionTextField.h
//  Suggestions
//
//  Created by Jonas Luebbers on 7/7/14.
//  Copyright (c) 2014 Jonas Luebbers. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLSuggestionTextField;
@protocol JLSuggestionTextFieldDelegate
- (void)textField:(JLSuggestionTextField *)textField didUpdateSuggestions:(NSArray *)suggestions;
@end

@interface JLSuggestionTextField : UITextField

@property (strong, nonatomic) NSObject <JLSuggestionTextFieldDelegate> * suggestionDelegate;
@property (strong, nonatomic) NSArray * dataSource;

- (NSString *)getSuggestion:(NSInteger)index;

@end
