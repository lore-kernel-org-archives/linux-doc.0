Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9311C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 15:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AD8261073
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 15:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhKLPn0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235374AbhKLPnR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Nov 2021 10:43:17 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3039DC06121D
        for <linux-doc@vger.kernel.org>; Fri, 12 Nov 2021 07:40:15 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id b17so6490484qvl.9
        for <linux-doc@vger.kernel.org>; Fri, 12 Nov 2021 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eHFem9bwQXsJyV+6JTiESgkyM4KbH6WnNIZTWfeQdQM=;
        b=YNrl8o8/Vn1AkLLoeyYZG9B20hm49tgpE4O3wgwFJgziK30a3PCI8xmMW/3GH7F4q6
         BCrb+c2z9Qw8YmTih2UF/NtYx6SkbMgpg5McDnMKQVwPvmrIrqWMA0T1P+r76E+hPQU7
         vspp5Z5zqD2ZLqfib+KTnbWtZ2nMsOzbJ4SwLu4cv8m7v9SA8U+cAXRbqUUD+9Xl2Tr5
         OBoBon+vXff3oyhGP2QE2TjyC8BXX7/bObQMaOixmqSVC7ROTUOojKNQp+E940X3GNrK
         90vm6Oa7flbxqDFNtZiHYV4HEx/9Jq8eLboCYNs30tEJ2nBhD0HG9UJ4S25gUib9lmaj
         uKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eHFem9bwQXsJyV+6JTiESgkyM4KbH6WnNIZTWfeQdQM=;
        b=uEqcKDlrXqPkdewGK9RGT1MG155DGdaHIvldpz9J1upBmkHgEWgytLMNt4vWoGvJ2O
         N5vNiOjShuJ3Unor6wXiKVbhQwLvuMZU2/0bCAHb5Qq5SKC2xAcg9NcYywJO3l6wQGP6
         9wyTWkVwTZJm/+dIqVbdsZhljphJmDElhC/9mKAQILSFvYX6p3YvjRL4nl1W9tj83CUh
         6ZGfNSiGxHDfJluapXuNe2q8D4PU07c0jELsabzYQ5SnSMsm0797qL/7vAJGJMmL20kg
         GIS6WG0kM4KvC4lWhxLbjNXLJyyfzVZtpJGI/xH4WBoO76ByjuZwkPL2CfqQUyMDA42Q
         kOTA==
X-Gm-Message-State: AOAM533bDqbR4ZihUvNorkfEFJ7leFbeNCqtXxma7JKwB3nKHWWfzwYi
        DpEs//ldv09ikzIHLrHwz/vGYQ==
X-Google-Smtp-Source: ABdhPJyk+u5C78xlis6nsI4oXFLdxJj5bzxauTbMsNW5fYwp9xLGPXNgO0ahuuvM/969OxjiMZGs4w==
X-Received: by 2002:ad4:5c4f:: with SMTP id a15mr15582209qva.26.1636731614399;
        Fri, 12 Nov 2021 07:40:14 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id t64sm2805724qkd.71.2021.11.12.07.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:40:14 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mlYez-00975w-1c; Fri, 12 Nov 2021 11:40:13 -0400
Date:   Fri, 12 Nov 2021 11:40:13 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/8] mm, dax: Introduce compound pages in devmap
Message-ID: <20211112154013.GE876299@ziepe.ca>
References: <20211112150824.11028-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112150824.11028-1-joao.m.martins@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 12, 2021 at 04:08:16PM +0100, Joao Martins wrote:

> This series converts device-dax to use compound pages, and moves away from the
> 'struct page per basepage on PMD/PUD' that is done today. Doing so, unlocks a
> few noticeable improvements on unpin_user_pages() and makes device-dax+altmap case
> 4x times faster in pinning (numbers below and in last patch).

I like it - aside from performance this series is important to clean
up the ZONE_DEVICE refcounting mess as it means that only fsdax will
be installing tail pages as PMD entries.

Thanks,
Jason
