Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B4920459E
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514719; cv=none; b=Y7qTYRBmiCOg43K+87cNy3JzaMg1ybyWNHaPN7L+mebJAd0zCEdmXiG2qDFvji4CnW/0QkpunqSGxb2l7BsrGpeEos+AgT8jr1KGHVXo/QCGxdI+Pd3H8G+JVH+9y0+mfMCnr624HvLk4UMR7UbFgPDTpxjdcRB6WwPgtE6UfHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514719; c=relaxed/simple;
	bh=2+3/lkceKHD7MtD7MIlV4ns2uYDhgxY7vrX1hRr/R4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HQqhg0r+egRg8SFpHMj9VqkvAIjipIFU+JPdQfe2W0MMzJhElposU6ZYbdDGuQgly2YreEDqTMLYF6dzpU/AsqiZJTtWntP1i8fPHcDY8W5Mh1UIN/u4dqgloaXTmAbHftz30owh/+5y/WpnwZJTne00BX85XjuDxD84xW69zYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PQGH/Nhp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PQGH/Nhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mBIX/0PCUoL/MsiBDJ6PB1wA3KuhKWrkaa20oqZPbO4=;
	b=PQGH/NhpII7WuqLk/NAYImgZJ1mSE8aAQ1016EyCj6A1R32XmFD7+UsrA83ehBT08H7GSf
	Q7fdBXXoBdcpVgfss8KY4UDSlZ8Kif3i8GhKjAQc0zt7myxPqLXBsrX+iRl2PWX5Hw7j50
	MX53rK4HWVOLA/Z7fztoSV6pOtCVG2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-XFclQExyPAyWvyPSlbYxKw-1; Tue, 01 Apr 2025 09:38:35 -0400
X-MC-Unique: XFclQExyPAyWvyPSlbYxKw-1
X-Mimecast-MFC-AGG-ID: XFclQExyPAyWvyPSlbYxKw_1743514715
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf446681cso34384425e9.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514714; x=1744119514;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBIX/0PCUoL/MsiBDJ6PB1wA3KuhKWrkaa20oqZPbO4=;
        b=jQaqLOpXUyjwLsu9C3QImzZYSUw7IJFDbUijzIAdXEYPJXe9PSwRwpJg5zT3PCtNKE
         02eOHBp95qX7KyFJPjkjcRCYP6Dvw5Rw0NjvUKegNarxTfod7o0XWWDSiMnIfzj72Jjs
         cmBR5pRE6/zSvpCUTEJPA2/sMrGsK3BedOUSOKFUNTdJN1zFsLJPk4p2cHjWZcANM2G0
         KwCThAyofB/yZ8CAhwj1b9z7vwBT4UvaRIrqgjhrZT6jUibfqRtmBvJ7lXXVmlWN4o0c
         0NKXZyOQjf9/q/bstLf2cSvljAqlCt0iwOpQwOs+uNFGmntlHHlMk1/OpnfKBElSWV19
         6xww==
X-Forwarded-Encrypted: i=1; AJvYcCUXHAmixUli7Ly8pSXDbYkLu1CfILlJxhBOzszH1XE9HJyZVD84gmxG4VjyXvQsA9z8L0EvUFXHlsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwGcHMFH8aKs7rXcKjhruYooKfArXuUA+EJZLWy7gYeFQZMY0
	LHS9GTzr0TfSXxLe3nar06zWDFHlNu/WO2DqsAykcWUFdebupLtdIJJw6kjtcNsq9K+fSsB2JA7
	zYuXVRPSZj2ySDNBBcupjjcefab4n85Esnufu0c6YI2B9TTaJ3Fk5aMVJvA==
X-Gm-Gg: ASbGncuiAyMCfKONigvL6PScn2iRtewzZlykrqkdAWXL1YDLcoVEGF94wBhk5gocNcT
	qGLRXn8uir3cAkUAEh/suojo79Puns9cjA0VbMsoc1APoJ1H2wVliNWFjcq89rggjjcSlRGFgXG
	OTCCZOKQsHaQFy4XW1W5JeuLGe1SKstIsVu7MaK7C12R6dQlJ+1qLoQuCNNZ5LRatINBka8UyRf
	F+vEbwPj5a/iwjVuyW455S0K6TKxvb8zNwE8pNH8dOnI84l7b50kYxNKvRSmzBCrIvD9VbY+xUP
	wDM2fIhGXT9nyclJ48K9Ke3CBb5Yieo7dGYhAnjUwDB/suLT91eidLVgglbPrb8d0ZgndoFzhaD
	pnBHExAIoNEN14tIQ5YcxSKve1x00CDzCB/HN88Ca
X-Received: by 2002:a05:600c:511a:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-43db61ff43fmr134406245e9.15.1743514714461;
        Tue, 01 Apr 2025 06:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr3twtZA0KooQEh8dHg9b7qeNoANKQTnQViaHy2o+wb2no4EXaYSixrF4D7f4LtSNg9X54Vw==
X-Received: by 2002:a05:600c:511a:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-43db61ff43fmr134405735e9.15.1743514714013;
        Tue, 01 Apr 2025 06:38:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede98sm199017395e9.6.2025.04.01.06.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:38:33 -0700 (PDT)
Message-ID: <9a9d9e82-2919-4c93-92c2-34e29f71044e@redhat.com>
Date: Tue, 1 Apr 2025 15:38:31 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 ryan.roberts@arm.com, suzuki.poulose@arm.com, yang@os.amperecomputing.com,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
 akpm@linux-foundation.org, ardb@kernel.org, mark.rutland@arm.com,
 joey.gouly@arm.com, maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
 oliver.upton@linux.dev, baohua@kernel.org, ioworker0@gmail.com,
 jgg@ziepe.ca, nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20250325093625.55184-1-miko.lenczewski@arm.com>
 <20250325093625.55184-4-miko.lenczewski@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250325093625.55184-4-miko.lenczewski@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.03.25 10:36, Mikołaj Lenczewski wrote:
> When converting a region via contpte_convert() to use mTHP, we have two
> different goals. We have to mark each entry as contiguous, and we would
> like to smear the dirty and young (access) bits across all entries in
> the contiguous block. Currently, we do this by first accumulating the
> dirty and young bits in the block, using an atomic
> __ptep_get_and_clear() and the relevant pte_{dirty,young}() calls,
> performing a tlbi, and finally smearing the correct bits across the
> block using __set_ptes().
> 
> This approach works fine for BBM level 0, but with support for BBM level
> 2 we are allowed to reorder the tlbi to after setting the pagetable
> entries. We expect the time cost of a tlbi to be much greater than the
> cost of clearing and resetting the PTEs. As such, this reordering of the
> tlbi outside the window where our PTEs are invalid greatly reduces the
> duration the PTE are visibly invalid for other threads. This reduces the
> likelyhood of a concurrent page walk finding an invalid PTE, reducing
> the likelyhood of a fault in other threads, and improving performance
> (more so when there are more threads).
> 
> Because we support via allowlist only bbml2 implementations that never
> raise conflict aborts and instead invalidate the tlb entries
> automatically in hardware, we can avoid the final flush altogether.
> Avoiding flushes is a win.
> 
> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   arch/arm64/mm/contpte.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 55107d27d3f8..77ed03b30b72 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -68,7 +68,8 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>   			pte = pte_mkyoung(pte);
>   	}
>   
> -	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
> +	if (!system_supports_bbml2_noabort())
> +		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>   
>   	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
>   }

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

