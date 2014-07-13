//
//  ViewController.m
//  Suggestions
//
//  Created by Jonas Luebbers on 7/7/14.
//  Copyright (c) 2014 Jonas Luebbers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) JLSuggestionGenerator * generator;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString * testString = @"aaa cornelius guntis noxious simon academia couscous hacker nutrition simple aerobics creation hamlet nyquist singer airplane creosote handily oceanography single albany cretin happening ocelot smile albatross daemon harmony olivetti smiles albert dancer harold olivia smooch alex daniel harvey oracle smother alexander danny hebrides orca snatch algebra dave heinlein orwell snoopy aliases december hello osiris soap alphabet defoe help outlaw socrates ama deluge herbert oxford sossina amorphous desperate hiawatha pacific sparrows analog develop hibernia painless spit anchor dieter honey pakistan spring andromache digital horse pam springer animals discovery horus papers squires answer disney hutchins password strangle anthropogenic dog imbroglio patricia stratford anvils drought imperial penguin stuttgart anything duncan include peoria subway aria eager ingres percolate success ariadne easier inna persimmon summer arrow edges innocuous persona super arthur edinburgh irishman pete superstage athena edwin isis peter support atmosphere edwina japan philip supported aztecs egghead jessica phoenix surfer azure eiderdown jester pierre suzanne bacchus eileen jixian pizza swearer bailey einstein johnny plover symmetry banana elephant joseph plymouth tangerine bananas elizabeth joshua polynomial tape bandit ellen judith pondering target banks emerald juggle pork tarragon barber engine julia poster taylor baritone engineer kathleen praise telephone bass enterprise kermit precious temptation bassoon enzyme kernel prelude thailand batman ersatz kirkland prince tiger beater establish knight princeton toggle beauty estate ladle protect tomato beethoven euclid lambda protozoa topography beloved evelyn lamination pumpkin tortoise benz extension larkin puneet toyota beowulf fairway larry puppet trails berkeley felicia lazarus rabbit trivial berliner fender lebesgue rachmaninoff trombone beryl fermat lee rainbow tubas beverly fidelity leland raindrop tuttle bicameral finite leroy raleigh umesh bob fishers lewis random unhappy brenda flakes light rascal unicorn brian float lisa really unknown bridget flower louis rebecca urchin broadway flowers lynne remote utility bumbling foolproof macintosh rick vasant burgess football mack ripple vertigo campanile foresight maggot robotics vicky cantor format magic rochester village cardinal forsythe malcolm rolex virginia carmen fourier mark romano warren carolina fred markus ronald water caroline friend marty rosebud weenie cascades frighten marvin rosemary whatnot castle fun master roses whiting cat fungible maurice ruben whitney cayuga gabriel mellon rules will celtics gardner merlin ruth william cerulean garfield mets sal williamsburg change gauss michael saxon willie charles george michelle scamper winston charming gertrude mike scheme wisconsin charon ginger minimum scott wizard chester glacier minsky scotty wombat cigar gnu moguls secret woodwind classic golfer moose sensor wormwood clusters gorgeous morley serenity yaco coffee gorges mozart sharks yang coke gosling nancy sharon yellowstone collins gouge napoleon sheffield yosemite commrades graham nepenthe sheldon zap computer gryphon ness shiva zimmerman condo guest network shivers cookie guitar newton shuttle cooper gumption next signature";

    NSArray * testData = [testString componentsSeparatedByString:@" "];

    self.outputTextView.text = @"";

    self.generator = [[JLSuggestionGenerator alloc] init];
    self.generator.data = testData;

    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChange:(id)sender
{
    NSArray * suggestions = [self.generator generateSuggestionsForString:self.textField.text];
    self.outputTextView.text = [suggestions componentsJoinedByString:@"\n"];
}

@end
