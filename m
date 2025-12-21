Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF6A84A35;
	Sun, 21 Dec 2025 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332166; cv=none; b=en5pNV1SczRQeMyFiD/OaqPFNAxNu7arGYzJjfP+UQBDAmnYi2cshKTi03pvXVYtyehdIrh5hhPOdk552L6i3DdojO3uhV+xtkTqhi268bUzAOLXJMWCiomXpknaljnlJKmTWrN1/+957Nm+AsThNPkePb0CmmS+qSKd4/+Uikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332166; c=relaxed/simple;
	bh=p++ab+scdeusI2vZJTjgYwM79xzmVgySoMmqEdRkErw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdR4dnzKZDNovKWEdgrYPelkWVl40QUKWEHwQaeJjv+gSX+fDj+NEKYpDEZpretvmmRTntBVOfssahkZM73Y4rDS+U5KQV1dveHqP8ELAKa0hbkVcluDFwlZOz2+3jCTraLwsZ/8l8qaxP/CACWoMZfgsQeD6CgUcBgfomJk2tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EalTEbZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EalTEbZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008C5C4CEFB;
	Sun, 21 Dec 2025 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766332165;
	bh=p++ab+scdeusI2vZJTjgYwM79xzmVgySoMmqEdRkErw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EalTEbZhrGgrW+WpgUJ7P7k4WQW/3fCqLxM7be1fN7KjZbdOrmrXIU2zNbdexG8AT
	 X9M0Xx59AFPBGRIBTvEyV/FLah2Fp52ZmYMCHcpORBjJpb19YZxl7tK5qYKxb7BwiE
	 +WuDtoTYS4sIGkxyiPphIrapYgLBR3bgKpAXHTdJeAUMD8jm0mCOjXNETbAzDOh7Hz
	 KoutTTWwFMp3JQg8l6XtGa9fP+JX+JF4lu1S77QJ/nn318DCYpWcDLdG4yMf1Np1mT
	 c+21uigte7TXnEjX3e4IzAyoMEozEmjnHqDj+eiwIl9EOQi37usKkd1oNXPNRBTTK3
	 1brEb9KuoorRw==
Message-ID: <a3e218dc-7e98-4254-b051-77ea930c2da0@kernel.org>
Date: Sun, 21 Dec 2025 16:49:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mm, hugetlb: implement movable_gigantic_pages sysctl
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, osalvador@suse.de, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 muchun.song@linux.dev, hannes@cmpxchg.org, Mel Gorman <mgorman@suse.de>,
 David Rientjes <rientjes@google.com>
References: <20251221125603.2364174-1-gourry@gourry.net>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251221125603.2364174-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/25 13:56, Gregory Price wrote:
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
> 
> However, since there are scenarios where gigantic pages are migratable,
> we should allow use of these on movable regions.
> 
> When not valid 1GB is available for migration, hot-unplug will retry
> indefinitely (or until interrupted).  For example:
> 
>    echo 0 > node0/hugepages/..-1GB/nr_hugepages  # clear node0 1GB pages
>    echo 1 > node1/hugepages/..-1GB/nr_hugepages  # reserve node1 1GB page
>    ./alloc_huge_node1 &    # Allocate a 1GB page on node1
>    ./node1_offline  &      # attempt to offline all node1 memory
>    echo 1 > node0/hugepages/..-1GB/nr_hugepages  # reserve node0 1GB page
> 
> In this example, node1_offline will block indefinitely until the final
> step, when a node0 1GB page is made available.
> 
> Note: Boot-time CMA is not possible for driver-managed hotplug memory,
> as CMA requires the memory to be registered as SystemRAM at boot time.
> Additionally, 1GB huge pages are not supported by THP.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Suggested-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Link: https://lore.kernel.org/all/20180201193132.Hk7vI_xaU%25akpm@linux-foundation.org/
> ---

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David
