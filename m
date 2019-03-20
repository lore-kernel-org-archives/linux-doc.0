Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 196487D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 21:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfCTVbb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Mar 2019 17:31:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37387 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbfCTVbb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Mar 2019 17:31:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id v14so683586wmf.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Mar 2019 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mtxf5pT39Z4BnbnxgSq7NjbZwWFw7wbcGxGIAo3gGpo=;
        b=Hv4/2pZsdQ9/lGuJMcAKTBbQlWwDQ4TvIeFoDsoLQIB6cL0tn9YFVRTeTGV0aNPZRs
         em/Z1u9GSr5gRRyRmrsDlSeY0E8oZY1DsID5yn6eZIjVsk4h41LdTzVfBUgO0ZI0cIcw
         PNhEopdU2FTDIagAghKH0MOFUuhN/aieSmyX5XgHzHKPHu++ohJBVMqP2XCfDpdyFo6u
         80oKeAaPwt8YMzbU42eO+EFrGm3VBZhzgXrykubyvWYOF0rZUbfEHlYrKfBSPs6bk/Gr
         JO08NcPXd9RncZkdZ7kruffxULpbBADb/VmNMMrcWch6vZExIUlhuAfRX+GrFd0if46j
         0kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mtxf5pT39Z4BnbnxgSq7NjbZwWFw7wbcGxGIAo3gGpo=;
        b=IG8PkCSHE5AD4OV+uuv6C3PT4EQ8IXp0JtsubKcZTi35DDvhvspQXnvcfTZYjhXDHC
         lysO6GDRXz3wOC9hYbAO1vEWafQRx3EilhEEITgajW15mSozJNm9WLCu9E1e4r4b8KVJ
         ctC4EVq3MMtgrwi1YEF7E12ryJF8mCY8PFkVkSoEX6267oGcoRc+QJjRToYrPzqBnqH+
         6xfNN0dX/nAd7eqSuY1ebC0XqkSdz/8zfauPD7WK9+wXvBCAYw9YBApg3BLTTtl/e5E2
         jvWuFw93M94qYBTLSWcqivuI2VpS3ZcN9lCtIZJk+7m/2RbS/eG0N41CeUiHHKzOWr8j
         pTlQ==
X-Gm-Message-State: APjAAAW6btme+cweiMQJUO9TBvKJMC7uv1K0PC3tn/vCO4xfcI5BBUEe
        cL8FUPhnLvvV7CYTVTvjZZJm9rO810oNRC9R4U07
X-Google-Smtp-Source: APXvYqxQQW3kNihij1Gl9oxwdtbghk+q6zd/Q77QU9ixq+Z8/jzPiFPM/zm5LcbxvJATXFOnH0T3XPepzBtNyvZpLQ4=
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr259183wmj.62.1553117489398;
 Wed, 20 Mar 2019 14:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190320161320.59291-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190320161320.59291-1-andriy.shevchenko@linux.intel.com>
From:   Bjorn Helgaas <bhelgaas@google.com>
Date:   Wed, 20 Mar 2019 16:31:17 -0500
Message-ID: <CAErSpo4v5qxza6Uyo8ZJ1kWWY2eBMxn5JQNQk2kAeZ2PZ2a+Yw@mail.gmail.com>
Subject: Re: [PATCH v1] dma-mapping: Fix filename references
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        linux-doc@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 20, 2019 at 11:13 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> After the commit cf65a0f6f6ff
>
>   ("dma-mapping: move all DMA mapping code to kernel/dma")
>
> some of the files are referring to outdated information, i.e. old file names
> of DMA mapping sources.
>
> Fix it here.
>
> Cc: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> +++ b/arch/ia64/kernel/setup.c
> @@ -256,7 +256,7 @@ __initcall(register_memory);
>   * This function checks if the reserved crashkernel is allowed on the specific
>   * IA64 machine flavour. Machines without an IO TLB use swiotlb and require
>   * some memory below 4 GB (i.e. in 32 bit area), see the implementation of
> - * lib/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
> + * kernel/dma/swiotlb.c. The hpzx1 architecture has an IO TLB but cannot use that
>   * in kdump case. See the comment in sba_init() in sba_iommu.c.

Is the point here that just that if you lack an IOTLB and want devices
to be able to reach system memory above 4GB, you need a bounce buffer
below 4GB?  If so, maybe we could just say *that* instead of a
nebulous reference to "the implementation of */swiotlb.c", which
doesn't tell you what part of the implementation is relevant.

> diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
> index 5f5302028a9a..7b6dd54018fa 100644
> --- a/arch/x86/kernel/pci-swiotlb.c
> +++ b/arch/x86/kernel/pci-swiotlb.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/* Glue code to lib/swiotlb.c */
> +/* Glue code to kernel/dma/swiotlb.c */

I personally don't think there's much value in this line and I'd
remove it entirely.

>  #include <linux/pci.h>
>  #include <linux/cache.h>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index fa57de34776d..1e610ce5992c 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -474,7 +474,7 @@ static int __init reserve_crashkernel_low(void)
>         ret = parse_crashkernel_low(boot_command_line, total_low_mem, &low_size, &base);
>         if (ret) {
>                 /*
> -                * two parts from lib/swiotlb.c:
> +                * two parts from kernel/dma/swiotlb.c:
>                  * -swiotlb size: user-specified with swiotlb= or default.
>                  *
>                  * -swiotlb overflow buffer: now hardcoded to 32k. We round it

Is there any chance this could be updated to refer to some variable or
function names that grep/ctags/cscope/etc could find?  If we had that,
I think the filename reference would be superfluous.

> diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
> index 3cdafea55ab6..1d7f606c59d9 100644
> --- a/arch/x86/pci/sta2x11-fixup.c
> +++ b/arch/x86/pci/sta2x11-fixup.c
> @@ -1,6 +1,6 @@
>  /*
>   * arch/x86/pci/sta2x11-fixup.c
> - * glue code for lib/swiotlb.c and DMA translation between STA2x11
> + * glue code for kernel/dma/swiotlb.c and DMA translation between STA2x11

I think both of these lines (the "arch/x86/pci/sta2x11-fixup.c" one
and the "glue code" one) are superfluous.

There's also a superfluous empty line at the end of the GPL license
text, but I guess that should be removed by replacing the whole thing
with an SPDX line.

>   * AMBA memory mapping and the X86 memory mapping
>   *
>   * ST Microelectronics ConneXt (STA2X11/STA2X10)
> --
> 2.20.1
>
