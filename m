Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA961EB5C2;
	Mon, 30 Mar 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857307; cv=none; b=uL9qKedryFIvS3FHUYwc70h87hF1MO+J9lEw7ojaBZykyGAoIdjvn3r5GVlqufiHw1/xdU21SncGzMG/kgcRsK27QIgBIV/J8HTpkHEpDSRruDlq3uTYK++puLynXN16TUG5XgMYe5h9vN65cbynMioGPCiFk/0ZDiXjYBzlmio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857307; c=relaxed/simple;
	bh=c2v402NYvCzdZ276PSOrOAneL4XWK44QnJnzK0i0j8c=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IZJROvhVsqtn5rrOGQbU3oJuE1wForkr8je82ZzJpLfZH30RFcTLLKTeHq84OxPI936/wBshYlR9Vc1cYNglSMNVA2z/ip9G7Dm4k11qzelIMuga907BxdUbXDirWmhQOLMNdlTc3uUymOU2lbn6SFOUzYZA07zzfQchSvLvaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=kdRyhgPo; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="kdRyhgPo"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gxL/nLHtk8yzJElgrCWa2G5swCzIh9KhW/8g+WYobqw=;
	b=kdRyhgPoF6ynd8J8zQDabTun7D67+34eRkJ+/9iQPVyI8ywedL6hVtwVCtLr2aJawq8obtW0M
	fDXTp5Rn5dZSgRVNcskaQDvbTVawHpsxDvrQs271E4xMZiR5R3hQYnqv74YWERC1dGFxW6JJJaR
	yw7yOw1NLjkcMAarT8N7KUg=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fkk0x160sznTW1;
	Mon, 30 Mar 2026 15:49:37 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 00A104048B;
	Mon, 30 Mar 2026 15:55:02 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Mar 2026 15:55:01 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Mar 2026 15:55:01 +0800
Subject: Re: [PATCH 1/2] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
 <20260323-ecc_panic-v1-1-72a1921726c5@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <a88d62ee-530c-1a6e-c05f-de324f940b8f@huawei.com>
Date: Mon, 30 Mar 2026 15:55:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260323-ecc_panic-v1-1-72a1921726c5@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/3/23 23:29, Breno Leitao wrote:
> When memory_failure() encounters an in-use kernel page that cannot be
> recovered (slab, page tables, kernel stacks, reserved, vmalloc, etc.),
> it currently logs MF_IGNORED and continues. This leaves corrupted data
> accessible to the kernel, risking silent data corruption or a delayed
> crash when the poisoned cache line is next accessed.
> 
> For example, a multi-bit ECC error on a dentry cache slab page was
> ignored by memory_failure(), and 67 seconds later d_lookup() accessed
> the poisoned cache line, causing a synchronous external abort:
> 
>   [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
>   [88690.498473] Memory failure: 0x40272d: unhandlable page.
>   [88690.498619] Memory failure: 0x40272d: recovery action for
>                  get hwpoison page: Ignored
>   ...
>   [88757.847126] Internal error: synchronous external abort:
>                  0000000096000410 [#1] SMP
>   [88758.061075] pc : d_lookup+0x5c/0x220
> 
> Add a new sysctl vm.panic_on_unrecoverable_memory_failure (default 0)
> that, when set to 1, panics immediately on unrecoverable memory
> failures. This provides a clean crash dump at the time of the error
> rather than a delayed crash with potential silent corruption in between.
> 
> The panic is placed in action_result() so that all call sites that log
> MF_MSG_GET_HWPOISON with MF_IGNORED are covered, including the hugetlb
> path in try_memory_failure_hugetlb().
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  mm/memory-failure.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index ee42d43613097..25bd043497195 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -74,6 +74,8 @@ static int sysctl_memory_failure_recovery __read_mostly = 1;
>  
>  static int sysctl_enable_soft_offline __read_mostly = 1;
>  
> +static int sysctl_panic_on_unrecoverable_mf __read_mostly;
> +
>  atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
>  
>  static bool hw_memory_failure __read_mostly = false;
> @@ -155,6 +157,15 @@ static const struct ctl_table memory_failure_table[] = {
>  		.proc_handler	= proc_dointvec_minmax,
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE,
> +	},
> +	{
> +		.procname	= "panic_on_unrecoverable_memory_failure",
> +		.data		= &sysctl_panic_on_unrecoverable_mf,
> +		.maxlen		= sizeof(sysctl_panic_on_unrecoverable_mf),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= SYSCTL_ONE,
>  	}
>  };
>  
> @@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
>  	pr_err("%#lx: recovery action for %s: %s\n",
>  		pfn, action_page_types[type], action_name[result]);
>  
> +	if (sysctl_panic_on_unrecoverable_mf &&
> +	    type == MF_MSG_GET_HWPOISON && result == MF_IGNORED)
> +		panic("Memory failure: %#lx: unrecoverable page", pfn);

MF_MSG_GET_HWPOISON contains some other scenarios. For example, an isolated folio will
make get_hwpoison_page return -EIO so we will see MF_MSG_GET_HWPOISON and MF_IGNORED in
action_result. But that's recoverable if folio is used by userspace thus panic will be
unacceptable.
Will it better to check type against MF_MSG_KERNEL_HIGH_ORDER?

Thanks.
.
