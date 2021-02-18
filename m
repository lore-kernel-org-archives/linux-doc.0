Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86C8C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 03:31:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7772A64E45
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 03:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhBRDas (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Feb 2021 22:30:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54244 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230063AbhBRDar (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Feb 2021 22:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613618960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DoMp21k95Jp6kwK2dHRqLcGVCEPrre4aoDuTP2Iaam4=;
        b=FNsZAVT7etptOIR9ZJRtaI9PSD21EKKLc31tCiXw0bfcTmlwqy3jVzCCZT3gb/c0gJAlN4
        Cfx3i1CxAMwZNWxCkVNqcm/dW+EXH4klrxDnZ5k7mQ5uEulY8uDIiI0riqtp2CFGYv10A8
        PCGhwZbPivITLh+HW6A222GKwzM1i/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-51wJf5h3NYaw5muEIpHCEg-1; Wed, 17 Feb 2021 22:29:15 -0500
X-MC-Unique: 51wJf5h3NYaw5muEIpHCEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78CB51005501;
        Thu, 18 Feb 2021 03:29:12 +0000 (UTC)
Received: from localhost (ovpn-12-112.pek2.redhat.com [10.72.12.112])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D3E14100164C;
        Thu, 18 Feb 2021 03:29:08 +0000 (UTC)
Date:   Thu, 18 Feb 2021 11:29:06 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     mingo@redhat.com, tglx@linutronix.de, rppt@kernel.org,
        dyoung@redhat.com, catalin.marinas@arm.com, will@kernel.org,
        nsaenzjulienne@suse.de, corbet@lwn.net, John.P.donnelly@oracle.com,
        prabhakar.pkin@gmail.com, horms@verge.net.au, robh+dt@kernel.org,
        arnd@arndb.de, james.morse@arm.com, xiexiuqi@huawei.com,
        guohanjun@huawei.com, huawei.libin@huawei.com,
        wangkefeng.wang@huawei.com, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 01/11] x86: kdump: replace the hard-coded alignment
 with macro CRASH_ALIGN
Message-ID: <20210218032607.GD2871@MiWiFi-R3L-srv>
References: <20210130071025.65258-1-chenzhou10@huawei.com>
 <20210130071025.65258-2-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130071025.65258-2-chenzhou10@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/30/21 at 03:10pm, Chen Zhou wrote:
> Move CRASH_ALIGN to header asm/kexec.h for later use. Besides, the
> alignment of crash kernel regions in x86 is 16M(CRASH_ALIGN), but
> function reserve_crashkernel() also used 1M alignment. So just
> replace hard-coded alignment 1M with macro CRASH_ALIGN.
> 
> Suggested-by: Dave Young <dyoung@redhat.com>
> Suggested-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> Tested-by: John Donnelly <John.p.donnelly@oracle.com>
> ---
>  arch/x86/include/asm/kexec.h | 3 +++
>  arch/x86/kernel/setup.c      | 5 +----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 6802c59e8252..be18dc7ae51f 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -18,6 +18,9 @@
>  
>  # define KEXEC_CONTROL_CODE_MAX_SIZE	2048
>  
> +/* 16M alignment for crash kernel regions */
> +#define CRASH_ALIGN		SZ_16M
> +
>  #ifndef __ASSEMBLY__
>  
>  #include <linux/string.h>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 3412c4595efd..da769845597d 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -390,9 +390,6 @@ static void __init memblock_x86_reserve_range_setup_data(void)
>  
>  #ifdef CONFIG_KEXEC_CORE
>  
> -/* 16M alignment for crash kernel regions */
> -#define CRASH_ALIGN		SZ_16M
> -
>  /*
>   * Keep the crash kernel below this limit.
>   *
> @@ -510,7 +507,7 @@ static void __init reserve_crashkernel(void)
>  	} else {
>  		unsigned long long start;
>  
> -		start = memblock_phys_alloc_range(crash_size, SZ_1M, crash_base,
> +		start = memblock_phys_alloc_range(crash_size, CRASH_ALIGN, crash_base,
>  						  crash_base + crash_size);

Looks good to me, thx.

Acked-by: Baoquan He <bhe@redhat.com>

>  		if (start != crash_base) {
>  			pr_info("crashkernel reservation failed - memory is in use.\n");
> -- 
> 2.20.1
> 

