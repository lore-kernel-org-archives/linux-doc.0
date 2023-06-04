Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431B1C7EE23
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 03:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjFDDvv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 23:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjFDDvq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 23:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B303E1
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 20:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685850657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3xoQmPFaAUegfYSJYPIpp3RbbthxKSVIwBfF4d2guz4=;
        b=SOuxGqiWE6TbRlXdpbS9YTLsBJ9JAbZrKPzAqj+ivGcodWDFrRaCexGlZ3o9vXnefhFmu8
        jEdOCWuXgelDDZVbmGZFSIk9BPfg5s8nyUvlUgU+2Yq1uvSAqeYbR+LOT5F3YhBIZI3EtA
        gHXCxK3cyrwTMzHWkoa0lsDD+pa3Cfo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-A2_BvKP3MLuD089rbGtYyw-1; Sat, 03 Jun 2023 23:50:50 -0400
X-MC-Unique: A2_BvKP3MLuD089rbGtYyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBA8D800888;
        Sun,  4 Jun 2023 03:50:49 +0000 (UTC)
Received: from localhost (ovpn-12-83.pek2.redhat.com [10.72.12.83])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 595831410F25;
        Sun,  4 Jun 2023 03:50:47 +0000 (UTC)
Date:   Sun, 4 Jun 2023 11:50:44 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Chen Jiahao <chenjiahao16@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
        bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
        atishp@rivosinc.com, thunder.leizhen@huawei.com, horms@kernel.org
Subject: Re: [PATCH -next v5 1/2] riscv: kdump: Implement
 crashkernel=X,[high,low]
Message-ID: <ZHwKFADVXyNYJBCp@MiWiFi-R3L-srv>
References: <20230511085139.1039088-1-chenjiahao16@huawei.com>
 <20230511085139.1039088-2-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511085139.1039088-2-chenjiahao16@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jiahao,

On 05/11/23 at 04:51pm, Chen Jiahao wrote:
......  
> @@ -1300,14 +1325,34 @@ static void __init reserve_crashkernel(void)
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
> +		search_end = memblock_end_of_DRAM();
> +	} else if (ret || !crash_size) {
> +		/* Invalid argument value specified */
>  		return;
> +	}

The parsing part looks great, while you didn't mark if it's specified
high reservation, please see later comment why it's needed.

>  
>  	crash_size = PAGE_ALIGN(crash_size);
>  
>  	if (crash_base) {
> +		fixed_base = true;
>  		search_start = crash_base;
>  		search_end = crash_base + crash_size;
>  	}
> @@ -1320,17 +1365,31 @@ static void __init reserve_crashkernel(void)
>  	 * swiotlb can work on the crash kernel.
>  	 */
>  	crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
> -					       search_start,
> -					       min(search_end, (unsigned long) SZ_4G));
> +					       search_start, search_end);

If it's a specified high reservation, you have 
search_start = memblock_start_of_DRAM();
search_end = memblock_end_of_DRAM();

Then it attempts to search top down first time here.

>  	if (crash_base == 0) {
> -		/* Try again without restricting region to 32bit addressible memory */
> +		if (fixed_base) {
> +			pr_warn("crashkernel: allocating failed with given size@offset\n");
> +			return;
> +		}
> +		search_end = memblock_end_of_DRAM();
> +
> +		/* Try again above the region of 32bit addressible memory */
>  		crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
> -						search_start, search_end);
> +						       search_start, search_end);

If crashkernel=,high case, the first attempt failed, here it assigns
search_end with memblock_end_of_DRAM(). It's the exactly the same
attempt, why is that needed? Why don't you use a local variable 'high'
to mark the crashkernel=,hig, then judge when deciding how to adjsut the
reservation range.

Do I misunderstand the code? 

Thanks
Baoquan

>  		if (crash_base == 0) {
>  			pr_warn("crashkernel: couldn't allocate %lldKB\n",
>  				crash_size >> 10);
>  			return;
>  		}
> +
> +		if (!crash_low_size)
> +			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
> +	}
> +
> +	if ((crash_base > dma32_phys_limit - crash_low_size) &&
> +	    crash_low_size && reserve_crashkernel_low(crash_low_size)) {
> +		memblock_phys_free(crash_base, crash_size);
> +		return;
>  	}
>  
>  	pr_info("crashkernel: reserved 0x%016llx - 0x%016llx (%lld MB)\n",
> -- 
> 2.31.1
> 

