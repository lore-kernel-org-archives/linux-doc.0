Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E74FC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Mar 2022 07:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347130AbiCKHZU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Mar 2022 02:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232126AbiCKHZT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Mar 2022 02:25:19 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043361B65DA
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 23:24:15 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id g1so15596235ybe.4
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 23:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qcSIpjSWLhRrlsmQ73YhW910e9trxsztOOdRdWeu+CM=;
        b=DFLmC0sR8O0uNQmc+1zmAeHAvecET0WlDEJnBSKoVFCvkv3cBpuO5WuhVbfB4PxBD1
         ehKR5Dr5xJd4bFYYxUH7U7XMBKmU8rVNjA5dP8bxPIvt+9Xn023rIdzys+Tf1zkgMNIM
         u8Nizo4CdA3QOXfRVdWADCNsO6NDLaFrOBozkSRB6k1RZ7CZxbAh72CPyFUjp5XG+hhW
         43d/dB7B9OSQxh//G4dqCoQj3nbbJBNDPlhXXadcNob9/KocXGMBubjd8bXDQdSSMSV4
         OX41CNxCWNU75dqRaRgbTVS4Jr2kXpcRd5bihFDevGfrlDMr0hjl67lFU23W5cGbSsw3
         RwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcSIpjSWLhRrlsmQ73YhW910e9trxsztOOdRdWeu+CM=;
        b=YZ001lHB1C+sVdlfbUIIs5jkHYbgXlZj2EryLUMxxri709eCdMonyhl90h07ctmXh1
         HPGt4IFlTh2pVpPpLpQNiiZWTtrTp41GiZs5969k5SDDTa3Fut0uIxEgMubYLLcOz6XI
         hukgLT+lGt0X1pwWKjzvQYOMvBHssRQj1wUorzxxizkXu7L57biafsh6re9MiwqxujCU
         rm3TD5mfDK5TpCXFDteLLXIhcPL0Ll5Xjo7MlNK7vd3ZqA4wZIF92n/m9n3Y1Dfum654
         +dffg40HZBKo+kEOTN9Wjya2++0yRfD3W03h+7akugDe1vVU7fLLU19/RTQJW1e6IQsI
         uEkA==
X-Gm-Message-State: AOAM533r9aCb7T2Q8tSSD027tSwABzub4QJcuNXK4qXmdktvbQyMNPWq
        nwUiJdvs1UTxZ44DKHRE7UoPWPiV6+MPjC71VhfLtA==
X-Google-Smtp-Source: ABdhPJxtqLKdhvvwiS5rMHsZrRQUvSdu4UvCC24UiLt2rPUxgxcqOAsceLK3Em3mxZXVMmXs5iN0M+fF7P3DwGHZ+yY=
X-Received: by 2002:a25:d188:0:b0:628:ba86:ee68 with SMTP id
 i130-20020a25d188000000b00628ba86ee68mr6854831ybg.427.1646983455057; Thu, 10
 Mar 2022 23:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20220307130708.58771-1-songmuchun@bytedance.com>
 <20220307130708.58771-2-songmuchun@bytedance.com> <YiY0QkE+efo1hyda@bombadil.infradead.org>
 <CAMZfGtWHZgvFSE0P1LNprcjt0YAvC5XFAz=aUZw9vJFPGzUTbw@mail.gmail.com> <YipuORuIdxq89Lqg@bombadil.infradead.org>
In-Reply-To: <YipuORuIdxq89Lqg@bombadil.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Mar 2022 15:22:29 +0800
Message-ID: <CAMZfGtUybuDSnwQKos7A9zB=WQc_avrFK0eZo3bgeD7tnWzf3Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm: hugetlb: disable freeing vmemmap pages when
 struct page crosses page boundaries
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 11, 2022 at 5:31 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Mar 08, 2022 at 01:03:08AM +0800, Muchun Song wrote:
> > On Tue, Mar 8, 2022 at 12:35 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > >
> > > On Mon, Mar 07, 2022 at 09:07:05PM +0800, Muchun Song wrote:
> > > > If the size of "struct page" is not the power of two and this
> > > > feature is enabled, then the vmemmap pages of HugeTLB will be
> > > > corrupted after remapping (panic is about to happen in theory).
> > >
> > > Huh what? If a panic is possible best we prevent this in kconfig
> > > all together. I'd instead just put some work into this instead of
> > > adding all this run time hacks.
> >
> > If the size of `struct page` is not power of 2, then those lines added
> > by this patch will be optimized away by the compiler, therefore there
> > is going to be no extra overhead to detect this.
> >
> > >
> > > Can you try to add kconfig magic to detect if a PAGE_SIZE is PO2?
> > >
> >
> > I agree with you that it is better if we can move this check
> > into Kconfig. I tried this a few months ago. It is not easy to
> > do this. How to check if a `struct page size` is PO2 in
> > Kconfig? If you have any thoughts please let me know.
>
> Can you query this with a script?
>
> config HAS_PAGE_SIZE_PO2
>         bool
>         default $(shell, scripts/check_po2_page_size.sh arguments_are_allowed)
>

Excellent. I'll try this approach.

Thanks very much.
