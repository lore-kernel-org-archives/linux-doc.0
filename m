Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D906C12002
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 00:18:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B409613CC
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 00:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhGOAU7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 20:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbhGOAU7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 20:20:59 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A842C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 17:18:07 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id q10so3483478pfj.12
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 17:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4VJ3QvXXf1oCSZlmmZFCmW5HhP20GRBt05z5BXuB1vs=;
        b=uBduij+oYAOXEjH4jNqSZs7BixvrflL0IdUDoXUhFmhs1w/2WYw8ttEEGg0fN02eaK
         7jsxrQM6OVx8FmZm481U3WqWwFAVAui13aUjeAE1kfy6CAYU+LuqJOhRzoywQ2m84iXS
         B1nfeX/Ke9hDOud+8boi/Ki8fNat1B4XK5KyHFB5BT4fXGBAaEMEttGMHdCBq+3X7Rty
         ziJScIfev0Y8vKOVwePgJfib2PwmVGnXtzcGHuRrxCcTChd/GC8pmKw5xJOw9d0JLeB9
         KehMTZovWBH1NoSAnLm/xlmhl2DLXrMROI/NiJA33bK5WY9iZsdazO9f7mnP60FF15o/
         VHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4VJ3QvXXf1oCSZlmmZFCmW5HhP20GRBt05z5BXuB1vs=;
        b=gODLQlDkXvrg5eRYbz6CvVMp1Hc3Eo16NaKXN1wyuin/faA3lpr8iRdT7/DqANywNq
         NYBWKIDdefM/apbSbCEvY1WDCvuZuZN2GKnKCqoEzFLyr3ivulCLyrMfSw2lgv27sPpW
         ilc32CNhrx35fzH8YeXbHMRk5121WUSJj95DYi4azGlw4kw0sMg8ei9AF34aYKWI5Yra
         p1wjBm7tH/H/Ttpva32IjWxJd5SdwwITKM+ZJ6CJeUUlGgGldwvBk4DTIaoqWxRJ8hyZ
         TSQyv9ajrgHZHQKQ1zrG0EH2ZlM+bjrIDychrx1ez9R10evVPaaxDPlKK2+U7MrEHPO5
         eOkA==
X-Gm-Message-State: AOAM532zDhXvQVXgIXX7UZE8kVTWxo3OSppPJjIX+d1svHjWNXeDX/RQ
        Z+xwyI5wkQx5ahAUekfk435yCppHaD7vzf+tp44rnQ==
X-Google-Smtp-Source: ABdhPJyETQCPrQKAwXM3+Q+zFkI7GfSpzIc9Eemwwj5kBC+9lq+w0ZtFhIg9xVOKlT93NH9LOjq2bKHvYF+tqDg4OFk=
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id
 l6-20020a056a0016c6b029032de1909dd0mr811916pfc.70.1626308286912; Wed, 14 Jul
 2021 17:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-2-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-2-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 14 Jul 2021 17:17:55 -0700
Message-ID: <CAPcyv4iSiTRN2QNYqWDUepFQdiDmBk24e420xUUUCZ_ON8j5SA@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] memory-failure: fetch compound_head after pgmap_pfn_valid()
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
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

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
