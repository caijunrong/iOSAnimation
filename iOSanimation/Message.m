//
//  Message.m
//  RuntimeDemo
//
//  Created by Sam Lau on 7/5/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import "Message.h"
#import "MessageForwarding.h"
#import <objc/runtime.h>

@implementation Message

//- (void)sendMessage:(NSString *)word
//{
//    NSLog(@"normal way : send message = %@", word);
//}

//- (void)sendOtherMessage:(NSString *)word{
//    NSLog(@"sendOtherMessage word:%@",word);
//}

#pragma mark - Method Resolution
/// override resolveInstanceMethod or resolveClassMethod for changing sendMessage method implementation
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(sendMessage:)) {
        
        //如果是这个方法的话，重新定义一个新的方法,映射过去
        class_addMethod([self class], sel, imp_implementationWithBlock(^(id self, NSString *word) {
            NSLog(@"word = %@", word);
            //通过这种方法可以讲找不到的方法重新定义到别的方法去
            [self sendOtherMessage:word];
        }), "v@*");
    }
    return YES;
}

#pragma mark - Fast Forwarding
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if (aSelector == @selector(sendMessage:)) {
//        return [MessageForwarding new];
//    }
//    
//    return nil;
//}


#pragma mark - Normal Forwarding
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:*"];
    }
    
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    MessageForwarding *messageForwarding = [MessageForwarding new];
    
    if ([messageForwarding respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:messageForwarding];
    }
}

@end
