//
//  ViewController.m
//  FirstApp
//
//  Created by Leonardo Talero on 7/20/15.
//  Copyright (c) 2015 unir. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *prima_url=[NSURL URLWithString:
                      @"http://www.eleconomista.es/prima-riesgo/espana"                       ];
    NSURLRequest *request =[NSURLRequest requestWithURL:prima_url cachePolicy:0 timeoutInterval:5.0];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *page_content=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
    NSRegularExpression *regex=[NSRegularExpression regularExpressionWithPattern:@"\\| (\\d{3},\\d{2})" options:0 error:NULL];
    NSTextCheckingResult *match=[regex firstMatchInString:page_content options:0 range:NSMakeRange(0, [page_content length])];
    NSString *primastring=[page_content substringWithRange:[match rangeAtIndex:1]];
    self.primaLabel.text=primastring;
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
