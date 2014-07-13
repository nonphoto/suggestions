//
//  JLSuggestionGenerator.m
//  Suggestions
//
//  Created by Jonas Luebbers on 7/13/14.
//  Copyright (c) 2014 Jonas Luebbers. All rights reserved.
//

#import "JLSuggestionGenerator.h"

@implementation JLSuggestionGenerator

- (NSArray *)generateSuggestionsForString:(NSString *)string
{
    NSMutableArray * results = [[NSMutableArray alloc] init];
    NSString * query = [self generateQueryForString:string];
    NSError * error = NULL;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:query options:NSRegularExpressionCaseInsensitive error:&error];
    if (!error) {
        [self.data enumerateObjectsUsingBlock:^(id obj, NSUInteger i, BOOL *stop) {
            NSTextCheckingResult * match = [regex firstMatchInString:self.data[i] options:0 range:NSMakeRange(0, [self.data[i] length])];
            if (match) {
                // NSRange range = [match range];
                // NSUInteger rank = range.length;
                [results addObject:self.data[i]];
            }
        }];
    }

    return results;
}

- (NSString *)generateQueryForString:(NSString *)string
{
    NSMutableArray * characters = [[NSMutableArray alloc] init];
    for (int i = 0; i < [string length]; i++) {
        [characters addObject:[string substringWithRange:NSMakeRange(i, 1)]];
    }
    return [characters componentsJoinedByString:@".*?"];
}


@end
