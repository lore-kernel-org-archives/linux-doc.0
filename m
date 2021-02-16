Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F167C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 13:39:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F11C664DE0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 13:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhBPNj3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Feb 2021 08:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhBPNjY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Feb 2021 08:39:24 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BC6C061574
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 05:38:43 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v9so7770941edw.8
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 05:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WVdO5Suny8ndHlIrRpoBrmqIPx4CWmlNbuYupKr2Cqc=;
        b=mx72lufRdfc46M4ag+yiDlWAEO4kn8+gbsl3jWz0aFqVijhPbgaHfBEQpRr24bWoo3
         Kzcg5/Qv0MqwuyCOWfV1DbKnZu075rzPranwK6vD4iech5drvH3efYd5mAeEH9goRzIa
         WVW3u5QveHXn/Yw7x4byE6AG/TaLuDBAt4Gb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WVdO5Suny8ndHlIrRpoBrmqIPx4CWmlNbuYupKr2Cqc=;
        b=pF03cdo4SvvaFVL6G93xafFW9f+x9VQ+nHa0sWP8blQ9vDCDa5HWO3VSkl35DlOSs4
         J+NugiFdlBM/b75Wk3iPgik6BlaDjzi+pjc8GYwpM0muMSkb7Uxc3otSKAiLNx3jopxn
         txnIYEPW4HyS71wMBAOldcFBrDdxMIBwlp1V9Ch3HfDw9yzqzGCAMgP34uB6Lvg68yFY
         kQbZ0mWz9AprblxY2IuSUpmHYvuMuFZGMwIi9KUtFSmY8S3nagedKIoqQ0B313kbGzx7
         2pCaNAdCH5NpVY8RcYUCsOTHz9wHCGyNN3qq9Sb9C/DIh7eLlzHH+Y50a1JmJPmYmTgf
         jObA==
X-Gm-Message-State: AOAM533w7GNQZUOR/ORW3D6ZlELZQR793mGBmzPLpH2Sl+qw080MjIpe
        ZDFR4714JofSrJZ2pqpeKXvFeQ==
X-Google-Smtp-Source: ABdhPJzpPnxzHatNnDsBqyQ+8F5czdeOrvKXZriPXHaF1qmKcbRlVfIHYJBPmwi07+8O5GcHXWnEEw==
X-Received: by 2002:a50:fe02:: with SMTP id f2mr938391edt.173.1613482721746;
        Tue, 16 Feb 2021 05:38:41 -0800 (PST)
Received: from localhost ([2a01:4b00:8432:8a00:63de:dd93:20be:f460])
        by smtp.gmail.com with ESMTPSA id i21sm13620839edy.9.2021.02.16.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 05:38:41 -0800 (PST)
Date:   Tue, 16 Feb 2021 13:38:40 +0000
From:   Chris Down <chris@chrisdown.name>
To:     Eiichi Tsukata <eiichi.tsukata@nutanix.com>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, felipe.franciosi@nutanix.com
Subject: Re: [RFC PATCH] mm, oom: introduce vm.sacrifice_hugepage_on_oom
Message-ID: <YCvK4EPg30ocI8gP@chrisdown.name>
References: <20210216030713.79101-1-eiichi.tsukata@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210216030713.79101-1-eiichi.tsukata@nutanix.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Eiichi,

I agree with Michal's points, and I think there are also some other design 
questions which don't quite make sense to me. Perhaps you can clear them up?  
:-)

Eiichi Tsukata writes:
>diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>index 4bdb58ab14cb..e2d57200fd00 100644
>--- a/mm/hugetlb.c
>+++ b/mm/hugetlb.c
>@@ -1726,8 +1726,8 @@ static int alloc_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
>  * balanced over allowed nodes.
>  * Called with hugetlb_lock locked.
>  */
>-static int free_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
>-							 bool acct_surplus)
>+int free_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
>+			bool acct_surplus)
> {
> 	int nr_nodes, node;
> 	int ret = 0;

The immediate red flag to me is that we're investing further mm knowledge into 
hugetlb. For the vast majority of intents and purposes, hugetlb exists outside 
of the typical memory management lifecycle, and historic behaviour has been to 
treat a separate reserve that we don't touch. We expect that hugetlb is a 
reserve which is by and large explicitly managed by the system administrator, 
not by us, and this seems to violate that.

Shoehorning in shrink-on-OOM support to it seems a little suspicious to me, 
because we already have a modernised system for huge pages that handles not 
only this, but many other memory management situations: THP. THP not only has 
support for this particular case, but so many other features which are 
necessary to coherently manage it as part of the mm lifecycle. For that reason, 
I'm not convinced that those composes to a sensible interface.

As some example questions which appear unresolved to me: if hugetlb pages are 
lost, what mechanisms will we provide to tell automation or the system 
administrator what to do in that scenario? How should the interface for 
resolving hugepage starvation due to repeated OOMs look? By what metrics will 
you decide if releasing the hugepage is worse for the system than selecting a 
victim for OOM? Why can't the system use the existing THP mechanisms to resolve 
this ahead of time?

Thanks,

Chris
