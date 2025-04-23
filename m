Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F11448E0
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430854; cv=none; b=kMjRBvxveS+RjdcTGcc0zTxjP5rdLdj4p/vCR/rwp3jHX6I4ahWjSh1zHb9afsyAxwbM+EvmaXW1440z8KLbXOmev9YLOto6EIUbJl3Ol/abiXW3QYWEMS1mPPO3XEatYS+nH7g8BvsJ8aJtvK8d29S5kVw0yJ1OQWf9sivtL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430854; c=relaxed/simple;
	bh=mt+GEqVwIjWA95oaLQYfJjWsfuLTCwWdKipansAd/NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHBFXTH8F02Df12i/7/rDVjgrJChQ3tgqxcXZfdd6l4fG5tM5u8+imOOdteOCI3B1DO0R2aoIPiNrLd/koPXDuwUxvC3ZvaroTg7cM8AIAVf3XM3jjpSnlXNnqSi4GpjmMqaURx9svurHLwewM/K1AWEEZXDVm2Tj/F1lbH1OPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f2fBzraD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f2fBzraD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745430852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QESgbLfbNX2Y3UvNxy+rKh4qRh0SduwfR4pzjcuKRTw=;
	b=f2fBzraDXEsCTH2FjHCcSgMXqL5ZDS4J+ZgvsvCEfp2GC/J4ZNzMxRZNK5kUcQe8LbIzuU
	UYDzKzCX/Xc2Zx5KR/2VcJ2OUz8IgQKHHBV0pWd8XhGBjIcUqIYpcVQoZgyW6LjFVXm7b9
	othHODPRFLTDG1Bw2891jSdmtIMLf8A=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-8YG6toyBPcWX-82TWnuOrQ-1; Wed, 23 Apr 2025 13:54:10 -0400
X-MC-Unique: 8YG6toyBPcWX-82TWnuOrQ-1
X-Mimecast-MFC-AGG-ID: 8YG6toyBPcWX-82TWnuOrQ_1745430849
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5499c383444so28002e87.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 10:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430849; x=1746035649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QESgbLfbNX2Y3UvNxy+rKh4qRh0SduwfR4pzjcuKRTw=;
        b=gTqqtm547ttIpSqgM2m3IE+cRyVUY4Reli3ccXbDHmzyaN6DPtjNMryn7dO+ZZNFTK
         O3gmClcjJSXRFLo5JEgc7jB5hwHpG6bCm5+1TPzM91ZVs2FAcwpYafWaOL3lcZo1aneZ
         db6D0J226KzBu86oUoSFtHH02iqHFoFqrv4Uw9jcuPBqIIscRKPu2NzMWi6u/7LrRZ3l
         ECEhPgYf9MCkRhFR9VpWVAO3ZyC8OTzh9ET0gU6wgUByuaO1Fn18vPlJ/h9VdTGgEtVo
         EQMaJssuueOncpiH+V88X6kuvnHp9qYnTG69kJbg7V7j59lpz6OWUIKrR/gZM2iM6v3N
         1PoA==
X-Forwarded-Encrypted: i=1; AJvYcCUNPwJvV+nuNUIW1ETbYraKPx1a3oR8iIS/DcNTd2IHguSTAFZEItPfvColK9NiIGigW1rWB4GcfPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6ishkI9r74dxwWwGQOHuQ+f0O0r4PIpkkBU44FH16ES8brtr
	OphEEOY4XpU2uulRnsiSCClaBISVMSUiNUeMrZ1wh0QY6HmoXSaW1x0SsIVoUoJVFL8cRrtUHw7
	viVqmN3QC292S419xeljg5/E33tT0pUSBrf7xImKDif4XdtxGEQrV/Hmp
