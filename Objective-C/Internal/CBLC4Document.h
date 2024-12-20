//
//  CBLC4Document.h
//  CouchbaseLite
//
//  Copyright (c) 2024 Couchbase, Inc All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>
#import "c4.h"

NS_ASSUME_NONNULL_BEGIN

@interface CBLC4Document : NSObject

@property (readonly, nonatomic) C4Document* rawDoc;

/** Revision flag of the selected revision. */
@property (readonly, nonatomic) C4RevisionFlags revFlags;

/** Sequence of the selected revision. */
@property (readonly, nonatomic) C4SequenceNumber sequence;

/** Document ID of the selected revision. */
@property (readonly, nonatomic) C4String docID;

/** Revision ID of the selected revision. */
@property (readonly, nonatomic) C4String revID;

/** Body of the selected revision. */
@property (readonly, nonatomic) FLDict body;

+ (instancetype) document: (C4Document*)document;

/** Not available */
- (instancetype) init NS_UNAVAILABLE;

- (instancetype) initWithRawDoc: (C4Document*)rawDoc;

@end

NS_ASSUME_NONNULL_END
