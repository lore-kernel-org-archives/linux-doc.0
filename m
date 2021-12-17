Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85289C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 20:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbhLQUkM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Dec 2021 15:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237008AbhLQUkK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 15:40:10 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FCFC061574
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:40:10 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id o20so12319593eds.10
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fFYHj/85wq9sp2q1J+u1Ml7YxuIRP5NvJyUtf+MXyA=;
        b=cJw7R6IKrWDvsdo4quNKJl7yowzlSAHbDI1qyzLRE08kUlNHdph4InZjJ8Da37rlMW
         TYTu57W8GfVaR3uyaMrsqy6OJvP+dnCqaEhL+vDOl/t5etD3LFAphX+fle4Z+4q5JUHs
         HptT4U/SfI31C1p3odw09uIZxNiTnn51wMLzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fFYHj/85wq9sp2q1J+u1Ml7YxuIRP5NvJyUtf+MXyA=;
        b=RmKP6o0QG5W/1O1vcXw6Wvz9nwEgr/8P6zBRFlBbFXX8jDemvxnPEHvi0OiCwxgHcg
         x3Kw86ryfc3OpezL/jecrl1YRa0dqlgxsgSbvtwQ/CkHudc7kt6dSqZibDXR/XCXMk6M
         G7MPHP/c4WI3/lc1t1WXRqBRoYl40/FWVczvxlZR8+5qADRBj+kN6FWLL4oul+m/4ZIn
         7vjVu7kjrgqwrXdpJ7xN4LtCRf5bMMTUnEIg2DpDGMVOT4mOwlZvJ7gNhJXIw1AFdJrN
         xGSGJ13S2Px1Ar8qhFJCofJP3P85YY7MgLJX8QEOEjxOVg178hu0O6e+b5DPygZDH7El
         dPJg==
X-Gm-Message-State: AOAM531I1PsJGS5cguvH8IOrKqnELZN+Xe1pF63pWjX+HzmoXxNcmQ6X
        0d9GUqgADf6t72ctW3OB+mjvhK8nqpb0+kqF7l0=
X-Google-Smtp-Source: ABdhPJw3ZiabtOVSciU9keQe0qc7P6bklxZForBIlTgMoDbasW2nQMhIyp04nAfhMtJsS8j845MISA==
X-Received: by 2002:a17:906:c111:: with SMTP id do17mr3809871ejc.284.1639773608691;
        Fri, 17 Dec 2021 12:40:08 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id q17sm4031207edd.10.2021.12.17.12.40.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 12:40:08 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id y22so12477545edq.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:40:08 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr3847861wrp.442.1639773598131;
 Fri, 17 Dec 2021 12:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com> <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 12:39:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgD1Y_hV3eCRL55m+sGfmwic0wbq+0LV8youYKirHJTog@mail.gmail.com>
Message-ID: <CAHk-=wgD1Y_hV3eCRL55m+sGfmwic0wbq+0LV8youYKirHJTog@mail.gmail.com>
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

On Fri, Dec 17, 2021 at 12:36 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> >
> > 5. Take a R/O pin (RDMA, VFIO, ...)
> > -> refcount > 1
> >
> > 6. memset(mem, 0xff, pagesize);
> > -> Write fault -> COW
>
> I do not believe this is actually a bug.
>
> You asked for a R/O pin, and you got one.

If you want a shared pin that actually follows the changes of your
process around, then that is what you should have asked for.

At the time of such a shared pin, you can do what we already do:
re-use the page if it has a refcount of 1. Or do an early COW event
(feel free to avoid the "mark it writable and dirty").

But note: *refcount* of 1. Not "mapcount". Because mapcount would be
broken garbage.

                Linus
