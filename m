Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D350CC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 21 Dec 2021 18:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbhLUSAz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Dec 2021 13:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbhLUSAw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Dec 2021 13:00:52 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E72C06173F
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 10:00:52 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id bm14so42371362edb.5
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 10:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VIbA3tyKRgvmJRKKTWC54hBhDnm0QxqACXVEDucCono=;
        b=hi49HjIoBTBvSXG2A2+cFTDsRuJjpXTbXPT2YO0B5WLC6WmWLV13V5z0TR/SlDr/63
         iOmlX+Uu844DfzR1WbHs0Qw1BOG13MhIrY+PoLF4H5qxGf8+AMW/UNirqtZtyPp4EF02
         DRy+25A1pXY0epijI8EyJvK8QbbP7eNmzrRr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VIbA3tyKRgvmJRKKTWC54hBhDnm0QxqACXVEDucCono=;
        b=PLkgJ8HjPdt/grq/BfMOjlz5C7axswpEHDhaBAmacUM2qiOFmCV4yH4Cm5AwzZVbX5
         kKpt9PeSPae6bi2whOVeEHIdiQ2Z0QlaTV9E8nmRX3oPAJY044DqXttRN3LFFmHsfdoj
         f5eKTuH/pZgNt2agQaKYCcwe1g/mHo4XUg4njyGS1Wnm20whijjcaN0XIepAPLwkLI0L
         J9Rk/I3RIjX58ZdEEmY+B6eoAVWAkqbheQDGCOhE+sGmaAfF4DdKE9v7hdHLbb/55YF3
         4D3BuwO6o3diP9G0WPkARHKgB4Q6vEYbh8YaLlVkly6WpvumF1YWouit686PQBSW+3Ww
         mhOQ==
X-Gm-Message-State: AOAM531b5zSVa6cjotLDhHNN81LYr6TP+4RVfVmmZ4hR9HMNVCX06ax2
        jAvX/MeaV1+3ruLHbwIZ1NI49ep3meIX8+qYlcQ=
X-Google-Smtp-Source: ABdhPJwVYF9D4ApnWxRbf68e12mcfu1MH+/LoxrT1ohTuC5GMpgSr6cmQBXfO77rqHNll367QBdwVw==
X-Received: by 2002:a05:6402:524d:: with SMTP id t13mr4539508edd.356.1640109650370;
        Tue, 21 Dec 2021 10:00:50 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id qa30sm2717923ejc.54.2021.12.21.10.00.50
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 10:00:50 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2616842wme.4
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 10:00:50 -0800 (PST)
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr3769746wmj.155.1640109639062;
 Tue, 21 Dec 2021 10:00:39 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wj7eSOhbWDeADL_BJKLzdDF5s_5R9v7d-4P3L6v1T3mpQ@mail.gmail.com>
 <20211218184233.GB1432915@nvidia.com> <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
 <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
 <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com> <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com> <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com> <20211221010312.GC1432915@nvidia.com>
 <fd7e3195-4f36-3804-1793-d453d5bd3e9f@redhat.com> <CAHk-=wgQq3H6wfkW7+MmduVgBOqHeiXQN97yCMd+m1mM-1xCLQ@mail.gmail.com>
 <900b7d4a-a5dc-5c7b-a374-c4a8cc149232@redhat.com>
In-Reply-To: <900b7d4a-a5dc-5c7b-a374-c4a8cc149232@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 21 Dec 2021 10:00:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi191H+U0TNJhL7Jf7VAA+mA6y8MUQLy9DkkaS+tNgp+w@mail.gmail.com>
Message-ID: <CAHk-=wi191H+U0TNJhL7Jf7VAA+mA6y8MUQLy9DkkaS+tNgp+w@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     David Hildenbrand <david@redhat.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, Nadav Amit <namit@vmware.com>,
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
        Matthew Wilcox <willy@infradead.org>,
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

On Tue, Dec 21, 2021 at 9:40 AM David Hildenbrand <david@redhat.com> wrote:
>
> > I do think the existing "maybe_pinned()" logic is fine for that. The
> > "exclusive to this VM" bit can be used to *help* that decision -
> > because only an exclusive page can be pinned - bit I don't think it
> > should _replace_ that logic.
>
> The issue is that O_DIRECT uses FOLL_GET and cannot easily be changed to
> FOLL_PIN unfortunately. So I'm *trying* to make it more generic such
> that such corner cases can be handled as well correctly. But yeah, I'll
> see where this goes ... O_DIRECT has to be fixed one way or the other.
>
> John H. mentioned that he wants to look into converting that to
> FOLL_PIN. So maybe that will work eventually.

I'd really prefer that as the plan.

What exactly is the issue with O_DIRECT? Is it purely that it uses
"put_page()" instead of "unpin", or what?

I really think that if people look up pages and expect those pages to
stay coherent with the VM they looked it up for, they _have_ to
actively tell the VM layer - which means using FOLL_PIN.

Note that this is in absolutely no way a "new" issue. It has *always*
been true. If some O_DIORECT path depends on pinning behavior, it has
never worked correctly, and it is entirely on O_DIRECT, and not at all
a VM issue. We've had people doing GUP games forever, and being burnt
by those games not working reliably.

GUP (before we even had the notion of pinning) would always just take
a reference to the page, but it would not guarantee that that exact
page then kept an association with the VM.

Now, in *practice* this all works if:

 (a) the GUP user had always written to the page since the fork
(either explicitly, or with FOLL_WRITE obviously acting as such)

 (b) the GUP user never forks afterwards until the IO is done

 (c) the GUP user plays no other VM games on that address

and it's also very possible that it has worked by pure luck (ie we've
had a lot of random code that actively mis-used things and it would
work in practice just because COW would happen to cut the right
direction etc).

Is there some particular GUP user you happen to care about more than
others? I think it's a valid option to try to fix things up one by
one, even if you don't perhaps fix _all_ cases.

              Linus
