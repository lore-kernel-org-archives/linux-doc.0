Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717DAC001DC
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jul 2023 10:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbjGZKZw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jul 2023 06:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbjGZKZu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jul 2023 06:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5F21FEC
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 03:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690367103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=36DJPnF7Pxv/d3UEUTkuVMdzn88ssz77HYYWsSAh9Ic=;
        b=XbAW+fxu3CUTvWGMXSVpQjC75zNgVF1GTDnJ2OAeMPzgmeWQB77fxGyb7rQvmc5H7ZuFYX
        RnRs92QvCJ8lckiKHpjNEzp/MF8RI67jtuOkt50fiaAPq/Iznk1ljDuWXRyTLfGQxBHxar
        45WouI12yIswfyBgUcPv/Y0gSwgzUKg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-VUxOp_ZdMMuuLuv-n4j8Yg-1; Wed, 26 Jul 2023 06:24:59 -0400
X-MC-Unique: VUxOp_ZdMMuuLuv-n4j8Yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B84991C31C46;
        Wed, 26 Jul 2023 10:24:58 +0000 (UTC)
Received: from localhost (ovpn-12-99.pek2.redhat.com [10.72.12.99])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id AC8E62166B25;
        Wed, 26 Jul 2023 10:24:57 +0000 (UTC)
Date:   Wed, 26 Jul 2023 18:24:53 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Chen Jiahao <chenjiahao16@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
        bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
        atishp@rivosinc.com, thunder.leizhen@huawei.com, horms@kernel.org
Subject: Re: [PATCH -next v9 1/2] riscv: kdump: Implement
 crashkernel=X,[high,low]
Message-ID: <ZMD0dV6JEG0UhWD6@MiWiFi-R3L-srv>
References: <20230726175000.2536220-1-chenjiahao16@huawei.com>
 <20230726175000.2536220-2-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726175000.2536220-2-chenjiahao16@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/26/23 at 05:49pm, Chen Jiahao wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Here introduce the parameter option crashkernel=X,[high,low].
