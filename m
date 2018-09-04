Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B356F7D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Sep 2018 23:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbeIEEIe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 00:08:34 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:35771 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbeIEEIe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 00:08:34 -0400
Received: by mail-yw1-f65.google.com with SMTP id 14-v6so1960765ywe.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Sep 2018 16:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ettus-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=l7cfVWEo+s72Cr+f/IYhNLNnmwH47pf9W7a9az82J0Y=;
        b=dD9x0giIiUICFigz0dtpjAo0Z1+LJYljzzrINoo9BCg/Tlf/PzhqUnQIj05u+VDCM0
         DtL5hm4yOKQ6KuUGCZxI9RKLvBh8GANRbCV4OZC92CSXwKCVykSMdW2Vh0bJfRzQ/4zj
         UaTK+GqQXQcXiLmzqMPKbY8TyrR42oAMnTfMJmKFbvO5rpjh4SHccAAPPEHOgiW1/fKp
         uVrzgvbw4jnnGmqY+DDvDGE0adFz5YdD2/R+2kN8ZuzBfVCQAoKsCWcfN3lfcPyTPZzW
         qO+ZgKFAWbdxVkrrFcCudVYZd6CkCJl06FWyFHmgXXkDHzgC0rJVjeou+MtjoiXO6pVf
         nBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=l7cfVWEo+s72Cr+f/IYhNLNnmwH47pf9W7a9az82J0Y=;
        b=t1Kh+Dh84xnQP0UkDHA/ZUfwcbkpJ3+JQhTdiu2Gz+ee0t/Y+LNB+8gkZwad7bR3l8
         K30J0CzRUtBDamgWk6eKmbcU/eXMW12BVfEmqybe3f7XBMwuT3/C5necTRn8xmz0EVfb
         8PhqyNcFISYCQfzzM8Lr0oDvsfP1kYD4OjifGQej5xQ66I1+VAyVxdN0oAkC4X25VBie
         cs5gx3NYLb5coLr03sZNnVPMTDSfA2MFG5wHy+gOL3Wc5Lsnk19CPuvA7NzvjIm1HFS+
         6QJPKq/G5YGUFC464SRPSP9Jsb6q5rXMukBfDk8Qu0QNH4gRfjJi1Rd+si+BIga7U+1H
         ufbg==
X-Gm-Message-State: APzg51DEPB1TXb5nA/DmeMlZVHIKqBBOzKZksaVImkyzhuOKr9MR7GJl
        AnfsaX9VPhFI5RtXtatyawO61r4PFSZNZWjmPzJwKg==
X-Google-Smtp-Source: ANB0VdbeR1oZCqfPA+qZ/SShGK7kcGEsAbFhwIOTWM3X1MmvdF0ooEzaUUZT7NLubgu3UAvHq6Nio4HKNpwwL90rJZ8=
X-Received: by 2002:a0d:ef01:: with SMTP id y1-v6mr20209976ywe.498.1536104469894;
 Tue, 04 Sep 2018 16:41:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:e106:0:0:0:0:0 with HTTP; Tue, 4 Sep 2018 16:41:09 -0700 (PDT)
In-Reply-To: <20180904212237.3078-2-atull@kernel.org>
References: <20180904212237.3078-1-atull@kernel.org> <20180904212237.3078-2-atull@kernel.org>
From:   Moritz Fischer <moritz.fischer@ettus.com>
Date:   Tue, 4 Sep 2018 16:41:09 -0700
Message-ID: <CAAtXAHfzhmdZ6SnheZ-DXD14dde7Ccm66jEM=Q3UWDukKsyGBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] fpga: do not access region struct after fpga_region_unregister
To:     Alan Tull <atull@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-fpga@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On Tue, Sep 4, 2018 at 2:22 PM, Alan Tull <atull@kernel.org> wrote:
> A couple drivers were accessing the region struct after it had been
> freed.  Save off the pointer to the mgr before the region struct gets
> freed.
>
> Signed-off-by: Alan Tull <atull@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
> v2: no change in v2 of patchset
> ---
>  drivers/fpga/dfl-fme-region.c | 4 +++-
>  drivers/fpga/of-fpga-region.c | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/fpga/dfl-fme-region.c b/drivers/fpga/dfl-fme-region.c
> index 0b7e19c..51a5ac2 100644
> --- a/drivers/fpga/dfl-fme-region.c
> +++ b/drivers/fpga/dfl-fme-region.c
> @@ -14,6 +14,7 @@
>   */
>
>  #include <linux/module.h>
> +#include <linux/fpga/fpga-mgr.h>
>  #include <linux/fpga/fpga-region.h>
>
>  #include "dfl-fme-pr.h"
> @@ -66,9 +67,10 @@ static int fme_region_probe(struct platform_device *pdev)
>  static int fme_region_remove(struct platform_device *pdev)
>  {
>         struct fpga_region *region = dev_get_drvdata(&pdev->dev);
> +       struct fpga_manager *mgr = region->mgr;
>
>         fpga_region_unregister(region);
> -       fpga_mgr_put(region->mgr);
> +       fpga_mgr_put(mgr);
>
>         return 0;
>  }
> diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
> index 35fabb8..052a134 100644
> --- a/drivers/fpga/of-fpga-region.c
> +++ b/drivers/fpga/of-fpga-region.c
> @@ -437,9 +437,10 @@ static int of_fpga_region_probe(struct platform_device *pdev)
>  static int of_fpga_region_remove(struct platform_device *pdev)
>  {
>         struct fpga_region *region = platform_get_drvdata(pdev);
> +       struct fpga_manager *mgr = region->mgr;
>
>         fpga_region_unregister(region);
> -       fpga_mgr_put(region->mgr);
> +       fpga_mgr_put(mgr);
>
>         return 0;
>  }
> --
> 2.7.4
>

Thanks,
Moritz
