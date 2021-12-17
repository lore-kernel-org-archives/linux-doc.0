Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4200EC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 22:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhLQWSj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Dec 2021 17:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhLQWSj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 17:18:39 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027D9C06173E
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 14:18:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id u13so163892lff.12
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 14:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dEiolkPpvvhLwx2+Ioc9tJdHpFervZFA65QfTIT8vY=;
        b=UNpQI26wi57RyV1YxwSTRqGoF8pfqkrpBA7VJxkw1ZxwY2/GrWansyaJMvj0VZ+zMR
         214ZaRKvpcMDVsjVSqCzfpGWodtPb3EbTzuTia7DZiYsm/Guy70EmsRf0kdKbipswVN4
         hCq+6iDJno8XBTK4ljnI1AIK0LnvRqZevuKic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dEiolkPpvvhLwx2+Ioc9tJdHpFervZFA65QfTIT8vY=;
        b=5WRTpbdKgeZEUyZ2qG8WZjzhvxNyI5e6db0CTsWCcUrx4rPl+y/28EWVaCkEz8Rngy
         gclIVVDohj0GeSvQWGlSl3OwR36lHmO4cJdJZJoG/V7h9wfQewoLVMJGRywCumIrPqre
         LdkqdZbsB3YkTpm6mJg3uS6HB3NPN3TJaQg8da0ZQLdr88dzFdvar2BGXMsmTJhYPKb2
         epGq1E0AYHnK2Yl5bBENyEIxEnfXPhioGJafSurWL3+xTwV2eR/fyTuvZ6+2ZvQg5L5l
         NGlBVPyfjUGwQvsujsDmJqAEN9akLovCyxGwyhtezAmxsEsGgJ3/0X/nz5tsoWp244kb
         4dTg==
X-Gm-Message-State: AOAM530ui1U07F5zjvXGYyqRkFxR+9EedG/IzDNrEBLzi96MTbjUeZY+
        zjymv4i26jtq+F95q+vl61bfuFgDciL4+VK6BCw=
X-Google-Smtp-Source: ABdhPJzR1I+NZUVy5LqSizy1w7/aK3TQBgn3jjv0DAd2IDAds8A8x3yq5QfkBe/CPCUf6d7qPrrx7A==
X-Received: by 2002:a05:6512:ba8:: with SMTP id b40mr4780748lfv.114.1639779516861;
        Fri, 17 Dec 2021 14:18:36 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id p3sm1526652lfg.273.2021.12.17.14.18.36
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 14:18:36 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id cf39so7443178lfb.8
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 14:18:36 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr4057992wrp.442.1639779505799;
 Fri, 17 Dec 2021 14:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <9c3ba92e-9e36-75a9-9572-a08694048c1d@redhat.com> <CAHk-=wghsZByyzCqb5EbKzZtAbrFvQCViD+jK9HQL4viqUb6Ow@mail.gmail.com>
 <e93f3fc9-00fd-5404-83f9-136b372e4867@redhat.com> <CAHk-=wiFhVXZH_ht_dYQ_g2WNuhvWVrv8MjZ8B8_g6Kz2cZrHw@mail.gmail.com>
 <02cf4dcf-74e8-9cbd-ffbf-8888f18a9e8a@redhat.com>
In-Reply-To: <02cf4dcf-74e8-9cbd-ffbf-8888f18a9e8a@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 14:18:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiujJLsLdGQho8oSbEe2-B1k1tJg6pzePkbqZBqEZL56A@mail.gmail.com>
Message-ID: <CAHk-=wiujJLsLdGQho8oSbEe2-B1k1tJg6pzePkbqZBqEZL56A@mail.gmail.com>
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

On Fri, Dec 17, 2021 at 1:47 PM David Hildenbrand <david@redhat.com> wrote:
>
> For now I have not heard a compelling argument why the mapcount is
> dubious, I repeat:
>
> * mapcount can only increase due to fork()
> * mapcount can decrease due to unmap / zap

And to answer the "why is this dubious", let' sjust look at your
actual code that I reacted to:

+       vmf->page = vm_normal_page(vmf->vma, vmf->address, vmf->orig_pte);
+       if (vmf->page && PageAnon(vmf->page) && !PageKsm(vmf->page) &&
+           page_mapcount(vmf->page) > 1) {

Note how you don't just check page_mapcount(). Why not? Because
mapcount is completely immaterial if it's not a PageAnon page, so you
test for that.

So even when you do the mapcount read as one atomic thing, it's one
atomic thing that depends on _other_ things, and all these checks are
not atomic.

But a PageAnon() page can actually become a swap-backed page, and as
far as I can tell, your code doesn't have any locking to protect
against that.

So now you need not only the mmap_sem (to protect against fork), you
also need the page lock (to protect against rmap changing the type of
page).

I don't see you taking the page lock anywhere. Maybe the page table
lock ends up serializing sufficiently with the rmap code that it ends
up working

In the do_wp_page() path, we currently do those kinds of racy checks
too, but then we do a trylock_page, and re-do them. And at any time
there is any question about things, we fall back to copying - because
a copy is always safe.

Well, it's always safe if we have the rule that "once we've pinned
things, we don't cause them to be COW again".

But that "it's safe if" was exactly my (b) case.

That's why I much prefer the model I'm trying to push - it's
conceptually quite simple. I can literally explain mine at a
conceptual level with that "break pre-existing COW, make sure no
future COW" model.

In contrast, I look at your page_mapcount() code, and I go "there is
no conceptual rules here, and the actual implementation details look
dodgy".

I personally like having clear conceptual rules - as opposed to random
implementation details.

             Linus
