Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC92ECEAB
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759913914; cv=none; b=N5SiKkZeKN+peOMKCCDYfPSkcp8Jt0RgeK9gvj6/ahYxF854uuEUnfPBp05EFc0gYqcJyk0lg1uGeejwf0y3/rp3MLtjWhpUIrEliZ8nPekKAMtqeVkzJM474N6Ea5X4v07l2tzWqGTBYbuZ+2VaQ3HQTatez7AZ6zt80D2u0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759913914; c=relaxed/simple;
	bh=vBuujdqKwYmwBY/2CYFdIj19MRZnIonMIeZi+ye7MXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3xnt2p4HWtenYIGDZOjU2X7cKEKBxnDz9pkAuXmIOpT5ERFVRLF9ifkzv0lZeowhNMk1PKlA+UgWrKF5B3JfvHarAW0DDQStavPvmIOLNBc8A0FtSiEe5suXtf5R/8lMAv3cHsAhyvSQlJ5TMhilWgfBXA/3joUgIbO/5PnQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hDBJ7mbX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hDBJ7mbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759913911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aCkfyt5I/VmtvqgtnNAWpB9LnANN2vnP/klB7sFCMlE=;
	b=hDBJ7mbXJvmuvMr/loWxDzGcTpRjky2ZYeREn/VPeIaDOJevszsiGDxaS76Grt6E9np6q4
	XLlzAA2ErlAJSAipKhW309GZrQmZwnLQHMfJ4XIiXzdkKv46oiyr+ZCKlDBQjYEhAGqUP8
	ILMjNQMODNF6wrWKftJsh0vwcZ6r0Bs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-hfQTMlhgNBKdv6pKKiv_qA-1; Wed, 08 Oct 2025 04:58:28 -0400
X-MC-Unique: hfQTMlhgNBKdv6pKKiv_qA-1
X-Mimecast-MFC-AGG-ID: hfQTMlhgNBKdv6pKKiv_qA_1759913907
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-426c4d733c4so128978f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 01:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913907; x=1760518707;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCkfyt5I/VmtvqgtnNAWpB9LnANN2vnP/klB7sFCMlE=;
        b=JPK6ACvQ0QVYc7DQ1rq1q+y/gkJe1CaUKmRj2cx+TEU+cb6enVUUTSRJyYvwc+IuGw
         kqOTfXK6vS3NSTPZ7DTy//ha8rkAN5WpvLM5z34cFQU+FWmYj7cjVgoZvzP27iXYQAlr
         85eBeNRkrwH1NqIbFC6mitMpWJG5llEbJuDsv3apOwjMpKUkCpbU4UZgONAQtUjVd/kp
         4yvN4CFwkUdHFd2m4Na9TqTgC7e1x4delLsAef2NPaIxeJmwhLqypCEuVRIHIEqDIVQf
         qopgwN6xETD441rU/BQPzacJyA0DOIaM+/jQvwBS51vjun20x+NhkOJxFY3I7rNNrAhv
         dP9A==
X-Forwarded-Encrypted: i=1; AJvYcCW7PWyiQ2EVRF4uv+XoEizIw4ik97C/X36Gh50+QNcLw/DR3qDLXG0Z7zHK2ap0AGVl1xJumdLAzk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8A/oOhIXUK2AtggQFEKwLdrLnJA7dAur9xLlvNp7DiI1HHI8
	JFzwDyXMKhgPyCIkYjqzE5IHwH0rd51uLfkb6Xf2YxoexM7YOhnKCxtWlaUt/LLcnSD2agekTgu
	37luGXRa/kMH8/wMof2dCPH1/7rxhoJGeKK/YMHKrFMzHyBRunfaEca/9MC5GXQ==
X-Gm-Gg: ASbGncsVdWBM0XfhE7R2qF5BV3LesYOMqPn7w0nDPzl6vvuC0mi0e6qROdnd2U19YUg
	z2XO/lbWXgAeBzWnfLLvL0n4u1ExiNkNvwzMrpCnrFX7sXMxzI0ZNxKT1l7EAxIb0p2K7/OVDyw
	fejl6fRe2/XQ7TNSzNvZr5YGtsFLxGOtiAfPJnZtVXTaJFuYiKVEzqFzgbiFMcpxo2fIdl63NUx
	UHnq3k5qMQl0qLNbTzjqwr7yhnRFuveTj1nAahk6AyFamF2w8xdy8MRKAyZngUK5jwcs+aROqHE
	tvCVGykZDrGuk61OuEd6SR0kdievo6Zee0SFGM7gzWnM7x+QRSFOUtty+7eOlurGdnM6R3oTkX+
	yVIKdafcR
