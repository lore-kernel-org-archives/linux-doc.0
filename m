Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA673C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 10:17:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A35ED23B79
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 10:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729674AbgLIKR5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 05:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbgLIKR5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 05:17:57 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1ECBC061793
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 02:17:16 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id z12so616801pjn.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 02:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i6nki0stxvDLMDU16G+h85cVFW5HA5XUXV7cTIWJJr0=;
        b=pvUndUzCm8phQVX+DQW2QbqJ6hP9Mo1rCH6uiOZCqqpSNGU9AL8BzqhYf42rozN7IS
         l5Yzs+0CjrRX0Z6S4G66CTxWCnl793hSRan0/U/azt8MSlaLczL2lfXWVh/tF4TE0cMK
         k/Y4ljOcfwGflRPHG/C7BHPw2td3XFUEFUYEVDupOvEb9FhIMV6eI7ZvF1G+BaqnuiWu
         6FfASOuRfrMdUUyOTrK5OtqN11+ZF/sWPIl22uwKKkTupgFH6BAdoV04vtfaqR8FdjQ7
         xlcPF0pW0V6Plql9HIJolEdv59J2SxcKJwjFLEr7gDNWWqzwQYvgLmZCtR9Xld+G24IZ
         6cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i6nki0stxvDLMDU16G+h85cVFW5HA5XUXV7cTIWJJr0=;
        b=tHZPz4xm/P0SGBtXNtoIDgkbx1lUUqWO5K4OFni0MOM0Rti8tIwzokR2YDBH6lWJ2s
         PzM98q+tu3srSzFFKmsfUekOzObv35kqXanxt8fLBR7y7I83PLdpsSbZhL/1JIpPVIYe
         uo5Jx3T3CsPSdGFlBsbqdHtknX19AnQVwvtZwj6aJTQYCu1afBs57KrWk/on5NrhiKMu
         PHMZH7PHImKZOGb4UrOkYV5gSRmI2z+rRGgDivYMUUSsrtknha1ODPwt7Whue9Zib7Yi
         8DwdmQ/sWUHuz9LApDtnfaflIAcvmSkO8dJftOi/myXr69pphRzOU6Tu4og8BEMqSZKy
         Z1bA==
X-Gm-Message-State: AOAM5329AnPTSSeCAGmcklz/GMg7ICZAvPrG/ep4kqhSKU/WWGuGaeKq
        n0aZ9v/ftLBAic7Y8+CyYYBQCJb8bmeAZMZn56vLHA==
X-Google-Smtp-Source: ABdhPJwl0QKoTLMWry62ykQQQg/oA1aCc3XrZuGoJQcckNVK8qnVxEk3a+7jD8/okgrNoYprcRELUScKGF6oOLWx0fQ=
X-Received: by 2002:a17:902:ed0d:b029:da:c83b:5f40 with SMTP id
 b13-20020a170902ed0db02900dac83b5f40mr1585560pld.20.1607509036409; Wed, 09
 Dec 2020 02:17:16 -0800 (PST)
MIME-Version: 1.0
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <20201130151838.11208-7-songmuchun@bytedance.com> <ba57ea7d-709b-bf36-d48a-cc72a26012cc@redhat.com>
 <CAMZfGtV5200NZXH9Z_Z9qXo5FCd9E6JOTXjQtzcF0xGi-gCuPg@mail.gmail.com>
 <4b8a9389-1704-4d8c-ec58-abd753814dd9@redhat.com> <a6d11bc6-033d-3a0b-94ce-cbd556120b6d@redhat.com>
In-Reply-To: <a6d11bc6-033d-3a0b-94ce-cbd556120b6d@redhat.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 9 Dec 2020 18:16:40 +0800
Message-ID: <CAMZfGtV9YnrLTosxz+wj_KEc+17iPWhfKmUB+P4CrKqcN_63dA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 06/15] mm/hugetlb: Disable freeing
 vmemmap if struct page size is not power of two
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

On Wed, Dec 9, 2020 at 6:10 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 09.12.20 11:06, David Hildenbrand wrote:
> > On 09.12.20 11:03, Muchun Song wrote:
> >> On Wed, Dec 9, 2020 at 5:57 PM David Hildenbrand <david@redhat.com> wrote:
> >>>
> >>> On 30.11.20 16:18, Muchun Song wrote:
> >>>> We only can free the tail vmemmap pages of HugeTLB to the buddy allocator
> >>>> when the size of struct page is a power of two.
> >>>>
> >>>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> >>>> ---
> >>>>  mm/hugetlb_vmemmap.c | 5 +++++
> >>>>  1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> >>>> index 51152e258f39..ad8fc61ea273 100644
> >>>> --- a/mm/hugetlb_vmemmap.c
> >>>> +++ b/mm/hugetlb_vmemmap.c
> >>>> @@ -111,6 +111,11 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
> >>>>       unsigned int nr_pages = pages_per_huge_page(h);
> >>>>       unsigned int vmemmap_pages;
> >>>>
> >>>> +     if (!is_power_of_2(sizeof(struct page))) {
> >>>> +             pr_info("disable freeing vmemmap pages for %s\n", h->name);
> >>>
> >>> I'd just drop that pr_info(). Users are able to observe that it's
> >>> working (below), so they are able to identify that it's not working as well.
> >>
> >> The below is just a pr_debug. Do you suggest converting it to pr_info?
> >
> > Good question. I wonder if users really have to know in most cases.
> > Maybe pr_debug() is good enough in environments where we want to debug
> > why stuff is not working as expected.
> >
>
> Oh, another thought, can we glue availability of
> HUGETLB_PAGE_FREE_VMEMMAP (or a new define based on the config and the
> size of a stuct page) to the size of struct page somehow?
>
> I mean, it's known at compile time that this will never work.

Good question. I also thought about this question. Just like the
macro SPINLOCK_SIZE does, we also can generate a new macro
to indicate the size of the struct page. :)

>
> --
> Thanks,
>
> David / dhildenb
>


-- 
Yours,
Muchun
