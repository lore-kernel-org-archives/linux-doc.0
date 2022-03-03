Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9D2C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 11:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbiCCLQ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 06:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbiCCLQ2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 06:16:28 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851AB1688EF
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 03:15:42 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id g26so9444200ybj.10
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 03:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HoCF6NhxARCr3ueC6ZsYxpx/8H0Eb++Uzi1onIsqoOI=;
        b=vEyMm8AoudFkaUiSf63rN3f+y8qOG2p1y/HS/fJTPu1jm6bL42nRqFnoFdDWk0eOIM
         wCzc7FNE4wVhBJARwJalFPSk2FcLPnKaTOtkSwUef3OgINTy7HXa2sVBxjDJnJ1yGhxO
         WKm0iCHP9rlmjVEacE7KW27nIEUwBj7ExG2KwaoQjzPEbfJmlS+Xw5cY7cLNwtlyjmm4
         8HntGVf2ezfkJ3yHo7X1k8k0/lmA356l/zbX0yaHFNej17DLMOJvyW+LDESdoPZxNby9
         Vqoi+9OzQbmFmQLc5IACX+pgGYjrB4HD5QKAygv6e6vWDCxhVUKDC14SWRqSZYeIuk8I
         SDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HoCF6NhxARCr3ueC6ZsYxpx/8H0Eb++Uzi1onIsqoOI=;
        b=tk4UA6HR4DOYpNEUweL9c/ZNFC+CJPB6mJ6XG48G4Lt/Kyk5gpoPQZB/E3/XG18FjG
         jCVkAcFFIbcyM+R4BtB8g5B3+GDy6NpskaurkCOiGzXFJxk7u3p1j8u7/bi/98EdOo/p
         5LBXPTNfNWruWcs9Hsr7MnZKb5MFlwZkxiA53muDnF5/bTjIM3AYYnWOEStsxfis4zJk
         t1bYDyLBARpftIHPrzogBejfcBIaY4osjmd3Y5JYzebc+I9jEibEe8Ox7FIBmGgK+zzp
         kA4js9j8l2xwzdGFtenW0vcmQkX+/zcXtG6fmcbcqcUgef+jhwN+T0BshzMIoUq/mNGX
         U+Og==
X-Gm-Message-State: AOAM531Wgawvm6ymy77DjREKxh9GEL5b+KeFPHDkAmPT1CUiIiAwO6Bb
        Jh7x57bUc3TjsYTvU2w4XzFPPdqHyfoSj8z32I1B8saPz7jW0Q==
X-Google-Smtp-Source: ABdhPJxaDIq/YEzZwJfm09LBLmjgPY+iewMxbF1kjAykJ3N+XvyUN9PxI2ut1UTmptmNB87P4qQubfrG5JzIp82VraM=
X-Received: by 2002:a25:d188:0:b0:628:ba86:ee68 with SMTP id
 i130-20020a25d188000000b00628ba86ee68mr3937633ybg.427.1646306141760; Thu, 03
 Mar 2022 03:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20220302083758.32528-1-songmuchun@bytedance.com>
 <20220302083758.32528-4-songmuchun@bytedance.com> <Yh/g2BRPZC3370mX@bombadil.infradead.org>
In-Reply-To: <Yh/g2BRPZC3370mX@bombadil.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 3 Mar 2022 19:15:05 +0800
Message-ID: <CAMZfGtUCPAc2Ff7Cg1oxo=JYMaX1GM3HVNvK_Nka+4j5Xg3AtA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm: hugetlb: add hugetlb_free_vmemmap sysctl
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>,
        Adam Manzanares <a.manzanares@samsung.com>,
        Davidlohr Bueso <dave@stgolabs.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 3, 2022 at 5:25 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Wed, Mar 02, 2022 at 04:37:58PM +0800, Muchun Song wrote:
> > We must add "hugetlb_free_vmemmap=on" to boot cmdline and reboot the
> > server to enable the feature of freeing vmemmap pages of HugeTLB
> > pages. Rebooting usually taske a long time. Add a sysctl to enable
> > the feature at runtime and do not need to reboot.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  Documentation/admin-guide/sysctl/vm.rst | 13 ++++++++++
> >  include/linux/memory_hotplug.h          |  9 +++++++
> >  mm/hugetlb_vmemmap.c                    | 42 ++++++++++++++++++++++++++++-----
> >  mm/hugetlb_vmemmap.h                    |  4 +++-
> >  mm/memory_hotplug.c                     |  5 ++++
> >  5 files changed, 66 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> > index f4804ce37c58..01f18e6cc227 100644
> > --- a/Documentation/admin-guide/sysctl/vm.rst
> > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > @@ -561,6 +561,19 @@ Change the minimum size of the hugepage pool.
> >  See Documentation/admin-guide/mm/hugetlbpage.rst
> >
> >
> > +hugetlb_free_vmemmap
> > +====================
> > +
> > +A toggle value indicating if vmemmap pages are allowed to be optimized.
> > +If it is off (0), then it can be set true (1).  Once true, the vmemmap
> > +pages associated with each HugeTLB page will be optimized, and the toggle
> > +cannot be set back to false.  It only optimizes the subsequent allocation
> > +of HugeTLB pages from buddy system, while already allocated HugeTLB pages
> > +will not be optimized.
>
> The commit log or documentation does not descrie why its safe to toggle
> one way and not the other?
>

I thought it was easy to handle the transition from disable to enable
(code is simple).  I might be wrong. I'll try to handle the other side in
the next version if it is not hard to handle.

Thanks Luis.
