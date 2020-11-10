Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A9EC56201
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 07:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73A5F20870
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 07:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="w6shu/O0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJHLV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Nov 2020 02:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJHLV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 02:11:21 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0322DC0613D3
        for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2020 23:11:20 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id y7so10548918pfq.11
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2020 23:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UlQT59tCD8Lul0BWpf5GF9dCDTyjNMETV0Q2jjk6K5c=;
        b=w6shu/O07nzqF+lqi/iGcNfpQe1U6qmJrLgGz0kpjhpCm9sCsCU/VmXA59A6UfM0OV
         YzFK1vR37tjuSJT5GbxO0/T2Ir0r7TFAuNhi2mLBlkqtQaVAVopnYQxJg+6ninNe3Cfv
         3KZgdVHuhrgy2O4a8WM3yMfVHAdlEN13MEvr+RQCOfgRYU5CN29UlOED8E3Yc5J5mhxT
         pqnHqJyugYFyl/y6EKnOGf9Rpllke0irq006nZ5hxZEJbXKD8GqZ3o7e7rbbKQdagR15
         +A55cq1UrHKQ2ErcRH6rFAF4zg/cvFj3diRH2aMlnoqRgEf7NCq37Vyqm2oFy5m/zvJC
         8SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UlQT59tCD8Lul0BWpf5GF9dCDTyjNMETV0Q2jjk6K5c=;
        b=ZkcwcbHRt75m0v9c0RlfJcMI88djb2v4dZO9Uw3DqD15K3b6M5KKnPrhLYhupkR6qn
         w0PeZwL34pnhDFNide1tGa9E1TLZEpPA988IjrGP++QkaFGKT2fyWvLgTzEO1EtkOh0r
         9m1BLESk0uhjCwKzp2IC8m3DebxtUmGQUTxcaYdDWuUvAjTC5OXcU+CoLQ1Mm5fHkTg6
         hlFsYw3865fMt2Sx7ojVQRSVFh0N3xPv0Eq/aLvtKdABdisQKPAzyNtqHaCtMpMIwyOZ
         2ls06+2h/F19ImwhgNF8SBbGpyRJh0SvRK3VZEX6ecQmQQZ8IKcgeB2Rot1xWOqnlNrr
         mR9g==
X-Gm-Message-State: AOAM531Yr6FBoyLxqZhuWl6yHz9aQsn59/GNtgG+4/6lm98fdnIV0sXA
        LAwKks59ZIQ1i4eIoz7+KVc3bJWuRByMuD3Fmz1NTQ==
X-Google-Smtp-Source: ABdhPJz3ovoBuWkQkrA7YSi9Hd89lWM0yU7X6hXWN7PjXgUhVfEkL8F1YzWa+UsEyEvQk7eZ4RT/Dm7BWVzyxx8AhKU=
X-Received: by 2002:a17:90b:385:: with SMTP id ga5mr3615777pjb.13.1604992280457;
 Mon, 09 Nov 2020 23:11:20 -0800 (PST)
MIME-Version: 1.0
References: <CAMZfGtVm9buFPscDVn5F5nUE=Yq+y4NoL0ci74=hUyjaLAPQQg@mail.gmail.com>
 <20201110054250.GA2906@localhost.localdomain> <CAMZfGtWbGETq=3b5i0aentemXkZn2J2DNWu05mBs=4L8bJm1jg@mail.gmail.com>
 <20201110063325.GA4286@localhost.localdomain>
In-Reply-To: <20201110063325.GA4286@localhost.localdomain>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 10 Nov 2020 15:10:43 +0800
Message-ID: <CAMZfGtUe9ewZoHb4X+RLPbRZgw4vnVS31JPRu3n6Ekw=hXfj=w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 05/21] mm/hugetlb: Introduce pgtable
 allocation/freeing helpers
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 10, 2020 at 2:33 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Tue, Nov 10, 2020 at 02:08:46PM +0800, Muchun Song wrote:
> > The check should be added here.
> >
> >            if (!pgtable)
> >                    return NULL;
> >
> > Just like my previous v2 patch does. In this case, we can drop those
> > checks. What do you think?
>
> It is too early for me, so bear with me.
>
> page_huge_pte will only return NULL in case we did not get to preallocate
> any pgtable right?

The page_huge_pte only returns NULL when we did consume the
page tables. Not each HugeTLB page need to split the vmemmap
page tables. We preallocate page tables for each HugeTLB page,
if we do not need to split PMD. We should free the preallocated
page tables.

Maybe you can see the comments of the other thread.

  [PATCH v3 09/21] mm/hugetlb: Free the vmemmap pages associated with
each hugetlb page

Thanks.

>
> What I was talimg about is that
> >
> > >         page_huge_pte(page) = list_first_entry_or_null(&pgtable->lru,
> > >                                                        struct page, lru);
>
> here we will get the either a pgtable entry or NULL in case we already consumed
> all entries from the list.
> If that is the case, we can return NULL and let the caller known that we
> are done.
>
> Am I missing anything?


>
>
> --
> Oscar Salvador
> SUSE L3



--
Yours,
Muchun
