Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DA8C7E283
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 22:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752761AbeCBWI1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 17:08:27 -0500
Received: from sandeen.net ([63.231.237.45]:47416 "EHLO sandeen.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752403AbeCBWI1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Mar 2018 17:08:27 -0500
Received: from [10.0.0.4] (liberator [10.0.0.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by sandeen.net (Postfix) with ESMTPSA id 3246F1171D;
        Fri,  2 Mar 2018 16:07:26 -0600 (CST)
Subject: Re: [PATCH] xfs: Change URL for the project in xfs.txt
To:     Dave Chinner <david@fromorbit.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Masanari Iida <standby24x7@gmail.com>, linux-xfs@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
References: <20180302133013.9744-1-standby24x7@gmail.com>
 <20180302172401.GT19312@magnolia> <20180302215731.GT30854@dastard>
From:   Eric Sandeen <sandeen@sandeen.net>
Message-ID: <27d9f522-fa75-6766-3ca6-79f99522e861@sandeen.net>
Date:   Fri, 2 Mar 2018 16:08:24 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180302215731.GT30854@dastard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/2/18 3:57 PM, Dave Chinner wrote:
> On Fri, Mar 02, 2018 at 09:24:01AM -0800, Darrick J. Wong wrote:
>> On Fri, Mar 02, 2018 at 10:30:13PM +0900, Masanari Iida wrote:
>>> The oss.sgi.com doesn't exist any more.
>>> Change it to current project URL, https://xfs.wiki.kernel.org/
>>>
>>> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
>>> ---
>>>  Documentation/filesystems/xfs.txt | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/filesystems/xfs.txt b/Documentation/filesystems/xfs.txt
>>> index 3b9b5c149f32..4d9ff0a7f8e1 100644
>>> --- a/Documentation/filesystems/xfs.txt
>>> +++ b/Documentation/filesystems/xfs.txt
>>> @@ -9,7 +9,7 @@ variable block sizes, is extent based, and makes extensive use of
>>>  Btrees (directories, extents, free space) to aid both performance
>>>  and scalability.
>>>  
>>> -Refer to the documentation at http://oss.sgi.com/projects/xfs/
>>> +Refer to the documentation at https://xfs.wiki.kernel.org/
> 
> Did I miss a memo?

About which part, the loss of oss.sgi or the addition of the kernel.org wiki?

The kernel.org wiki is pretty bare though.  OTOH xfs.org is a bit less
official.  We really need to resolve this issue.

-Eric

> Cheers,
> 
> Dave.
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
