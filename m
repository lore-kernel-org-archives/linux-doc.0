Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABC5C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Sep 2021 15:52:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B270360F6B
	for <linux-doc@archiver.kernel.org>; Mon,  6 Sep 2021 15:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243403AbhIFPxk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Sep 2021 11:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243386AbhIFPxj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Sep 2021 11:53:39 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C9FC061757
        for <linux-doc@vger.kernel.org>; Mon,  6 Sep 2021 08:52:35 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id a93so14380117ybi.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Sep 2021 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/bgcmHKDn3LorkuSVcyCAc/MMYfBn+zOMCmk2ZUB6aM=;
        b=olm2PhGCTEx8jQKQDPim0F/G0tBroK7mfgYdUepqc+UelRqSX/GROVmY2M3UCa0lob
         Vljs4WXF/BrdWjVIYgzg4cHFZ5N3sLEb4jPJ8VHqmMqO0WIJ7jMdOvI7xve98ywgsEmk
         EJ+yoAt2Mwy2iuR9zQuXuWrMK5753BkiByyq7AqIO9hK2DPVV1IeUeZNeZ9AZ4W3GdHt
         Ys+bDqqEUpRXHYUH2HmtmAv4xb0GKy4kmP1/5emiSbc9kHoTUoanAAe7XrLQRbhDn5CA
         8xhWkM+3BdIWs3T0IY3LbfaCLto0Jy/FxqN+q+PyMvj7bDJY5Gr7MuaL3DwjC39N8BLS
         h9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/bgcmHKDn3LorkuSVcyCAc/MMYfBn+zOMCmk2ZUB6aM=;
        b=ee8YxeknqRXa8CA1nHTg2YLplTgW1biVDjSPP0iTEWyRjSe1KzowRTgwgiJgvtcBzp
         I3Vxx4eV2HexQ7lEyvNmGhtspp41rZ8wJsd6LN+4VsOk0xfRD4uRZHrsMTdYtb20bDBu
         +IbJVrs6O52yPp517ErDou0s5yyQz3aGtnEw5Rd8WCsvhC2U3yCsiUOA7BJF56t6dpAc
         0CY8KJEhxw0SSNKaff/8bUlprryaKiF+3eTYhhcZuGhsWRbWZ6NvrodgxBBPcJOOKWz+
         1M0636tnnH2QIBddVYZzTK+bn3tnZLmP5m3YXi9buD8DYvbIKnytIz04c5/+Cz2nJL7e
         YI/A==
X-Gm-Message-State: AOAM532VNutawIpHD/elK2v6TGwiMjh7pRaavCJvvHGT9F1ltlurkRN4
        0ydgaUSCZJY6+AWRKXRrUsJkGE/xTG/ym1oDTpoGjA==
X-Google-Smtp-Source: ABdhPJxgYWk6hy+mdeQO4de4+4PREXPTlKpeaHpkquia6aZN9siSokaYw+RKTlqY3cv1THELavVZ+hiDZKAMXGk9cW0=
X-Received: by 2002:a25:b9c8:: with SMTP id y8mr18444413ybj.487.1630943554077;
 Mon, 06 Sep 2021 08:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210902231813.3597709-1-surenb@google.com> <20210902231813.3597709-2-surenb@google.com>
 <202109031420.2F17A2C9@keescook> <20210905130418.GA7117@localhost>
In-Reply-To: <20210905130418.GA7117@localhost>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 6 Sep 2021 08:52:23 -0700
Message-ID: <CAJuCfpH9o=SPE=vspc-o8mFomyg_LZsx7OQtzSQh91pTwKH6Mg@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] mm: add a field to store names for private
 anonymous memory
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
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
        =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        John Hubbard <jhubbard@nvidia.com>,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        chris.hyser@oracle.com, Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 5, 2021 at 6:04 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > the process is still running, so it has to have some sort of
> > > synchronization with every layer of userspace.  Efficiently tracking
> > > the ranges requires reimplementing something like the kernel vma
> > > trees, and linking to it from every layer of userspace.  It requires
> > > more memory, more syscalls, more runtime cost, and more complexity to
> > > separately track regions that the kernel is already tracking.
>
> Ok so far.
>
> > > This patch adds a field to /proc/pid/maps and /proc/pid/smaps to show a
> > > userspace-provided name for anonymous vmas.  The names of named anonymous
> > > vmas are shown in /proc/pid/maps and /proc/pid/smaps as [anon:<name>].
> > >
> > > Userspace can set the name for a region of memory by calling
> > > prctl(PR_SET_VMA, PR_SET_VMA_ANON_NAME, start, len, (unsigned
> > > long)name);
>
> Would setting a 64-bit integer instead of name be enough? Even if
> each party would set it randomly, risk of collisions would be very
> low... and we'd not have to deal with strings in kernel.

Thanks for the question, Pavel. I believe this was discussed in this
thread before and Colin provided the explanation with usage examples:
https://lore.kernel.org/linux-mm/20200821070552.GW2074@grain/.
Thanks,
Suren.

>
>                                                                 Pavel
>
>
> --
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
