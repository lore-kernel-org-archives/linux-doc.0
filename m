Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679CDC43462
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 02:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15A4D613C5
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 02:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhDQC4K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 22:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhDQC4J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 22:56:09 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53989C061574
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 19:55:42 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cu16so12986062pjb.4
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 19:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/WEoH5MRuctyP68fbGzySmbeyx0J6VUcO+fRuz+hj8=;
        b=Lj2mGHsPw4xnwhkesCow25VFlttvdhVf7gVXMvx2REAQ5eoNTmWeeZmsRWOP8ukcGT
         bXq5PU/LuCsL5q8XI9ENTtCDVBjZtJxAHZfdNt2Glm+5UJj9oPsKvMbZ1SGA9/QesFSJ
         4bFWv+gAnz+18Uzqzp1cREyLJp1AlwQS4apo49kvmH7jIHDfBnICtIfzD9RWyuVlgB5q
         soWJBLpSbTZ07UVyuiqQKD5NNHFnP6Y/HLyQd8h/CN781Ffkwv11JBcqm71d9oXpe1hP
         XIOcWTOIUPQfw7Ahtz+GVau8fHlEcMOO83twWZQIRbJeQMcdRkPyzPhHI9AzhixJ7ahb
         /x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/WEoH5MRuctyP68fbGzySmbeyx0J6VUcO+fRuz+hj8=;
        b=Cxw0/9c8qodtOjRAAYWNJh1KE6VeDCNC+Kb/2Jd4yaOHZcnss+0Ax/IfkT04ZM3g4s
         mBcRN5gNvDHwabMlGbNPdp1f6jjiOyAQQcianzamxvdTTRUVkOCaFmiAg5pQgUtlRizS
         RTWPRdKKYeu7tQqkx2r7s0QRmCxAj8PG0GkvE+sbJnEMsDIBxjOptRXqfV2wA9RuRS/o
         LjKbYF0dWSjiAATaIFr3LJchXAWgizJh3MfEQeF87OcQ1c76+g0MN0HA/E/WkV5/r7Lx
         6f2x/OJb9QMhCHrIwtuTKMTHIXAN/icZTinOLUJih+B1xh7mTU/NRscyxcsLv8BXOdHM
         +KJg==
X-Gm-Message-State: AOAM533OoUc9XMdLUcJFY/L3glNJPCg0iVehl0b10vpUUxtxA8iScmI2
        /g3ToYwIGbmmJTzcRUuAPBQA6n+526yHQspJLAyokg==
X-Google-Smtp-Source: ABdhPJyo0SQJTwtVhAbR/o9pr5hxFVyTl15sYNbV4iNKXnF/dkd56VDEhf19oxGcRM5VRKI0xsY8g+aNPGpWA0j/FSc=
X-Received: by 2002:a17:90b:88f:: with SMTP id bj15mr13038117pjb.147.1618628141821;
 Fri, 16 Apr 2021 19:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210415084005.25049-1-songmuchun@bytedance.com>
 <20210415084005.25049-5-songmuchun@bytedance.com> <602af5f8-f103-438e-d88e-2819404b9dab@oracle.com>
In-Reply-To: <602af5f8-f103-438e-d88e-2819404b9dab@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 17 Apr 2021 10:55:05 +0800
Message-ID: <CAMZfGtXpQ1WPRHX27tq++3AqCwUGNna7zvVh2toNDTfHkceY9Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v20 4/9] mm: hugetlb: free the vmemmap
 pages associated with each HugeTLB page
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        X86 ML <x86@kernel.org>, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Chen Huang <chenhuang5@huawei.com>,
        Bodeddula Balasubramaniam <bodeddub@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 17, 2021 at 5:10 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 4/15/21 1:40 AM, Muchun Song wrote:
> > Every HugeTLB has more than one struct page structure. We __know__ that
> > we only use the first 4 (__NR_USED_SUBPAGE) struct page structures
> > to store metadata associated with each HugeTLB.
> >
> > There are a lot of struct page structures associated with each HugeTLB
> > page. For tail pages, the value of compound_head is the same. So we can
> > reuse first page of tail page structures. We map the virtual addresses
> > of the remaining pages of tail page structures to the first tail page
> > struct, and then free these page frames. Therefore, we need to reserve
> > two pages as vmemmap areas.
> >
> > When we allocate a HugeTLB page from the buddy, we can free some vmemmap
> > pages associated with each HugeTLB page. It is more appropriate to do it
> > in the prep_new_huge_page().
> >
> > The free_vmemmap_pages_per_hpage(), which indicates how many vmemmap
> > pages associated with a HugeTLB page can be freed, returns zero for
> > now, which means the feature is disabled. We will enable it once all
> > the infrastructure is there.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > Reviewed-by: Oscar Salvador <osalvador@suse.de>
> > Tested-by: Chen Huang <chenhuang5@huawei.com>
> > Tested-by: Bodeddula Balasubramaniam <bodeddub@amazon.com>
> > Acked-by: Michal Hocko <mhocko@suse.com>
>
> There may need to be some trivial rebasing due to Oscar's changes
> when they go in.

Yeah, thanks for your reminder.

>
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> --
> Mike Kravetz
