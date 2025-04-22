Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9906727CCE2
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326975; cv=none; b=WEgLCvcO0ccztxhrbkAtJSpKchCMiHN7mzgkx4zAFKZbiB/lsO/Nkq7lP9jVADU6l8RCb5FboT70FV5SeEvoOKXCnTEgIho9uCl9xqfpAit/UBEp67kuWKdGQl0ueUKqj9YNeyYDGOZiXyyh8mBPIjhWz5gwIk5Wb3zh4SsHUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326975; c=relaxed/simple;
	bh=CcuddQ4PiIhvayVUlUxXnUoZdkIiFG/Q5E0gd5Fmocc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fsroTF3zSgpjYaz3bBbh1efBZLqh4CJDK1mmMVNcqbEiUxpsjyooyrzqoI132+W1s7YWL18njvmnTIHvldG5Ge0O12QM0DCBb6Jt6Jf5SnaTEXthYiyMrupTp2tOWdZ+dU/CWXEbb3k18FUyy63NReoeKfTEtZslWeyaJ6B10F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Zhj5s6BVNz1R7bX;
	Tue, 22 Apr 2025 21:00:49 +0800 (CST)
Received: from kwepemo200002.china.huawei.com (unknown [7.202.195.209])
	by mail.maildlp.com (Postfix) with ESMTPS id 32DAB1A016C;
	Tue, 22 Apr 2025 21:02:49 +0800 (CST)
Received: from [10.174.179.13] (10.174.179.13) by
 kwepemo200002.china.huawei.com (7.202.195.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Apr 2025 21:02:48 +0800
Message-ID: <9f731254-ccd3-5fde-a5a8-c2771a308588@huawei.com>
Date: Tue, 22 Apr 2025 21:02:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH] docs: hugetlbpage.rst: add free surplus huge pages
 description
To: <osalvador@suse.de>, <muchun.song@linux.dev>, <akpm@linux-foundation.org>,
	<david@redhat.com>, <corbet@lwn.net>
CC: <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>
References: <20250419073214.2688926-1-tujinjiang@huawei.com>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <20250419073214.2688926-1-tujinjiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemo200002.china.huawei.com (7.202.195.209)


在 2025/4/19 15:32, Jinjiang Tu 写道:

Hi

> When echo 0 > /proc/sys/vm/nr_hugepages is concurrent with freeing in-use
> huge pages to the huge page pool, some free huge pages may fail to be
> destroyed and accounted as surplus. The counts are like below:
>
>    HugePages_Total: 1024
>    HugePages_Free: 1024
>    HugePages_Surp: 1024
>
> When set_max_huge_pages() decrease the pool size, it first return free
> pages to the buddy allocator, and then account other pages as surplus.
> Between the two steps, the hugetlb_lock is released to free memory and
> require the hugetlb_lock again. If another process free huge pages to the
> pool between the two steps, these free huge pages will be accounted as
> surplus.

I think this is a constraint of interface nr_hugepages, this interface couldn't
guarantee all huge pages will be freed. How do you think about it?

Thanks.

> Besides, Free surplus huge pages come from failing to restore vmemmap.
>
> Once the two situation occurs, users couldn't directly shrink the huge
> page pool via echo 0 > nr_hugepages, should use one of the two ways to
> destroy these free surplus huge pages:
>   1) echo $nr_surplus > nr_hugepages to convert the surplus free huge pages
> to persistent free huge pages first, and then echo 0 > nr_hugepages to
> destroy these huge pages.
>   2) allocate these free surplus huge pages, and will try to destroy them
> when freeing them.
>
> However, there is no documentation to describe it, users may be confused
> and don't know how to handle in such case. So update the documention.
>
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> ---
>   Documentation/admin-guide/mm/hugetlbpage.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
> index 67a941903fd2..0456cefae039 100644
> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
> @@ -239,6 +239,17 @@ this condition holds--that is, until ``nr_hugepages+nr_overcommit_hugepages`` is
>   increased sufficiently, or the surplus huge pages go out of use and are freed--
>   no more surplus huge pages will be allowed to be allocated.
>   
> +Caveat: Shrinking the persistent huge page pool via ``nr_hugepages`` may be
> +concurrent with freeing in-use huge pages to the huge page pool, leading to some
> +huge pages are still in the huge page pool and accounted as surplus. Besides,
> +When the feature of freeing unused vmemmap pages associated with each hugetlb page
> +is enabled, free huge page may be accounted as surplus too. In such two cases, users
> +couldn't directly shrink the huge page pool via echo 0 to ``nr_hugepages``, should
> +echo $nr_surplus to ``nr_hugepages`` to convert the surplus free huge pages to
> +persistent free huge pages first, and then echo 0 to ``nr_hugepages`` to destroy
> +these huge pages. Another way to destroy is allocating these free surplus huge
> +pages and these huge pages will be tried to destroy when they are freed.
> +
>   With support for multiple huge page pools at run-time available, much of
>   the huge page userspace interface in ``/proc/sys/vm`` has been duplicated in
>   sysfs.