> 
> One can reserve the crash kernel from high memory above DMA zone range
> by explicitly passing "crashkernel=X,high"; or reserve a memory range
> below 4G with "crashkernel=X,low".

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/setup.c |  5 +++
>  arch/riscv/mm/init.c      | 93 ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 91 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 971fe776e2f8..376f5d49ce85 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -178,6 +178,11 @@ static void __init init_resources(void)
>  		if (ret < 0)
>  			goto error;
>  	}
> +	if (crashk_low_res.start != crashk_low_res.end) {
> +		ret = add_resource(&iomem_resource, &crashk_low_res);
> +		if (ret < 0)
> +			goto error;
> +	}
>  #endif
>  
>  #ifdef CONFIG_CRASH_DUMP
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 70fb31960b63..156e09a1ceee 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1297,6 +1297,28 @@ static inline void setup_vm_final(void)
>  }
>  #endif /* CONFIG_MMU */
>  
> +/* Reserve 128M low memory by default for swiotlb buffer */
> +#define DEFAULT_CRASH_KERNEL_LOW_SIZE	(128UL << 20)
> +
> +static int __init reserve_crashkernel_low(unsigned long long low_size)
> +{
> +	unsigned long long low_base;
> +
> +	low_base = memblock_phys_alloc_range(low_size, PMD_SIZE, 0, dma32_phys_limit);
> +	if (!low_base) {
> +		pr_err("cannot allocate crashkernel low memory (size:0x%llx).\n", low_size);
> +		return -ENOMEM;
> +	}
> +
> +	pr_info("crashkernel low memory reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
> +		low_base, low_base + low_size, low_size >> 20);
> +
> +	crashk_low_res.start = low_base;
> +	crashk_low_res.end = low_base + low_size - 1;
> +
> +	return 0;
> +}
> +
>  /*
>   * reserve_crashkernel() - reserves memory for crash kernel
>   *
> @@ -1308,8 +1330,12 @@ static void __init reserve_crashkernel(void)
>  {
>  	unsigned long long crash_base = 0;
>  	unsigned long long crash_size = 0;
> +	unsigned long long crash_low_size = 0;
>  	unsigned long search_start = memblock_start_of_DRAM();
> -	unsigned long search_end = memblock_end_of_DRAM();
> +	unsigned long search_end = (unsigned long)dma32_phys_limit;
> +	char *cmdline = boot_command_line;
> +	bool fixed_base = false;
> +	bool high = false;
>  
>  	int ret = 0;
>  
> @@ -1325,14 +1351,36 @@ static void __init reserve_crashkernel(void)
>  		return;
>  	}
>  
> -	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> +	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
>  				&crash_size, &crash_base);
> -	if (ret || !crash_size)
> +	if (ret == -ENOENT) {
> +		/* Fallback to crashkernel=X,[high,low] */
> +		ret = parse_crashkernel_high(cmdline, 0, &crash_size, &crash_base);
> +		if (ret || !crash_size)
> +			return;
> +
> +		/*
> +		 * crashkernel=Y,low is valid only when crashkernel=X,high
> +		 * is passed.
> +		 */
> +		ret = parse_crashkernel_low(cmdline, 0, &crash_low_size, &crash_base);
> +		if (ret == -ENOENT)
> +			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
> +		else if (ret)
> +			return;
> +
> +		search_start = (unsigned long)dma32_phys_limit;
> +		search_end = memblock_end_of_DRAM();
> +		high = true;
> +	} else if (ret || !crash_size) {
> +		/* Invalid argument value specified */
>  		return;
> +	}
>  
>  	crash_size = PAGE_ALIGN(crash_size);
>  
>  	if (crash_base) {
> +		fixed_base = true;
>  		search_start = crash_base;
>  		search_end = crash_base + crash_size;
>  	}
> @@ -1345,12 +1393,37 @@ static void __init reserve_crashkernel(void)
>  	 * swiotlb can work on the crash kernel.
>  	 */
>  	crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
> -					       search_start,
> -					       min(search_end, (unsigned long) SZ_4G));
> +					       search_start, search_end);
>  	if (crash_base == 0) {
> -		/* Try again without restricting region to 32bit addressible memory */
> +		/*
> +		 * For crashkernel=size[KMG]@offset[KMG], print out failure
> +		 * message if can't reserve the specified region.
> +		 */
> +		if (fixed_base) {
> +			pr_warn("crashkernel: allocating failed with given size@offset\n");
> +			return;
> +		}
> +
> +		if (high) {
> +			/*
> +			 * For crashkernel=size[KMG],high, if the first attempt was
> +			 * for high memory, fall back to low memory.
> +			 */
> +			search_start = memblock_start_of_DRAM();
> +			search_end = (unsigned long)dma32_phys_limit;
> +		} else {
> +			/*
> +			 * For crashkernel=size[KMG], if the first attempt was for
> +			 * low memory, fall back to high memory, the minimum required
> +			 * low memory will be reserved later.
> +			 */
> +			search_start = (unsigned long)dma32_phys_limit;
> +			search_end = memblock_end_of_DRAM();
> +			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
> +		}
> +
>  		crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
> -						search_start, search_end);
> +						       search_start, search_end);
>  		if (crash_base == 0) {
>  			pr_warn("crashkernel: couldn't allocate %lldKB\n",
>  				crash_size >> 10);
> @@ -1358,6 +1431,12 @@ static void __init reserve_crashkernel(void)
>  		}
>  	}
>  
> +	if ((crash_base >= dma32_phys_limit) && crash_low_size &&
> +	     reserve_crashkernel_low(crash_low_size)) {
> +		memblock_phys_free(crash_base, crash_size);
> +		return;
> +	}
> +
>  	pr_info("crashkernel: reserved 0x%016llx - 0x%016llx (%lld MB)\n",
>  		crash_base, crash_base + crash_size, crash_size >> 20);
>  
> -- 
> 2.34.1
> 

