Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBA3B8D64
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799511; cv=none; b=tkP80W9dwMQ4b+0xFMu4ey0fR6ZHnu05qNwe+W6k9Om4Lm9PyVvq6BGH/j/OdJWA2gnIWxpbnyjn72MTAh3miA6QDNtCNqfjPCG/pujmMa3uiKdCejgQmJdDhCSykekyF5aN3i67UWyY1q8SLzjaLA1C8wUE4b0BDSxDJ1bBQOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799511; c=relaxed/simple;
	bh=9FNzeog4COCy9LuoTkzFA4bpW5oB7/uHLvwqjcx59m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puqzwI/nj6dtJaY20Cu4qeW9SVJ0Ple7AO3ieNtnscIDJH2ri+GlkU8HLdnRIe+QLkNuBNMSqWb2SiKoOx1fQoJz4aAxjMh58zK92cFkIsZ/TzSbEkFNTZLwDVPtQ3djTLX4oLoDgBTGYr5Z2qzRVtqRO6urj/W9cGRfw3L/RRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDXZaWf4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDXZaWf4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0d06cfa93so77465ad.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767799507; x=1768404307; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mL3jyZUpIqGDPVZblrA8h5rKljtD6YCYa6ewKnuMe84=;
        b=qDXZaWf4hVy04s3COTTBwEmFS2mwHyD+ZPkkGjenTck4tGLaxht+so2DQZN5kQHSnz
         EuPGcce71k83GSy0mBHHTZg/6VY0+AbLwdN35J8qiGLhQMGV81PwKRNFIOZ8KkYokQFQ
         bedcjXjMgselExzAFTp57dzSUc8irySHFF4hDTMbr56oFWqkSEKwpk9LqJmgnYtdz2Vo
         I5KgsnIK38rb1PzWwG3n7vNmj4Wlqe2fuNNvi3wQFCw6d2kDTXaqAhTv1VtMMLkx8hyR
         m6Zdyd9dkHs67PE+veoebAOPgqBItJkArwSwDlQ3yVSgnOXe61FeFsyzJiuodl+wlN+9
         d7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799507; x=1768404307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL3jyZUpIqGDPVZblrA8h5rKljtD6YCYa6ewKnuMe84=;
        b=NQDlzstllqxX0XKHVMkj7eTV2HdkE6tFrcujFKKXVUFQQWvcQVKWAgwx1qYECHoaQL
         tg1+WND5F0piL1oKNAheCTC0Y3r0og/AP7ctwuIYvSu6k4UMduYz2EdaFoi9oc1ulFC7
         LPItFBl/DY+S0RQUtTfaIEIGmUb/O0VuhY6WCkmT1/pX/FB9rF+he6RTXlG2WllXyE2v
         M0DJr5LRp83sVuvLByAuALdD412doFZ7EG/q9iJipknqB0ugbpyzp03S1wg9NwyZzn9+
         Qpqo6jSBoDSjxo1WExKPmS34VnNfH2c5yRu/R0B0BbGvaahyh3FptvaTa9jxNSc8JR8i
         1iRg==
X-Forwarded-Encrypted: i=1; AJvYcCVohTkhBNZ9gqYSQqWGZbbB0N9vJuWbWUixC27UlfpP6jVBGFic49I27bESbaqRzyl3pc1/mrfTFFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2C1AJYGAFiEdcFFhF5lbbE0ULf8J/qbfPyVd4K7H9pLWLmwd
	FLh5kbGkZmzipsXp0WeEu2kq7OUFT+REtFArK2M61OJM2IhVsyx3Az1OHj6qTic3yg==
X-Gm-Gg: AY/fxX7wLYyxjkdd5KvfpZhFHXRaEBZ+QvCChcXJGGpG6x8BkOScL1B3YonCDG/yJw5
	oKwVQw7XllyAz/kDfMB2uPWfmVz6aDgbG97rO51mJlawB/ghOzVCnrjDanQRh6T7ZeaYSNIssV9
	nTSbnLqmNAd7+OT5rKUTtc3d3xjSD28zoXMpdAopFZnNPjTvt9p7aPbgrnTpF+L6NkujT6BqiPu
	VrYoRffKJdqAGlJqXV9pCspBBSQyQUA/gNQ8tRlIlSrZ4MmRseJ30NvU51BwCitK9Qmzt+DNqJl
	W16sBuznAmPkJK9FfbuSJ1UroGdkIrXXXnglFNfy0P1Dg8mPsuO/f00M7VHHbdZz9jOyiLe9tSv
	Gks9O7aSVXqeWFvzbSm48pTzxBWikJLT5gq5hg0AB0zpnVfcm/3uwq9BaIvZz07UWjVOtsPcvbX
	y3NkrtD5poeTnjlcRw3t1sucytWK4iEOxODgIK2VoGhK0EclgN
X-Received: by 2002:a17:902:c950:b0:292:b6a0:80df with SMTP id d9443c01a7336-2a3edbc4a49mr2836835ad.10.1767799507191;
        Wed, 07 Jan 2026 07:25:07 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc96ca7a9sm5548384a12.25.2026.01.07.07.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:25:06 -0800 (PST)
Date: Wed, 7 Jan 2026 15:24:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org
Subject: Re: [PATCH v5 0/4] iommu: Add IOMMU_DEBUG_PAGEALLOC sanitizer
Message-ID: <aV56y9KcAS8mC7Uk@google.com>
References: <20260106162200.2223655-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260106162200.2223655-1-smostafa@google.com>

