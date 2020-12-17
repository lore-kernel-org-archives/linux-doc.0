Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6B6C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 10:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C9AF23899
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 10:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgLQKnU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 05:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgLQKnT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 05:43:19 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FC2C061794
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 02:42:39 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id g18so20077198pgk.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 02:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ISaOxv2M3y6rzTF7V0ZUu/XvyKLY1Lh8tc0RjKV/bE=;
        b=JdIliH6SeXTydvTW28vuoACmBG9WQrqrb7eKRimd1Cl9Rh8HMO0wnx7XJRZaA7s0sN
         dgXttyNW31CGIl4D9+NBOs8ygxpG55qZVW0OepUVtuNnw3MCLFVAP8MXJfyAaEmEMArH
         ud1l8hYWYRDL5TTsIuEMt8tTHpvlXlQG80iRvj6OkWGBKjMjpHnHEcRqFIr6t4P4hGRg
         92iWo0ce2iAyOZv/ULkYH33m4ThMTdyKMzWezF9P85dqlZkW/btdOv1Jfr18pK85a3JX
         DuIGt2ihK02S2meZ+b1yNUwpJafxowwwPbj1PT3Hc/3fWv9yv5zlIYE8AG2IVjjmPq/N
         XxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ISaOxv2M3y6rzTF7V0ZUu/XvyKLY1Lh8tc0RjKV/bE=;
        b=C4hj7HVgZwSjhyaoa7OS7JQoinziubMKrRY1bSEqwwy7EsmeCrhzS9Qgvx+kyx0+tR
         3AkIogjgCw4THnnok5Jm/czmn2YzlO0RaMgQWAJZpHdb2hyOHZVoBc0eidwaqbGVkELL
         TAO8oY9DXMHmznhfbzW3noKw81GofHzNAxgsndEm7NkA/ML8IMoiKa+j0dhDC1zn067f
         DdwBxj8WCwxG/AIE9IfMecHr5EZt1QXvbI8IRzujNqsEW3eDRQgOsO/SfmiQem4KSboc
         oYqfX+feVK1RS1h7iMDXzFNogVP9mnQzazW2Qflf/cFIgS2wZ1rv/yknhO2dejnKwgiK
         mqPw==
X-Gm-Message-State: AOAM5311CQ5T8RVs4ZESMKjUogD9ZLjVFnlImKMDT6cswHX1jHjrDzAu
        8KxPD2gCcR9ufTnDNuOo14XxlRWiZPQKwYqT8WxcEg==
X-Google-Smtp-Source: ABdhPJyQqONmSuuKMNSnMEKXcxXk9UVbNjaPbYGZ8ABrFQ0kIzVpoir8YmisZWEI9RBFKOOPGshygmfRmOp3NTZUEXA=
X-Received: by 2002:a63:50a:: with SMTP id 10mr9159315pgf.273.1608201758996;
 Thu, 17 Dec 2020 02:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20201213154534.54826-1-songmuchun@bytedance.com>
 <20201213154534.54826-12-songmuchun@bytedance.com> <20201217103154.GA8481@linux>
In-Reply-To: <20201217103154.GA8481@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 17 Dec 2020 18:42:02 +0800
Message-ID: <CAMZfGtUesG88wnwN6XEXWSyDFgWFGqNS153sUkXqxZu-U0h9DA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 11/11] mm/hugetlb: Optimize the code
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

On Thu, Dec 17, 2020 at 6:32 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Sun, Dec 13, 2020 at 11:45:34PM +0800, Muchun Song wrote:
> >  static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
> >  {
> > -     return h->nr_free_vmemmap_pages;
> > +     return h->nr_free_vmemmap_pages && is_power_of_2(sizeof(struct page));
>
> This is wrong as it will return either true or false, but not what we want:

Yeah, very thanks for pointing that out.

>
>         static inline unsigned long free_vmemmap_pages_size_per_hpage(struct hstate *h)
>         {
>                 return (unsigned long)free_vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
>         }
>
> the above will compute to 4096, which is wrong for obvious reasons.

You are right. It is my mistake. Thanks Oscar.

>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
