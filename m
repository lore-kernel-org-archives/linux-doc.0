Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E69939B956;
	Wed, 22 Apr 2026 02:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826166; cv=none; b=rFdFAWB6+5+fNakIkFVMbZYWwqMJTnq5MOYpPxvxL21gGpwKyAElspbzgAHzBy4nzs/sIatITnJOu0h1FjdPJHVUm9dzk7y23KGXJ4SZb4jikKHvl5o42ktq8+bmjQmhbu8arEO5dlu22u/ZcO6ha59vxHzvZ1Y/DohMHNn7FMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826166; c=relaxed/simple;
	bh=Ckvk77EAjeLTIX2wgILkBII6n2w7CsOm7zuEfDu+i+s=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=u9Cp01cw2/5GSynAZt/a6bLoSTTcj1CsBVkM4o7Y0JpFhRaWpYnTj8rJbwTYItZVI22WexRoVVzYTJixYGaHoVAXVD9qte11tAWPieguSVUWgn76xj994aAZgRZ5hwozbImS/JBcwMxrshJHKn2LXQGTLLnx+fDu9k38O1qbdB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Xz2ZZ71U; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Xz2ZZ71U"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JzDqbIKbIFSBf7sqhcVwocNSInW3q3vKEWkmrJICE7w=;
	b=Xz2ZZ71UomY77wBHhzvPxFmV8ZCOpnBnRoyr71FEAt5K+U2wQIngcGVNvpJOP9BwQyVYSYBTw
	hY9WMDAE2jgjvJRwdaNOvqvR5+bVlJYFK46LtfBbd5zwNeeyu/a9CwWJZqpiGX5d6bgqppOa8Cr
	4YRlZpqmV/9SMPnVB3qYkTw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4g0k6G6kc3zpSwY;
	Wed, 22 Apr 2026 10:42:46 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 231CC40569;
	Wed, 22 Apr 2026 10:49:11 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 10:49:10 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 10:49:09 +0800
Subject: Re: [PATCH v4 0/3] mm/memory-failure: add panic option for
 unrecoverable pages
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <299a6968-1813-39f3-de28-3fcec6f3d182@huawei.com>
Date: Wed, 22 Apr 2026 10:49:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/15 20:54, Breno Leitao wrote:
> When the memory failure handler encounters an in-use kernel page that it
> cannot recover (slab, page tables, kernel stacks, vmalloc, etc.), it
> currently logs the error as "Ignored" and continues operation.
> 
> This leaves corrupted data accessible to the kernel, which will inevitably
> cause either silent data corruption or a delayed crash when the poisoned memory
> is next accessed.
> 
> This is a common problem on large fleets. We frequently observe multi-bit ECC
> errors hitting kernel slab pages, where memory_failure() fails to recover them
> and the system crashes later at an unrelated code path, making root cause
> analysis unnecessarily difficult.
> 
> Here is one specific example from production on an arm64 server: a multi-bit
> ECC error hit a dentry cache slab page, memory_failure() failed to recover it
> (slab pages are not supported by the hwpoison recovery mechanism), and 67
> seconds later d_lookup() accessed the poisoned cache line causing
> a synchronous external abort:
> 
>     [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
>     [88690.498473] Memory failure: 0x40272d: unhandlable page.
>     [88690.498619] Memory failure: 0x40272d: recovery action for
>                    get hwpoison page: Ignored
>     ...
>     [88757.847126] Internal error: synchronous external abort:
>                    0000000096000410 [#1] SMP
>     [88758.061075] pc : d_lookup+0x5c/0x220
> 
> This series adds a new sysctl vm.panic_on_unrecoverable_memory_failure
> (default 0) that, when enabled, panics immediately on unrecoverable
> memory failures. This provides a clean crash dump at the time of the
> error, which is far more useful for diagnosis than a random crash later
> at an unrelated code path.
> 
> This also categorizes reserved pages as MF_MSG_KERNEL, and panics on
> unknown page types (MF_MSG_UNKNOWN).
> 
> Note that dynamically allocated kernel memory (SLAB/SLUB, vmalloc,
> kernel stacks, page tables) shares the MF_MSG_GET_HWPOISON return path
> with transient refcount races, so it is intentionally excluded from the
> panic conditions to avoid false positives.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

It might be helpful to add some information from [1].

Thanks for your work.

[1] https://lore.kernel.org/all/aeHy3-vQTQYJlGw5@gmail.com/
