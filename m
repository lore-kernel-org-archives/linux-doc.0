Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C39BC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 19:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240542AbhLQTXQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Dec 2021 14:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240467AbhLQTXQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 14:23:16 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C85C061574
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 11:23:16 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id b7so11724765edd.6
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 11:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wsxPP4x55S3xHdetgetRuLFyO1pK7A4RVTBxuMZfoqY=;
        b=LN01Ax5zkrMJ36hMWyzfEwjvgOa05trYbyjDx9OvqN5hVC5jgm8DAsreT8ZC9IIalh
         FdsStvpmEXelZNEqxx+tiW5zfa1gTjPnHrDtMyQU36PnWl7IppVmVyKP51KznO6W4vcH
         OrJ7ICe+DK/A6cO51E7sHzoyw84upkUlBNY1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wsxPP4x55S3xHdetgetRuLFyO1pK7A4RVTBxuMZfoqY=;
        b=YhYqrziC3xvRQzmQ2rKEI5VKdwQugZwKSPaBFmuRrbGhAPE7obzVSwiJOM3INCnsNG
         yQyPNdAxoVHSWBPLsOgj8QVvca8MUXaOCPErMTLdk2fSrkt55nG6S2fMfSRdZMIF2VEi
         1rDKZNgxlndJ3kSVBvbsXui2y1eJp04go7cPtjtEmBnnTGBdnRlz2vttqmU2rcdInktr
         WoAoSzNYhRoBEczdIDkzaZ44Fi9K7ICTHnYvErDoNsypa95TJRybdNMexYfjCu8M+YPh
         snvtrLsuzMvDXPij/fyygX+BCgWuK5zwNGAaGuiLDAxBGlUvfqlkeWrMhy9brLOaGzk1
         g2sQ==
X-Gm-Message-State: AOAM531DjWjGdeKi9rjU9VGvtxZGM64TSPX79NMjkrDPWpPuGwYZ2PcY
        urTfWqE9RexXWkC80SNwejSYGgoIulapIYLBYL4=
X-Google-Smtp-Source: ABdhPJy90PgLQX4UD1XsHhnnuhxl3c4O8hbtrnaQ19HcmtifmUWDqLxT4T5SJr0QjmaZ6NQwGn+Raw==
X-Received: by 2002:a17:907:a42c:: with SMTP id sg44mr1766003ejc.513.1639768994570;
        Fri, 17 Dec 2021 11:23:14 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id ds1sm3986609edb.91.2021.12.17.11.23.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 11:23:14 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so2180732wmb.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 11:23:14 -0800 (PST)
X-Received: by 2002:a05:600c:1d97:: with SMTP id p23mr3854552wms.144.1639768983510;
 Fri, 17 Dec 2021 11:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
In-Reply-To: <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 11:22:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
Message-ID: <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Nadav Amit <namit@vmware.com>, Rik van Riel <riel@surriel.com>,
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

On Fri, Dec 17, 2021 at 11:04 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> If we are doing a COW, we need an *exclusive* access to the page. That
> is not mapcount, that is the page ref.
>
> mapcount is insane, and I think this is making this worse again.

Maybe I'm misreading this, but afaik

 - get a "readonly" copy of a local private page using FAULT_FLAG_UNSHARE.

   This just increments the page count, because mapcount == 1.

 - fork()

 - unmap in the original

 - child now has "mapcount == 1" on a page again, but refcount is
elevated, and child HAS TO COW before writing.

Notice? "mapcount" is complete BS. The number of times a page is
mapped is irrelevant for COW. All that matters is that we get an
exclusive access to the page before we can write to it.

Anybody who takes mapcount into account at COW time is broken, and it
worries me how this is all mixing up with the COW logic.

Now, maybe this "unshare" case is sufficiently different from COW that
it's ok to look at mapcount for FAULT_FLAG_UNSHARE, as long as it
doesn't happen for a real COW.

But honestly, for "unshare", I still don't see that the mapcount
matters. What does "mapcount == 1" mean? Why is it meaningful?

Because if COW does things right, and always breaks a COW based on
refcount, then what's the problem with taking a read-only ref to the
page whether it is mapped multiple times or mapped just once? Anybody
who already had write access to the page can write to it regardless,
and any new writers go through COW and get a new page.

I must be missing something realyl fundamental here, but to me it
really reads like "mapcount can fundamentally never be relevant for
COW, and if it's not relevant for COW, how can it be relevant for a
read-only copy?"

             Linus
