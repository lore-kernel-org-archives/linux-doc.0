Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50463C433E6
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 13:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B6DB64FE7
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 13:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbhCKNA6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Mar 2021 08:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhCKNAj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Mar 2021 08:00:39 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11F0C061574
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 05:00:39 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n10so13627965pgl.10
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 05:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICClhXTxVfeDP5mVm1fYPC9myvROzb0Cj0NknzNNdKs=;
        b=FNWkqzAOnObAD9/0sUTGtXYMiNmrmS8FJP++ikoDpY2J5iqbCSDXmEDaZHkPYz3FXL
         /3sUWNHTxqVd5BmYP7/gMMHemNaYCOzzjhMY3Y3/cy5denRGwPb6GXyBN+mTXKpbPJ63
         d1QZ9NojXcrEpGmXU+F8r9B90LJtBHRBqKqjYO+CBZjGNeUj0SZv6y2XGals1rh/QGpJ
         rRnhDR8bevFcuRXA8sM/7nxYwhMkjPWFiEHD6DDlo+DIMXqP5UYYyF7RvhuntNeX0uV7
         +lbw12eHhpCMdlJ4OfITM2qsSCGj8Nia4SGTMhaUsWxOKnXitSkW05QekiAa/VwUb9zN
         zakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICClhXTxVfeDP5mVm1fYPC9myvROzb0Cj0NknzNNdKs=;
        b=ljcMvNcrFdvsgrdTdVL4x9HT9tNvERassqzTuI9Zg/6L6y0PYD2ZcvAApML1KQzQ2N
         +fKuTlYFnLs1aDmeymZcrWqd7EstlN7QQnzMq5X6p5a8xI/9PNcepFjFFw5lnmv0E92+
         mtoId5CJ0Sg6/QIJwhZsHTGfQypkN1PgHr2QkU7rOU3cq40kbblfn/iUMttFsqBvTmTU
         /FiLdsKCXKxfZA0L7Voezm9hv+chGnDbhiqlyR2G3d5xswRB9iMA8m6lESSXiR7iiadH
         Nbub5A66/MIWhPr1MmKj5Hm6BMetePNzOHLChao2KbAl/P267Guw2SDjfjqPRAiXjFDD
         xaew==
X-Gm-Message-State: AOAM5311EMKfmDEOZYiajNwCUPRFM2VmwMEihLw+v5UTtIdAso0zbs1Z
        cj5pvhBgFBPIkreZ8vXeMgNxmoj67JzZjk54R+KSzg==
X-Google-Smtp-Source: ABdhPJxyzvuPcaF1NhUhc4M3D6E0KoDRfcfVCFt8gZR+bL7CluOq6WyYxviIqRjhulE609IOhIf8Gf0BgyaPXq/cOKA=
X-Received: by 2002:aa7:9e5b:0:b029:1f1:5ba4:57a2 with SMTP id
 z27-20020aa79e5b0000b02901f15ba457a2mr7614145pfq.59.1615467638784; Thu, 11
 Mar 2021 05:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20210308102807.59745-1-songmuchun@bytedance.com>
 <20210308102807.59745-10-songmuchun@bytedance.com> <YEjoozshsvKeMAAu@dhcp22.suse.cz>
 <CAMZfGtV1Fp1RiQ64c9RrMmZ+=EwjGRHjwL8Wx3Q0YRWbbKF6xg@mail.gmail.com>
 <YEnbBPviwU6N2RzK@dhcp22.suse.cz> <CAMZfGtW5uHYiA_1an3W-jEmemsoN3Org7JwieeE2V271wh9X-A@mail.gmail.com>
 <YEnlRlLJD1bK/Dup@dhcp22.suse.cz> <CAMZfGtX3pUmPOY1ieVQubnBKHZoOxfp-ARsPigYZpc=-UiiNjg@mail.gmail.com>
 <YEoKJYzP8//qVebC@dhcp22.suse.cz>
In-Reply-To: <YEoKJYzP8//qVebC@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 11 Mar 2021 21:00:01 +0800
Message-ID: <CAMZfGtXOT0rjcS3UUBQ2_UC7nD7yuP1eGwbiV+KjjhN4icU4fw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v18 9/9] mm: hugetlb: optimize the code
 with the help of the compiler
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

On Thu, Mar 11, 2021 at 8:16 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 11-03-21 18:00:09, Muchun Song wrote:
> [...]
> > Sorry. I am confused why you disagree with this change.
> > It does not bring any disadvantages.
>
> Because it is adding a code which is not really necessary and which will
> have to be maintained. Think of future changes which would need to grow
> more of these. Hugetlb code paths shouldn't really think about size of
> the struct page.

Got it. I will drop this patch.

> --
> Michal Hocko
> SUSE Labs
