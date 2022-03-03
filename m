Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7449C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 02:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbiCCC3l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Mar 2022 21:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiCCC3j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Mar 2022 21:29:39 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A515A1BEA5
        for <linux-doc@vger.kernel.org>; Wed,  2 Mar 2022 18:28:54 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2dc0364d2ceso40220057b3.7
        for <linux-doc@vger.kernel.org>; Wed, 02 Mar 2022 18:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v2tz3AuOoQeFoLXvffTr2cIrrixjHNaOs+XLOL0KCfw=;
        b=Cf/ju3K84F49k8wI7YQgyVYv3aMiVSZ7LUjx6feXZrNHr1cnaJFLUrSSLIwOUaEdtV
         9tVTIXdEla4GZAOr3bbyF+liAgp/0T6++nQbK7rLWODyVm5sULM4XB9QCYXoe73uBXgC
         d+cqehy56gj3gkfnaziTmIW+f6zLOu4MPFhb4ngMlS54sPtUdpqSJrSNZ++HhPn/5t0P
         jymhfGHsOU63FPtX5lGhPABzo6+5Jx+1Q7XxI6QiL6A7HW8EnZkmhCupezBUc+6PRaJc
         3fLtt+boLXSQc1SWIb3suDEZuEkrIlFSBBJ2Y639LLAkGjCYgSJEmjZIiSQ5Zy/X4dv7
         igpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2tz3AuOoQeFoLXvffTr2cIrrixjHNaOs+XLOL0KCfw=;
        b=3Xd/eJ48fGZ3uE69gqj7AXBHOqgI7npk1e4Kl4mRLTnxL8NhiTc3mRVnfg/NntEBNV
         oPEB/yWaabju4Jbbe6UF5dTyQG9NMv9JAH8bDe44MKP/C+oqumuTLq7CnZZ373lgw2xX
         WlwAgSRw4Q4tCefqMRkE3lgAfxWv/X1EKznNZNCbgTqfN/c5kKaYc4XMDn+LrShzs493
         Zz7zAWsAkQi/svDEuNiJelDtw+gPYPFbsXQzA3WQ+ZcZQZMCAOJQSTSzsk8elGgtV6vp
         3dxZjU17BKKn0iTgAShhsQblLunpSDcyS/TfXwne4J/dYqCPxd/48gBAUFIPpGAUCUvJ
         J1nQ==
X-Gm-Message-State: AOAM532L1uaGh6MQYFeTwfQG83I+v2iYN6jKXlna12v6w9M03glbBe4+
        vpEoNqclxV94AO6ovTGJ3avOmvLLeHRif2wGJe/DCw==
X-Google-Smtp-Source: ABdhPJzghYtIErFg1LL0XWlyHrqePiGoOB5PMKNoSnMLd1aQ8LcM0OZbgcs0kzaIvSgwZl0ATRheQRHUCPaCaMM23yY=
X-Received: by 2002:a81:5dd6:0:b0:2d6:3041:12e0 with SMTP id
 r205-20020a815dd6000000b002d6304112e0mr33446832ywb.331.1646274533419; Wed, 02
 Mar 2022 18:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20220302083758.32528-1-songmuchun@bytedance.com>
 <20220302083758.32528-2-songmuchun@bytedance.com> <e0ecfbdf-2d9e-4e2e-f538-fab115eaf4da@oracle.com>
In-Reply-To: <e0ecfbdf-2d9e-4e2e-f538-fab115eaf4da@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 3 Mar 2022 10:28:17 +0800
Message-ID: <CAMZfGtUcGGuq4ZoS44aMAYfYZQk-S-cJap3LZKLS-2fgi_s3Rw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mm: hugetlb: disable freeing vmemmap pages when
 struct page crosses page boundaries
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 3, 2022 at 8:25 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 3/2/22 00:37, Muchun Song wrote:
> > If CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is enabled and the size
> > of "struct page" is not power of two, we cannot optimize vmemmap pages
> > of HugeTLB pages. We should disable this feature in this case.
>
> I'll let you reply to the question from Luis, but IIUC there is no issue
> today as "struct page" is certainly a power of two.  This is more future
> looking.  Correct?

Partly right. The size of "struct page" is not the power of two if
!CONFIG_MEMCG && CONFIG_SLAB on x86_64.  But it is not
a conventional configuration nowadays.  So it is not a critical
problem. I am not sure if a Fixes tag is necessary.

>
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  mm/hugetlb_vmemmap.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index b3118dba0518..836d1117f08b 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -121,6 +121,17 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
> >       if (!hugetlb_free_vmemmap_enabled())
> >               return;
> >
> > +     if (IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON) &&
> > +         !is_power_of_2(sizeof(struct page))) {
> > +             /*
> > +              * The hugetlb_free_vmemmap_enabled_key can be enabled when
> > +              * CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON. It should
> > +              * be disabled if "struct page" crosses page boundaries.
> > +              */
> > +             static_branch_disable(&hugetlb_free_vmemmap_enabled_key);
>
> Should we possibly print a warning here as in the routine early_hugetlb_free_vmemmap_param?  This is called once per hstate, so
> perhaps pr_warn_once.

Good point. Will do.

Thanks.
