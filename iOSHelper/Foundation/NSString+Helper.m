//
//  NSString+Helper.m
//  iOSHelper
//
//  Created by Aigo on 14-7-24.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSString+Helper.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSNumber+Helper.h"

@implementation NSString (Helper)
- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (BOOL)isNotBlank{
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)equals:(NSString *)str{
    return [self compare:str] == NSOrderedSame;
}

- (CGFloat)heightByFont:(UIFont *)font width:(CGFloat)width{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                              options:NSStringDrawingTruncatesLastVisibleLine
                           attributes:attributes
                              context:nil].size.height;
}

- (NSString *)stringByURLEncode{
    NSString *encoded = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes( NULL,
                                                                                              (__bridge CFStringRef)self,
                                                                                              NULL,
                                                                                              CFSTR("!#$&'()*+,/:;=?@[]"),
                                                                                              kCFStringEncodingUTF8);
    return encoded;
}
- (NSString *)stringByURLDecode{
    CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(kCFStringEncodingUTF8);
    NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                        withString:@" "];
    decoded = (__bridge_transfer NSString *)
    CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                            (__bridge CFStringRef)decoded,
                                                            CFSTR(""),
                                                            en);
    return decoded;
}

- (NSInteger)TextLength{
    float number = 0.0;
    for (int index = 0; index < [self length]; index++){
        NSString *character = [self substringWithRange:NSMakeRange(index, 1)];
        
        if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3){
            number++;
        }else{
            number = number + 0.5;
        }
    }
    return ceil(number);
}

- (NSNumber*)numberValue{
    return [NSNumber numberWithString:self];
}


- (NSData *)dataValue{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end
