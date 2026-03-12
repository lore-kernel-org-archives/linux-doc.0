Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E133F58B
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283907; cv=none; b=VFC1K3YWMUgb+NA9PFTsBh+PaRSupdkjKHojJq3KNVfi/CgYBWV65edLh3lCXLeKmqPUxG7FJbZxTQKMofLXWdCV9Futr/Z6MsycvGoRiFb5A7j89XmQXxPs9XP0ZMUr5VWE1Fz3FNuYVRqvcp20NbzoR/hA4sF9BRNrScpGTZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283907; c=relaxed/simple;
	bh=A59oM9Q5svsIpMBqG0+x6uy6o8XOuAN2whtRBtc8OcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsbnZ3dPaZZPOeOpgO2Ug4Wh0Mkm7//7D98S5iI93e9XDDfFlMgJ5f5zMcB0hwLK+0dWeXb6sk2Te3oIMDw3GKfvE9bZnzzeDz0Pa7qhzAaSb4tZSHgUVARv27eP1EPeSaZlWIVdcRL/LuTz8S7vK3vrGT5o1KXqildZWZwoQSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AImIgeCc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AImIgeCc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so4448255e9.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 19:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773283904; x=1773888704; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4dT/iAwBrfERuCP8iX2naiSjaj3fk/39yeqZSkIJKM=;
        b=AImIgeCcKc08ioiGPZ8jpmMj+dyazLnm+O9ScIEtYj5SYhDEqXEUQEZSRk/9ZMqZsE
         l1bMcMxU9hliQY6KAr48wYupmLKxQD4ODn4xcoDKiTeCJltnEYTay0fWFWkGLs8MYt+0
         rHfEuxcTjjjsuiJFItaYkIdybvsd8flpbSAYab2iFJds9sEAqa7XqXl0DZN+FNCy+FHu
         aoMUlxNH9UzH91RRdnZlM8LUW89XThGoHsUxGUoLddLLwixAK53pq6empfojU+fIDDqo
         tHpYrdMqlBf1biGpn2u9On7UoYNByf2WJCnefUDPB6Q6fGPe6yf3dDct0Ybw2+6eC2j8
         dKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283904; x=1773888704;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4dT/iAwBrfERuCP8iX2naiSjaj3fk/39yeqZSkIJKM=;
        b=vM+tXW1Mqi6dVKJT7wtitiOGnK4M5g5PaMsdmd+VCRMrnR1qI2YJTjDzhai7TG1mil
         G58FcHcTpahIEtlh+NYO1KdSU+ANvER1QJWXj4SUwyMKxhNf+oHnHXifw8rGxKSNH1Pt
         lXG6dsb08p4SpIsORah9hBfb/4W2YCUd9IxcU+O4MyRv0aPBPQ1KT8utzNfCbCWW/ugS
         otBgb5nPl+5t1Lxk9lMQcL+PU2NIISljcTYzER91dDE9GiyoXU0xrTbXBkgLAuOk7pXj
         kuJA1lLGgzRSXqScXSV1VVGeF2bCwTKZ5YhNgX/kwOptnr7l/jvL/yfPfxS+FgegyDo1
         yq9w==
X-Forwarded-Encrypted: i=1; AJvYcCWcll8qvuMc7SQHLJDbHYcOJwGbirghSeEjHvqwPfs///l7SRyIJD21j7cRmSJkiT47CUs/jAgLIbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnz+5Mx0TspPPJs/YBAii+MExclEzVcEt4SrAuaShfQ3fCK+AJ
	z9MztacGvFddFdIcOd6MHT2vhkmL4LAHTMFcSBUU968C9P2Bkm6DMDmPhSMHs+zR