X-Gm-Gg: ASbGncszIkEPOVAze6K2r3n7S6M/qXmHZAmCbrN1RXzl8NLy0UMdgFSvQL2XK30wRMk
	H0jxnmPduMWUmf7xDe5dyXCoxBVHe2hYgbtHw3WF9StFFGXaePcoX29GzL5GNTLMgxhCQETZTfS
	6IKB2HeLQToJZ5uDRV9IIDGVwBeMcQs4hjx8ZSyQMz8YqBHF3mQdLSn429SHtoolv05VjuLzyUH
	NNUVRsViyr2SQDlOTkiS2gbiQe3jbsxIIM57144WTtkdEhITPB3B/NIqzMWepFP5S5/QO5qLThD
	RLOv9N1+7kN8Pl6x8v7Bpu6mhNO5Yp8yhjNoBg==
X-Received: by 2002:a05:6512:1318:b0:545:2b24:c714 with SMTP id 2adb3069b0e04-54d6e62c9c2mr6285129e87.18.1745430848645;
        Wed, 23 Apr 2025 10:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzJrFtBxv3ILf8kxudvvXLLQMA4k/wXdgyXDUK6/Kq+MOMB6h4q33zBlb3xTdNXEt/3B1MQg==
X-Received: by 2002:a05:6512:1318:b0:545:2b24:c714 with SMTP id 2adb3069b0e04-54d6e62c9c2mr6285107e87.18.1745430848074;
        Wed, 23 Apr 2025 10:54:08 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540ec1sm1595753e87.85.2025.04.23.10.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 10:54:07 -0700 (PDT)
Message-ID: <7185c055-fc9e-4510-a9bf-6245673f2f92@redhat.com>
Date: Wed, 23 Apr 2025 20:54:05 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/24] mm/hmm: let users to tag specific PFN with DMA
 mapped bit
To: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jake Edge <jake@lwn.net>,
 Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org,
 kvm@vger.kernel.org, linux-mm@kvack.org,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Chuck Lever <chuck.lever@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <cover.1745394536.git.leon@kernel.org>
 <0a7c1e06269eee12ff8912fe0da4b7692081fcde.1745394536.git.leon@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <0a7c1e06269eee12ff8912fe0da4b7692081fcde.1745394536.git.leon@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/23/25 11:13, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Introduce new sticky flag (HMM_PFN_DMA_MAPPED), which isn't overwritten
