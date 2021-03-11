Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A251C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 09:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5014864FDC
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 09:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhCKJGU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Mar 2021 04:06:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhCKJFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Mar 2021 04:05:54 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEF2C061761
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 01:05:54 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id x29so13273928pgk.6
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NEuWJ1IzW9w1LR0NVWyqtXThfP/VhN1PD6Tu5Oy4aJU=;
        b=QiA3e4UOTC6PwCbi+C54OFbkwIRbRlQhWEa7Zi6lg6rbvSsuDTLFVYlZYgUbOQdEow
         0Vj3Mk/FnadcKEVMgPih+IquWlvg/pWvvcQE9bv3mKi0TAs02CkadvB5Ai4/1QOmEL8h
         UuWR228OYb2YtqQ6KBUtmbCz7ojNSbTBmmQTXYAa8YibyX/rIu5fj1whwsLToaQC1p++
         l2wfbGX+6k98fxPNNio0d7M8SnD4R5D+fXNkhZkXkxoUwMkHORIe7f54+2cR7IVkeSri
         m+fOaHETRjK6bCMuihy6y2WnFTbhwwqNHojA9xykcu7jXPBWzaw3hMUH+36nm2zvUMyM
         n9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NEuWJ1IzW9w1LR0NVWyqtXThfP/VhN1PD6Tu5Oy4aJU=;
        b=VAuuIaLsKfZDe5L97wakDaylWgor85q6NZFz4AOp81MMXQnqZnYJKNa4QpmNDqCHYt
         ROU785+JoFgMTFrfBXGFh6ZEbuUs3jHSGwsz4JfZ55GmuhAddttZXGGhJ3tnuIiplgWV
         J0C3pZ0DH7bcWgLp9VxFPt/q5cLIGbY3mjbINVv5cNqHo0xirNABObkIiXKLHx3pq4MX
         7J198egJafZDinbqjejCBiFrgxVoFxPX49KYGYhbF8kaVzrvaVPrAE+gHkNL9nMGCk80
         oZqhHUXvKqKrmXJSzAcSxx2etxcgvp6O0Af+xZvXZ8bmhzQMW28EZCsM4qfaNz1179ZT
         YLaw==
X-Gm-Message-State: AOAM532hKEbF24QopKlC4aLAIVLAuA7GpK0Gf/OzbHNLVcRYYXLVkeYs
        ozQWePawqn+cJDa4CTc0fVkDClD2ZIqFkEiOanaoRg==
X-Google-Smtp-Source: ABdhPJxfLY17X+FDlSSom02cJEgvIJynJ88BEDZxL6oI/2zyXG78s5f6Q/h0nA9sEvkBon/N6NJyk8LdklhW7UNvJkU=
X-Received: by 2002:a63:141e:: with SMTP id u30mr6601246pgl.31.1615453553609;
 Thu, 11 Mar 2021 01:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20210308102807.59745-1-songmuchun@bytedance.com>
 <20210308102807.59745-2-songmuchun@bytedance.com> <YEjUYOIJb2kYoQIA@dhcp22.suse.cz>
 <CAMZfGtUj9vcVrSjT8Tk12jfkVE127Vkdkx6Js1JXzL+=rmu7Qw@mail.gmail.com>
 <CAMZfGtX37yBkKJjmBBSBeDeVAM6XywAJuEXjTSm7apOmQ-FOxA@mail.gmail.com> <YEnajfqDEjEMTYXE@dhcp22.suse.cz>
In-Reply-To: <YEnajfqDEjEMTYXE@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 11 Mar 2021 17:05:15 +0800
Message-ID: <CAMZfGtXN3b+XPCyWU4oz+wmnVKYhD6+W3wMk54b16pKTRrhu9g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v18 1/9] mm: memory_hotplug: factor out
 bootmem core functions to bootmem_info.c
To:     Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Chen Huang <chenhuang5@huawei.com>,
        Bodeddula Balasubramaniam <bodeddub@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 11, 2021 at 4:53 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 11-03-21 16:45:51, Muchun Song wrote:
> > On Thu, Mar 11, 2021 at 10:58 AM Muchun Song <songmuchun@bytedance.com> wrote:
> > >
> > > On Wed, Mar 10, 2021 at 10:14 PM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > [I am sorry for a late review]
> > >
> > > Thanks for your review.
> > >
> > > >
> > > > On Mon 08-03-21 18:27:59, Muchun Song wrote:
> > > > > Move bootmem info registration common API to individual bootmem_info.c.
> > > > > And we will use {get,put}_page_bootmem() to initialize the page for the
> > > > > vmemmap pages or free the vmemmap pages to buddy in the later patch.
> > > > > So move them out of CONFIG_MEMORY_HOTPLUG_SPARSE. This is just code
> > > > > movement without any functional change.
> > > > >
> > > > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > > > > Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> > > > > Reviewed-by: Oscar Salvador <osalvador@suse.de>
> > > > > Reviewed-by: David Hildenbrand <david@redhat.com>
> > > > > Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
> > > > > Tested-by: Chen Huang <chenhuang5@huawei.com>
> > > > > Tested-by: Bodeddula Balasubramaniam <bodeddub@amazon.com>
> > > >
> > > > Separation from memory_hotplug.c is definitely a right step. I am
> > > > wondering about the config dependency though
> > > > [...]
> > > > > diff --git a/mm/Makefile b/mm/Makefile
> > > > > index 72227b24a616..daabf86d7da8 100644
> > > > > --- a/mm/Makefile
> > > > > +++ b/mm/Makefile
> > > > > @@ -83,6 +83,7 @@ obj-$(CONFIG_SLUB) += slub.o
> > > > >  obj-$(CONFIG_KASAN)  += kasan/
> > > > >  obj-$(CONFIG_KFENCE) += kfence/
> > > > >  obj-$(CONFIG_FAILSLAB) += failslab.o
> > > > > +obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
> > > >
> > > > I would have expected this would depend on CONFIG_SPARSE.
> > > > BOOTMEM_INFO_NODE is really an odd thing to depend on here. There is
> > > > some functionality which requires the node info but that can be gated
> > > > specifically. Or what is the thinking behind?
> >
> > I have tried this. And I find that it is better to depend on
> > BOOTMEM_INFO_NODE instead of SPARSEMEM.
> >
> > If we enable SPARSEMEM but disable HAVE_BOOTMEM_INFO_NODE,
> > the bootmem_info.c also is compiled. Actually, we do not
> > need those functions on other architectures. And these
> > functions are also related to bootmem info. So it may be
> > more reasonable to depend on BOOTMEM_INFO_NODE.
> > Just my thoughts.
>
> If BOOTMEM_INFO_NODE is disbabled then bootmem_info.c would be
> effectivelly only {get,put}_page_bootmem, no?

{get,put}_page_bootmem also would be effective. I found that
get_page_bootmem is only used in the scope of the
CONFIG_BOOTMEM_INFO_NODE. So I move them
to the bootmem_info.c.

Thanks.

>
> --
> Michal Hocko
> SUSE Labs
