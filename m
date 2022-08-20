Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40226C28D13
	for <linux-doc@archiver.kernel.org>; Sat, 20 Aug 2022 01:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244969AbiHTBUh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Aug 2022 21:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245119AbiHTBUf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 21:20:35 -0400
Received: from mail-il1-x149.google.com (mail-il1-x149.google.com [IPv6:2607:f8b0:4864:20::149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE92CCE20
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 18:20:33 -0700 (PDT)
Received: by mail-il1-x149.google.com with SMTP id w6-20020a056e02190600b002e74e05fdc2so4288638ilu.21
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 18:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=Hy+OWfxLn1uSpMl+3tDFv8ysfTdHK4w3mL5UmpkU+QQ=;
        b=CTGMBtvoh43gIBFSYnDgcc5aZW77kdnh3yZHlfmBhGcZG11dqsl19mRFKitMzL+xZ9
         rWu3OEir+jIpKaM4/9hFLBexiC4OM7H+JtqVZlzqpMMyN1Bni/Cw7Wx4TqyXlOXvXzNe
         eyd335dHsFOw9/uta3ly6pUIN7i/kGKh7fzolnc6c7TpZHymz0A4MEBIsRSYGSF0O8gY
         1ZhdspYJjg+BsG+3HWd3gYYtBumyjUowRvZREX8I4R3fydUg5W06EN7TBQ7gMGhKqTt/
         qmLGIgF0CYbktOUlxlqYAoeLXH9tbzvxbOOk81YBPkGMjpXjEo3b2qd59SsvIKdScU5w
         mY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=Hy+OWfxLn1uSpMl+3tDFv8ysfTdHK4w3mL5UmpkU+QQ=;
        b=Gv77c3O8xDTyGu6oDVkBJ1MEnEho5p0cJc8Ya6qkeP8amQPxSiLdkcWImHPieDmIRd
         +10pYo6voPNZdm0QXzbSeWh+gLb85JhIrvK9/nRlasnunDoPVohfUTdgGxskKEV0Mp4Y
         1MBBCsY7/ibaF1G3ZmdgEqsaTEfbUsJeRQSBt3PvtRoFw9H778yrwerNyFpUbnEriOzw
         VdMSgMN+PPk+DHN80lgBwTl9YlkRhI++FDmRxCevDLGQIuEtJHcuH4kXX851DnuC2TFo
         vhxVTIyc0/yTbH4nmpsxBwCF1wyjm1+IYDBHRRTTwxDG6PA3hsEhrN3q4byGr3CPPN1c
         K5oQ==
X-Gm-Message-State: ACgBeo2B9vdTYzjrM0EYCh+Mw6DDIvlnlb1AeN1mg8bY0Jl2BHX5X+fG
        cJaGzJIV+5LBcyd7TPPXZ7YuM/ReAa0=
X-Google-Smtp-Source: AA6agR4eHC/d7mAFZH7t0obrCovhw8Et3/m9OfbGJ/5CXwIS59lUyMZnJ7lU6aOLt+yLkwtEJg3Iesw9HnI=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:be87:320b:90a3:ceed])
 (user=yuzhao job=sendgmr) by 2002:a6b:b802:0:b0:67b:de15:c1fb with SMTP id
 i2-20020a6bb802000000b0067bde15c1fbmr4507430iof.215.1660958432754; Fri, 19
 Aug 2022 18:20:32 -0700 (PDT)
Date:   Fri, 19 Aug 2022 19:20:31 -0600
In-Reply-To: <20220611082514.37112-5-dongli.zhang@oracle.com>
Message-Id: <20220820012031.1285979-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20220611082514.37112-5-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: Re: [PATCH v1 4/4] swiotlb: panic if nslabs is too small
From:   Yu Zhao <yuzhao@google.com>
To:     dongli.zhang@oracle.com
Cc:     ak@linux.intel.com, akpm@linux-foundation.org,
        alexander.sverdlin@nokia.com, andi.kleen@intel.com, bp@alien8.de,
        bp@suse.de, cminyard@mvista.com, corbet@lwn.net,
        damien.lemoal@opensource.wdc.com, dave.hansen@linux.intel.com,
        hch@infradead.org, iommu@lists.linux-foundation.org,
        joe.jin@oracle.com, joe@perches.com, keescook@chromium.org,
        kirill.shutemov@intel.com, kys@microsoft.com,
        linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        ltykernel@gmail.com, michael.h.kelley@microsoft.com,
        mingo@redhat.com, m.szyprowski@samsung.com, parri.andrea@gmail.com,
        paulmck@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
        robin.murphy@arm.com, tglx@linutronix.de, thomas.lendacky@amd.com,
        Tianyu.Lan@microsoft.com, tsbogend@alpha.franken.de,
        vkuznets@redhat.com, wei.liu@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Panic on purpose if nslabs is too small, in order to sync with the remap
