Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44593C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 13:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0717823340
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 13:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbhATNW4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 08:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732561AbhATNUU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 08:20:20 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40234C0613C1
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:19:40 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id h21so1845815qvb.8
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 05:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JuQvGRvkQQfVRzn/FUI+haarmzYqzGiLWBP9Je4qZPE=;
        b=QHJVd3T5Tsl7WmiiJ+h+AhTVu4iAWpt/4foFcd4/mjShCb05HeiGCXzKAj+Da/VDvV
         QqCbyDX+iw+0+XERIeP1O2cu/DekTw4hKakyJ638PzTcE2mQiR/oPwKEsyQv81ntuBUA
         IxtkYJu/+X8kTXcCLKn+qpX/46Ms6sZfYWWaIdX0MhJg6q5zRuogluR7m7+4GTW68pJy
         CNJzr2I+/7YWY6RRVTZNzBKAWMuIFxMbyHZqzIQbmdcme9ixdyOYyqXa3nCZnV08TVmf
         t1RQvZOApFqM68tMKYBli2pd1wrLaIUXypZac/PIJ2HSrwUtOfWNghJ1LMNXXysB4qCX
         6JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JuQvGRvkQQfVRzn/FUI+haarmzYqzGiLWBP9Je4qZPE=;
        b=KBYLyzZ0bbG5PjuujworQ8xOmnL24O/e0HsIVWgP3AKTTqVCDuHc0dGkdpAnXceh6Y
         W/PqQoZ2IbwPkRN07vWbPPrkyoDV+wMvLW9dGZoeb245RWG8zIfXqkwaiiFzMF5E0xw1
         zUGdt0j0swS/2mUOPErUDT+bbOJ30TCN5a2ZcW1mxGlBgwXC2/8pZG9uYqiwBv5vtepN
         TpO6fvTy/23zTvuqBkYQd4UXRglMHRUmbDD4FNeOR5BxL1eGT2/HSxqNBgIwcuPOianv
         u8syo27/XvUxiZS7SlciGyxtKHuJrswk28zt0iw0Ignfa9AIWjHh/4P0CD9BbfEjuV/W
         7cyA==
X-Gm-Message-State: AOAM5310shxzvXqBCCR5iQggRzTB3arXmqEKWyZVudFjZjOGpWVcyUZs
        dE3xh6Kpp/JlKDo94DIGROb7gw==
X-Google-Smtp-Source: ABdhPJz4cQZ1YMTMG0FLUN0ZbA69O2/qIdTs4LRKLu+daL+1MgPSen3w52S63HZWxLilbEYISziQdA==
X-Received: by 2002:a05:6214:1110:: with SMTP id e16mr9110666qvs.62.1611148779431;
        Wed, 20 Jan 2021 05:19:39 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id b67sm1249374qkc.44.2021.01.20.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:19:38 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l2DOb-004Tve-SU; Wed, 20 Jan 2021 09:19:37 -0400
Date:   Wed, 20 Jan 2021 09:19:37 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, vbabka@suse.cz, mhocko@suse.com,
        david@redhat.com, osalvador@suse.de, dan.j.williams@intel.com,
        sashal@kernel.org, tyhicks@linux.microsoft.com,
        iamjoonsoo.kim@lge.com, mike.kravetz@oracle.com,
        rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org,
        mgorman@suse.de, willy@infradead.org, rientjes@google.com,
        jhubbard@nvidia.com, linux-doc@vger.kernel.org,
        ira.weiny@intel.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 12/14] mm/gup: longterm pin migration cleaup
Message-ID: <20210120131937.GG4605@ziepe.ca>
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
 <20210120014333.222547-13-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120014333.222547-13-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 19, 2021 at 08:43:31PM -0500, Pavel Tatashin wrote:
> When pages are longterm pinned, we must migrated them out of movable zone.
> The function that migrates them has a hidden loop with goto. The loop is
> to retry on isolation failures, and after successful migration.
> 
> Make this code better by moving this loop to the caller.
> 
> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
>  mm/gup.c | 88 +++++++++++++++++++++++---------------------------------
>  1 file changed, 36 insertions(+), 52 deletions(-)

This looks OK, it is better

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I really dislike we always have to go over the page list twice in pin
mode

The is_pinnable_page() and LRU isolation should really be done inside
__get_user_pages_locked() as each page is added to the output list

But that is more of a larger issue than this series

Jason