X-Gm-Gg: ATEYQzzW5bvAWoEYuQ6v1KZ6AOWIv8AHTJ4SVGT0eutT9qw7Yyk4lsXFtoKtw/33Qsi
	MGOozPigTP47eRa3IHz9qlRRl/Nia3bIdKPYiO7nVEdP0RWOe5t/tFRh5V5/PKlOb/t73RnrWSH
	/UBFhc4SR6Oc3uwF6Z5EdLnOYzIL05BZ4khs3TmAC3H6kCoOE43Ru5VsSdwpPgBlQ7R9QVRcNpf
	c49boAQHvMxxtWBdYm9XdOB/wCcXrTFFbJ9nlBJ1pOu2y3iacwMVkzR+ce+MC2h12i5krHCPaJ/
	Ucatu3Q9Bc0LJ16xzzYFK43AwcZU6VemOGIHmSMmufyJNhSU8a2zFGnW23AHnGEjKDdFbTldmm9
	HVrm9dc15M1K+hpXF5SsCeZDgjwW8Y3WHeTIOBDG9hslQzX4tsEr8cEr3q9lRjddv+PtY6Rf7/l
	zvtJWfWiqxyCzKnYrJU+oHig==
X-Received: by 2002:a05:600c:37c6:b0:485:3fc6:c0f3 with SMTP id 5b1f17b1804b1-4854ad723c2mr79625495e9.0.1773283903640;
        Wed, 11 Mar 2026 19:51:43 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c3878sm32997245e9.16.2026.03.11.19.51.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2026 19:51:43 -0700 (PDT)
Date: Thu, 12 Mar 2026 02:51:42 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v2] docs: filesystems: clarify KernelPageSize vs.
 MMUPageSize in smaps
