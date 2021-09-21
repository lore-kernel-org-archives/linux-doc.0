Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967B8C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 13:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7841A6109E
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 13:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhIUNUx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Sep 2021 09:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbhIUNUx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Sep 2021 09:20:53 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63FCC061575
        for <linux-doc@vger.kernel.org>; Tue, 21 Sep 2021 06:19:24 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w11so3803582plz.13
        for <linux-doc@vger.kernel.org>; Tue, 21 Sep 2021 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ajg0Ic2ukm8TxWyKIQvdzjy3cGeHqBvme3M6FKkuoZA=;
        b=HGwD/sZcgt5qr4TxYezSTU4IuspmeRfGFITiSG1XdNZASgw9A6oNhHA+mIgMtiCD/j
         cRG//IOR0zdNWIubAyx9IRy+WCaZd1YX7EF4pmeA4dKat4PRm+0aeFouvSQFnBesZ6O/
         Oki8ZYDNEd9CK781SyMBqmMzqrXHLYuy9GZoAAjOYPDHoxwqrWB9uE8sCvTH6g4NjeeD
         z7p6y66uyQM2Vodnd3eoGU1GN0Q2cxBDaQ+veJO63iZyD2KVF0Mey8nzQF8R+3Xn1WHR
         S6G670JZc56/whUVlkzvQmc9mfcxrx3JzJLGtJDcJ/V09iT8puTf2Rwed0dJz/sQjyjt
         9vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ajg0Ic2ukm8TxWyKIQvdzjy3cGeHqBvme3M6FKkuoZA=;
        b=f/2Y40TPXmfk906L0oo3EnpZoA7gT3BMz1J4CFpAyw3ip4szfcRjj5OrruKffoVoTk
         W5p7CsGBT2KUItcQg7YZbwMs5jz4yeSEG8hxlpzhPdiyL8Sx8S1lVmCfQ1UQPomtea/Q
         6hajCsvWbZeLd9i0sosYDQrXgmixOFaEcqP0Bp8e+qHdXzo+aeeG08o/I97mzsU6a/Hh
         KXlqejrgJcq6b9hWgWgCzrJgfOQpPmDXtF2uCbqA/vicElW0IeCBsRlhRTWTj9Tzi7ic
         kWGQDk91ywcKHNNmdZpPHC8n/7KYHs2sR9b3/47XQlHI69alNdHZ7elVmc3IXwwznG3G
         D5RA==
X-Gm-Message-State: AOAM5314rxlK73rQ+rQTdc206fxf01ruOK2AJiwGWeEQKXd4squq4gCa
        GVosnpWTSJ/BB0HoSE/3exdUFlrHt99KlApQi6b92g==
X-Google-Smtp-Source: ABdhPJxcdX7KsItciQu84ZL6BpS+9wViC3AR+TZyszy1sSCrru/j8eMSu5j+Lj8iXBDBzB8SmaXh1Rb2Lq85kqqrrBY=
X-Received: by 2002:a17:902:7613:b0:13d:c6f0:1ecf with SMTP id
 k19-20020a170902761300b0013dc6f01ecfmr903911pll.16.1632230364236; Tue, 21 Sep
 2021 06:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210917034815.80264-1-songmuchun@bytedance.com>
 <20210917034815.80264-5-songmuchun@bytedance.com> <CAGsJ_4wW6b5aC4va1_BZuWLqxzRkSi3vLcyJo7XGMbVi8i7iuw@mail.gmail.com>
 <CAMZfGtVtU2zWYJB1U_Q4AMBb5vYysT2MC06qsA5u0T6FrpbW1g@mail.gmail.com> <CAGsJ_4zDKVkXf60d4ZPZjFJBN5L8wR1_57D_EUEzGZWcYhxn=A@mail.gmail.com>
In-Reply-To: <CAGsJ_4zDKVkXf60d4ZPZjFJBN5L8wR1_57D_EUEzGZWcYhxn=A@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 21 Sep 2021 21:18:43 +0800
Message-ID: <CAMZfGtVHriw5jXGJDOCr2pxHmB5SPVPto8yWkZBDmjSw8dcVEQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 4/4] selftests: vm: add a hugetlb test case
To:     Barry Song <21cnbao@gmail.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, Muchun Song <smuchun@gmail.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 21, 2021 at 8:29 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Tue, Sep 21, 2021 at 2:26 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > On Sat, Sep 18, 2021 at 1:20 PM Barry Song <21cnbao@gmail.com> wrote:
> > >
> > > On Sat, Sep 18, 2021 at 12:08 AM Muchun Song <songmuchun@bytedance.com> wrote:
> > > >
> > > > Since the head vmemmap page frame associated with each HugeTLB page is
> > > > reused, we should hide the PG_head flag of tail struct page from the
> > > > user. Add a tese case to check whether it is work properly.
> > > >
> > >
> > > TBH, I am a bit confused. I was thinking about some kernel unit tests to make
> > > sure those kernel APIs touched by this patchset are still working as before.
> > > This userspace test, while certainly useful for checking the content of page
> > > frames as expected, doesn't directly prove things haven't changed.
> > >
> > > In patch 1/4, a couple of APIs have the fixup for the fake head issue.
> > > Do you think a test like the below would be more sensible?
> > > 1. alloc 2MB hugeTLB
> >
> > It is done in main().
> >
> > > 2. get each page frame
> > > 3. apply those APIs in each page frame
> > > 4. Those APIs work completely the same as before.
> >
> > Reading the flags of a page by /proc/kpageflags is done
> > in stable_page_flags(), which has invoked PageHead(),
> > PageTail(), PageCompound() and compound_head().
> > If those APIs work properly, the head page must have
> > 15 and 17 bits set. And tail pages must have 16 and 17
> > bits set but 15 unset.
> >
> > So I think check_page_flags() has done the step 2 to 4.
> > What do you think?
>
> yes. Thanks for your explanation. thereby, I think we just need some doc
> here to explain what it is checking. something like
> /*
>  * pages other than the first page must be tail and shouldn't be head;
>  * this also verifies kernel has correctly set the fake page_head to tail
>  * while hugetlb_free_vmemmap is enabled
>  */

Got it. Will do. Thanks.

> +       for (i = 1; i < MAP_LENGTH / PAGE_SIZE; i++) {
> +               read(fd, &pageflags, sizeof(pageflags));
> +               if ((pageflags & TAIL_PAGE_FLAGS) != TAIL_PAGE_FLAGS ||
> +                   (pageflags & HEAD_PAGE_FLAGS) == HEAD_PAGE_FLAGS) {
> +                       close(fd);
> +                       printf("Tail page flags (%lx) is invalid\n", pageflags);
> +                       return -1;
> +               }
> +       }
> >
> > Thanks.
>
> Thanks
> barry
