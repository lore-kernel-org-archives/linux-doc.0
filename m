Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0936BC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 18:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7B5622E00
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 18:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbhASSnu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404357AbhASSF7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 13:05:59 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C02C061573
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 10:05:14 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id 22so22737423qkf.9
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VdWMG/uGCJ43g2jyUu+cOqHYdfz8BVsdLX4Jg//Lvgk=;
        b=j05GmtUhLQZqMespMujz2B04lEC5T+G/IfPEWSLg9vszMTM84+Zwtv7YEyyGBOnOMD
         YZC13ZpoqFi0CBqzxMyMLz5MGzx9rrfUGkf8WoTmWLe+XPRMAlK9wStYfMqqlkPknPAq
         yGDvTKn7uo+pfQGH7wmxQgS0VxVr6WuRqwgAHe+hR8rmQgHR51984f46IM/N2BUDhuUS
         YJMag/9hIm93ON0T4gX5kXGSFdmvo91YglWHnbp2mCOm7C6wA5Cg0t+d33mCD3gJD5CY
         VLG4PZoRo65ssQgEKGnjk49NqZBmRBjXDP1dFdICMM9Iv1Yj7cOvkh0ctNhWEORsk4bd
         7Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VdWMG/uGCJ43g2jyUu+cOqHYdfz8BVsdLX4Jg//Lvgk=;
        b=PgKv2OiQNFLUAd1T11vhrmqVWTK7OYgmwmm4xuWh3j6SPLynHpn032kMsB8q8iB37f
         efR6/P8O/yCaG2MPG/BZZwrwFgrmzgE3HVEpsgHf6l7Ww8s5St/Zwy6JYpBV2Ev5kA/a
         VJGFgC4DxzW3Md7j+1PMrL/fVuDZ/iEil1ETxCK85ZqqrJk/b3HLDw9cje4xqVLZNon8
         xvOGqbEvQ1vljH/rcOA859cg0LipmzGOYI7QYCOGGwKD87NvpoYGmxeTAiWYHBcdm/b3
         hCJTJRh+zIE6+Nc3a+ijB5nTSZfoFrwREf5R6ZQdjAXRMGxiBZ93DsboQPFlJGDCWOVI
         016A==
X-Gm-Message-State: AOAM532PG69pgGVeQ5S6s4j6D+MOHmxkzzRPWEqLvVb5vjSplkiCmfFq
        550YpG4F2zScgNt7NnMk0AzQ8w==
X-Google-Smtp-Source: ABdhPJx7MA8sBMbEtUSV41m+37ci8w0m1RGlrZnwqu/7wxd6/5Vt3/6VIuQwvxqlLT6y5Ik3JcwCyA==
X-Received: by 2002:a37:a50c:: with SMTP id o12mr5590816qke.98.1611079513428;
        Tue, 19 Jan 2021 10:05:13 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id o5sm12802873qti.47.2021.01.19.10.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 10:05:13 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l1vNQ-003pFv-F7; Tue, 19 Jan 2021 14:05:12 -0400
Date:   Tue, 19 Jan 2021 14:05:12 -0400
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
Subject: Re: [PATCH v5 02/14] mm/gup: check every subpage of a compound page
 during isolation
Message-ID: <20210119180512.GY4605@ziepe.ca>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
 <20210119043920.155044-3-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119043920.155044-3-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 18, 2021 at 11:39:08PM -0500, Pavel Tatashin wrote:
> When pages are isolated in check_and_migrate_movable_pages() we skip
> compound number of pages at a time. However, as Jason noted, it is
> not necessary correct that pages[i] corresponds to the pages that
> we skipped. This is because it is possible that the addresses in
> this range had split_huge_pmd()/split_huge_pud(), and these functions
> do not update the compound page metadata.
> 
> The problem can be reproduced if something like this occurs:
> 
> 1. User faulted huge pages.
> 2. split_huge_pmd() was called for some reason
> 3. User has unmapped some sub-pages in the range
> 4. User tries to longterm pin the addresses.
> 
> The resulting pages[i] might end-up having pages which are not compound
> size page aligned.
> 
> Fixes: aa712399c1e8 ("mm/gup: speed up check_and_migrate_cma_pages() on huge page")
> 
> Reported-by: Jason Gunthorpe <jgg@nvidia.com>

No new line after fixes

> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
>  mm/gup.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)

Looks good

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
