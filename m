Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7ABC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 20 Dec 2021 21:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhLTV2L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Dec 2021 16:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhLTV2I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Dec 2021 16:28:08 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73714C06173F
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 13:28:08 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id k2so18110732lji.4
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 13:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=03tftiEYhqRnEnhYGSXfRSnQjXKVu8uhIKmeLcivayo=;
        b=BlcnCZc5c1t5Dfig8sDq8+kwYqCC5UxX6TKvoHp42AdOCuhs3rMbspFkuXfJmAXJmn
         AGLGLo8y6eS/99X7esXkovRQFwuKpXpaeZOFoeiIWJJaZBHwkF0L6FJ8hQr5zCDB00D4
         Pgj1fWZ4XRAjJ+KB5ZQMvjvAc+FPYlGHucNEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=03tftiEYhqRnEnhYGSXfRSnQjXKVu8uhIKmeLcivayo=;
        b=g4Qm8Sq0aB87xjNL1EqwPPNzP/LhhVGwIavSAzhXmkpieUsgvWwhDGuIL3UVpdlIbo
         0YLaf+5l/q5hsC9w46krIYTtwtOyO6/jbnw0v2OheHvgsR9nRuLI36cbQYultjWue4V3
         t8+3+b6y0Z5JxnV5D3Zv3my/VJVBP+/D9ToYeOqFz1Fhtr4k/U4wi7m8/udqv6IfC02R
         COsowIX3+M3PLeibbUNu/QM1cA6QoWz5ZCnrgmpYw3twwM1Dyk7G7SoLya5Vp3rQDmqm
         ZBn6Sq4yxhxjHKTUBreIacxGno2LkmbhlajRUxNqTNrw7TAaLkMHjGM/cageIRhQPbvn
         a/Xg==
X-Gm-Message-State: AOAM5330YYWtRul624CfzdwROK4ogDuyZWsARYsq9oOM4RKeRq/y5IZ9
        DrZqWrQWfHNrjRT4BlrYdvmsm9oPLCLgcdOSBLY=
X-Google-Smtp-Source: ABdhPJzyro5mQkvnv09WCq+Zd9QddLtFKuxXVEuJTqjYaKptXfsPGFjesyagM3FXByweR3hoSeHK3A==
X-Received: by 2002:a2e:9bd4:: with SMTP id w20mr16336668ljj.69.1640035686538;
        Mon, 20 Dec 2021 13:28:06 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id o19sm1456904lfu.149.2021.12.20.13.28.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 13:28:06 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id u22so18090444lju.7
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 13:28:06 -0800 (PST)
X-Received: by 2002:adf:d1a6:: with SMTP id w6mr35633wrc.274.1640035674847;
 Mon, 20 Dec 2021 13:27:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
 <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com> <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com> <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com> <Yb+gId/gXocrlJYD@casper.infradead.org>
 <YcDNaoGcGS6ypucg@casper.infradead.org> <CAHk-=wj+HbN0Ai+M2ABBvWnNKd2+J97kYPOsjwJC6o9xRF9jHw@mail.gmail.com>
 <YcDvTMUF3XWKWgSW@casper.infradead.org>
In-Reply-To: <YcDvTMUF3XWKWgSW@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 20 Dec 2021 13:27:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgyRg+H6PJkDRr7H0=-GNiNZ+yJ7XEWnue5+Nh6SOyXVQ@mail.gmail.com>
Message-ID: <CAHk-=wgyRg+H6PJkDRr7H0=-GNiNZ+yJ7XEWnue5+Nh6SOyXVQ@mail.gmail.com>
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

On Mon, Dec 20, 2021 at 1:02 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> Hah, that was actually how I did it originally (without actually
> committing at each step, and with a few "Oh, hang on, now we can avoid
> calculating this too" stops and restarts along the way), but I thought
> it all hung together logically as a single change.  It's hard to see
> things from the other person's perspective at times.

In just about any other area, I wouldn't mind one bigger patch that
just removes code that isn't used.

But when it's in the vm code, and it's pretty grotty, I do prefer
seeing three patches that individually are much easier to see that
"yeah, this doesn't actually change anything at all".

The combined patch may be exactly the same thing, it's just much
harder to see that "oh, now it's not used any more".

That was perhaps especially true since a number of the changes also
ended up doing statement simplification when the old layout made no
sense any more with part of the results not used.

So your 3-patch series was much easier to look at and go "Yeah, I
believe each of these patches is a no-op".

So ACK on all those patches.

          Linus
