Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3129EC4361B
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 13:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE13723331
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 13:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgLGNYk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 08:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgLGNYj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 08:24:39 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AEDC0613D1
        for <linux-doc@vger.kernel.org>; Mon,  7 Dec 2020 05:23:59 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id j13so7435298pjz.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 05:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ky+I9YkVzigjjr6stcndvMLpkjlk5/E6enUFznI0xXk=;
        b=P34K7+7gmugd3RCndoxHSZmBwWjqQv3lr+RU3A27tiFeJKxAykWlrOPr07RB7o66zG
         cYb/c/eE0KLWrs5GrSbXMMSKbdtAjZ2MRRWh5ndWSP1P4aLF8PBT9NgdHEjJqadOtjbH
         eZaRFlCVVSeQZzDFFqim+bari+CRXDx07Hq3qbkzX5FakwrG/XFfrEgPyYJOjLU3rZ3m
         HsvwSYCxIEIIWdbe3toyI98SqwSN5s57GVIcD29eU1kjLpNE92MUOgdQepdm9qph2i8X
         9OstqP7zx0smn0/yY8wSD+6jUjWZFMJBR41NjBx9xvrjjLCOroYV+60llyFZxW8t7xuB
         nPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ky+I9YkVzigjjr6stcndvMLpkjlk5/E6enUFznI0xXk=;
        b=A0gQ5IUeXphvsH6lKtx9XLv9rqmBqzC96gfoH+igm1Kdfc8+BQW24jBx6jOR8o67lP
         mN8XLGpd+0YItuovXDZQw2GWKCeSN9ghYAaxdcmqi+nRyCe05khtOkkGJiGkoZyFldxz
         hrY6SSAm8+6Rm8i3/4HkxK+8fv0lCh3xXojW3aCp+7pYWkF/0kPnCgqlypUOg+993J/U
         wJoiipqqQDOk7jXOqBqoJfEch2I/v8jWfWdBDKGqvpHKgf0wNJHfEkNLeF1F1fJHHGiN
         EbcQ5aCdNoNWjem1+qQW0iQg//5ywDwEk+JlcOn4ISeM2vvDivPZV4MGz4tGiYskO8Qp
         PI2Q==
X-Gm-Message-State: AOAM5328aXdVi8pwbm8ABoJSMC9xWO36QMi9gvmGcSDyNiU6JGzdH+es
        BxdF4GD0nqOi8qUS1FjmkOe/kdSYyrz7TzpXEw4DJg==
X-Google-Smtp-Source: ABdhPJwusQET8H/ZtzbMlFRmNDIDtUwVD9D8y47cTahBIlck/QWVBQr9rJ+XFSKkdsByhbn0oiK+TQ4qvTtVAjvkk2k=
X-Received: by 2002:a17:90a:c588:: with SMTP id l8mr16181556pjt.147.1607347438932;
 Mon, 07 Dec 2020 05:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <20201130151838.11208-6-songmuchun@bytedance.com> <17abb7bb-de39-7580-b020-faec58032de9@redhat.com>
In-Reply-To: <17abb7bb-de39-7580-b020-faec58032de9@redhat.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 7 Dec 2020 21:23:22 +0800
Message-ID: <CAMZfGtUBe32=wYfR9Nqnq5_Xvb8hHO5j14eyFkRwx5uaS0n=1Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 05/15] mm/bootmem_info: Introduce {free,prepare}_vmemmap_page()
To:     David Hildenbrand <david@redhat.com>
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
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 7, 2020 at 8:39 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 30.11.20 16:18, Muchun Song wrote:
> > In the later patch, we can use the free_vmemmap_page() to free the
> > unused vmemmap pages and initialize a page for vmemmap page using
> > via prepare_vmemmap_page().
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  include/linux/bootmem_info.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
> > index 4ed6dee1adc9..239e3cc8f86c 100644
> > --- a/include/linux/bootmem_info.h
> > +++ b/include/linux/bootmem_info.h
> > @@ -3,6 +3,7 @@
> >  #define __LINUX_BOOTMEM_INFO_H
> >
> >  #include <linux/mmzone.h>
> > +#include <linux/mm.h>
> >
> >  /*
> >   * Types for free bootmem stored in page->lru.next. These have to be in
> > @@ -22,6 +23,29 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
> >  void get_page_bootmem(unsigned long info, struct page *page,
> >                     unsigned long type);
> >  void put_page_bootmem(struct page *page);
> > +
> > +static inline void free_vmemmap_page(struct page *page)
> > +{
> > +     VM_WARN_ON(!PageReserved(page) || page_ref_count(page) != 2);
> > +
> > +     /* bootmem page has reserved flag in the reserve_bootmem_region */
> > +     if (PageReserved(page)) {
> > +             unsigned long magic = (unsigned long)page->freelist;
> > +
> > +             if (magic == SECTION_INFO || magic == MIX_SECTION_INFO)
> > +                     put_page_bootmem(page);
> > +             else
> > +                     WARN_ON(1);
> > +     }
> > +}
> > +
> > +static inline void prepare_vmemmap_page(struct page *page)
> > +{
> > +     unsigned long section_nr = pfn_to_section_nr(page_to_pfn(page));
> > +
> > +     get_page_bootmem(section_nr, page, SECTION_INFO);
> > +     mark_page_reserved(page);
> > +}
>
> Can you clarify in the description when exactly these functions are
> called and on which type of pages?

Will do.

>
> Would indicating "bootmem" in the function names make it clearer what we
> are dealing with?
>
> E.g., any memory allocated via the memblock allocator and not via the
> buddy will be makred reserved already in the memmap. It's unclear to me
> why we need the mark_page_reserved() here - can you enlighten me? :)

Very thanks for your suggestions.

>
> --
> Thanks,
>
> David / dhildenb
>


-- 
Yours,
Muchun
