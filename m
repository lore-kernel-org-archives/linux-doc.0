Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E746EC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  8 Oct 2021 21:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD21C60F92
	for <linux-doc@archiver.kernel.org>; Fri,  8 Oct 2021 21:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243380AbhJHVPH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Oct 2021 17:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbhJHVPH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Oct 2021 17:15:07 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4712C061570
        for <linux-doc@vger.kernel.org>; Fri,  8 Oct 2021 14:13:11 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id np13so8494632pjb.4
        for <linux-doc@vger.kernel.org>; Fri, 08 Oct 2021 14:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F0j9Fen+aM1yxtAVTmt6zwsss9sN5UsLCk44GHH1tRc=;
        b=I+McrbgmDL8gZ9vmtX1aR7+zkzhDrlHhXT6iEzjY4OCKkruLZDBi+tzb3viHWvPBBY
         kW2Us4im1MyQTWLJHDidgCouWJsWR1fzIwUGgK8+FBItkM6TWjIfpDSi5vv4VKXHDqoI
         OyfVYPUddfURQDYvCN/P/GevbyB1QLdePw59Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F0j9Fen+aM1yxtAVTmt6zwsss9sN5UsLCk44GHH1tRc=;
        b=ZhQ1FL0IcBK0yxpMDwWzgLm5bzIuQuzAn5u8jsr7tZdjK/82ird/I6Y9KNGMKdrNix
         sDAdqyXrT30KhhPFVzogl+IBiZwdbS3HskpN7Wg4SHJRNtipV2gSAgIIPWYB6Ljpd0zS
         dDfsM0GAm6ZZBeEOgTiR6qvrhLeEnPLV11BGNdeqVuQmH67V6GxNI72GBH1TxxgtPjsN
         FGbFWzM4CNXZhxCIWuEfa+tIZVeE4l5LWpNdXfrQick0clgzOzuBMbck4X4YRYVpjYPe
         JtQD/z8AQdP94eUejlcdEHzitok0NQcyuyT7j7dGIoym4UCrdoIpnfTjqH+SdDpeotw0
         PYkQ==
X-Gm-Message-State: AOAM530pVyfo9C2OMUGbvo7Kms91Nn9gu4oL57SybzwD7JIyU5WiCsuo
        0Jyc+3SC3qnlRzGWjZ0bvQMTjA==
X-Google-Smtp-Source: ABdhPJzKqh8cplGZb7R2umhTGHifh9Yt7Lk84Rr0o+/sxMRQibhJwMtOnRqKr/aL33Vlwtg7KQQOpQ==
X-Received: by 2002:a17:902:7043:b0:13e:1007:3d6d with SMTP id h3-20020a170902704300b0013e10073d6dmr11395704plt.79.1633727591177;
        Fri, 08 Oct 2021 14:13:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x7sm233598pfj.28.2021.10.08.14.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 14:13:10 -0700 (PDT)
Date:   Fri, 8 Oct 2021 14:13:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        John Hubbard <jhubbard@nvidia.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Michal Hocko <mhocko@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Peter Xu <peterx@redhat.com>, rppt@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vincenzo.frascino@arm.com,
        Chinwen Chang =?utf-8?B?KOW8temMpuaWhyk=?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        Chris Hyser <chris.hyser@oracle.com>,
        Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Subject: Re: [PATCH v10 3/3] mm: add anonymous vma name refcounting
Message-ID: <202110081401.7AB25E4@keescook>
References: <CAJuCfpGp0D9p3KhOWhcxMO1wEbo-J_b2Anc-oNwdycx4NTRqoA@mail.gmail.com>
 <YV8jB+kwU95hLqTq@dhcp22.suse.cz>
 <CAJuCfpG-Nza3YnpzvHaS_i1mHds3nJ+PV22xTAfgwvj+42WQNA@mail.gmail.com>
 <YV8u4B8Y9AP9xZIJ@dhcp22.suse.cz>
 <CAJuCfpHAG_C5vE-Xkkrm2kynTFF-Jd06tQoCWehHATL0W2mY_g@mail.gmail.com>
 <202110071111.DF87B4EE3@keescook>
 <CAJuCfpFT7qcLM0ygjbzgCj1ScPDkZvv0hcvHkc40s9wgoTov7A@mail.gmail.com>
 <caa830de-ea66-267d-bafa-369a6175251e@nvidia.com>
 <b606021e-0afa-a509-84c4-2988d77f68bc@rasmusvillemoes.dk>
 <eb9fd99e-177e-efe6-667c-f5ff99ad518b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb9fd99e-177e-efe6-667c-f5ff99ad518b@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 08, 2021 at 09:43:59AM +0200, David Hildenbrand wrote:
> I'm going to point out that we already do have names for memfds.

I just did the same here[1]. :P

> [...] It's also displayed in /proc/self/maps.

I missed that part! /me screams forever

We really need to filter this at creation time. :( At least
seq_file_path() escapes "\n" for it, but not "\r", so humans on a
terminal could get very confused...

$ ./memfd '^M0000000000000000-ffffffffffffffff rwxp 00000000 00:00 0 [stack]' &
[1] 2953833
$ cat /proc/2953833/maps
...
0000000000000000-ffffffffffffffff rwxp 00000000 00:00 0     [stack] (deleted)
...


-Kees

[1] https://lore.kernel.org/lkml/202110081344.FE6A7A82@keescook

-- 
Kees Cook
