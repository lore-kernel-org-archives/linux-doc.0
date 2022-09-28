Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC63C32771
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 19:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbiI1ThG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 15:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbiI1ThF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 15:37:05 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE002A40A
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 12:37:04 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id 64so2421490iov.13
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=w+64nBC9flQuRlvFf/LyNi8vAIoeFZlmjiGW7/Cl9GA=;
        b=W1oLTSde5Qwb++pbSaUe4lWBe586C2QHURCizljXgg5WUYP5/EWw76ThSDAmN8HdLN
         1bn2X8u17DOL6ZgiSEAOjjzoUl0ujoEeqIqAEMA3x4+hZclF9cxqSuvfrOm66gTJvflh
         A92GVUKk1qjCxsntZgVqbe2oBEeMo3tqY1nO/yRnkJRglartg9jnsTgHrlNRscXIikWy
         n2UW5230gSIvPlWMoDgw2rolIttjNi28MVW1qEFn6Ed0Q+1wPFYGc245TNoRKM4VXfHL
         rQZOyeQfp22g8RGWrVUD5FqoZ4l+WHWCEaG5YRAVet6EKIz5JM1019yWewHiNCSt3tYp
         9DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=w+64nBC9flQuRlvFf/LyNi8vAIoeFZlmjiGW7/Cl9GA=;
        b=sRYvJSaWwrftN+S05J3SUxqwY6+/JneVEikjBlOnULYTpHy5C09cIaGiDAaH+4klpN
         ziYDEyUjSCEUWU2dvGAHJnU42zw4j+AsSmVSTdM4x63lfqCHrVee8/S/9G3ilBGQaJco
         2uCpEwyDs0GoRDwxU1M3AuK4L0Mr8wL6hOjoAZzxDsyn8z2dmwYBqe2XUmzzeWEF79bi
         Sa8HVO0z5Ek5Cyy5Y1TYVKhlpElr+UCJAYGjW7Hiemb6edQUH5OJzIlwbPKkbgnBkGB+
         x/MlrX28Wb3bNj2mSyIeJQzlyAE3AE4hcGP9//vqF282qkm/xDYjsDkwHj4TazV+xgAC
         nCKA==
X-Gm-Message-State: ACrzQf0X7iTJg5OwQJR5JB9VRvYCFeoNpdDlHuPiSlQdxWwgew+DorHo
        oPfx+Lcrv7qQeCEuq/QmoTQoqw==
X-Google-Smtp-Source: AMsMyM4pvj/63KDkjqfOHv+ZDuiHOFQWJwmRPDGjn/J9jBlb8WWfq0hCxV1lxPeDvR8N5J4PM3KGgA==
X-Received: by 2002:a02:c6d4:0:b0:35a:4ea3:4890 with SMTP id r20-20020a02c6d4000000b0035a4ea34890mr1234303jan.215.1664393823556;
        Wed, 28 Sep 2022 12:37:03 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:e132:6c29:fb2a:a1b])
        by smtp.gmail.com with ESMTPSA id z25-20020a6be019000000b006814fd71117sm2283016iog.12.2022.09.28.12.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 12:37:03 -0700 (PDT)
Date:   Wed, 28 Sep 2022 13:36:58 -0600
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        Holger =?iso-8859-1?Q?Hoffst=E4tte?= 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH mm-unstable v15 08/14] mm: multi-gen LRU: support page
 table walks
Message-ID: <YzSiWq9UEER5LKup@google.com>
References: <20220918080010.2920238-1-yuzhao@google.com>
 <20220918080010.2920238-9-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918080010.2920238-9-yuzhao@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andrew,

Can you please take another fixlet? Thanks.

Don't sync disk for each aging cycle.

wakeup_flusher_threads() was added under the assumption that if a
system runs out of clean cold pages, it might want to write back dirty
pages more aggressively so that they can become clean and be dropped.

However, doing so can breach the rate limit a system wants to impose
on writeback, resulting in early SSD wearout.

Reported-by: Axel Rasmussen <axelrasmussen@google.com>
Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 mm/vmscan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5b565470286b..0317d4cf4884 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4413,8 +4413,6 @@ static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
 	if (wq_has_sleeper(&lruvec->mm_state.wait))
 		wake_up_all(&lruvec->mm_state.wait);
 
-	wakeup_flusher_threads(WB_REASON_VMSCAN);
-
 	return true;
 }
 
-- 
2.37.3.998.g577e59143f-goog
