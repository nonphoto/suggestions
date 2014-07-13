//
//  JLSuggestionTextField.m
//  Suggestions
//
//  Created by Jonas Luebbers on 7/7/14.
//  Copyright (c) 2014 Jonas Luebbers. All rights reserved.
//

#import "JLSuggestionTextField.h"

@interface JLSuggestionTextField ()

@end

@implementation JLSuggestionTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}


- (void)textDidChange:(id)sender
{
    NSMutableArray * characters = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.text length]; i++) {
        [characters addObject:[self.text substringWithRange:NSMakeRange(i, 1)]];
    }
    NSString * query = [characters componentsJoinedByString:@".*?"];

    NSError * error = NULL;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:query options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        [self.suggestionDelegate textField:self didUpdateSuggestions:nil];
        return;
    }

    NSMutableArray * results = [[NSMutableArray alloc] init];
    [self.dataSource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSTextCheckingResult * match = [regex firstMatchInString:self.dataSource[idx] options:0 range:NSMakeRange(0, [self.dataSource[idx] length])];
        if (match) {
            NSRange range = [match range];
            NSUInteger rank = range.length;
            [results addObject:self.dataSource[idx]];
        }
    }];
    [self.suggestionDelegate textField:self didUpdateSuggestions:results];
}

- (NSString *)getSuggestion:(NSInteger)index
{
    return @"";
}
@end
