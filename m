Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A9CC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 06:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D10E561107
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 06:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhKJGVz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 01:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhKJGVy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 01:21:54 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F32C061766
        for <linux-doc@vger.kernel.org>; Tue,  9 Nov 2021 22:19:07 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id g17so3641783ybe.13
        for <linux-doc@vger.kernel.org>; Tue, 09 Nov 2021 22:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IjUT8zCp2aLFMQgSGnAyzSy9afXTEGUeSUT1uAZ7PO8=;
        b=v9Y/NbJGrZHSlykl99QODQr2L+E6A/yXZBeBI6qkRCLgq3bsOIp2K86NV5/7A2MCWO
         W5iIvM32RREMYIexhAKSHaabulV+5QCary78yorn8Bdqf/JV/KR5nDVwXmrIkMnAVJtp
         lJb5H2+JwqrgqysOJXa7oZtiNWZmz+3weCON1t/D7ptQpsGxFYpL1nPfmAevqYrLpxGX
         B3tzSoNjBm/UbNWh6Z44JTfXa4c8SsYCIcb8hnczY++B5QoKj2palcQ+u+q4n/PuU/I7
         /hcmU920o2jq57EE9RKaBfIgnHI3xyRpsZf/mzDfVAj45qDsEup1eaHpm648d/IJ+diT
         7eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IjUT8zCp2aLFMQgSGnAyzSy9afXTEGUeSUT1uAZ7PO8=;
        b=3YT/GGENwxaqmrGKhvh+j5mMUVjfiSgQYYMiu3YHejQ5u5bmE3VpLXfgM5CtD15drJ
         jCuxvC/DYfmkUCr/ERsraPcHGvlUpU88X0ooR/XCQYvz6e6jEqqJznmPI75WnBNF73mR
         6qEoU8Ix5tFrWk72ABubaM0xiAJWGF/nFSTySRUem3t222AdB81Tv8ADp3spfg/shi9X
         Ay7VtjPhWGkjWqZ6rv8vjXYZcmi6ilMXaVRYNubY1ysKA4OJaTreMMFzpOelgPmsBKDZ
         tT9ishfISyg6LhI5j4zhzvZ4LXSmNciLyn1I/Zs+/7/0wBk8LzQnt0R6NGCH20EnJA4M
         6img==
X-Gm-Message-State: AOAM533VlJcyA2m9IS9jBCsmyYg6r5iqYnYsHR5GlN/Dc4fsLWy0GbPE
        VZNMXahbR2S/blsS8EDLlWD51UohXKiF2ygGkI7ckA==
X-Google-Smtp-Source: ABdhPJyohPEpBCsDPpumT7620p3FFrCbW0oBZn8eKqR9DCKf+/LwgW+c7aCl7L981TDd4Nbz5zjOd52C8OBlwTDibwo=
X-Received: by 2002:a25:ef0b:: with SMTP id g11mr14790116ybd.404.1636525146779;
 Tue, 09 Nov 2021 22:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20211101031651.75851-1-songmuchun@bytedance.com>
 <CAMZfGtUeL45=WG3ceaZ_tALMGZTLtuD9jbfKEzeQv270OnaLYQ@mail.gmail.com> <35c5217d-eb8f-6f70-544a-a3e8bd009a46@oracle.com>
In-Reply-To: <35c5217d-eb8f-6f70-544a-a3e8bd009a46@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 10 Nov 2021 14:18:28 +0800
Message-ID: <CAMZfGtW=e___8kpe1B5a1rK+SV63bP_Nwucj89QKaX4ZOMUpaw@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Free the 2nd vmemmap page associated with each
 HugeTLB page
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, Muchun Song <smuchun@gmail.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Barry Song <21cnbao@gmail.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 9, 2021 at 3:33 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 11/8/21 12:16 AM, Muchun Song wrote:
> > On Mon, Nov 1, 2021 at 11:22 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >>
> >> This series can minimize the overhead of struct page for 2MB HugeTLB pages
> >> significantly. It further reduces the overhead of struct page by 12.5% for
> >> a 2MB HugeTLB compared to the previous approach, which means 2GB per 1TB
> >> HugeTLB. It is a nice gain. Comments and reviews are welcome. Thanks.
> >>
> >
> > Hi,
> >
> > Ping guys. Does anyone have any comments or suggestions
> > on this series?
> >
> > Thanks.
> >
>
> I did look over the series earlier.  I have no issue with the hugetlb and
> vmemmap modifications as they are enhancements to the existing
> optimizations.  My primary concern is the (small) increased overhead
> for the helpers as outlined in your cover letter.  Since these helpers
> are not limited to hugetlb and used throughout the kernel, I would
> really like to get comments from others with a better understanding of
> the potential impact.

Thanks Mike. I'd like to hear others' comments about this as well.
From my point of view, maybe the (small) overhead is acceptable
since it only affects the head page, however Matthew Wilcox's folio
series could reduce this situation as well.

Looking forward to others' comments.

Thanks.

>
> --
> Mike Kravetz
