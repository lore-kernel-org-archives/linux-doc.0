Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB99C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 07:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6086360F93
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 07:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbhG1Han (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jul 2021 03:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbhG1Han (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 03:30:43 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4C6C061757
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 00:30:42 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e21so1628357pla.5
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 00:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NqBINzippdeAi2AUoM8Hkgi2WKFqvanJBMGmS1p+Xcs=;
        b=m8+KioYWU5HcHAf03pb9llrLo1TzP76HPELHuGb/Etbo8asLxCQSh9F/oGXlIiB6GM
         uVA47IXLQRBJzElI3CMtSS1swD/F+dIDTZ8/is84Qigm0BbQ4liDCW3YVcKcsVgr7zjn
         iX0HWTmyCyWrhOCD1vL3tGmfwhK7AkTk2hV4qb2uLNNECKf6bVqEE57aiZ/7xxRIhf0G
         BBQz3JKlXxxq1w4iR4D5R0LsuqZNQbMyo+T8Uk4IA/9f45q0PeMX2NRuQVmP2StJ7n3z
         q3TOMEMGnt8skKjG6IFHe8HSqt7oe+TD5+xshm5BYIe45oIl+ZYRLPbjqX4mkQTyGSWW
         y2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqBINzippdeAi2AUoM8Hkgi2WKFqvanJBMGmS1p+Xcs=;
        b=eWO8yTd8WBdkRXVXLiDwfZaup/OV1AeXmR+d8Uq7ShCCuMbcoIQVs94pudLfAs+UAL
         Dtlk4YvKJN7Pz74ehlhX7W1Er1AryzYcLkU9By3Nbf8lJWSDCf5KOw2b3dcRd23oLcny
         EsKXvVqu7cUW+voniExJ2cPUTq1crm8PGsD/TaIFDzb9eUBgxxq7J8lMbiqcVQdJcjH8
         UjVDhL25dAp4+0NNLlp6EVk5oNb71cK1WTiUqK4QKJL3dOE5SFAAkJ+KW/i0cVvF/+EV
         5rFupYb292M/k9WVaxq5kKYj7MKb9IpFWZdq9/5gW94jDE7e/fpEQIuuA5uiEJjVvb6I
         cN8g==
X-Gm-Message-State: AOAM532wbdKuMrJ9nQ+Q8O+7obOX5zPwbhAQ+5X98R+Y8eB1oX2xAtSv
        TToA3mwWdu9rIAAmB0P7M44gXnaDlQxlMfYc8M1U1Q==
X-Google-Smtp-Source: ABdhPJxyIIHHl86lkJ8BKYd8Sr40+PFPjq08zj2oGDSc7bXZBce3xcsJXqCNSwrIRSxqXD0wTgM3ITFht3olLzROjE4=
X-Received: by 2002:a65:5544:: with SMTP id t4mr27532425pgr.240.1627457441692;
 Wed, 28 Jul 2021 00:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-12-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-12-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 28 Jul 2021 00:30:30 -0700
Message-ID: <CAPcyv4hv+LXmAs-BMATuyoPLRAF_-+d5Yap450sbCDFTcvGO4w@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] device-dax: ensure dev_dax->pgmap is valid for
 dynamic devices
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
> Right now, only static dax regions have a valid @pgmap pointer in its
> struct dev_dax. Dynamic dax case however, do not.
>
> In preparation for device-dax compound pagemap support, make sure that
> dev_dax pgmap field is set after it has been allocated and initialized.

I think this is ok to fold into the patch that needs it.

>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  drivers/dax/device.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index 0b82159b3564..6e348b5f9d45 100644
> --- a/drivers/dax/device.c
> +++ b/drivers/dax/device.c
> @@ -426,6 +426,8 @@ int dev_dax_probe(struct dev_dax *dev_dax)
>         }
>
>         pgmap->type = MEMORY_DEVICE_GENERIC;
> +       dev_dax->pgmap = pgmap;
> +
>         addr = devm_memremap_pages(dev, pgmap);
>         if (IS_ERR(addr))
>                 return PTR_ERR(addr);
> --
> 2.17.1
>
