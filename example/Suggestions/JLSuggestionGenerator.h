//
//  JLSuggestionGenerator.h
//  Suggestions
//
//  Created by Jonas Luebbers on 7/13/14.
//  Copyright (c) 2014 Jonas Luebbers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLSuggestionGenerator : NSObject

@property (strong, nonatomic) NSArray * data;

- (NSArray *)generateSuggestionsForString:(NSString *)string;

@end
