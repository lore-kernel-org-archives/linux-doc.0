Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1567CC001B0
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jul 2023 10:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjGZK0O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jul 2023 06:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjGZK0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jul 2023 06:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A92213A
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690367129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6NrkSvDdE4cdjpoTJxD+Lnito5LDpS0282P7ZLa36EE=;
        b=ayfft717g8RgJMTFk85JjdJMKe5+RZXiwygGW27X3CyHOqRZgrm/Etx78YkuOX+xDNcIRH
        0f3PfzoAfhWlwCGzY4TXJFZHpwCmcuOKzwmrG9z3v5MVVAXN5B8ONHRxGhO7MRIhw1r/5p
        3sny/i2OuKLFWX0VIYjyuBzQUJ2tzl0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-jrcLmOGXMXWtWFE-eZtxUw-1; Wed, 26 Jul 2023 06:25:24 -0400
X-MC-Unique: jrcLmOGXMXWtWFE-eZtxUw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E81B1C31C49;
        Wed, 26 Jul 2023 10:25:23 +0000 (UTC)
Received: from localhost (ovpn-12-99.pek2.redhat.com [10.72.12.99])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E202646A3A7;
        Wed, 26 Jul 2023 10:25:22 +0000 (UTC)
Date:   Wed, 26 Jul 2023 18:25:19 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Chen Jiahao <chenjiahao16@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
        bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
        atishp@rivosinc.com, thunder.leizhen@huawei.com, horms@kernel.org
Subject: Re: [PATCH -next v9 2/2] docs: kdump: Update the crashkernel
 description for riscv
Message-ID: <ZMD0jxzH0jmFLTd8@MiWiFi-R3L-srv>
References: <20230726175000.2536220-1-chenjiahao16@huawei.com>
 <20230726175000.2536220-3-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726175000.2536220-3-chenjiahao16@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/26/23 at 05:50pm, Chen Jiahao wrote:
> Now "crashkernel=" parameter on riscv has been updated to support
> crashkernel=X,[high,low]. Through which we can reserve memory region
> above/within 32bit addressible DMA zone.
> 
> Here update the parameter description accordingly.

Acked-by: Baoquan He <bhe@redhat.com>

> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Reviewed-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a1457995fd41..bd519749968f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -862,7 +862,7 @@
>  			memory region [offset, offset + size] for that kernel
>  			image. If '@offset' is omitted, then a suitable offset
>  			is selected automatically.
> -			[KNL, X86-64, ARM64] Select a region under 4G first, and
> +			[KNL, X86-64, ARM64, RISCV] Select a region under 4G first, and
>  			fall back to reserve region above 4G when '@offset'
>  			hasn't been specified.
>  			See Documentation/admin-guide/kdump/kdump.rst for further details.
> @@ -875,14 +875,14 @@
>  			Documentation/admin-guide/kdump/kdump.rst for an example.
>  
>  	crashkernel=size[KMG],high
> -			[KNL, X86-64, ARM64] range could be above 4G. Allow kernel
> -			to allocate physical memory region from top, so could
> -			be above 4G if system have more than 4G ram installed.
> -			Otherwise memory region will be allocated below 4G, if
> -			available.
> +			[KNL, X86-64, ARM64, RISCV] range could be above 4G.
> +			Allow kernel to allocate physical memory region from top,
> +			so could be above 4G if system have more than 4G ram
> +			installed. Otherwise memory region will be allocated
> +			below 4G, if available.
>  			It will be ignored if crashkernel=X is specified.
>  	crashkernel=size[KMG],low
> -			[KNL, X86-64, ARM64] range under 4G. When crashkernel=X,high
> +			[KNL, X86-64, ARM64, RISCV] range under 4G. When crashkernel=X,high
>  			is passed, kernel could allocate physical memory region
>  			above 4G, that cause second kernel crash on system
>  			that require some amount of low memory, e.g. swiotlb
> @@ -893,6 +893,7 @@
>  			size is	platform dependent.
>  			  --> x86: max(swiotlb_size_or_default() + 8MiB, 256MiB)
>  			  --> arm64: 128MiB
> +			  --> riscv: 128MiB
>  			This one lets the user specify own low range under 4G
>  			for second kernel instead.
>  			0: to disable low allocation.
> -- 
> 2.34.1
> 