X-Received: by 2002:a05:6000:40c7:b0:3e7:68b2:c556 with SMTP id ffacd0b85a97d-4266726c44fmr1368213f8f.26.1759913907311;
        Wed, 08 Oct 2025 01:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeKz3b4r2qfAkjDy90jbChwaRK5kUNQF21Ofr8oD6OHDyol5EbgRMerKt5zFgrHRyjWGc/Ng==
X-Received: by 2002:a05:6000:40c7:b0:3e7:68b2:c556 with SMTP id ffacd0b85a97d-4266726c44fmr1368193f8f.26.1759913906885;
        Wed, 08 Oct 2025 01:58:26 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-110.customers.d1-online.com. [80.187.83.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6c3esm29244385f8f.1.2025.10.08.01.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:58:26 -0700 (PDT)
Message-ID: <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
Date: Wed, 8 Oct 2025 10:58:23 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: corbet@lwn.net, muchun.song@linux.dev, osalvador@suse.de,
 akpm@linux-foundation.org, hannes@cmpxchg.org, laoar.shao@gmail.com,
 brauner@kernel.org, mclapinski@google.com, joel.granados@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@suse.com>,
 Alexandru Moise <00moses.alexander00@gmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, David Rientjes <rientjes@google.com>
References: <20251007214412.3832340-1-gourry@gourry.net>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251007214412.3832340-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.10.25 23:44, Gregory Price wrote:
> This reverts commit d6cb41cc44c63492702281b1d329955ca767d399.
> 
> This sysctl provides some flexibility between multiple requirements which
> are difficult to square without adding significantly more complexity.
> 
> 1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
> 2) onlining memory in ZONE_MOVABLE to prevent GFP_KERNEL usage
> 3) passing NUMA structure through to a virtual machine (node0=vnode0,
>     node1=vnode1) so a guest can make good placement decisions.
> 4) utilizing 1GB hugepages for VM host memory to reduce TLB pressure
> 5) Managing device memory after init-time to avoid incidental usage
>     at boot (due to being placed in ZONE_NORMAL), or to provide users
>     configuration flexibility.
> 
> When device-hotplugged memory does not require hot-unplug assurances,
> there is no reason to avoid allowing otherwise non-migratable hugepages
> in this zone.  This allows for allocation of 1GB gigantic pages for VMs
> with existing mechanisms.
> 
> Boot-time CMA is not possible for driver-managed hotplug memory, as CMA
> requires the memory to be registered as SystemRAM at boot time.
> 
> Updated the code to land in appropriate locations since it all moved.
> Updated the documentation to add more context when this is useful.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Alexandru Moise <00moses.alexander00@gmail.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Suggested-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Link: https://lore.kernel.org/all/20180201193132.Hk7vI_xaU%25akpm@linux-foundation.org/
> ---
>   Documentation/admin-guide/sysctl/vm.rst | 31 +++++++++++++++++++++++++
>   include/linux/hugetlb.h                 |  4 +++-
>   mm/hugetlb.c                            |  9 +++++++
>   3 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 4d71211fdad8..c9f26cd447d7 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -40,6 +40,7 @@ Currently, these files are in /proc/sys/vm:
>   - enable_soft_offline
>   - extfrag_threshold
>   - highmem_is_dirtyable
> +- hugepages_treat_as_movable
>   - hugetlb_shm_group
>   - laptop_mode
>   - legacy_va_layout
> @@ -356,6 +357,36 @@ only use the low memory and they can fill it up with dirty data without
>   any throttling.
>   
>   
> +hugepages_treat_as_movable
> +==========================
> +
> +This parameter controls whether otherwise immovable hugepages (e.g. 1GB
> +gigantic pages) may be allocated from from ZONE_MOVABLE. If set to non-zero,
> +gigantic hugepages can be allocated from ZONE_MOVABLE. ZONE_MOVABLE memory
> +may be created via the kernel boot parameter `kernelcore` or via memory
> +hotplug as discussed in Documentation/admin-guide/mm/memory-hotplug.rst.
> +
> +Support may depend on specific architecture and/or the hugepage size. If
> +a hugepage supports migration, allocation from ZONE_MOVABLE is always
> +enabled (for example 2MB on x86) for the hugepage regardless of the value
> +of this parameter. IOW, this parameter affects only non-migratable hugepages.
> +
> +Assuming that hugepages are not migratable in your system, one usecase of
> +this parameter is that users can make hugepage pool more extensible by
> +enabling the allocation from ZONE_MOVABLE. This is because on ZONE_MOVABLE
> +page reclaim/migration/compaction work more and you can get contiguous
> +memory more likely. Note that using ZONE_MOVABLE for non-migratable
> +hugepages can do harm to other features like memory hotremove (because
> +memory hotremove expects that memory blocks on ZONE_MOVABLE are always
> +removable,) so it's a trade-off responsible for the users.
> +
> +One common use-case of this feature is allocate 1GB gigantic pages for
> +virtual machines from otherwise not-hotplugged memory which has been
> +isolated from kernel allocations by being onlined into ZONE_MOVABLE.
> +These pages tend to be allocated and released more explicitly, and so
> +hotplug can still be achieved with appropriate orchestration.
> +
> +
>   hugetlb_shm_group
>   =================
>   
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 526d27e88b3b..bbaa1b4908b6 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -172,6 +172,7 @@ bool hugetlbfs_pagecache_present(struct hstate *h,
>   
>   struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);
>   
> +extern int hugepages_treat_as_movable;
>   extern int sysctl_hugetlb_shm_group;
>   extern struct list_head huge_boot_pages[MAX_NUMNODES];
>   
> @@ -926,7 +927,8 @@ static inline gfp_t htlb_alloc_mask(struct hstate *h)
>   {
>   	gfp_t gfp = __GFP_COMP | __GFP_NOWARN;
>   
> -	gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> +	gfp |= (hugepage_movable_supported(h) || hugepages_treat_as_movable) ?
> +	       GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;

I mean, this is as ugly as it gets.

Can't we just let that old approach RIP where it belongs? :)

If something unmovable, it does not belong on ZONE_MOVABLE, as simple as that.

Something I could sympathize is is treaing gigantic pages that are actually
migratable as movable.


Like

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 526d27e88b3b2..78da85b1308dd 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -896,37 +896,12 @@ static inline bool hugepage_migration_supported(struct hstate *h)
         return arch_hugetlb_migration_supported(h);
  }
  
