Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ED128D83E
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433454; cv=none; b=lzZ3FvyU3oGoH2aXB2IqLFYT3JpOnYkm/pu5vlI/emSf909GSyHY3Ox4XxCT9kb61LbeF77V501BDm/7St9fo8sH/l64aqeL5ABjZFc/kO0DGYJbLqR9BT0330CInJRekGk4HpaKRenjLs68w49VtaIl8kaqrV3AKXioIHbttw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433454; c=relaxed/simple;
	bh=gh76Cwi537UAiZiZzvQ7qO7K4eMJvXZ5GcYqQsv4qVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZ57ZW7QzCJ/50sOIoFKQ1VYTf4jyraYqKGcueVgL5M0qfZB+sWb/vzRgN6V8RPHl4Oh3zpsIa3Vis5bmhJcYxNzQ3gqnR5esXHUfUzYzfDamWT2AS6fL8Zt9YcxW4bY4I9zCCJYmueLqRM4qr7a4xtfJHTKc4mM65nrN1oHp1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EUEOBP2n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EUEOBP2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745433452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6pwEnRnhkHgazDgVxPbcQpa5mERaCMyYK1dziw6UIo=;
	b=EUEOBP2nmpJF5XmufuyC/HIcBOTM8TgYaIueDWTT8ofPtnfWc/CGh3aJJ3MVbfT+1Wnu7k
	lXE+Q4rq9n1OekVQ7HgQ9A3XJsQxwfXGDLp62Ftd8CJS3PkPqDfIls4Vs6ZrAhAN2DrRm8
	ebc2avXQ5w+A40Yi7hkS0kSRLfNt934=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-m_rDZXQ3NPmpW7EoENI0qg-1; Wed, 23 Apr 2025 14:37:28 -0400
X-MC-Unique: m_rDZXQ3NPmpW7EoENI0qg-1
X-Mimecast-MFC-AGG-ID: m_rDZXQ3NPmpW7EoENI0qg_1745433447
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-30bf67adf33so6649301fa.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 11:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433447; x=1746038247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6pwEnRnhkHgazDgVxPbcQpa5mERaCMyYK1dziw6UIo=;
        b=OuBGFX0SHxyLaE/0B23NChcE2wTsUhbrQJQqo8nUZjX6Gi2c4F6A7smKCWcUsgZJ0o
         xBFdLgIOrZE186g5et3TahL/v1tS1NExQLb1wt6PJes9BOQob554nUvEmJCNYGZo4Buf
         ymYjw7VlutuVDQ61BTk9sHqJCYVkV37DWpCBQ39Si15/s4yM3TjNCH2rHdhMKpuUTNYp
         FEIesSuTIxtwnq6XXyPk0z5BO7yRArj25n0/SlDD0r9jjv8Zm6rEHIRPWoH8KBDxp3n5
         5IO+1b1atWlcml2UCqssZTBDmjYK3Sa/j9t45wkNCedQSbNWF0MQj8l8ur6s4vWs2WUz
         hsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfgPSw1cAJckFaJvkV/dMU3EGLJ3fUJFVDmY8D0ci+Kvnhndjbmz0HSMH/5vF8cCNz0m1YLr+6Etc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe2iAI3ZPMd4lK3REjbGo1/g3W/aOT2ErRMmeoTf8/DHC9GKJn
	BXcAIMmwYHxKOHW9afrrtOwLjiV3HOjtA9L/AhRkzdGPVp2r12s0OFfApZAyv4XkJvcHj9zot2V
	afDR8vE5onSdch3zM3cmc9zTIAeLCGt3OcHAy4oF397kfBauegw098uZq
X-Gm-Gg: ASbGncsRuyjf6RVb4scfNK86MkGLWOqaHbsrtpjiKalAa/+cyttPoSwx5+oJA4bTulA
	QHF+E4qIPLceHzmjBzyQ9VsDCvIxa67szCGs6rkjbd2HTkyF5881fK8GW2VWRhXiT8UfEjnGSyt
	VbBIz4qJb3SirH2xdStgsq71quL03ghX6JTJfXDwX4kIne4W3vxVZEsKTangKL19u9+Q9AN96Nb
	w3DpQaJZC69teFhROQHNni/zaXhv3FetzHDUSGCjcRnWGK4TFhtkeLbiIX+oXuzOSPxAfgy24FN
	BZgdofQClaOyVeOZbEeH3BGR4QZrvdLXJv6weg==
X-Received: by 2002:a2e:8818:0:b0:308:e956:66e with SMTP id 38308e7fff4ca-3179449456amr500091fa.0.1745433446936;
        Wed, 23 Apr 2025 11:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeLX03zhP8nSlFHqNWBiKFBjf3MShxZQb8tc2EeW+8vLK6+b+87nnEoR+0vFre3XFcDl9w4g==
X-Received: by 2002:a2e:8818:0:b0:308:e956:66e with SMTP id 38308e7fff4ca-3179449456amr499761fa.0.1745433446435;
        Wed, 23 Apr 2025 11:37:26 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075e8e9sm19833701fa.12.2025.04.23.11.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 11:37:26 -0700 (PDT)
Message-ID: <36891b0e-d5fa-4cf8-a181-599a20af1da3@redhat.com>
Date: Wed, 23 Apr 2025 21:37:24 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/24] mm/hmm: let users to tag specific PFN with DMA
 mapped bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Jake Edge <jake@lwn.net>,
 Jonathan Corbet <corbet@lwn.net>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Yishai Hadas <yishaih@nvidia.com>,
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
 <7185c055-fc9e-4510-a9bf-6245673f2f92@redhat.com>
 <20250423181706.GT1213339@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250423181706.GT1213339@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 4/23/25 21:17, Jason Gunthorpe wrote:
> On Wed, Apr 23, 2025 at 08:54:05PM +0300, Mika Penttilä wrote:
>>> @@ -36,6 +38,13 @@ enum hmm_pfn_flags {
>>>  	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
>>>  	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
>>>  	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
>>> +
>>> +	/*
>>> +	 * Sticky flags, carried from input to output,
>>> +	 * don't forget to update HMM_PFN_INOUT_FLAGS
>>> +	 */
>>> +	HMM_PFN_DMA_MAPPED = 1UL << (BITS_PER_LONG - 7),
>>> +
>> How is this playing together with the mapped order usage?
> Order shift starts at bit 8, DMA_MAPPED is at bit 7

hmm bits are the high bits, and order is 5 bits starting from
(BITS_PER_LONG - 8)


> The pfn array is linear and simply indexed. The order is intended for
> page table like HW to be able to build larger entries from the hmm
> data without having to scan for contiguity.
>
> Even if order is present the entry is still replicated across all the
> pfns that are inside the order.
>
> At least this series should replicate the dma_mapped flag as well as
> it doesn't pay attention to order.
>
> I suspect a page table implementation may need to make some small
> changes. Indeed with guarenteed contiguous IOVA there may be a
> significant optimization available to have the HW page table cover all
> the contiguous present pages in the iommu, which would be a higher
> order than the pages themselves. However this would require being able
> to punch non-present holes into contiguous mappings...
>
> Jason
>
--Mika