Message-ID: <20260312025142.wued4ueww4bgcoeg@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260306081916.38872-1-david@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306081916.38872-1-david@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Mar 06, 2026 at 09:19:16AM +0100, David Hildenbrand (Arm) wrote:
>There was recently some confusion around THPs and the interaction with
>KernelPageSize / MMUPageSize. Historically, these entries always
>correspond to the smallest size we could encounter, not any current
>usage of transparent huge pages or larger sizes used by the MMU.
>
>Ever since we added THP support many, many years ago, these entries
>would keep reporting the smallest (fallback) granularity in a VMA.
>
>For this reason, they default to PAGE_SIZE for all VMAs except for
>VMAs where we have the guarantee that the system and the MMU will
>always use larger page sizes. hugetlb, for example, exposes a custom
>vm_ops->pagesize callback to handle that. Similarly, dax/device
>exposes a custom vm_ops->pagesize callback and provides similar
>guarantees.
>
>Let's clarify the historical meaning of KernelPageSize / MMUPageSize,
>and point at "AnonHugePages", "ShmemPmdMapped" and "FilePmdMapped"
>regarding PMD entries.
>
>While at it, document "FilePmdMapped", clarify what the "AnonHugePages"
>and "ShmemPmdMapped" entries really mean, and make it clear that there
>are no other entries for other THP/folio sizes or mappings.
>
>Also drop the duplicate "KernelPageSize" and "MMUPageSize" entries in
>the example.
>
>Link: https://lore.kernel.org/all/20260225232708.87833-1-ak@linux.intel.com/
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Lance Yang <lance.yang@linux.dev>
>Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>Cc: Zi Yan <ziy@nvidia.com>
>Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>Cc: Nico Pache <npache@redhat.com>
>Cc: Ryan Roberts <ryan.roberts@arm.com
>Cc: Dev Jain <dev.jain@arm.com>
>Cc: Barry Song <baohua@kernel.org>
>Cc: Lance Yang <lance.yang@linux.dev>
>Cc: Jonathan Corbet <corbet@lwn.net>
>Cc: Shuah Khan <skhan@linuxfoundation.org>
>Cc: Usama Arif <usamaarif642@gmail.com>
>Cc: Andi Kleen <ak@linux.intel.com>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---
>
>v1 -> v2:
>* Some rewording and clarifications
>* Drop duplicate entries in the example
>
>---
> Documentation/filesystems/proc.rst | 40 +++++++++++++++++++++---------
> 1 file changed, 28 insertions(+), 12 deletions(-)
>
>diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
>index b0c0d1b45b99..e2d22a424dcd 100644
>--- a/Documentation/filesystems/proc.rst
>+++ b/Documentation/filesystems/proc.rst
>@@ -464,26 +464,37 @@ Memory Area, or VMA) there is a series of lines such as the following::
>     KSM:                   0 kB
>     LazyFree:              0 kB
>     AnonHugePages:         0 kB
>+    FilePmdMapped:         0 kB
>     ShmemPmdMapped:        0 kB
>     Shared_Hugetlb:        0 kB
>     Private_Hugetlb:       0 kB
>     Swap:                  0 kB
>     SwapPss:               0 kB
>-    KernelPageSize:        4 kB
>-    MMUPageSize:           4 kB
>     Locked:                0 kB
>     THPeligible:           0
>     VmFlags: rd ex mr mw me dw
> 
> The first of these lines shows the same information as is displayed for
> the mapping in /proc/PID/maps.  Following lines show the size of the
>-mapping (size); the size of each page allocated when backing a VMA
>-(KernelPageSize), which is usually the same as the size in the page table
>-entries; the page size used by the MMU when backing a VMA (in most cases,
>-the same as KernelPageSize); the amount of the mapping that is currently
>-resident in RAM (RSS); the process's proportional share of this mapping
>-(PSS); and the number of clean and dirty shared and private pages in the
>-mapping.
>+mapping (size); the smallest possible page size allocated when backing a
>+VMA (KernelPageSize), which is the granularity in which VMA modifications
>+can be performed; the smallest possible page size that could be used by the
>+MMU (MMUPageSize) when backing a VMA; the amount of the mapping that is
>+currently resident in RAM (RSS); the process's proportional share of this
>+mapping (PSS); and the number of clean and dirty shared and private pages
>+in the mapping.
>+
>+"KernelPageSize" always corresponds to "MMUPageSize", except when a larger
>+kernel page size is emulated on a system with a smaller page size used by the
>+MMU, which is the case for some PPC64 setups with hugetlb.  Furthermore,
>+"KernelPageSize" and "MMUPageSize" always correspond to the smallest
>+possible granularity (fallback) that can be encountered in a VMA throughout
>+its lifetime.  These values are not affected by Transparent Huge Pages
>+being in effect, or any usage of larger MMU page sizes (either through
>+architectural huge-page mappings or other explicit/implicit coalescing of
>+virtual ranges performed by the MMU).  "AnonHugePages", "ShmemPmdMapped" and
>+"FilePmdMapped" provide insight into the usage of PMD-level architectural
>+huge-page mappings.
> 
> The "proportional set size" (PSS) of a process is the count of pages it has
> in memory, where each page is divided by the number of processes sharing it.
>@@ -528,10 +539,15 @@ pressure if the memory is clean. Please note that the printed value might
> be lower than the real value due to optimizations used in the current
> implementation. If this is not desirable please file a bug report.
> 
>-"AnonHugePages" shows the amount of memory backed by transparent hugepage.

This confused me sometimes. And finally I found it just shows PMD-mapped THP.

The name is misleading. But it seems not easy to rename it, since there are
user space application use this, like selftests.

>+"AnonHugePages", "ShmemPmdMapped" and "FilePmdMapped" show the amount of
>+memory backed by Transparent Huge Pages that are currently mapped by
>+architectural huge-page mappings at the PMD level. "AnonHugePages"
>+corresponds to memory that does not belong to a file, "ShmemPmdMapped" to
>+shared memory (shmem/tmpfs) and "FilePmdMapped" to file-backed memory
>+(excluding shmem/tmpfs).
> 
>-"ShmemPmdMapped" shows the amount of shared (shmem/tmpfs) memory backed by
>-huge pages.
>+There are no dedicated entries for Transparent Huge Pages (or similar concepts)
>+that are not mapped by architectural huge-page mappings at the PMD level.
> 
> "Shared_Hugetlb" and "Private_Hugetlb" show the amounts of memory backed by
> hugetlbfs page which is *not* counted in "RSS" or "PSS" field for historical
>-- 
>2.43.0
>

-- 
Wei Yang
Help you, Help me