-/*
- * Movability check is different as compared to migration check.
- * It determines whether or not a huge page should be placed on
- * movable zone or not. Movability of any huge page should be
- * required only if huge page size is supported for migration.
- * There won't be any reason for the huge page to be movable if
- * it is not migratable to start with. Also the size of the huge
- * page should be large enough to be placed under a movable zone
- * and still feasible enough to be migratable. Just the presence
- * in movable zone does not make the migration feasible.
- *
- * So even though large huge page sizes like the gigantic ones
- * are migratable they should not be movable because its not
- * feasible to migrate them from movable zone.
- */
-static inline bool hugepage_movable_supported(struct hstate *h)
-{
-       if (!hugepage_migration_supported(h))
-               return false;
-
-       if (hstate_is_gigantic(h))
-               return false;
-       return true;
-}
-
  /* Movability of hugepages depends on migration support. */
  static inline gfp_t htlb_alloc_mask(struct hstate *h)
  {
         gfp_t gfp = __GFP_COMP | __GFP_NOWARN;
  
-       gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
+       gfp |= hugepage_migration_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
  
         return gfp;
  }


Assume you want to offline part of the ZONE_MOVABLE there might still be sufficient
space to possibly allocate a 1 GiB area elsewhere and actually move the gigantic page.

IIRC, we do the same for memory offlining already.


Now, maybe we want to make the configurable. But then, I would much rather tweak the
hstate_is_gigantic() check in hugepage_movable_supported(). And the parameter
would need a much better name than some "treat as movable".

-- 
Cheers

David / dhildenb

