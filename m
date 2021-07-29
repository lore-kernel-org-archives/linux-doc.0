Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261A4C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 06:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3958601FF
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 06:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhG2GBL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 02:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbhG2GBL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 02:01:11 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6104C061757
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 23:01:08 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so7834736pjd.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 23:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OgD5C61YbZ2KunWoqNcKnBbaf1qoas81IHhBsJLKfSM=;
        b=EnJl/Mx7QLBayu7Yl3kff+Gl9vL7axw9v4cntOhPsXkky2EN/GwFYc2ew6t5qU4Eh2
         Csmn/NjeHBKpt1ddqOD9UIPc6Y+5weNm9lJ10a2LP9l52vxd3KmJvfvv4pjj570xYZ2c
         6vgl2oDqrpEhPiidu4UN+GbhPO+VGurpaDrmVS9H7qqDQt03nEPD7vQzG9hFzVBG+VJy
         DnYKIPV4q9xCH+VnuBu4i9UFgJ8jBXx5mEyr59xxYIz+tHOdIoIR7/eYeKVljfdkTUPm
         VEvq0U525iIPHBay2MJF76CnO47yzAq93gYOmmAZAPnWb5eX0eWjmxxeRzlsq+EV/O1v
         Pp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OgD5C61YbZ2KunWoqNcKnBbaf1qoas81IHhBsJLKfSM=;
        b=cNYx1UJ+ECFj5xUWfwEibTZxjWkWS99puM1nDW42nOdMum7jWkWEPg91mtnf8PS4rH
         OET4JNmRxKpyLzeQ9E3v5f2M4wmIVoyFH/abCGoMjvUV3yYA1yhdKuDgn0CJcCk7qfTF
         BmprBNN/XjgjxwGZVDAhz3ilky5fzYzuYtGJJFmeK4npSAmnSQDADaPyaBIX3f2TcyEt
         LoIpCKIZtKUN1eQggcxDZbsUli5Zfa8AtmJ4Z2t3xYUJjstu+EN16Q4wJaajXcwLO8pI
         CZs1pUlpRroMWJHmaw+4xXHe6UPyl/52ch0WDnjDN7y5Zuu0QayMfFTLVkAXM+ehXU5E
         6uxQ==
X-Gm-Message-State: AOAM5323eVBTbOdd6z2QjaAYK2ENzsbUvClHl925cwIlqM+2qR+1ZJEU
        wbTpQWA9TpO0cO3iTr0okoagFsoMl1W/1ewGVm0KfQ==
X-Google-Smtp-Source: ABdhPJwgmmS8Q6Z8sSqxjFLXS+0lYHCYezXCZpuTpd9HoPdRfyijBwKfbyNCcV13ys534Nfd6x7nsXbkoqv2rbURjVE=
X-Received: by 2002:a17:902:6ac9:b029:12c:3bac:8d78 with SMTP id
 i9-20020a1709026ac9b029012c3bac8d78mr3101247plt.34.1627538468213; Wed, 28 Jul
 2021 23:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210714091800.42645-1-songmuchun@bytedance.com>
 <20210714091800.42645-2-songmuchun@bytedance.com> <cf279a44-2a1a-6385-8230-86e083e11ba0@oracle.com>
 <CAMZfGtUtk9uyO7v0v94YqLaHhrZ-CoFvVH60n54apib7PHPcKw@mail.gmail.com>
In-Reply-To: <CAMZfGtUtk9uyO7v0v94YqLaHhrZ-CoFvVH60n54apib7PHPcKw@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 29 Jul 2021 14:00:28 +0800
Message-ID: <CAMZfGtXmNSg2mNsdG20JDzZofMSdreYOiKCO1WQ+zAEomkozyw@mail.gmail.com>
Subject: Re: [PATCH 1/5] mm: introduce PAGEFLAGS_MASK to replace ((1UL <<
 NR_PAGEFLAGS) - 1)
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 27, 2021 at 2:27 PM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Tue, Jul 27, 2021 at 5:04 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
> >
> > On 7/14/21 2:17 AM, Muchun Song wrote:
> > > Instead of hard-coding ((1UL << NR_PAGEFLAGS) - 1) everywhere, introducing
> > > PAGEFLAGS_MASK to make the code clear to get the page flags.
> > >
> > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > > ---
> > >  include/linux/page-flags.h      | 4 +++-
> > >  include/trace/events/page_ref.h | 4 ++--
> > >  lib/test_printf.c               | 2 +-
> > >  lib/vsprintf.c                  | 2 +-
> > >  4 files changed, 7 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > > index 5922031ffab6..358d3f6fa976 100644
> > > --- a/include/linux/page-flags.h
> > > +++ b/include/linux/page-flags.h
> > > @@ -178,6 +178,8 @@ enum pageflags {
> > >       PG_reported = PG_uptodate,
> > >  };
> > >
> > > +#define PAGEFLAGS_MASK               (~((1UL << NR_PAGEFLAGS) - 1))
> >
> > Can you explain why you chose this definition instead of
> >
> > #define PAGEFLAGS_MASK          ((1UL << NR_PAGEFLAGS) - 1)
> >
> > and mostly use ~PAGEFLAGS_MASK below?
>
> Hi Mike,
>
> Actually, I learned from PAGE_MASK. So I thought the macro
> like xxx_MASK should be the format of 0x00...00ff...ff. I don't
                                           ^^^
Sorry. I mean 0xff...ff00...00 here.

> know if this is an unwritten rule. Please correct me if I am
> wrong.
>
> Thanks.
>
> > --
> > Mike Kravetz
