Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3047C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 20:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhLQUvz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Dec 2021 15:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240924AbhLQUvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 15:51:52 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1563C061574
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:51:51 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id z29so12448632edl.7
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TG2f+1lEN9hemuQjgMe4Yp+YI3NU/6U4WSw8/cJzPxw=;
        b=Yrgcl5joP5IKSH1feNkTltzJLVVG8zrXENqo7vUe3EVV9XknZ07REOeQRBojTzTO86
         ru0XQjTptmuCTBKHvUxnc0k1m5boTQTeFASvq7tIIKB6yCjG9+KF1TpJp2uSt5cPlXfQ
         mvyq0AjNx+7bb2we1uo6ifMBNTtiDYvBUnRhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TG2f+1lEN9hemuQjgMe4Yp+YI3NU/6U4WSw8/cJzPxw=;
        b=pFM0BmEUckGKAi7n/uc4VXZB8qw5YfZhN65ze30BXuHdH2+bT7dQIjfOhf1HA82FRB
         VKnU0P7k+ClTBCNa/bxIKGkrdfTke6cfJNB3cSQzBptnAvtJnl3oNg2j9/on5FBDGIGJ
         +4onBoifjAph1rEf/t6xyL40YVPbktFWN7BByJw8VRKip2b5ZwWSu10h6u+rBIrL1WOI
         SWblinhkuxfU9I+IpcWR5G2qjrp+znq5JVIA0cXrMKN6UrMHl+v7sktd8XblY65ZLoxZ
         ksh5tBbZKEKljiHojMSoaxbKDwlShMmS5sE8bmpB5LK0zO0i0FoBCZFfey+g5ro8bwlx
         z2qw==
X-Gm-Message-State: AOAM533Og+b7Zn+T2hCkfwluM6KgnsmWDQGNFqid2l2C5vsFOJsrkgzz
        QEiD2s3Xv4sRYd7MIDyYzXmYprDjzoi/hUtPkA4=
X-Google-Smtp-Source: ABdhPJw1cklv2c5HiZC1GMTNxLYwzx7RaHBvLQ0+bak89Y3XI+akgyntF2aXp7GyLbM68nWAMstQTg==
X-Received: by 2002:a17:907:6eaa:: with SMTP id sh42mr3773780ejc.556.1639774310342;
        Fri, 17 Dec 2021 12:51:50 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id s16sm3908020edt.30.2021.12.17.12.51.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 12:51:50 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2267225wme.4
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:51:49 -0800 (PST)
X-Received: by 2002:a05:600c:1914:: with SMTP id j20mr11082980wmq.26.1639774298625;
 Fri, 17 Dec 2021 12:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com> <9c3ba92e-9e36-75a9-9572-a08694048c1d@redhat.com>
In-Reply-To: <9c3ba92e-9e36-75a9-9572-a08694048c1d@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 12:51:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wghsZByyzCqb5EbKzZtAbrFvQCViD+jK9HQL4viqUb6Ow@mail.gmail.com>
Message-ID: <CAHk-=wghsZByyzCqb5EbKzZtAbrFvQCViD+jK9HQL4viqUb6Ow@mail.gmail.com>
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

On Fri, Dec 17, 2021 at 12:45 PM David Hildenbrand <david@redhat.com> wrote:
>
> If a page is mapped exactly once, page_mapcount(page) == 1 and there is
> nothing to do.

Why?

You state that, but you stating that doesn't magically make it so.

What makes "mapcount==1" stable and special? Your "it's an
atomic_read()" argument is nonsense - it implies that the count can be
changing, but you will get _one_ answer.

What makes that one answer of a changing count special?

What if there are other references to that same page, gotten with
vmsplice(), and just about to be mapped into another address space?

This is the meat of my argument. You claim that "mapcount==1" is
special. I claim that you haven't explained why it would be. And I do
not believe it is.

                 Linus
