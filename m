Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72E8C43461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 22:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78B2B20872
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 22:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="NvD9FH7j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgIOWyR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 18:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbgIOPil (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 11:38:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED574C06174A
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 08:28:37 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z19so2124449pfn.8
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3hFA+AYRcOFg15m1pODeTESDGf29GxzkowTbH/0FwhE=;
        b=NvD9FH7jzHdmmVqx2+B3GaZyyb7SzVJCGbxcurxADdLywqS4prFZe+m15IKNLz/lZb
         uufZgZRL5fc24zy97GUZiwuSjWy5SmkECf811W3pWN5ZmcZNLUppvpAj0LRvDeW5fg15
         oxG0UXwRhqo/E0iSVuDLvwhhwAx6ZwjTAngSWBzPBAbBn+umSmm1DTYlDuAIMdMnoQTv
         0Ffe/ORg2/b1UkMDmEKFU7XkXQUBqYfUZk1WNhhn6lDem+yq/j1f+uzz1zHXTBjRU+yO
         2GqP9m9QdmD7dghZrVk93zAxLCXvJeT4QxQrEIhB4kRwR81ZyPu3Ikwm8LeaqyvlVhxo
         MssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3hFA+AYRcOFg15m1pODeTESDGf29GxzkowTbH/0FwhE=;
        b=GW+jfssZTfyXnZ9Jmi6IcEcVCALzBXzfNy5+6Rn3bfrl/U3U9t3FKgXaQTo7QYDx1o
         pBtqwT1wxTCkur0FMHINeMWzGmCVwl/wAA73dx7e298Y7nJGd20/6kNA+WLOND93BHGU
         hySYEgJwEt5BO40RWyYuGdkmKpMsjP4TS8hjsaHJPOAoxs9ccKkreu1jg31mbpfWSMkh
         i0NvKuJvNmItoVgCGcs6yqofUCO6PInp2F+UMfIqrr+BSkJT4Bd5rt7tGeqtGAgDyFvu
         pAJ8o7cILXTz9hWAtPTu0Qrusr5lGBUSPR95/05cKrt5f1G0tZ6chHMdE8BIEABQRpUy
         dJSA==
X-Gm-Message-State: AOAM532L2xZy+hhhmycdcj2XRLGeW72GyBeBi35EF8r5tddw5EMXja3T
        sgaRE5myiLtUl5/WL8J0TqVg7YWrY9qpyKte6n/E5Q==
X-Google-Smtp-Source: ABdhPJxqFxl0ezhOPvlUoXv87DU4ARGU0sUArN1IhU04uIEVn+Sze3RMVgqCcwOmxVDT3336+MmXOQXZxq6T9WdXFms=
X-Received: by 2002:aa7:8287:0:b029:142:2501:39ec with SMTP id
 s7-20020aa782870000b0290142250139ecmr2349117pfm.59.1600183717500; Tue, 15 Sep
 2020 08:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200915125947.26204-1-songmuchun@bytedance.com> <20200915143241.GH5449@casper.infradead.org>
In-Reply-To: <20200915143241.GH5449@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 15 Sep 2020 23:28:01 +0800
Message-ID: <CAMZfGtW0PqU6SLihLABA8rU+FuBqm8NksDW=EkLXy1RZfYeDGA@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 00/24] mm/hugetlb: Free some vmemmap
 pages of hugetlb page
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de, almasrymina@google.com,
        David Rientjes <rientjes@google.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 15, 2020 at 10:32 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Sep 15, 2020 at 08:59:23PM +0800, Muchun Song wrote:
> > This patch series will free some vmemmap pages(struct page structures)
> > associated with each hugetlbpage when preallocated to save memory.
>
> It would be lovely to be able to do this.  Unfortunately, it's completely
> impossible right now.  Consider, for example, get_user_pages() called
> on the fifth page of a hugetlb page.

Can you elaborate on the problem? Thanks so much.

>
> I've spent a lot of time thinking about this, and there's a lot of work
> that needs to happen before we can do this, mostly in device drivers.
> Do you want to help?  It's a multi-year project.

Welcome, we can work together.


-- 
Yours,
Muchun
