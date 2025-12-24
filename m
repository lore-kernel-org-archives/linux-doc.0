Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136927713
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766612725; cv=none; b=lG29qI1wgmEkZb5xl2giqqf46wKsovc4CspU7shlugtIVB7CjR4aN1t1jQQw3BeU9LGPxHYlOTFuDPIFP1YP2DEQNLfIyHP1hLY35oXXqk/HKyZ+lghA6wsYNMP3uPP3Cs+aB5cvHo56e/z38/xYcoHXWytVe0nw7mioNH14gGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766612725; c=relaxed/simple;
	bh=JAZ/iYBIl3CCPfknwU6bcRgdj89O1TUPl5WIxmRNkgg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HKMZo8MTxf2/hQwxPM9c7ForCbFmbg6bgmXkjwNRe432n901J+JHQfMmuoxCFHafDZoOTMl31nl17ujWIDS6XFCaaw12RPP54qTlE+52Bwyayb9pjun52KiJ/g/GOBYvMspIwHpdIcy3LnDLDPxUEFLCrXyyoeRqb391uisKcmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GasIkLE8; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GasIkLE8"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a1462573caso953345ad.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 13:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766612723; x=1767217523; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BVSrph4vFqsRAei4UBF49evcQq/UGcTwkAqjzFfFby4=;
        b=GasIkLE8YM63nI29PrJO7zhQ1/X9phVzTeNVoKCWEXve/EPMs+2LWYd32ALdGD6Ow0
         oRDzR5IysGxd2tllOpx6//dvfcDced4U+hEuRerivzqt2pHAligzEkSP4YeRBeryFsyE
         xKkopz3aKyKouWCwlcioo2gp6qOtzknB+tXyrL39hSAkiB8FfgOMjSWtz3VCgzTqkNjk
         kxf2wnbeMz5Lk7Ey+pk19d9XWKnbyERLaQUM7t0GYvju3UoymAK44+DeKkhCO+XKgmRz
         HYtbNDm1STD666oENWrHPgwhjkMfT4HG7UExOd6RQds2kMFmv6GUu0ZkSaLtcwGkDsiY
         N62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766612723; x=1767217523;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVSrph4vFqsRAei4UBF49evcQq/UGcTwkAqjzFfFby4=;
        b=o9Z7qx2LpO4jqA76FtbtMTb7hasWZu9y11U3AwLdTILdZwX1MEHV7qqVTv3hA4I/9O
         OjWZev5fNVvgv6bzWD3rdoMOcRjf2dNJ2FrOJxeyxQVfQoqFZ64B18lpX6v8fPBCIOXM
         RKiL4vd+A1HG8lbMs5kfBzH6UXqNleg7fHHB3ZPgszIiQcR5AsvFhHs6XHPOb1VtQq9B
         i6JRRCcFFyGCdu/PVBrLau6NgS0z+AQRNY7xmxbxau3zcsKE7VRtHQkvwThm9znRiQic
         VKOooUqzl/AxIgGSjYIjR6D/iFuVbwH+PAb4HBCqCKt59U1FuIS1niPfO6NTSfxd3/uM
         qGdA==
X-Forwarded-Encrypted: i=1; AJvYcCUjR2xBh4c+N16OOSU0wevG/kGB5IGmmaytrHYJSETIQ6BzrVBxErqY86qHQu10utfD+/qSwqcEdrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJvGhXxLofEQAd6qMYAHLNriMtgq087NZ7MySd8PkMLIc0jge
	lcX/ixis4zcC0xFNtliHW/OjYA1aB5ePMA4j5Q/SkJ8H6SgY2SueEjZMm3npU2wUrA==
X-Gm-Gg: AY/fxX4IvxCipy205svhJgQSIm80ZHIt5qxf9vZv9K9LfnspGoCMrZdYEHFgSCM5yUq
	oPAfyMscV8apn1g0TR+4PuDtRor+dpIHfd3/VLtmCykaU6xO+PW/VDW3mSPWoUU/NvGBsd109jm
	9UgjU6nbXqvxdPkZ2EXFBzlS58sLY0wTJJPjD2jZC0myDevjgMEvs5KqCdv6t9JefUafzvL5Soy
	cxUwwbyiwWkr0BlDkoxooSraJVxOeixpNV6Y5L2KgL4jrqtwXEcznFloQXQuk4us3dHsj7m7Jz+
	2JD3Yrz7+yMWEOrmwzhY9JBvoejUDxdpIlQ9f4JofK2KfeL4WeDzKgPuAff0Dgb8xIwD0J+gmWX
	LVZq9+LKZlCTKahhY9011eeBax/FZdrxcIfA9ooBlsCx7sXB8YWwANVSRqwIfwyDoO6jo7lvtg2
	rdEua+wAVpiRXwtnL7BE86gP8U1pTy9+V4XbofR9tgoSVai09PtzPGxyMfEY07XurPj9xKbCkWQ
	d4X5TIURPpPXzHckePZs+4tmCZZ35LMFtSH4d352w==
X-Google-Smtp-Source: AGHT+IFinsP+qZuskXhMf0I7dlZgK8eVRNz1z/uGY3g6QJhLT6VgXkln24BNeTU7r9KKUD0or0bXNA==
X-Received: by 2002:a17:902:f70f:b0:29d:7b9e:6df8 with SMTP id d9443c01a7336-2a3522d57c7mr2328755ad.2.1766612722711;
        Wed, 24 Dec 2025 13:45:22 -0800 (PST)
Received: from [2a00:79e0:2eb0:8:892f:1325:ec15:5ca8] ([2a00:79e0:2eb0:8:892f:1325:ec15:5ca8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm163086525ad.25.2025.12.24.13.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 13:45:22 -0800 (PST)
Date: Wed, 24 Dec 2025 13:45:21 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Gregory Price <gourry@gourry.net>
cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, kernel-team@meta.com, david@kernel.org, 
    osalvador@suse.de, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
    Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
    surenb@google.com, mhocko@suse.com, corbet@lwn.net, muchun.song@linux.dev, 
    hannes@cmpxchg.org, David Hildenbrand <david@redhat.com>, 
    Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v5] mm, hugetlb: implement movable_gigantic_pages
 sysctl
In-Reply-To: <20251221125603.2364174-1-gourry@gourry.net>
Message-ID: <dd6428a4-2984-e8f0-2760-bc2c7056b009@google.com>
References: <20251221125603.2364174-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 21 Dec 2025, Gregory Price wrote:

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
>   echo 0 > node0/hugepages/..-1GB/nr_hugepages  # clear node0 1GB pages
>   echo 1 > node1/hugepages/..-1GB/nr_hugepages  # reserve node1 1GB page
>   ./alloc_huge_node1 &    # Allocate a 1GB page on node1
>   ./node1_offline  &      # attempt to offline all node1 memory
>   echo 1 > node0/hugepages/..-1GB/nr_hugepages  # reserve node0 1GB page
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

Acked-by: David Rientjes <rientjes@google.com>

Thanks for pursuing this, Gregory.
