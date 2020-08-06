#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface PIUITextFieldDelegate : NSObject <UITextViewDelegate>

- (instancetype)initWithChannel:(FlutterMethodChannel*)channel arguments:(id _Nullable)args;

@end

NS_ASSUME_NONNULL_END
