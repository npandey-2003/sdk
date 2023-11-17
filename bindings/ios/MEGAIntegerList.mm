/**
 * @file MEGAIntegerList.mm
 * @brief List of integers
 *
 * (c) 2017- by Mega Limited, Auckland, New Zealand
 *
 * This file is part of the MEGA SDK - Client Access Engine.
 *
 * Applications using the MEGA API must present a valid application key
 * and comply with the the rules set forth in the Terms of Service.
 *
 * The MEGA SDK is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright Simplified (2-clause) BSD License.
 *
 * You should have received a copy of the license along with this
 * program.
 */

#import "MEGAIntegerList.h"
#import "MEGAIntegerList+init.h"

using namespace mega;

@interface MEGAIntegerList ()

@property MegaIntegerList *megaIntegerList;
@property BOOL cMemoryOwn;

@end

@implementation MEGAIntegerList

- (instancetype)initWithMegaIntegerList:(mega::MegaIntegerList *)megaIntegerList cMemoryOwn:(BOOL)cMemoryOwn {
    self = [super init];

    if (self) {
        _megaIntegerList = megaIntegerList;
        _cMemoryOwn = cMemoryOwn;
    }

    return self;
}

- (void)dealloc {
    if (self.cMemoryOwn) {
        delete _megaIntegerList;
    }
}

- (mega::MegaIntegerList *)getCPtr {
    return self.megaIntegerList;
}

- (NSInteger)size {
    return self.megaIntegerList ? self.megaIntegerList->size() : 0;
}

- (int64_t)integerAtIndex:(NSInteger)index {
    return self.megaIntegerList ? self.megaIntegerList->get((int)index) : -1;
}

@end
