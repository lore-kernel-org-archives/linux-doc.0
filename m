Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE22AE95
	for <linux-doc@vger.kernel.org>; Sat, 19 Apr 2025 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745083248; cv=none; b=KLjn/IL4ohN9y8BQWpYZle6YfOsIj5b1vFxc6n/ODUPvcDaufWflgEitz7nBNmNztePlxfNLGHP/flRN7Sqz8aXWfo1dKhmSoJsqjNO8SQRPYmRQkPhUnAwrsckNZn+SNSiEd1HgwX9G47EgJIGSVb6hs+2LX5/7x1sgzi+Z09s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745083248; c=relaxed/simple;
	bh=Y24x08VAvWv5v/1A13U4wn2J2QJZcGUVUM7BViddqpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SL9IMYVkRQCdasfPUPf9NTPCXqEYStGXQmIXcHA3G4nunEqNZYtBD+wTfgz9eZ7qrLM5Zh3j2ywd5+MpsMSMcmtS7/b+vDWE80pp0JpRwYdIzMURu0lDfrjnsSs2UNzMGgsH+6thQzvcgQ115Cow3Mi0dzTkkfgdE1nDvj6MJs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y1W9CtYL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y1W9CtYL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=shQn835qdIaooUON9bexG92y1I3IWbZ1v7IIKF2PNuY=; b=Y1W9CtYLUD4zIsvScfrkQKcocN
	VLMb8/lhuLwWY9+sG3asDjXRhoSaRoJmaqMNL+/ZilCgG5FQJ5Ui6Y0E1VbGMLzFcvhGCkZdPTLZ9
	n5xL6vpa7Yxq/miXPes+FCT3r772Fv9l6Zjoii/fxB8imG37FVs21PgtVfAC6GPsTkLKqsnSImFXX
	I3z6JRaDLXxxO+H32k1wSQ5iaDj474TM7lMwVsROlqUzC2jh6HC3x1XKgEmIFMcT6vUB9kyqU3eRM
	l6LPb8b0MWcADwPAS4MVa/SRW5706ydNvo125p+hSYkP5Yn3mz7fMJMhtXjvZ5nTnT+21d7S4ToLJ
	Y25eUdDw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6BrW-00000003iYa-2T8P;
	Sat, 19 Apr 2025 17:20:18 +0000
Message-ID: <1bb5fadd-583c-4c56-b52f-37eee516c1dd@infradead.org>
Date: Sat, 19 Apr 2025 10:20:14 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs: hugetlbpage.rst: add free surplus huge pages
 description
To: Jinjiang Tu <tujinjiang@huawei.com>, osalvador@suse.de,
 muchun.song@linux.dev, akpm@linux-foundation.org, david@redhat.com,
 corbet@lwn.net
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, wangkefeng.wang@huawei.com
References: <20250419073214.2688926-1-tujinjiang@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250419073214.2688926-1-tujinjiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/19/25 12:32 AM, Jinjiang Tu wrote:
> When echo 0 > /proc/sys/vm/nr_hugepages is concurrent with freeing in-use
> huge pages to the huge page pool, some free huge pages may fail to be
> destroyed and accounted as surplus. The counts are like below:
> 
>   HugePages_Total: 1024
>   HugePages_Free: 1024
>   HugePages_Surp: 1024
> 
> When set_max_huge_pages() decrease the pool size, it first return free
> pages to the buddy allocator, and then account other pages as surplus.
> Between the two steps, the hugetlb_lock is released to free memory and
> require the hugetlb_lock again. If another process free huge pages to the
> pool between the two steps, these free huge pages will be accounted as
> surplus.
> 
> Besides, Free surplus huge pages come from failing to restore vmemmap.
> 
> Once the two situation occurs, users couldn't directly shrink the huge
> page pool via echo 0 > nr_hugepages, should use one of the two ways to
> destroy these free surplus huge pages:
>  1) echo $nr_surplus > nr_hugepages to convert the surplus free huge pages
> to persistent free huge pages first, and then echo 0 > nr_hugepages to
> destroy these huge pages.
>  2) allocate these free surplus huge pages, and will try to destroy them
> when freeing them.
> 
> However, there is no documentation to describe it, users may be confused
> and don't know how to handle in such case. So update the documention.
> 
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> ---
>  Documentation/admin-guide/mm/hugetlbpage.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
> index 67a941903fd2..0456cefae039 100644
> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
> @@ -239,6 +239,17 @@ this condition holds--that is, until ``nr_hugepages+nr_overcommit_hugepages`` is
>  increased sufficiently, or the surplus huge pages go out of use and are freed--
>  no more surplus huge pages will be allowed to be allocated.
>  
> +Caveat: Shrinking the persistent huge page pool via ``nr_hugepages`` may be
> +concurrent with freeing in-use huge pages to the huge page pool, leading to some
> +huge pages are still in the huge page pool and accounted as surplus. Besides,
> +When the feature of freeing unused vmemmap pages associated with each hugetlb page

   when

> +is enabled, free huge page may be accounted as surplus too. In such two cases, users
> +couldn't directly shrink the huge page pool via echo 0 to ``nr_hugepages``, should

                                                                               but should


Also, please limit each line to <80 characters.

> +echo $nr_surplus to ``nr_hugepages`` to convert the surplus free huge pages to
> +persistent free huge pages first, and then echo 0 to ``nr_hugepages`` to destroy
> +these huge pages. Another way to destroy is allocating these free surplus huge
> +pages and these huge pages will be tried to destroy when they are freed.
> +

But I don't see why this is a user problem to be solved by users...

>  With support for multiple huge page pools at run-time available, much of
>  the huge page userspace interface in ``/proc/sys/vm`` has been duplicated in
>  sysfs.

-- 
~Randy

