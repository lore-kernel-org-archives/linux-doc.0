Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B002BC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 13:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8057323A59
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 13:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbhANNG0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 08:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbhANNGZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 08:06:25 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BABC061574
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 05:05:45 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id n25so3762765pgb.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 05:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=otxZaMxXrqXQ+HB6nBjrd36W75JtcSkls6JE059kKq8=;
        b=Y5wdk5Z+2zXharmJBzMfvHlw+DCQOtiGesEKv/ljgEMRr2bZnbpYpeN5Rc6nkzBSU7
         6GZaLZNf2+smELPyQ7e1VoARGBuINS5W3oUPrtBX3hmlAxujkz6OCS92eRfWqs8YR7cy
         SyIyelX801SjXYu3JKgZT72YIOJP8SANg6sSD8lt7xGj+VRtWODdLPAmAaofjvpLHQgi
         k7Fw7ZRWx8UOFc+lFuD4W6OhkoVyRMiwgORb5OSsnkjwmHOCfQpmzYUHG2WdxIqVeZ1k
         p5KFqGx34Rk9jsS+lk6PDzPCsRug5oPCXF5v/nfS/Bwd2xy8CiIrNOhyZcYR0HC6uE9e
         /y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otxZaMxXrqXQ+HB6nBjrd36W75JtcSkls6JE059kKq8=;
        b=i+L5KduBAloh7DQu0/o1uzXG7OMM92ViggLJHhAcSzQZXle02UK2/vBXSgJIMWpANA
         2g19z/4yP0+v3IWkWI1B5S05UVT0YKQWxI/H9K06iyZthV8chmU+a5Yd4hOSNU1EvOYL
         x16mtQUGxcin0BbQpiFdnUsyjV7FR3mzYIeyhQZ6RbsS7BNN1nUlL5r8CukqbDZZgOWu
         w+h7NVWQ6/6px4/6koqkmjUasDsyUwGWu9v2lSKReWI9XWdUt+C/rfMlfF0cP8mE7fp3
         vNtjvguNEjGx93F/McMtsGOJpQpAMwCkfX407wvFJjWcbhJXaQjqyJFiwyRncjbHpQCA
         xH5Q==
X-Gm-Message-State: AOAM531ybJlzsbx6OGM+Lts/yqppuH8+TWik+t8u0fU0mX9D4tbRgEbq
        IuV9IrQdHkSu2DZjl2WfilBN9+wsiPGWZ97WV+YWDA==
X-Google-Smtp-Source: ABdhPJzXR6KWx5reUzFIFz1GMOxEjEoANCQaSp+5a9EX5pYZyQ4qs0zpJRJh7vxaZ4eM6E2Q8vb99n3CxNo6z+THTLU=
X-Received: by 2002:a63:480f:: with SMTP id v15mr7419423pga.341.1610629545074;
 Thu, 14 Jan 2021 05:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20210106141931.73931-1-songmuchun@bytedance.com>
 <20210106141931.73931-5-songmuchun@bytedance.com> <20210112080453.GA10895@linux>
 <CAMZfGtUqN2BZH28i9VJhRJ3VH3OGKBQ7hDUuX1-F5LcwbKk+4A@mail.gmail.com>
 <20210113092028.GB24816@linux> <a9baf18c-22c7-4946-9778-678f6bc808dc@oracle.com>
 <CAMZfGtUhhMDCaZKeayS1+w0MvBijDZC2AiUV4z5rUFrfbXBefw@mail.gmail.com> <20210114115248.GA24592@localhost.localdomain>
In-Reply-To: <20210114115248.GA24592@localhost.localdomain>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 14 Jan 2021 21:05:06 +0800
Message-ID: <CAMZfGtXksc0Ugasqn4czpwHunsGR5nfxVO_iLsrLrnYMsgieYw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 04/13] mm/hugetlb: Free the vmemmap
 pages associated with each HugeTLB page
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 14, 2021 at 7:52 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Jan 14, 2021 at 06:54:30PM +0800, Muchun Song wrote:
> > I think this approach may be only suitable for generic huge page only.
> > So we can implement it only for huge page.
> >
> > Hi Oscar,
> >
> > What's your opinion about this?
>
> I tried something like:
>
> static void vmemmap_pte_range(pmd_t *pmd, unsigned long addr,
>                               unsigned long end,
>                               struct vmemmap_remap_walk *walk)
> {
>         pte_t *pte;
>
>         pte = pte_offset_kernel(pmd, addr);
>
>         if (!walk->reuse_page) {
>                 BUG_ON(pte_none(*pte));
>
>                 walk->reuse_page = pte_page(*pte++);
>                 addr = walk->remap_start;
>         }
>
>         for (; addr != end; addr += PAGE_SIZE, pte++) {
>                 BUG_ON(pte_none(*pte));
>
>                 walk->remap_pte(pte, addr, walk);
>         }
> }
>
> void vmemmap_remap_free(unsigned long start, unsigned long end,
>                         unsigned long reuse)
> {
>         LIST_HEAD(vmemmap_pages);
>         struct vmemmap_remap_walk walk = {
>                 .remap_pte      = vmemmap_remap_pte,
>                 .reuse_addr     = reuse,
>                 .remap_start = start,
>                 .vmemmap_pages  = &vmemmap_pages,
>         };
>
>         BUG_ON(start != reuse + PAGE_SIZE);
>
>         vmemmap_remap_range(reuse, end, &walk);
>         free_vmemmap_page_list(&vmemmap_pages);
> }
>
> but it might overcomplicate things and I am not sure it is any better.
> So I am fine with keeping it as is.
> Should another user come in the future, we can always revisit.
> Maybe just add a little comment in vmemmap_pte_range(), explaining while we
> are "+= PAGE_SIZE" for address and I would like to see a comment in
> vmemmap_remap_free why the BUG_ON and more important what it is checking.

OK, I will add some comments to explain why we do this in
vmemmap_remap_free and vmemmap_remap_free. Thanks.

>
> --
> Oscar Salvador
> SUSE L3
