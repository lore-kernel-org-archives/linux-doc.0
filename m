Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C691FC19425
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 15:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AD5923770
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 15:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgLIPOX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 10:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbgLIPOX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 10:14:23 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15000C061794
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 07:13:43 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id x12so609996plr.10
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 07:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MH2oBtgG7SM/WEjQVktVm6vzkLZc11BiXccpenn6u5w=;
        b=veTVgAoUehNGrKZIOLlBn2vp5nNt2WZg/o23lwAg/fsGibfKfMJcJw3iWo+tUytQzS
         Q4IKHPYhpizNVCD+7+LDs72sFFQSnpYnN33k3SGvTMThqaycRloc+azGCc4UyljH+T8r
         Lg8DJ+rmLIYj1t4VvDnE9WiGPAYNBrOS1EJEtwPaVe6dIXfaq/fettA58rI8RN7EkBUN
         //DVuFJbb92zLltzHOC7cZlRv7a6Gbm3vuhDYlcp+W8gNyPb3fEAqNtyHwcxQ1Jp3cLT
         g0hiyRFhL6I4ib0Ov1mP/mQNVH3ImSWHVnYAt/LYj94DdLGjf0C/E9rzx3kdj1EvzFM5
         c9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MH2oBtgG7SM/WEjQVktVm6vzkLZc11BiXccpenn6u5w=;
        b=dMITYqLRTguU75rETH/90JiPmBNvVaSBfaNsts5AZkd890kF4ujzzhfViPfPW2S+Pc
         RYE6C1vmxdQQANV+bX2sfct4yv13IaPyWYfOmhJX5y2s80tczxiN7mHIhhqu60bP6BFv
         mgV00rRpb0cVKMwS0zL0QYzjH/mVOKiU/uwo2ImevbzG/URhpHPBqvyuy8l/s0dxSK9X
         LmR97EPEOJUUC8uqOhJG6mupALcD6gqRqTHvnYnFUtirdn1nFStPUnBKi2+m8XNg4Bkx
         on4+duk1cRXexW/X61fcMpXa4GAoF0+3UkIwKn809KfW+3F0R89+k3svF2v6xnR4ngoB
         yk0g==
X-Gm-Message-State: AOAM531Mj4oeDjF1km55oa3LMrOrfUEORLZZMVGwub+m19ErKIyIuvEr
        2zCfFdaLTJcVXwCUcJXBoFEcub7oxH5XVc0NqZodIw==
X-Google-Smtp-Source: ABdhPJzy9V7tyAUDxcV027ueD0F0tNTha+NK7Tvb0IvWRd4/heU72ewIi40CX5slgfRaL4RB5vtjw1qzSz/Nznch+dw=
X-Received: by 2002:a17:902:bb92:b029:d9:e9bf:b775 with SMTP id
 m18-20020a170902bb92b02900d9e9bfb775mr2657733pls.24.1607526822541; Wed, 09
 Dec 2020 07:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <20201130151838.11208-7-songmuchun@bytedance.com> <ba57ea7d-709b-bf36-d48a-cc72a26012cc@redhat.com>
 <CAMZfGtV5200NZXH9Z_Z9qXo5FCd9E6JOTXjQtzcF0xGi-gCuPg@mail.gmail.com>
 <4b8a9389-1704-4d8c-ec58-abd753814dd9@redhat.com> <a6d11bc6-033d-3a0b-94ce-cbd556120b6d@redhat.com>
In-Reply-To: <a6d11bc6-033d-3a0b-94ce-cbd556120b6d@redhat.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 9 Dec 2020 23:13:06 +0800
Message-ID: <CAMZfGtWfz8DcwKBLdf3j0x9Dt6ZvOd+MvjX6yXrAoKDeXxW95w@mail.gmail.com>
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

I want to define a macro which indicates the size of the
struct page. There is place (kernel/bounds.c) where can
do similar things. When I added the following code in
that file.

        DEFINE(STRUCT_PAGE_SIZE, sizeof(struct page));

Then the compiler will output a message like:

       make[2]: Circular kernel/bounds.s <- include/generated/bounds.h
dependency dropped.

Then I realise that the size of the struct page also depends
on include/generated/bounds.h. But this file is not generated.

Hi David,

Do you have some idea about this?

>
> --
> Thanks,
>
> David / dhildenb
>


-- 
Yours,
Muchun