On Tue, Jan 06, 2026 at 04:21:56PM +0000, Mostafa Saleh wrote:
> Overview
> --------
> This patch series introduces a new debugging feature,
> IOMMU_DEBUG_PAGEALLOC, designed to catch DMA use-after-free bugs
> and IOMMU mapping leaks from buggy drivers.
> 
> The kernel has powerful sanitizers like KASAN and DEBUG_PAGEALLOC
> for catching CPU-side memory corruption. However, there is limited
> runtime sanitization for DMA mappings managed by the IOMMU. A buggy
> driver can free a page while it is still mapped for DMA, leading to
> memory corruption or use-after-free vulnerabilities when that page is
> reallocated and used for a different purpose.
> 

Thanks for this series! This is really helpful!

> Inspired by DEBUG_PAGEALLOC, this sanitizer tracks IOMMU mappings on a
> per-page basis, as it’s not possible to unmap the pages, because it
> requires to lock and walk all domains on every kernel free, instead we
> rely on page_ext to add an IOMMU-specific mapping reference count for
> each page.
> And on each page allocated/freed from the kernel we simply check the
> count and WARN if it is not zero, and dumping page owner information
> if enabled.
> 
> Concurrency
> -----------
> By design this check is racy where one caller can map pages just after
> the check, which can lead to false negatives.
> In my opinion this is acceptable for sanitizers (for ex KCSAN have
> that property).
> Otherwise we have to implement locks in iommu_map/unmap for all domains
> which is not favourable even for a debug feature.
> The sanitizer only guarantees that the refcount itself doesn’t get
> corrupted using atomics. And there are no false positives.
> 
> CPU vs IOMMU Page Size
> ----------------------
> IOMMUs can use different page sizes and which can be non-homogeneous;
> not even all of them have the same page size.
> 
> To solve this, the refcount is always incremented and decremented in
> units of the smallest page size supported by the IOMMU domain. This
> ensures the accounting remains consistent regardless of the size of
> the map or unmap operation, otherwise double counting can happen.
> 
> Testing & Performance
> ---------------------
> This was tested on Morello with Arm64 + SMMUv3
> Did some testing Lenovo IdeaCentre X Gen 10 Snapdragon
> Did some testing on Qemu including different SMMUv3/CPU page size (arm64).
> 
> I also ran dma_map_benchmark on Morello:
> 
> echo dma_map_benchmark > /sys/bus/pci/devices/0000\:06\:00.0/driver_override
> echo 0000:06:00.0 >  /sys/bus/pci/devices/0000\:06\:00.0/driver/unbind
> echo 0000:06:00.0 > /sys/bus/pci/drivers/dma_map_benchmark/bind
> ./dma_map_benchmark -t $threads -g $nr_pages
> 
> CONFIG refers to "CONFIG_IOMMU_DEBUG_PAGEALLOC"
> cmdline refers to "iommu.debug_pagealloc"
> Numbers are (map latency)/(unmap latency), lower is better.
> 
> 			CONFIG=n    CONFIG=y    CONFIG=y
> 			            cmdline=0   cmdline=1
> 4K - 1 thread		0.1/0.6     0.1/0.6     0.1/0.7
> 4K - 4 threads		0.1/1.1     0.1/1.0     0.2/1.1
> 1M - 1 thread		0.8/21.2    0.7/21.2    5.4/42.3
> 1M - 4 threads		1.1/45.9    1.1/46.0    5.9/45.1
> 

Just curious to know if we've also measured the latency for larger
mappings? e.g. 1G mapping backed by `n` 4K mappings?

> Changes in v5:
> v4: https://lore.kernel.org/all/20251211125928.3258905-1-smostafa@google.com/
> - Fix typo in comment
> - Collect Baolu R-bs
> 
> Main changes in v4:
> v3: https://lore.kernel.org/all/20251124200811.2942432-1-smostafa@google.com/
> - Update the kernel parameter format in docs based on Randy feedback
> - Update commit subjects
> - Add IOMMU only functions in iommu-priv.h based on Baolu feedback
> 
> Main changes in v3: (Most of them addressing Will comments)
> v2: https://lore.kernel.org/linux-iommu/20251106163953.1971067-1-smostafa@google.com/
> - Reword the Kconfig help
> - Use unmap_begin/end instead of unmap/remap
> - Use relaxed accessors when refcounting
> - Fix a bug with checking the returned address from iova_to_phys
> - Add more hardening checks (overflow)
> - Add more debug info on assertions (dump_page_owner())
> - Handle cases where unmap returns larger size as the core code seems
>   to tolerate that.
> - Drop Tested-by tags from Qinxin as the code logic changed
> 
> Main changes in v2:
> v1: https://lore.kernel.org/linux-iommu/20251003173229.1533640-1-smostafa@google.com/
> - Address Jörg comments about #ifdefs and static keys
> - Reword the Kconfig help
> - Drop RFC
> - Collect t-b from Qinxin
> - Minor cleanups
> 
> Mostafa Saleh (4):
>   iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
>   iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
>   iommu: debug-pagealloc: Track IOMMU pages
>   iommu: debug-pagealloc: Check mapped/unmapped kernel memory
> 
>  .../admin-guide/kernel-parameters.txt         |   9 +
>  drivers/iommu/Kconfig                         |  19 ++
>  drivers/iommu/Makefile                        |   1 +
>  drivers/iommu/iommu-debug-pagealloc.c         | 174 ++++++++++++++++++
>  drivers/iommu/iommu-priv.h                    |  58 ++++++
>  drivers/iommu/iommu.c                         |  11 +-
>  include/linux/iommu-debug-pagealloc.h         |  32 ++++
>  include/linux/mm.h                            |   5 +
>  mm/page_ext.c                                 |   4 +
>  9 files changed, 311 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
>  create mode 100644 include/linux/iommu-debug-pagealloc.h
> 
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 
> 
