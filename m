Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4164C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  8 Oct 2022 02:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJHCSw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Oct 2022 22:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiJHCSu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Oct 2022 22:18:50 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72218127BC4
        for <linux-doc@vger.kernel.org>; Fri,  7 Oct 2022 19:18:48 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mkpdj3F77zlXYj;
        Sat,  8 Oct 2022 10:14:17 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 10:18:46 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 10:18:46 +0800
Message-ID: <775c7be8-e73a-af1b-0584-5f52e922098b@huawei.com>
Date:   Sat, 8 Oct 2022 10:18:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT
Content-Language: en-US
To:     Liu Shixin <liushixin2@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
CC:     <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <conor@kernel.org>
References: <20220915065027.3501044-1-liushixin2@huawei.com>
 <20220915065027.3501044-3-liushixin2@huawei.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220915065027.3501044-3-liushixin2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2022/9/15 14:50, Liu Shixin wrote:
> After we support HAVE_ARCH_HUGE_VMAP, we can now enbale HAVE_ARCH_HUGE_VMALLOC
> too. This feature has been used in kvmalloc and alloc_large_system_hash
> for now. This feature can be disabled by kernel parameters "nohugevmalloc".
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 336b925570c0..d567dca3ae75 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -70,6 +70,7 @@ config RISCV
>   	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>   	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>   	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_HUGE_VMALLOC

should be "select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP"

this could also fix the lkp build issue.

>   	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
>   	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
