Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923818AFE;
	Mon, 13 Apr 2026 03:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776051761; cv=none; b=pVy4d4RAs6xUgzMWpYFZy3gd+YsLxiP9iaIQxxeyvG17jmoLdCRKxanDcPESnwuUFEXT4ff8t/23HtKJmduH0CtIu2R2TJN1grkkKLBOYw6W0tirie1lJte9PaCEPuTWQbRr7KRIIF3D3r3FoL6UMHhNzclW1IL/Di3/YhqZlMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776051761; c=relaxed/simple;
	bh=Zmv/zr4aYb9NLLn+/uye7F8uxgwJflDtMrxg6M/x5Zw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hTUf8jeuV7Dz6AdCjuJE8c3wQezRfffYXs7SxhKjOvxb3nrkzoYpn8xn8ODenSf20f/BUD6DGPZQQOIP3IoG7e+z3oA1WfZaMvv1kqBxsS0/TTyoH0QaT+4ClJMhaBAYya6l7+2W7jW7oNjdl/pqSJ+5DiKWbW2ZRxOAhTSWx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=UBAiCWrY; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=UBAiCWrY; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="UBAiCWrY";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="UBAiCWrY"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VMBgE/Gsm0n04DIPKSxZD/WWr/ajg+HN9qmWHOd2nLM=;
	b=UBAiCWrYyWVLxflrm6gIeQAmeDDsz2uzinYSsE/+GLgGs818dvZT0Lldpd1SE/SsmosenhEbj
	4ZWfz0Bm9fdQTtyjbsQi18FPjFDNEJTE2Smu8uSDdbwbJExZI2KmC2IPx/ykS3ucY8qbIImKVbR
	EOL3oOYUY8SKJosN5lGRDQg=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fvCrd69VGz1BGG3;
	Mon, 13 Apr 2026 11:41:53 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VMBgE/Gsm0n04DIPKSxZD/WWr/ajg+HN9qmWHOd2nLM=;
	b=UBAiCWrYyWVLxflrm6gIeQAmeDDsz2uzinYSsE/+GLgGs818dvZT0Lldpd1SE/SsmosenhEbj
	4ZWfz0Bm9fdQTtyjbsQi18FPjFDNEJTE2Smu8uSDdbwbJExZI2KmC2IPx/ykS3ucY8qbIImKVbR
	EOL3oOYUY8SKJosN5lGRDQg=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fvCkH2j1Bz1T4Gh;
	Mon, 13 Apr 2026 11:36:23 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id D9D0740574;
	Mon, 13 Apr 2026 11:42:20 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Apr 2026 11:42:20 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 13 Apr 2026 11:42:19 +0800
Subject: Re: [PATCH v2 2/3] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
 <20260331-ecc_panic-v2-2-9e40d0f64f7a@debian.org>
 <59c133a7-74a7-4678-d907-add764bbd107@huawei.com>
 <adkFQF7QH8Jc3p3U@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <15315535-3881-e2db-02d4-907235dd98b7@huawei.com>
Date: Mon, 13 Apr 2026 11:42:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <adkFQF7QH8Jc3p3U@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/10 22:17, Breno Leitao wrote:
> On Tue, Apr 07, 2026 at 10:57:36AM +0800, Miaohe Lin wrote:
>> On 2026/3/31 19:00, Breno Leitao wrote:
>>> +	if (sysctl_panic_on_unrecoverable_mf && result == MF_IGNORED &&
>>> +	    (type == MF_MSG_KERNEL || type == MF_MSG_KERNEL_HIGH_ORDER ||
>>> +	     type == MF_MSG_UNKNOWN))
>>> +		panic("Memory failure: %#lx: unrecoverable page", pfn);
>>
>> Will it be better to add a helper here?
> 
> Yes, a helper would make things easier to read and digest. Thanks for
> the feedback. This is what I have in mind:
> 
> commit 36d5b3cbbe6d6abfe3296b7b21135a5f01e743eb
> Author: Breno Leitao <leitao@debian.org>
> Date:   Mon Mar 23 08:00:29 2026 -0700
> 
>     mm/memory-failure: add panic_on_unrecoverable_memory_failure sysctl
>     
>     Add a sysctl that allows the system to panic when an unrecoverable
>     memory failure is detected. This covers kernel pages, high-order
>     kernel pages, and unknown page types that cannot be recovered.
>     
>     Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 6ff80e01b91a4..a29b6688fe2d3 100644
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
> @@ -1281,6 +1292,16 @@ static void update_per_node_mf_stats(unsigned long pfn,
>  	++mf_stats->total;
>  }
>  
> +static bool is_unrecoverable_memory_failure(enum mf_action_page_type type,
> +					    enum mf_result result)

Thanks for your update.

> +{
> +	return sysctl_panic_on_unrecoverable_mf &&
> +	       result == MF_IGNORED &&
> +	       (type == MF_MSG_KERNEL ||
> +		type == MF_MSG_KERNEL_HIGH_ORDER ||
> +		type == MF_MSG_UNKNOWN);
> +}
> +
>  /*
>   * "Dirty/Clean" indication is not 100% accurate due to the possibility of
>   * setting PG_dirty outside page lock. See also comment above set_page_dirty().
> @@ -1298,6 +1319,9 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
>  	pr_err("%#lx: recovery action for %s: %s\n",
>  		pfn, action_page_types[type], action_name[result]);
>  
> +	if (is_unrecoverable_memory_failure(type, result))

Would it be better to name it as panic_on_unrecoverable_mf() or something like it?
This function determines whether panic on the specified memory error.

Thanks.
.

