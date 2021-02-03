Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AEDC433DB
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 14:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F304664E31
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 14:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbhBCOyC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Feb 2021 09:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbhBCOx4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Feb 2021 09:53:56 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884E8C0613ED
        for <linux-doc@vger.kernel.org>; Wed,  3 Feb 2021 06:53:15 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id r77so23540745qka.12
        for <linux-doc@vger.kernel.org>; Wed, 03 Feb 2021 06:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tWqEMDRRJjAPsFV9gqXLc6rsgZRz2m3wCpFXqt37vmg=;
        b=OKUaNQOKewwCwxgBOL++qolHJYoYrTRTOyTapiNnICmjOju2zV7ruz7VJ1G7WlfL8n
         WsVA2v5BqDiFoA0SIIPy9bk2Wm2yfuoXCci9i0tRqnmqF/dZw2/D1PmwBqxKVkpKUYOT
         SOvK3/d0GYAHgC5ALoicPwgmnl9KtFHqGgnFb5fjSXC6naKrJfeL4cgg+jX1fZ3KFZ7R
         MzM7m4y2nz0+Eb/9asZei5aOP5o2q60siHUnRvx5sIrak3DxfXeow3mRUqQQgMwVShm4
         f0mcRQOFQeBZD7jZDGToDkxw/lfUnMJdOBQAH6DxLsSG7FG8n8pXxueB5LH0orU5C+Hn
         Vblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tWqEMDRRJjAPsFV9gqXLc6rsgZRz2m3wCpFXqt37vmg=;
        b=kdUcwPHoPRZIgPzsEAS8oKzYVOw/GkS9qEMwsa9BjdqHHwgJJ/ZuBV9zVEF5edlb32
         e+3AKVpDYq6uDtAvQCj0ZGkZYkJUQDlltUoPt1ucYHcXb7REGYpZewKLqQ4uIw7xEyW0
         2uvjP/EtXDpgvUGtbDbnxFR238apgND/9oQ/ZSqSUycXzEfs/+M4gFty5qhKqJhNjyEJ
         eSjY84xXR7/KEx9YMFrEA9mRF4Rc5lTCsncVRcg6cmy1uksk2nQwXCvVnXJptzytJJr8
         BSJAG7WkCLhbXMg+bdhgeF1JK22iON2fuhskLsJNWG2KhW3w5lwSZ1GqTZyx0K8YAPUj
         mYzw==
X-Gm-Message-State: AOAM531VdyjrZ5G5xCjRZSfQTA9O/XYWDKf9Wp2pNvO9cSiWct36mMnI
        tfUZYa+qV7ZbUl5yRDSb0GzQTA==
X-Google-Smtp-Source: ABdhPJxnBuDu0/Y4ebk4clO93dhdWtJeGD8m42ZMMPlbLv5AQ1yGXMN8J+Y8xJH+Vk+eugDQqMQzig==
X-Received: by 2002:ae9:edd2:: with SMTP id c201mr2872281qkg.375.1612363994790;
        Wed, 03 Feb 2021 06:53:14 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id 196sm1758474qkn.64.2021.02.03.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:53:14 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l7JWr-0031OU-H2; Wed, 03 Feb 2021 10:53:13 -0400
Date:   Wed, 3 Feb 2021 10:53:13 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, vbabka@suse.cz, mhocko@suse.com,
        david@redhat.com, osalvador@suse.de, dan.j.williams@intel.com,
        sashal@kernel.org, tyhicks@linux.microsoft.com,
        iamjoonsoo.kim@lge.com, mike.kravetz@oracle.com,
        rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org,
        mgorman@suse.de, willy@infradead.org, rientjes@google.com,
        jhubbard@nvidia.com, linux-doc@vger.kernel.org,
        ira.weiny@intel.com, linux-kselftest@vger.kernel.org,
        jmorris@namei.org
Subject: Re: [PATCH v8 02/14] mm/gup: check every subpage of a compound page
 during isolation
Message-ID: <20210203145313.GQ4718@ziepe.ca>
References: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
 <20210125194751.1275316-3-pasha.tatashin@soleen.com>
 <05a66361-214c-2afe-22e4-12862ea1e4e2@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a66361-214c-2afe-22e4-12862ea1e4e2@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 01:22:18PM +0000, Joao Martins wrote:

> With this, longterm gup will 'regress' for hugetlbfs e.g. from ~6k -> 32k usecs when
> pinning a 16G hugetlb file.

Yes, but correctness demands it.

The solution is to track these pages as we discover them so we know if
a PMD/PUD points and can directly skip the duplicated work

> Splitting can only occur on THP right? If so, perhaps we could
> retain the @step increment for compound pages but when
> !is_transparent_hugepage(head) or just PageHuge(head) like:

Honestly I'd rather see it fixed properly which will give even bigger
performance gains - avoiding the entire rescan of the page list will
be a win

Jason
