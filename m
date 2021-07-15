Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872FCC12002
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 02:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D39761377
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 02:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhGOC5G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 22:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhGOC5G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 22:57:06 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F979C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 19:54:13 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id m83so3803779pfd.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C90l7UH/YbMRyELxbBHByt2xcdW8Ch3InZoolsX6UZo=;
        b=tZiKTFH0YsHg3h/aDt2SiBtLUkYsFlXO5g3gj2mAXaX2Je6Y0a7i805bqoPsZKZmVj
         XjvsA5vskZULMgND6WSPz2I3ucfEr8Zh1G1lFSoPab6CJjv+0ZDrdSggEj0GD9qjfjT4
         KZ97dHwETzNhEwbJZORnXbDgoEhQvi55go1o2ZGdkPy1peepsJY+4GBgaQK8bQ3cXwBv
         anG224BiSL3DG7FYGz/s87MRHFBn80aMR+Mmft10qtFMxUNmX0Q4fT3nS619dhEWSu2b
         n+y2wKRxMmIkmwrxuS4dxs/s4K3463XqnENG6TnxT1dKH0HuJUPUQLBjYOgO1ucBNLNo
         MnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C90l7UH/YbMRyELxbBHByt2xcdW8Ch3InZoolsX6UZo=;
        b=DGShiqT+EDXtK2gWtkoTAaEETvOgQ7CAcMyTp8zJJSRcjIgRIinC77sXBIa67Y3KFm
         tn+9NJFh4hzNxYxzY7hwj5lPKTzqjz/NhN0y/wO3g6zt1/QzmrBrh7243bHsPfPBWaCC
         iOLX4r4p3vWFyGaTq4e2sd3CDWQ81yZaIu8l2hTVVY5xhxN2UjScvFV/kAWTZqk5FRWW
         u5llsHufKwDNY6IiUSlGzMfRXBHMEmjQZOErrS4RBBmkWkTdfHcaRPBgsvodgob9jbOW
         4X/PKlizi9EeGO34JXsotB4jK9ouHo48XmawTjmxdJVpb+UitljicnRbp1QmSdb93Mnd
         2kKA==
X-Gm-Message-State: AOAM5301LE95uzBesAPREbDENF1dFTXDkU44Fu3cBnoxgDIiJ+oFuFu6
        INKEzLg1Ham/FiLtF5iXln6D4qLJboDgdNKMiF0RJw==
X-Google-Smtp-Source: ABdhPJxHxk0QDwb10wnGqRmVq/VMVZ/VNOfw+9uOUQ7cTgD7H6IqGRmEEH9vEbdDhUQj72sGNuYENyeprDsy/ULlcjc=
X-Received: by 2002:a63:5963:: with SMTP id j35mr1598651pgm.341.1626317653069;
 Wed, 14 Jul 2021 19:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-3-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-3-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 15 Jul 2021 10:53:37 +0800
Message-ID: <CAMZfGtVhMbQ=QH__SbM4zf1KYBPSVsOcA-Cho2k832Qqmz+uMQ@mail.gmail.com>
Subject: Re: [External] [PATCH v3 02/14] mm/page_alloc: split
 prep_compound_page into head and tail subparts
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
> Split the utility function prep_compound_page() into head and tail
> counterparts, and use them accordingly.
>
> This is in preparation for sharing the storage for / deduplicating
> compound page metadata.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
