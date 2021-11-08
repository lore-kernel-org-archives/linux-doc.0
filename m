Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2C0C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  8 Nov 2021 08:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEAA3610A0
	for <linux-doc@archiver.kernel.org>; Mon,  8 Nov 2021 08:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237857AbhKHIUN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Nov 2021 03:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234561AbhKHIUM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Nov 2021 03:20:12 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EA3C061570
        for <linux-doc@vger.kernel.org>; Mon,  8 Nov 2021 00:17:28 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id v64so41345330ybi.5
        for <linux-doc@vger.kernel.org>; Mon, 08 Nov 2021 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5oR4Pjfl2f9V3U4NznnV9nmWC35FYhUexm9JqQPUc8=;
        b=1l41nRhnO7I1eGxP/c68wJ5DBQ0XGJ8lN5DMwqlVc/7TN/zU+ltPwjk8SMVijZZr43
         eAte3DcmoUJbVu6tTD67QKQxITk86RNdt1g3Iu9FVzXm1igJcyVg1zFefew5YtEvohju
         DRw9pjf6fuoYB6rSQ8M9J1F9y0fyTeFEz2ORBG/PWuvC0w/4zGUxJhEHmbrSGpllYJrZ
         GCa7cRNQl3xJL+Wissy/mStNpQzol9QX+pnfBbfBQFW7P64oOvBsmAMWOw7sNgFIt9lI
         Ht+HHwOot42mQ0ttkylEG/2dYgeGM8ch28daWUmtADUH/XOC+9ngAAySIn3u9tAGZOms
         lH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5oR4Pjfl2f9V3U4NznnV9nmWC35FYhUexm9JqQPUc8=;
        b=fGZcBM86/p7GR904wi8t5MwFfINi8mCvKrrHswe2B4f5foc0EGGjPCQvHS0lD7dx/s
         OOcbvLrSD2hdwaOwYo8Zp6lMxmQSjYi9GY9OK3hcZ0tE4w5+sp9NjcZ/qSoB7g4E1B7r
         kYOCn9gKdCkcbG/Ii1MgqLTPlGezIWhaUi5umvHiNqruSG30qJE6AwUn8+qVP5zPr3DQ
         aca1wsMy6csYbhup1LhIqkavLx1hvdFP4Wm1qP50t3h7aXzp2N8yaeoHDn8Mbqghn1gh
         eP4elE0h/Rx8c8Cgg1KzDmjnTmwPVhSrDUfL3hpSW4acSL7M38TUgBnwQJAsXOm0HmMZ
         lQIg==
X-Gm-Message-State: AOAM531DfnTHqdGALyQrJJbEuqD/SWguiCFw3eZUpSafh/uoXYUyxz0R
        n+MWymZCEhs4k67wK3o4OTx43jvYbp87h4fTy8zdIQ==
X-Google-Smtp-Source: ABdhPJwmhfFlfIbBhUPOG+fkwXvAiAmkbEzb2MCS5TsfMgmxfcPioM+5zjlOaUdX46bcUTxs4a1OEJUOaxjqDID9e70=
X-Received: by 2002:a05:6902:1342:: with SMTP id g2mr74674633ybu.419.1636359448098;
 Mon, 08 Nov 2021 00:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20211101031651.75851-1-songmuchun@bytedance.com>
In-Reply-To: <20211101031651.75851-1-songmuchun@bytedance.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 8 Nov 2021 16:16:50 +0800
Message-ID: <CAMZfGtUeL45=WG3ceaZ_tALMGZTLtuD9jbfKEzeQv270OnaLYQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Free the 2nd vmemmap page associated with each
 HugeTLB page
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Xiongchun duan <duanxiongchun@bytedance.com>,
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

On Mon, Nov 1, 2021 at 11:22 AM Muchun Song <songmuchun@bytedance.com> wrote:
>
> This series can minimize the overhead of struct page for 2MB HugeTLB pages
> significantly. It further reduces the overhead of struct page by 12.5% for
> a 2MB HugeTLB compared to the previous approach, which means 2GB per 1TB
> HugeTLB. It is a nice gain. Comments and reviews are welcome. Thanks.
>

Hi,

Ping guys. Does anyone have any comments or suggestions
on this series?

Thanks.
