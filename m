Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B139EF0E;
	Wed, 22 Apr 2026 03:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776829404; cv=none; b=OpWrA+ZSwk9NaTHswawy1/wWlqxLsXyqb0JCgXa5RbxsazCeGIalLXMccJprWr1GkvCTphFibfAiJDG6ThxCV/L3y8D9P4jqJ7b2Vu0GaLDUkrflxpdr6utRtY8V6MuwdkVAdITeO1TWAo+0+TykakwcNT4fnLf1CC47Qjjp5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776829404; c=relaxed/simple;
	bh=VexXu3DSwRz9VY9sibq8cHisnA/OURcFuITudlGctxw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ORfkInAb6z6pWU1BOTyxgtcldi5sio1c0Lfy7z/YtsMB20rOwGQS6tMHjovaem5JrU94G1lUFR8cDFirhhRDN8wquvhekjVPGHTmNXLDuVOBpho81ZWYUxQHOZjtMeYldM3n0ouunXudNIQ29x1hHBm9obn6Zdg9D95zkXfr6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RfLSOn7h; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RfLSOn7h"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OjwCt4nXBG5AAWzAicOYlXQgrFBK6YRkDyXLUyFVbWA=;
	b=RfLSOn7hatQETGPVKmpKXJitrg67J1xGPlxUXp9UCF+U+Y0tG5z+DuZcFve3awjZStrKCy9Em
	vERY697X+51AZmiNsMMtNl1mjYEFCfPeoKjQwAczIIVgcmsb4lVNIt3jVp+i1gpUkOXbkNgNN8h
	srXSp1Ny1er783qNxMOGVF4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4g0lJz6XKpz1T4Gh;
	Wed, 22 Apr 2026 11:37:07 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B1EF40571;
	Wed, 22 Apr 2026 11:43:18 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 11:43:17 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Apr 2026 11:43:16 +0800
Subject: Re: [PATCH v4 3/3] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
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
 <20260415-ecc_panic-v4-3-2d0277f8f601@debian.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <7b4a6659-e2e5-5e63-2952-c7a840ffcdec@huawei.com>
Date: Wed, 22 Apr 2026 11:43:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260415-ecc_panic-v4-3-2d0277f8f601@debian.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/15 20:55, Breno Leitao wrote:
> Add documentation for the new vm.panic_on_unrecoverable_memory_failure
> sysctl, describing the three categories of failures that trigger a
> panic and noting which kernel page types are not yet covered.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 37 +++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 97e12359775c9..592ce9ec38c4b 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -67,6 +67,7 @@ Currently, these files are in /proc/sys/vm:
>  - page-cluster
>  - page_lock_unfairness
>  - panic_on_oom
> +- panic_on_unrecoverable_memory_failure
>  - percpu_pagelist_high_fraction
>  - stat_interval
>  - stat_refresh
> @@ -925,6 +926,42 @@ panic_on_oom=2+kdump gives you very strong tool to investigate
>  why oom happens. You can get snapshot.
>  
>  
> +panic_on_unrecoverable_memory_failure
> +======================================
> +
> +When a hardware memory error (e.g. multi-bit ECC) hits a kernel page
> +that cannot be recovered by the memory failure handler, the default
> +behaviour is to ignore the error and continue operation.  This is
> +dangerous because the corrupted data remains accessible to the kernel,
> +risking silent data corruption or a delayed crash when the poisoned
> +memory is next accessed.
> +
> +When enabled, this sysctl triggers a panic on three categories of
> +unrecoverable failures: reserved kernel pages, non-buddy kernel pages
> +with zero refcount (e.g. tail pages of high-order allocations), and
> +pages whose state cannot be classified as recoverable.
> +
> +Note that some kernel page types — such as slab objects, vmalloc
> +allocations, kernel stacks, and page tables — share a failure path
> +with transient refcount races and are not currently covered by this
> +option. I.e, do not panic when not confident of the page status.
> +
> +For many environments it is preferable to panic immediately with a clean
> +crash dump that captures the original error context, rather than to
> +continue and face a random crash later whose cause is difficult to
> +diagnose.

Should we add some userful cases to show the real-world application scenarios?

Thanks.
.

> +
> += =====================================================================
> +0 Try to continue operation (default).
> +1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
> +  machine will be rebooted.
> += =====================================================================
> +
> +Example::
> +
> +     echo 1 > /proc/sys/vm/panic_on_unrecoverable_memory_failure
> +
> +
>  percpu_pagelist_high_fraction
>  =============================
>  
> 

