Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57557C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Dec 2021 18:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbhLVSkt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Dec 2021 13:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344813AbhLVSks (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Dec 2021 13:40:48 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE21C061574
        for <linux-doc@vger.kernel.org>; Wed, 22 Dec 2021 10:40:48 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id y22so12229937edq.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Dec 2021 10:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aq/wssbJW97LOVr0Eh6yDelER0nFi1ZCZpjRsYoDD3M=;
        b=REM7DgpgJmkfIJdXvPcefxx96s82wJsCzGWmJn0cvbBNm41AzviVhzuNtpthlyec3s
         UGTiKQqTbUxvgaQ7HgM0DrpzcNs62ueQTQhGdqh1NAJHhNe+Su+eXdejZMNZl6kf7Sg1
         AOMnLNyEuDxkkkjn3LNUqoR/nzbn3aEL5NIHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aq/wssbJW97LOVr0Eh6yDelER0nFi1ZCZpjRsYoDD3M=;
        b=j06H0UwVTFzl1WpdLCN4oMw+ffG7g7OkaIdTuhWw8wWOo97we9tVa3q5er7ctNkrZh
         2yjwJFuchSGXpqy9z+iS9jV1idBp99bSM3cB5lSIq9E0DefF6d96IDGH3hpjX5ndnrAa
         U6nYLRiptnjqn5pjIcaNNoFNQKIqh1zSJngap415j/vTFcBL+SpHkfrdIze3xOLcb+Ut
         4vImAz7sXuuGaiMqxnGILmE3+4AmqXdoNLzxJR91H6vvPyebrV6birTyR/WCy2oNLlRG
         Q/XDgL3Fn5DN8RBKGSvnis8ISh24eiEJKfJO0BOCc0yJx6D4nKXdkCah/rA5EmG3q5xy
         16qQ==
X-Gm-Message-State: AOAM533XoCAIBgBWdrX9iK0o9J6HvIdR1h12p2mZRxZQ2aPHSyBIcKHh
        ZK89KbO9EJcppvsxlDlxI7JQ4C12ZQce5xfsVCw=
X-Google-Smtp-Source: ABdhPJyhQOkU1ZyJO0kOjyk/EKGytNLYWKZH9QVYa/fIQF9o0amO1TCS59QBrrpV6X6MIhpeHH4YFg==
X-Received: by 2002:a50:ea84:: with SMTP id d4mr4055695edo.379.1640198446402;
        Wed, 22 Dec 2021 10:40:46 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id sc7sm984118ejc.87.2021.12.22.10.40.45
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 10:40:46 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id n14so6443848wra.9
        for <linux-doc@vger.kernel.org>; Wed, 22 Dec 2021 10:40:45 -0800 (PST)
X-Received: by 2002:a5d:6211:: with SMTP id y17mr2950577wru.97.1640198434545;
 Wed, 22 Dec 2021 10:40:34 -0800 (PST)
MIME-Version: 1.0
References: <fd7e3195-4f36-3804-1793-d453d5bd3e9f@redhat.com>
 <CAHk-=wgQq3H6wfkW7+MmduVgBOqHeiXQN97yCMd+m1mM-1xCLQ@mail.gmail.com>
 <900b7d4a-a5dc-5c7b-a374-c4a8cc149232@redhat.com> <20211221190706.GG1432915@nvidia.com>
 <3e0868e6-c714-1bf8-163f-389989bf5189@redhat.com> <dfe1c8d5-6fac-9040-0272-6d77bafa6a16@redhat.com>
 <20211222124141.GA685@quack2.suse.cz> <4a28e8a0-2efa-8b5e-10b5-38f1fc143a98@redhat.com>
 <20211222144255.GE685@quack2.suse.cz> <505d3d0f-23ee-0eec-0571-8058b8eedb97@redhat.com>
 <20211222160846.GH685@quack2.suse.cz>
In-Reply-To: <20211222160846.GH685@quack2.suse.cz>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 22 Dec 2021 10:40:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjUeCUo7dRkzTeqGMJ5-NE4=Xj09mMB0HCkCnMFxsbmwA@mail.gmail.com>
Message-ID: <CAHk-=wjUeCUo7dRkzTeqGMJ5-NE4=Xj09mMB0HCkCnMFxsbmwA@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     Jan Kara <jack@suse.cz>
Cc:     David Hildenbrand <david@redhat.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Nadav Amit <namit@vmware.com>,
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
        Oleg Nesterov <oleg@redhat.com>, Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 22, 2021 at 8:08 AM Jan Kara <jack@suse.cz> wrote:
>
> Well, but O_DIRECT reads must use FOLL_PIN in any case because they modify
> page data (and so we need to detect them both for COW and filesystem needs).

Well, O_DIRECT reads do, but not necessarily writes.

And hey, even reads have been dodgy in the past when we didn't really
have the pinning logic - there's been a lot of users that just wanted
it to work for their particular use-case rather than in general and in
all situations..

             Linus
