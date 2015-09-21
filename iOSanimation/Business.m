//
//  Business.m
//  iOSanimation
//  该消息的唯一参数是个NSInvocation类型的对象——该对象封装了原始的消息和消息的参数。我们可以实现forwardInvocation:方法来对不能处理的消息做一些默认的处理，也可以将消息转发给其他对象来处理，而不抛出错误。
//这里需要注意的是参数anInvocation是从哪的来的呢？其实在forwardInvocation:消息发送前，Runtime系统会向对象发送methodSignatureForSelector:消息，并取到返回的方法签名用于生成NSInvocation对象。所以我们在重写forwardInvocation:的同时也要重写methodSignatureForSelector:方法，否则会抛异常。
//当一个对象由于没有相应的方法实现而无法响应某消息时，运行时系统将通过forwardInvocation:消息通知该对象。每个对象都从NSObject类中继承了forwardInvocation:方法。然而，NSObject中的方法实现只是简单地调用了doesNotRecognizeSelector:。通过实现我们自己的forwardInvocation:方法，我们可以在该方法实现中将消息转发给其它对象。
//forwardInvocation:方法就像一个不能识别的消息的分发中心，将这些消息转发给不同接收对象。或者它也可以象一个运输站将所有的消息都发送给同一个接收对象。它可以将一个消息翻译成另外一个消息，或者简单的”吃掉“某些消息，因此没有响应也没有错误。forwardInvocation:方法也可以对不同的消息提供同样的响应，这一切都取决于方法的具体实现。该方法所提供是将不同的对象链接到消息链的能力。
//注意： forwardInvocation:方法只有在消息接收对象中无法正常响应消息时才会被调用。 所以，如果我们希望一个对象将negotiate消息转发给其它对象，则这个对象不能有negotiate方法。否则，forwardInvocation:将不可能会被调用。
//  Created by biyabi on 15/9/21.
//  Copyright (c) 2015年 caijunrong. All rights reserved.
//

#import "Business.h"
#import "My.h"
@interface Business()
@property (nonatomic, strong) My *my;
@end

@implementation Business

-(instancetype )init{
    if (self = [super init]) {
        _my = [[My alloc]init];
    }
    return self;
}

//方法1:
//处理转发方法
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    
    if (aSelector == @selector(sendNoneMethod:)) {
        NSLog(@"methodSignatureForSelector");
        signature = [_my methodSignatureForSelector:aSelector];
//        signature = [_my methodSignatureForSelector:@selector(justTestModethod:)];
    }
//    if (!signature)
//        signature = [_my methodSignatureForSelector:@selector(justTestModethod:)];
    
    return signature;
}


//方法2：直接转发消息到另一个对象
//如果此方法返回nil或self,则会进入消息转发机制(forwardInvocation:);否则将向返回的对象重新发送消息。
//-(id)forwardingTargetForSelector:(SEL)aSelector{
////    if (aSelector == @selector(sendNoneMethod:)) {
////        NSLog(@"forwardingTargetForSelector inside");
////        aSelector = @selector(justTestModethod:);
////        
////        return self.my;
////        
//////        return self.my;  //other object
////    }
//    
//    
//    if (![self respondsToSelector:aSelector]) {
//        NSLog(@"forwardingTargetForSelector inside");
//        aSelector = @selector(justTestModethod:);
//        
//        return self.my;
//    }
//    
//    
//    NSLog(@"forwardingTargetForSelector outside");
//    return [super forwardingTargetForSelector:aSelector];//nil or self;
//}

//方法1:
//处理转发对象
-(void)forwardInvocation:(NSInvocation *)anInvocation{

    SEL selector = [anInvocation selector];
    
//    if (selector == @selector(sendNoneMethod:)) {
//        NSLog(@"forwardInvocation");
//        if ([self.my respondsToSelector:@selector(sendNoneMethod:)]) {
//            [anInvocation invokeWithTarget:self.my];
//        }
//    }else if (selector == @selector(justTestModethod:)){
//        if ([self.my respondsToSelector:@selector(justTestModethod:)]) {
//            [anInvocation invokeWithTarget:self.my];
//        }
//    }else{
//        [super forwardInvocation:anInvocation];
//    }
    
    if ([self.my respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:self.my];
    }
    
    NSLog(@"--");
}

//-(void)sendNoneMethod:(NSString *)str{
//    NSLog(@"+++");
//}

-(void)foo:(NSString *)fooMethod{
    NSLog(@"foo: detail");
}


@end
