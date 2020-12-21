Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590BDC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 10:10:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F8842075A
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 10:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgLUKKM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Dec 2020 05:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgLUKKM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Dec 2020 05:10:12 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA84EC0613D6
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 02:09:27 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id 2so8353210ilg.9
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 02:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9oI6PpbsNinrAY/UY/16dtjoAnO4VqhB1tmPSdI/mzw=;
        b=rhSiOJwy3U4u0Kw1EqHDbBvUoYsSF7bEya7dN9TqYVff8KYrfn4UChVh7IQq/1A9Hl
         dAjMNaS84HENeb8/nKBjvZN7gmKZ5lgqJI4lpX58TXd2r4oCuqj4CB7BHPmKKSaLaHoc
         lHMzUSmt9hw8K+yONpy8aFqQ/L4Do1Cwy4ZZR3ZFOnacCdVA1DOo5MzeguNrLwsgsRHo
         gHIvGZr71szBt0uZE3efY7l8C2RF2iWCb351IPFzUuia9o9b5npWOw8JAXptrZz+dY+h
         eHA8JHujNp0vf2XAROIjtg0hYg6zm6xieVMPX69Oh7q1hOHDsB+1qvQt/w4VACFcfLJg
         SL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9oI6PpbsNinrAY/UY/16dtjoAnO4VqhB1tmPSdI/mzw=;
        b=ODb1Ve2IrQGmcs2wKof6FwkvIfFAyk7Sdbjsqvz1RgfDDAafz9aHpCxCAQoHOD1v1e
         a1DrmRgrJkQ++LDM5b2Kv4zmBYrcZYPpuusKJtZ6FaeJRnbtm7fREL/J+4rEIdMfkFIW
         nVbmgiqmI5LBknXvzIg2XOhWwtV/KPWu7uTehLx9KZYe6sJ/ZWAMdUfuUXTMTrSR1xlc
         HIYfHrVfKxRASPbWsZINTqdw+sQxHXiRnpectPLKyYuOnODswjPxINsmcLtpLOG0LbCj
         WEqnjANKxJkX/P9GyQRekH4zpb8roqwWRV57jjufoPgx1SZxc6DmO/yjjZzOQyaXQaFs
         4Klw==
X-Gm-Message-State: AOAM533d6Bv36Poj59o4elEuvz+rwzLpFagFk12fw1lF/R7okW136zVE
        X1B9u+FiN/1jgBjPZaMUSWupkFdO93kqxPSZOvGvSm+8PmTj2Q==
X-Google-Smtp-Source: ABdhPJy5FiyRxWb1/yg6+OenrVe7Jltn8hbV9VjG+MoGHrsui5ke3eBLjJR+w4cjHgORyzwDp0wmtCT4SrAgqQp2DHs=
X-Received: by 2002:a63:1f21:: with SMTP id f33mr14505632pgf.31.1608543266172;
 Mon, 21 Dec 2020 01:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20201217121303.13386-1-songmuchun@bytedance.com>
 <20201217121303.13386-10-songmuchun@bytedance.com> <20201221080414.GA14343@linux>
In-Reply-To: <20201221080414.GA14343@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 21 Dec 2020 17:33:47 +0800
Message-ID: <CAMZfGtUr5NhScQDVF+DzsUHxYVD6vEs+2wEz6SOi-Y84+PXK2A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v10 09/11] mm/hugetlb: Introduce
 nr_free_vmemmap_pages in the struct hstate
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
        David Hildenbrand <david@redhat.com>, naoya.horiguchi@nec.com,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 21, 2020 at 4:17 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Dec 17, 2020 at 08:13:01PM +0800, Muchun Song wrote:
> > @@ -182,6 +184,12 @@ bool hugetlb_free_vmemmap_enabled;
> >
> >  static int __init early_hugetlb_free_vmemmap_param(char *buf)
> >  {
> > +     /* We cannot optimize if a "struct page" crosses page boundaries. */
> > +     if ((!is_power_of_2(sizeof(struct page)))) {
> > +             pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
> > +             return 0;
> > +     }
>
> Unless there is a strong reason behind, I would move this to the previous patch,
> where early_hugetlb_free_vmemmap_param is introduced.

OK. Will do. Thanks.

>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
