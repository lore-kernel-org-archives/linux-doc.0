Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138C6C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 07:29:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBEAE60F9C
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 07:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbhG1H3z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jul 2021 03:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbhG1H3y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 03:29:54 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B7BC061757
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 00:29:53 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so2923775pjh.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2S8+P9Er5rx8OhndztunXCa9ZYXKz6ZFsurjIyFPNKI=;
        b=gqdezsRO/p2YBoDmobyxqSuAOW3vRt4ku2SPejRpps4UMPun0YUJDOhjEzr7HDCaSo
         WBVu1lOOcsXy1mD+ZjzjRsM7RVnXGnYN9Sp78lblD0zfLD+qTXmNSxEwIKmpGcrngGaz
         SdO6vKep8ASVg8Jnj96pBB2ZX6AutIZ+h+Wkj019/6st0j0C41zTdD6Bp2Xfw6cZWz1x
         /0Daiodp/h9zwTK2C6KGbQdYJpW5Lry8tvK5hKcvMWueVFOXJ6tQ4CSmKIONcoaaQpSW
         IqFc3SPLhIEJveSRWwNC6ohwHyyZL/+Ag4W6YPNUg6UXGPnXN0jqKKXTHtubRZ/YqxcK
         uT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2S8+P9Er5rx8OhndztunXCa9ZYXKz6ZFsurjIyFPNKI=;
        b=Rc5OFZHQim4XNgOm63tt1/U7jnX/JCJ+6nQl1Ijklvc7RETTIA4Wm8iQz2PkYIZ2gj
         85E33Mw3NcR/YJYygVvt1kTFvtJyTLo1YSyCnM9bAR8wkOTlAHG0hqm8ZwdkqOGZ1sZ0
         HXd+xwPXHx9+//RTR0rVpN4uH4FCk6lQymVqYFmWqXLxKP7x7917qS25m+kr3t/VekZT
         JrqrhITilnirGPiGHE68sImSLH9rSyjXqx2lVpgxPpV20InBFb/fV976qrt4XzMzs2Dl
         no1MXX4+5b3J7zqBBwtxMfRkuTdb067RH3YVWUcYDrxw9AQVp1k6tLcW51uTG0LsZsiH
         mE8g==
X-Gm-Message-State: AOAM531GoNO+p89c2aV7uJNo1SahsqSslJB2HxiMZ+k0elxIPZnLqMMb
        OJCdpah/+TEzacqp1o/nyhVRR2zfQ1U6YbGCGfOBVA==
X-Google-Smtp-Source: ABdhPJwCSgiiXe9Ln9i8qGaBPIqEBi67YnKEKmT/EGWvvMj1Z25AvGEZqAAFUqQq71dxAlqNK2jmc743sCGmsO5Gn+M=
X-Received: by 2002:a17:902:ab91:b029:12b:8dae:b1ff with SMTP id
 f17-20020a170902ab91b029012b8daeb1ffmr22005774plr.52.1627457393556; Wed, 28
 Jul 2021 00:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-11-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-11-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 28 Jul 2021 00:29:42 -0700
Message-ID: <CAPcyv4hxn4_E0dJdLgzskzcJUsQ=0cb5KHM9_yiMLOeNq7muoA@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] device-dax: use ALIGN() for determining pgoff
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
> Rather than calculating @pgoff manually, switch to ALIGN() instead.

Looks good,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  drivers/dax/device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index dd8222a42808..0b82159b3564 100644
> --- a/drivers/dax/device.c
> +++ b/drivers/dax/device.c
> @@ -234,8 +234,8 @@ static vm_fault_t dev_dax_huge_fault(struct vm_fault *vmf,
>                  * mapped. No need to consider the zero page, or racing
>                  * conflicting mappings.
>                  */
> -               pgoff = linear_page_index(vmf->vma, vmf->address
> -                               & ~(fault_size - 1));
> +               pgoff = linear_page_index(vmf->vma,
> +                               ALIGN(vmf->address, fault_size));
>                 for (i = 0; i < fault_size / PAGE_SIZE; i++) {
>                         struct page *page;
>
> --
> 2.17.1
>
