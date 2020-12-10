Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83628C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 13:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B70D23119
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 13:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389219AbgLJNd1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 08:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387545AbgLJNbJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 08:31:09 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068A7C061793
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 05:30:29 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id x12so2298240plr.10
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tlXbD+UEW4Nv5CZk4BO09R9ymA6io2nhExNKSLuSREQ=;
        b=XEetfo9+rdFZ5g2HSecX62Vb83yVOQ4YXuxvIr2WX+3p4DuQGaZU6eU8CUT1vg6+Mb
         m8jJJFkKTc7U0a/C0aZOxg5CoEh0eW3IEEMZyEdgKcdjNbMiWqS9tUO75mojAmglH13G
         xs6aqo8pMw6GyO36bz7qI1tSyUk6f49dHEVlQqqgZqxUPHX9MUWx+16CR8r36dhWyKvS
         IuPCk7YP6uXuQf6dWn59o73V2Sn7TMRIE6Vzd5YLhVTUknu6cvsJWwTU1l8JEOfybJqs
         JNdvkSIfHvqtGEHpXNKiwgSHVJdxvRk7Uoz7m04WOmHXVpcm5mwqAOX6J5BTRjpP6wvE
         A3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tlXbD+UEW4Nv5CZk4BO09R9ymA6io2nhExNKSLuSREQ=;
        b=WN9DLTQSmzuqShe9Fr8rQsTb8jrwaK8xNEhLCAzA5NYbq8IX9FePIv/ZRjLBCKMsfH
         +IEYyAOVHaX7TLhTKa1yuAg7EdBDycqdLreZ+7wuFdGV+8y6+WAiK+6XpSIzjH2rUFWK
         /Nb1/aVGQ3FlVNO7LEZfIMPAf09Z7/Fc3CdoLPdszHAv5YiHFYNArCrAlS4NPluFzV62
         1UT09datJ2gwAMG6HB/UZ5bzBCuBwaJfRO+Bajx1lpVV+ZnmG4GpC+/tHHJq+6pGNJKk
         1+RZNZWy4viZB44omhSdrobIVEejM/2vf5BlgzJCuAom6eq+7p38QjDU7qL19RDZogIw
         k7lg==
X-Gm-Message-State: AOAM533jVNYhjv6JJawPQV6IDHzVaJXLcgWDRSuSQkyx4/R8NOTUJTtX
        rUiLMsPl7R4dqruoi8izjLPONzKYxLWf9douthW/4Q==
X-Google-Smtp-Source: ABdhPJyIxJlJPOzma7jwGPoMV3ur6Fu8hZQ/SgquqvsnBCzV9+EcBlQ5INuf2+vkcKklIzEA1H5DJlf1FTH47OaC8BE=
X-Received: by 2002:a17:902:ed0d:b029:da:c83b:5f40 with SMTP id
 b13-20020a170902ed0db02900dac83b5f40mr6598545pld.20.1607607028567; Thu, 10
 Dec 2020 05:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20201210035526.38938-1-songmuchun@bytedance.com>
 <20201210035526.38938-13-songmuchun@bytedance.com> <375d6bad6bb37e3626f71bfabc20b384@suse.de>
 <CAMZfGtUQOXmuRumv48MYGCYh_JZn4bMPPz8HW2ExgTPCfFMMnw@mail.gmail.com> <20201210131608.GA7811@localhost.localdomain>
In-Reply-To: <20201210131608.GA7811@localhost.localdomain>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 10 Dec 2020 21:29:51 +0800
Message-ID: <CAMZfGtX842XJC+C_OeptH4Ru_Q-qV1=5vCq_PgPJmuyTGKO_rg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 12/12] mm/hugetlb: Optimize the code
 with the help of the compiler
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
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 9:16 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Dec 10, 2020 at 08:14:18PM +0800, Muchun Song wrote:
> > Yeah, you are right. But if we do this check can make the code simple.
> >
> > For example, here is a code snippet.
> >
> > void func(void)
> > {
> >         if (free_vmemmap_pages_per_hpage())
> >                 return;
> >         /* Do something */
> > }
> >
> > With this patch, the func will be optimized to null when is_power_of_2
> > returns false.
> >
> > void func(void)
> > {
> > }
> >
> > Without this patch, the compiler cannot do this optimization.
>
> Ok, I misread the changelog.
>
> So, then is_hugetlb_free_vmemmap_enabled, free_huge_page_vmemmap,
> free_vmemmap_pages_per_hpage and hugetlb_vmemmap_init are optimized
> out, right?

Yes, that's right. I have disassembled to make sure of this. Thanks.

>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
