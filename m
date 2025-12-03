Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B572DCBF3;
	Wed,  3 Dec 2025 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753988; cv=none; b=DXVUhhhWJxzesnQs4hNfgvk3XsIHjHode6iHW3uKP5lQZa37MObfSl4U+bLjAcEIvCq7Iw396DFldztgC8eWVNa0HrvGSGWil1in7nCbF1g2dKR8koKfznztJNbCTLT9tECr6gu73SpQZz4jZg5FrdrtsAkl6tq0dnvHSk4WhaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753988; c=relaxed/simple;
	bh=XE+UMl9ZJpLLb7Ssie0tS0fINbbRf85YKziq43ZPqIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwBt+lyezx8U74FcKrEqpTLJ2UjJs/i6TUbd16vrnrSyHUQGwXnTLC7R5CAh92a+3XR/bcWAVpvZb8MJ571bw73aMFL3+SHG5l3L42dnkXFUup6ijMBnrETgRPanuS7EmuV3aJ+cXIufiJUrwxDopw+3IQOdhGB/Oo5X9XwRZxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eb3S81AB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eb3S81AB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ECDC4CEFB;
	Wed,  3 Dec 2025 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764753988;
	bh=XE+UMl9ZJpLLb7Ssie0tS0fINbbRf85YKziq43ZPqIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Eb3S81ABWFi7Ey1sqYmwEvl8GJJze+QGMljZR/U1ykkp3vMRbjs5FA62Rjg7j80BJ
	 P3V/zYn2I17YRTPqhysBE7sf5i0imPIMNbDIVImGcGJN2DoRD2TmbBM/wrdh5X1nvt
	 b4aZqo0Ta2CBqaCaTOzkPDc1v8THYtnVbiD+rsPVz399Ril5/a+gLDTlsDJsrU1qlf
	 EIMEhPA4XE5Mv/Pc3C2cMOonLJCZn+83V7bodGZk4jOVACBB4Z1hEJNReUxL3FZI46
	 WUf9MLQ2iCZI++6dEQhZUlWx6nGuy7I0YbG+BhAsnMla6EBw+ek/6xvlHkZWkt1PgE
	 tRakWkZqyMWvA==
Message-ID: <305328e0-3011-409c-a040-76fc478d541a@kernel.org>
Date: Wed, 3 Dec 2025 10:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm, hugetlb: implement movable_gigantic_pages sysctl
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: kernel-team@meta.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, osalvador@suse.de, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 muchun.song@linux.dev, Mel Gorman <mgorman@suse.de>,
 Alexandru Moise <00moses.alexander00@gmail.com>,
 David Rientjes <rientjes@google.com>
References: <20251203063836.187016-1-gourry@gourry.net>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251203063836.187016-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/25 07:38, Gregory Price wrote:
> This reintroduces a concept removed by:
> commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")
> 
> This sysctl provides flexibility between ZONE_MOVABLE use cases:
> 1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
> 2) onlining memory in ZONE_MOVABLE to make hugepage allocate reliable
> 
> When ZONE_MOVABLE is used to make huge page allocation more reliable,
> disallowing gigantic pages memory in this region is pointless.  If
> hotplug is not a requirement, we can loosen the restrictions to allow
> 1GB gigantic pages in ZONE_MOVABLE.
> 
> Since 1GB can be difficult to migrate / has impacts on compaction /
> defragmentation, we don't enable this by default. Notably, 1GB pages
> can only be migrated if another 1GB page is available - so hot-unplug
> will fail if such a page cannot be found.

In light of the other discussion: will it fail or will it simplt retry 
forever, until there is a free 1g page?

> 
> However, since there are scenarios where gigantic pages are migratable,
> we should allow use of these on movable regions.
> 
> Note: Boot-time CMA is not possible for driver-managed hotplug memory,
> as CMA requires the memory to be registered as SystemRAM at boot time.
> Additionally, 1GB huge pages are not supported by THP.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Alexandru Moise <00moses.alexander00@gmail.com>
> Suggested-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Link: https://lore.kernel.org/all/20180201193132.Hk7vI_xaU%25akpm@linux-foundation.org/
> ---
>   Documentation/admin-guide/mm/memory-hotplug.rst | 14 ++++++++++++--
>   Documentation/admin-guide/sysctl/vm.rst         | 17 +++++++++++++++++
>   include/linux/hugetlb.h                         |  3 ++-
>   mm/hugetlb.c                                    |  1 -
>   mm/hugetlb_sysctl.c                             |  9 +++++++++
>   5 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index 33c886f3d198..6581558fd0d7 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -612,8 +612,9 @@ ZONE_MOVABLE, especially when fine-tuning zone ratios:
>     allocations and silently create a zone imbalance, usually triggered by
>     inflation requests from the hypervisor.
>   
> -- Gigantic pages are unmovable, resulting in user space consuming a
> -  lot of unmovable memory.
> +- Gigantic pages are unmovable when an architecture does not support
> +  huge page migration and/or the ``movable_gigantic_pages`` sysctl is false.
> +  See Documentation/admin-guide/sysctl/vm.rst for more info on this sysctl.
>   
>   - Huge pages are unmovable when an architectures does not support huge
>     page migration, resulting in a similar issue as with gigantic pages.
> @@ -672,6 +673,15 @@ block might fail:
>   - Concurrent activity that operates on the same physical memory area, such as
>     allocating gigantic pages, can result in temporary offlining failures.
>   
> +- When an admin sets the ``movable_gigantic_pages`` sysctl to true, gigantic
> +  pages are allowed in ZONE_MOVABLE.  This only allows migratable gigantic
> +  pages to be allocated; however, if there are no eligible destination gigantic
> +  pages at offline, the offlining operation will fail.

Same question here.

Nothing else jumped at me, in general as discussed, as long as it is 
opt-in behavior

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David
