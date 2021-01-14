Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFFDC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 02:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5244523719
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 02:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbhANCwM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 21:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbhANCwJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 21:52:09 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAFFC061795
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 18:51:29 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id c22so2762279pgg.13
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 18:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vnXni1b9tGMKZsQyD1Z1Ra0F8lPxT5GkFopMevAsTu0=;
        b=pYQzB/dtAMuKglYrXj3uUgOV5H3ciR8TqPH6rKxps2HsuY0YD/UJTUTueQ924tV67x
         /nw9HW/y7yM+IdcquuDd6rg0qCOTGAyKdU4QdA3NnmK2VgnbP1SwW/2eIJr/f2z/KGg3
         bxaEmS+PxFNRC3IjXGCYARb+tqBpoGLgDEK08LhlF/nnflVP+RHfgNAXtArQ4karKE7V
         1TIbb8WdwuwY5l8k2HsX3cL+81dk1PaDAOTWANacxhnKOAW9UFbwmkA6bUQVA5Vjdo+A
         pyr2iP7Phr7B2FPaJRCikMvev+yUXrThxLpEMR9/Xve5A6Ks/H+mR80dJk1Nma2a+mlB
         shrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnXni1b9tGMKZsQyD1Z1Ra0F8lPxT5GkFopMevAsTu0=;
        b=TWTyid5D8up3y2dXq/+k8Lz1HZIbRq8mc0qEN2MwvC20IC8G6Z1JBUePSqGvWj9gB8
         jZy1mFK6W7qQJYlH1D4qXajJupx4Nq69ESKrBnet5Ah2EaT67abrPy98D57wJDWQVkLh
         +Vn4kekICzxbAacKE0lxs+bi1GqRtAKT0TsoJVFiENRfBHRTbWZuIwNuEnhcuIo4DBAd
         DdRIFYOrMXxzIDkZ+P+UoNc+luyJIsME82fWlPFISWhra2qcp690V95d6+rYxqNy4La9
         wdXawkXfb6Xe84ErefzrfT10k4zpFUP+UKSidYI5IgbPYYswoUtJ8Q5lcecEyMn1twcB
         Q5EQ==
X-Gm-Message-State: AOAM5307B10Qmn8/F9zE7oAJnUlUQcVO6x6iUYNFgme5xI36Juc64l9O
        quID2TEdM83IVZSahXyfHLHdThWKG9mBMRpbAQK6Yw==
X-Google-Smtp-Source: ABdhPJwLV2qDiUvnfgyZ4ayaL3nSZneYZNcN8beH+tlzxWuA16IAcL/EsRR5kgOQtXyBkHSnxPqgyqr59MPA1D9rT60=
X-Received: by 2002:a63:480f:: with SMTP id v15mr5111575pga.341.1610592688709;
 Wed, 13 Jan 2021 18:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20210106141931.73931-1-songmuchun@bytedance.com>
 <20210106141931.73931-4-songmuchun@bytedance.com> <65b2103d-6198-3380-d36e-17dd774359bd@oracle.com>
In-Reply-To: <65b2103d-6198-3380-d36e-17dd774359bd@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 14 Jan 2021 10:50:51 +0800
Message-ID: <CAMZfGtXUx5y80f5JSgTnDdLUDouiKkWGy=b8R3OrNW8WCOr=hw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 03/13] mm: Introduce VM_WARN_ON_PAGE macro
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
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

On Thu, Jan 14, 2021 at 6:31 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 1/6/21 6:19 AM, Muchun Song wrote:
> > Very similar to VM_WARN_ON_ONCE_PAGE and VM_BUG_ON_PAGE, add
> > VM_WARN_ON_PAGE macro.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  include/linux/mmdebug.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> I was going to question the use/need for this macro in the following
> patch.  Looks like Oscar has already done that, and free_bootmem_page
> will now use VM_BUG_ON_PAGE.  So, this patch can be dropped.

In the previous version, Oscar suggested I use WARN_ON instead of
BUG_ON. But he realised we actually should use BUG_ON in this
version. So I will drop this in the next version. Thanks.

>
> --
> Mike Kravetz