> retry logic.
> 
> In addition, print the number of bytes for tlb alloc failure.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  kernel/dma/swiotlb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index fd21f4162f4b..1758b724c7a8 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -242,6 +242,9 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  	if (swiotlb_force_disable)
>  		return;
>  
> +	if (nslabs < IO_TLB_MIN_SLABS)
> +		panic("%s: nslabs = %lu too small\n", __func__, nslabs);

Hi,

This patch breaks MIPS. Please take a look. Thanks.

On v5.19.0:
  Linux version 5.19.0 (builder@buildhost) (mips64-openwrt-linux-musl-gcc (OpenWrt GCC 11.2.0 r19590-042d558536) 11.2.0, GNU ld (GNU Binutils) 2.37) #0 SMP Sun Jul 31 15:12:47 2022
  Skipping L2 locking due to reduced L2 cache size
  CVMSEG size: 0 cache lines (0 bytes)
  printk: bootconsole [early0] enabled
  CPU0 revision is: 000d9301 (Cavium Octeon II)
  Kernel sections are not in the memory maps
  Wasting 278528 bytes for tracking 4352 unused pages
  Initrd not found or empty - disabling initrd
  Using appended Device Tree.
  software IO TLB: SWIOTLB bounce buffer size adjusted to 0MB
  software IO TLB: mapped [mem 0x0000000004b0c000-0x0000000004b4c000] (0MB)

On v6.0-rc1, with
  commit 0bf28fc40d89 ("swiotlb: panic if nslabs is too small")
  commit 20347fca71a3 ("swiotlb: split up the global swiotlb lock")
  commit 534ea58b3ceb ("Revert "MIPS: octeon: Remove vestiges of CONFIG_CAVIUM_RESERVE32"")

  Linux version 6.0.0-rc1 (builder@buildhost) (mips64-openwrt-linux-musl-gcc (OpenWrt GCC 11.2.0 r19590-042d558536) 11.2.0, GNU ld (GNU Binutils) 2.37) #0 SMP Sun Jul 31 15:12:47 2022
  Failed to allocate CAVIUM_RESERVE32 memory area
  Skipping L2 locking due to reduced L2 cache size
  CVMSEG size: 0 cache lines (0 bytes)
  printk: bootconsole [early0] enabled
  CPU0 revision is: 000d9301 (Cavium Octeon II)
  Kernel sections are not in the memory maps
  Wasting 278528 bytes for tracking 4352 unused pages
  Initrd not found or empty - disabling initrd
  Using appended Device Tree.
  software IO TLB: SWIOTLB bounce buffer size adjusted to 0MB
  software IO TLB: area num 1.
  Kernel panic - not syncing: swiotlb_init_remap: nslabs = 128 too small

On v6.0-rc1, with
  commit 20347fca71a3 ("swiotlb: split up the global swiotlb lock")
  commit 534ea58b3ceb ("Revert "MIPS: octeon: Remove vestiges of CONFIG_CAVIUM_RESERVE32"")

  Linux version 6.0.0-rc1+ (builder@buildhost) (mips64-openwrt-linux-musl-gcc (OpenWrt GCC 11.2.0 r19590-042d558536) 11.2.0, GNU ld (GNU Binutils) 2.37) #0 SMP Sun Jul 31 15:12:47 2022
  Failed to allocate CAVIUM_RESERVE32 memory area
  Skipping L2 locking due to reduced L2 cache size
  CVMSEG size: 0 cache lines (0 bytes)
  printk: bootconsole [early0] enabled
  CPU0 revision is: 000d9301 (Cavium Octeon II)
  Kernel sections are not in the memory maps
  Wasting 278528 bytes for tracking 4352 unused pages
  Initrd not found or empty - disabling initrd
  Using appended Device Tree.
  software IO TLB: SWIOTLB bounce buffer size adjusted to 0MB
  software IO TLB: area num 1.
  software IO TLB: mapped [mem 0x0000000004c0c000-0x0000000004c4c000] (0MB)
