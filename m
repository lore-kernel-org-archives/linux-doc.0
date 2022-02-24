Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016C7C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 03:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiBXDDr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 22:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiBXDDp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 22:03:45 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E323561A0C
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 19:03:16 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2d310db3812so10933287b3.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 19:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LBjw731gOZAZX11izjBDJpMfyEuV5GyF58y13CmjgQI=;
        b=WCSX7/V63Tb5YJ/PxU+KniB8C1Khw0+KR+ynZIbN1J62sE3rn9lOMkIK1u21L5m/Wu
         7IGQyDtJmH0r9tZfIjBsJvXZVpGv9cThH1BPWzrdG/fRzT5CxWhUQUfSxfIJ+36FWv/T
         +fbdnl8jfw6XCmqU2C1Az2GRLN/9bwb8wqp6JCopXfQvVWRK+yBbVN5yhL/lw5D9NlU2
         67UMFEVxKWVXXCBFmVXk3IGYMajUoqN85/eCbgQsMp9rD1PyjZ/7cD1w7VZtYXqup3mg
         SQFgHY041XA52HrXwHG3kfkM9VfoorWaT3r/9b9J9KXy1m9GFCBZ3kMh7WuhGH4qmzHb
         sNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LBjw731gOZAZX11izjBDJpMfyEuV5GyF58y13CmjgQI=;
        b=wnNgwVkPnIUfbQw3QQUPcqxdXP3H/0lon0Jq0xBxrKceeY6ClKlsqUNBCnRYBerY3+
         lwuDsPOVtZqHZ0vUZjBt7EHjUA+q9zwcv+FTHYglA1aUsROlWXrImFt1vkErWGjS8Gjy
         lm+ZERmJUcPY6L1MYGVP4hJAfPvk+2+YFRxZv4pb+9b1QRKceg0VeDzkswv4J8/XYspl
         ISwyy2a+Uvne/6ksjrDoJqsrQ2iq8rtKXuSXlzVjV+t3HJZ3vzfiTEFpUrVTWVMrZNWl
         CxvncuGlXOrlIPMauhQnmk52IwIL3eIyymVKvaqvloACJm4271M/MVcedSOWXuCYcRQ1
         Hxzw==
X-Gm-Message-State: AOAM5319wlWZJrxdDz29jdkUU/ibNegT2doXPSQi5axKk85JtCuhhRpI
        DkNw1pe8FNqzC/rYj4xmstJPQECnSiUXnFpyoBZjrA==
X-Google-Smtp-Source: ABdhPJz2AQ9wlEoioUOpPwIgSwQcN0ZkHflGDqUQfNbL2z/finOeSUCgBTkwVIhrEnBxK44ehL9YfcYLmYISvGb+fx8=
X-Received: by 2002:a0d:e609:0:b0:2d6:b8b0:8608 with SMTP id
 p9-20020a0de609000000b002d6b8b08608mr551938ywe.31.1645671796086; Wed, 23 Feb
 2022 19:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20220223194807.12070-1-joao.m.martins@oracle.com> <20220223194807.12070-2-joao.m.martins@oracle.com>
In-Reply-To: <20220223194807.12070-2-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 24 Feb 2022 11:02:38 +0800
Message-ID: <CAMZfGtXejFZhfs8hUB9MM-oozPhG-TO1PK4p8Z9o4QzmGtWp5Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] mm/sparse-vmemmap: add a pgmap argument to section activation
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 24, 2022 at 3:48 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> In support of using compound pages for devmap mappings, plumb the pgmap
> down to the vmemmap_populate implementation. Note that while altmap is
> retrievable from pgmap the memory hotplug code passes altmap without
> pgmap[*], so both need to be independently plumbed.
>
> So in addition to @altmap, pass @pgmap to sparse section populate
> functions namely:
>
>         sparse_add_section
>           section_activate
>             populate_section_memmap
>               __populate_section_memmap
>
> Passing @pgmap allows __populate_section_memmap() to both fetch the
> vmemmap_shift in which memmap metadata is created for and also to let
> sparse-vmemmap fetch pgmap ranges to co-relate to a given section and pick
> whether to just reuse tail pages from past onlined sections.
>
> While at it, fix the kdoc for @altmap for sparse_add_section().
>
> [*] https://lore.kernel.org/linux-mm/20210319092635.6214-1-osalvador@suse.de/
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Missed my Reviewed-by from previous version.

Thanks.
