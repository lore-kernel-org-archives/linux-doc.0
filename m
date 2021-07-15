Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A76C12002
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 02:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7E6661358
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 02:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhGOCzQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 22:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhGOCzQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 22:55:16 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFD1C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 19:52:23 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p22so3757481pfh.8
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 19:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMC/7BJES1xsl6whxIikhxzC8Rq8hRd9OZiivLLNk5o=;
        b=wVWv2guCZsRL63EFpcEV44cSTV9blEjTw/yo7hgyxR635O9UVREcpt+T3FzX4Lluqs
         9G7kDyCSSVj6iBRtHARWGMcpRXOO67gArpetvAoVUDNAwCc0X7fXV/FYFNk4h2qV6m8h
         Rl77vuZNfyFgqZ8+NucSgYQRhhsvVOOEHMixZRwsdM2gXDbNSHflX4NZ/evElDfxPTNw
         fQ/F/dwxnC+KU78EI5foaEWwwjSVMVXQhY2wGXsHoRBXVzLDNF6D6ta0tA9L7rmp9Y7V
         Mv2ayi8gIdpa3QNo3O+RZQMXpnyoYp5hXOYtXJ2V1VmTDMLNEl9V6AigG8qFVNbmsenW
         WOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMC/7BJES1xsl6whxIikhxzC8Rq8hRd9OZiivLLNk5o=;
        b=SSC60lJI6NsflMXh6dQrhwje4p8nSBYZfrMS47BtzbubXpTSKixoxhLMx7MoZLp022
         77jZz1P2fNC6LZZ2lGuoyXoAOSS+PWC5mpomWGc+KoFTty/+gyobpkp1Tpi+o/p7VON0
         l/v10uiwbTTn1CleI6kdsKgCAo6Sq+IDRbbyf1OR30wm6VAfi9cHxyn3nB6/hNFXoP/O
         4pRhl8hgC4JFv0urgH9lfj5An52dZ7XEs46V8tk5bg7gpMiXfI/02SzTSicg3WK1CH6M
         w7G/RxwQENiNkfhNhnT5B2bTRTWpcKwRAdOp7Zkpw7QGnBPF+NQ2NLwqasQMXAiMfKUi
         /RvQ==
X-Gm-Message-State: AOAM530ohKI2lZ2+JpV6KLwQh8S12McC2iSyGIFBxYQoeaXLYYvYuNqE
        d+q51YCg3a2sBy5KPF6fcH/2d4bO85vMDvjQwkJODA==
X-Google-Smtp-Source: ABdhPJyCEpo9gLI9Iqz6IRgl/n5sGdxftzB8/eWvGjFyB3LPYbqUeTR0VczLI0dVPoOPiyANWeNQTYTcnqJBBlaPbr4=
X-Received: by 2002:a63:5963:: with SMTP id j35mr1588664pgm.341.1626317543330;
 Wed, 14 Jul 2021 19:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-2-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-2-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 15 Jul 2021 10:51:47 +0800
Message-ID: <CAMZfGtWhx71w0b4FM_t2LCK-q1+ePv6YQtQat+9FozLPnN4x3Q@mail.gmail.com>
Subject: Re: [External] [PATCH v3 01/14] memory-failure: fetch compound_head
 after pgmap_pfn_valid()
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 15, 2021 at 3:36 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> memory_failure_dev_pagemap() at the moment assumes base pages (e.g.
> dax_lock_page()).  For pagemap with compound pages fetch the
> compound_head in case a tail page memory failure is being handled.
>
> Currently this is a nop, but in the advent of compound pages in
> dev_pagemap it allows memory_failure_dev_pagemap() to keep working.
>
> Reported-by: Jane Chu <jane.chu@oracle.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Reviewed-by: Naoya Horiguchi <naoya.horiguchi@nec.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
