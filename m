Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC97AC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9322F61445
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238033AbhDUJHb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Apr 2021 05:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238024AbhDUJHa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Apr 2021 05:07:30 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66D7C06138B
        for <linux-doc@vger.kernel.org>; Wed, 21 Apr 2021 02:06:57 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id h11so10494346pfn.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Apr 2021 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+iHXh65iVvo4np4Gau+UG0A6fVjF6OF4qe3iW5dlBQ=;
        b=cKRTNiweZv1CB+TmPXTHEuk/D3q6KRWbOYv26a5/nnRcbXbBa4sRinHzaZqlDw8IPK
         V26zl43Ll4ob/dxArZPWyA4qOpnJxPJk8DjZuABCkaNyS8O8ZsjefM98zQ/WDfNoXHjw
         I9Y4Jb7szrqvY1AsKwIGCc+RpKJHRvfXrbtzOpClqU2kr3qEvAJAWqK7aiwM4w7pEYAc
         N9/GDBfvk/vlEZcV/aayCTXvn5DmtTALGlTwJ2lRrwaZkNLn5ePUmFlVzUMAmu4Dvv9t
         LOWZ6CH+NAODFuCCxob1MO+H9YWAbW1/x6xFI+jX3V8c4KE39RF6vvG/gEqKUp5c5WK6
         f8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+iHXh65iVvo4np4Gau+UG0A6fVjF6OF4qe3iW5dlBQ=;
        b=Oeni8ahs9kGAgng+g6UqdUWTFHdXOP+B5rHY/1phx9XE9lkieMG8GzU9k8JWf32x6j
         vV3Xu5L/A9ApBawenFFeIaMCJacysB3B1GlEGbi2soJOAn7JQ71kdNw+sBFSl08Mx1QT
         6bAse8QHYLfLbWWVf4l4srWQg7R8iMbUIgVUF94r15Bwnl0RqIgkhNp7nvdNRfQbpEte
         VJUuCtKogw1QaDkrvBXrXOJ+elPFCLwknHtC2SD+nCDtiAdoosyd/YY5ofe3P/HJ8umX
         shhKmqVNyvxAGKDs9v9H1jpqoKEQLlqItGC5EE9qlzkz9xBdzHHNtYI/AS+doz2eD1bj
         NcHA==
X-Gm-Message-State: AOAM533hYY9axSYQbLmIa+WJlTdlo0D75XgJvI3phSk/MLuGbQmKKjFQ
        tbDhgiDSuzUfwqJ4gYB+2oJreBienroS5xXyBUvHmA==
X-Google-Smtp-Source: ABdhPJzKNN7n6cCYVH22d3weYBRKCJ+tLw5cB/f+qRUy/RycEPUVGIGD6d0QfahjlqPmJZLfex7L+sVrp7mhdjHX1iA=
X-Received: by 2002:a63:1665:: with SMTP id 37mr21367832pgw.31.1618996017511;
 Wed, 21 Apr 2021 02:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210415084005.25049-1-songmuchun@bytedance.com>
 <20210415084005.25049-9-songmuchun@bytedance.com> <YH6udU5rKmDcx5dY@localhost.localdomain>
 <CAMZfGtXmDhkCWateAR0q_EgRPDmGh_=D-6UuhMd+Si6=TDvghQ@mail.gmail.com> <20210421073346.GA22456@linux>
In-Reply-To: <20210421073346.GA22456@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 21 Apr 2021 17:06:20 +0800
Message-ID: <CAMZfGtWLkYPbz3F-QSNYLOgfwdcTA7iJxG6uvVLCoFtjaBt6nw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v20 8/9] mm: memory_hotplug: disable
 memmap_on_memory when hugetlb_free_vmemmap enabled
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
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
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 21, 2021 at 3:33 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Wed, Apr 21, 2021 at 11:41:24AM +0800, Muchun Song wrote:
> > > Documentation/admin-guide/kernel-parameters.txt already provides an
> > > explanation on memory_hotplug.memmap_on_memory parameter that states
> > > that the feature cannot be enabled when using hugetlb-vmemmap
> > > optimization.
> > >
> > > Users can always check whether the feature is enabled via
> > > /sys/modules/memory_hotplug/parameters/memmap_on_memory.
>
> Heh, I realized this is not completely true.
> Users can check whether the feature is __enabled__ by checking the sys fs,
> but although it is enabled, it might not be effective.

Right. I have done the test.

>
> This might be due to a different number of reasons, vmemmap does not fully
> span a PMD, the size we want to add spans more than a single memory block, etc.

Agree. Thanks for your explanations.

>
> That is what
>
> "Note that even when enabled, there are a few cases where the feature is not
>  effective."
>
> is supposed to mean.
>
> Anyway, I did not change my opionion on this.
>
> Thanks
>
> --
> Oscar Salvador
> SUSE L3