> by HMM range fault. Such flag allows users to tag specific PFNs with
> information if this specific PFN was already DMA mapped.
>
> Tested-by: Jens Axboe <axboe@kernel.dk>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/hmm.h | 17 +++++++++++++++
>  mm/hmm.c            | 51 ++++++++++++++++++++++++++++-----------------
>  2 files changed, 49 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 126a36571667..a1ddbedc19c0 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -23,6 +23,8 @@ struct mmu_interval_notifier;
>   * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
>   * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
>   *                 fail. ie poisoned memory, special pages, no vma, etc
> + * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
> + *                      to mark that page is already DMA mapped
>   *
>   * On input:
>   * 0                 - Return the current state of the page, do not fault it.
> @@ -36,6 +38,13 @@ enum hmm_pfn_flags {
>  	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
>  	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
>  	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
> +
> +	/*
> +	 * Sticky flags, carried from input to output,
> +	 * don't forget to update HMM_PFN_INOUT_FLAGS
> +	 */
> +	HMM_PFN_DMA_MAPPED = 1UL << (BITS_PER_LONG - 7),
> +

How is this playing together with the mapped order usage?


> HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 8),
>  
>  	/* Input flags */
> @@ -57,6 +66,14 @@ static inline struct page *hmm_pfn_to_page(unsigned long hmm_pfn)
>  	return pfn_to_page(hmm_pfn & ~HMM_PFN_FLAGS);
>  }
>  
> +/*
> + * hmm_pfn_to_phys() - return physical address pointed to by a device entry
> + */
> +static inline phys_addr_t hmm_pfn_to_phys(unsigned long hmm_pfn)
> +{
> +	return __pfn_to_phys(hmm_pfn & ~HMM_PFN_FLAGS);
> +}
> +
>  /*
>   * hmm_pfn_to_map_order() - return the CPU mapping size order
>   *
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 082f7b7c0b9e..51fe8b011cc7 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -39,13 +39,20 @@ enum {
>  	HMM_NEED_ALL_BITS = HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT,
>  };
>  
> +enum {
> +	/* These flags are carried from input-to-output */
> +	HMM_PFN_INOUT_FLAGS = HMM_PFN_DMA_MAPPED,
> +};
> +
>  static int hmm_pfns_fill(unsigned long addr, unsigned long end,
>  			 struct hmm_range *range, unsigned long cpu_flags)
>  {
>  	unsigned long i = (addr - range->start) >> PAGE_SHIFT;
>  
> -	for (; addr < end; addr += PAGE_SIZE, i++)
> -		range->hmm_pfns[i] = cpu_flags;
> +	for (; addr < end; addr += PAGE_SIZE, i++) {
> +		range->hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
> +		range->hmm_pfns[i] |= cpu_flags;
> +	}
>  	return 0;
>  }
>  
> @@ -202,8 +209,10 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
>  		return hmm_vma_fault(addr, end, required_fault, walk);
>  
>  	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> -	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++)
> -		hmm_pfns[i] = pfn | cpu_flags;
> +	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
> +		hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
> +		hmm_pfns[i] |= pfn | cpu_flags;
> +	}
>  	return 0;
>  }
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> @@ -230,14 +239,14 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  	unsigned long cpu_flags;
>  	pte_t pte = ptep_get(ptep);
>  	uint64_t pfn_req_flags = *hmm_pfn;
> +	uint64_t new_pfn_flags = 0;
>  
>  	if (pte_none_mostly(pte)) {
>  		required_fault =
>  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
>  		if (required_fault)
>  			goto fault;
> -		*hmm_pfn = 0;
> -		return 0;
> +		goto out;
>  	}
>  
>  	if (!pte_present(pte)) {
> @@ -253,16 +262,14 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  			cpu_flags = HMM_PFN_VALID;
>  			if (is_writable_device_private_entry(entry))
>  				cpu_flags |= HMM_PFN_WRITE;
> -			*hmm_pfn = swp_offset_pfn(entry) | cpu_flags;
> -			return 0;
> +			new_pfn_flags = swp_offset_pfn(entry) | cpu_flags;
> +			goto out;
>  		}
>  
>  		required_fault =
>  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
> -		if (!required_fault) {
> -			*hmm_pfn = 0;
> -			return 0;
> -		}
> +		if (!required_fault)
> +			goto out;
>  
>  		if (!non_swap_entry(entry))
>  			goto fault;
> @@ -304,11 +311,13 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  			pte_unmap(ptep);
>  			return -EFAULT;
>  		}
> -		*hmm_pfn = HMM_PFN_ERROR;
> -		return 0;
> +		new_pfn_flags = HMM_PFN_ERROR;
> +		goto out;
>  	}
>  
> -	*hmm_pfn = pte_pfn(pte) | cpu_flags;
> +	new_pfn_flags = pte_pfn(pte) | cpu_flags;
> +out:
> +	*hmm_pfn = (*hmm_pfn & HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
>  	return 0;
>  
>  fault:
> @@ -448,8 +457,10 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>  		}
>  
>  		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> -		for (i = 0; i < npages; ++i, ++pfn)
> -			hmm_pfns[i] = pfn | cpu_flags;
> +		for (i = 0; i < npages; ++i, ++pfn) {
> +			hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
> +			hmm_pfns[i] |= pfn | cpu_flags;
> +		}
>  		goto out_unlock;
>  	}
>  
> @@ -507,8 +518,10 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
>  	}
>  
>  	pfn = pte_pfn(entry) + ((start & ~hmask) >> PAGE_SHIFT);
> -	for (; addr < end; addr += PAGE_SIZE, i++, pfn++)
> -		range->hmm_pfns[i] = pfn | cpu_flags;
> +	for (; addr < end; addr += PAGE_SIZE, i++, pfn++) {
> +		range->hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
> +		range->hmm_pfns[i] |= pfn | cpu_flags;
> +	}
>  
>  	spin_unlock(ptl);
>  	return 0;

