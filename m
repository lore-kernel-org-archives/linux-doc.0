Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73C7C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Dec 2021 19:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240733AbhLTTPq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Dec 2021 14:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240759AbhLTTPo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Dec 2021 14:15:44 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE65DC06173E
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 11:15:43 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id m21so15334797edc.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 11:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XOYpkeAZ4lS3WnEUy/1la113N2UrQqSbbd4SmFdrc3c=;
        b=VFuYtAogQUUW1la4HqjicPNsqrgCWU4/5xCFL72zEN7r69TP/+ggb7YvA4E4nU7A0V
         PG6BDVDx9pa0XqFL6wSv9je24PF6AL3JtvSqJZAgHX9NpbG1f/CgePslYfGcEk8jq04L
         M+drnq/DXH4piOVaDEvFA5qWefrgkDK6VCuZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XOYpkeAZ4lS3WnEUy/1la113N2UrQqSbbd4SmFdrc3c=;
        b=SO2SccU61b0Wybd5/c1EXk2MCfUMnvlMx5P2ZGe0IzdjipXwtqLIXy54IiG05McPm+
         oMsaTzLdG+1U4RnxfIaQRF75MDxVzwgQ5uD76ahGv+SoHj2UKey2TDs3KGfLKJO37P8O
         MFedRs0J4PrFCvErWwYWfgpb3ylUYSp7rSOUQqE9s6AiaT02TxyhS344nk07ZhcHbD8O
         o6PnF2GNKkgoNorU+mOF2GpsZh2RftUxei36a89N83GHQCd0E14IejUSfS0mS5vU6M4p
         U5NxcYEWgLkPVAki/Ldueb5Q51XE2boNmh8iTaVQ13slVHzFxjBVmJwdT3yW/tyEk6v9
         dm1g==
X-Gm-Message-State: AOAM530WI5OHriFLpL/+qlkXt9SFyZc0J+AgwXeHDKQhh43hD61tXsuD
        wxVh5QDeftkyTPmCO3zR5WizRe05vojAmACc4No=
X-Google-Smtp-Source: ABdhPJxBCgNEbrxvkUmiTihX5rtujfB+/lR1zvaWuG17E6T0Ktgizi/BFckL5nW7/TS8SO0ZmIFSCw==
X-Received: by 2002:a50:ec10:: with SMTP id g16mr11983858edr.20.1640027741749;
        Mon, 20 Dec 2021 11:15:41 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id s3sm5631277ejs.145.2021.12.20.11.15.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 11:15:41 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id i22so22040215wrb.13
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 11:15:41 -0800 (PST)
X-Received: by 2002:a5d:6211:: with SMTP id y17mr2491550wru.97.1640027730630;
 Mon, 20 Dec 2021 11:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20211218184233.GB1432915@nvidia.com> <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
 <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
 <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com> <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com> <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com> <Yb+gId/gXocrlJYD@casper.infradead.org>
 <YcDNaoGcGS6ypucg@casper.infradead.org>
In-Reply-To: <YcDNaoGcGS6ypucg@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 20 Dec 2021 11:15:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj+HbN0Ai+M2ABBvWnNKd2+J97kYPOsjwJC6o9xRF9jHw@mail.gmail.com>
Message-ID: <CAHk-=wj+HbN0Ai+M2ABBvWnNKd2+J97kYPOsjwJC6o9xRF9jHw@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     Matthew Wilcox <willy@infradead.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Nadav Amit <namit@vmware.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 20, 2021 at 10:37 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> This might be a step in the right direction?
>
> Subject: [PATCH] mm: reuse_swap_page() no longer needs to return map_swapcount

Well, that patch seems to be a no-op removal of dead code, so absolutely yes.

That said, I think it would be good to split it up. I looked at that
patch and went "is that really a no-op" to the point of recreating it.

I think it would be good to make it multiple patches that are each
individally trivial. IOW, start with

 (1) remove second argument to reuse_swap_page() that is always NULL,
without making any other changes

 (2) that now made 'total_mapcount' unused in reuse_swap_page(),
remove it as an argument from page_trans_huge_map_swapcount()

 (3) that now made 'total_mapcount' unused in
page_trans_huge_mapcount(), remove it as an argument there too.

because as it stands, that patch of yours looks like it is changing a
lot of things, and I think it would be clearer to remove one thign at
a time as it becomes obviously not used.

Hmm?

           Linus
