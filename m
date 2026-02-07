Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597823101D3
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770504652; cv=none; b=iTYg032p3gp226ORy9YxAV2e5cp2ggshGzYDWaAdkZRK5X6vla/bDP6vxpB6W8/Qf9wAUtftnbcik+flsIsEci+p0s1ko01nddmMhGIi+v61w0nDiaoUhIFDEYZT0Cu9/AU2P+HzE4uST19gitSqq9b7OTTST1O/J1zmj4In8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770504652; c=relaxed/simple;
	bh=Y+6qfQ0jJpJvDEssgGqbLBMLN/j7Rup6ibh8xCsuHv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaQcrKclHMMWJJja5G57CbLfEFtwMEe7YOU1xTlgZudyYryHzLXfG28eMdw+TGkH6bXdI3XdRL72WYv02SerJOh9g5KxR8c3TgKhjRIRaTKYgsaI9/CawafFQ5cDsuq2wcU8pUnsYDoalEy1rR1QIIq2gWUYAfDMDR1USXiplgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTzLtks+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTzLtks+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f2599980so39142015e9.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 14:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770504651; x=1771109451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guTUZAnKzmLJTo83FGB09sw8SSRh07aMEfZkMVMbC+c=;
        b=fTzLtks+s+acyOMgG31V62SD2Z7CnZK5CGkmnxLuHlYeyXMjBHbkj9dq8yMJAEvYdx
         mnG5xPdoiMfQ0lvArkTyXDIUhzjYCEPJqdUcmv1becVix6YjVowIrIRyG8RvExf3IjF4
         bxKjysdd93bMiXu71QBzYanIVwVxPxTiY99sIPbDThwGhDC94BrTWIdprEPL5+SYgamL
         5tCrVN39yH/HpVE9K123NXvM3GNfUassBS7DYyM8+I2qPhQcSPhIqMminUWmWJj54USv
         uqD+n7bHahgrwl0yI3SoZvF5UfErXsbLDwQsLVmg+BD890Bx6kxmH9oAquWRS/3EL+kF
         uW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770504651; x=1771109451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guTUZAnKzmLJTo83FGB09sw8SSRh07aMEfZkMVMbC+c=;
        b=TJ01GmrBtzYAnWzgVk+28qzoQ+oDKK1OHNmNY9ZQHgkuoHVdgfyQowrZZxdOa7CWAy
         jwBzFme/0F5GotlqGJkJkpeO9PSKitLDKorLCN6ycemFAAjS4PtWQ0yRCnpMzgMXqsXh
         PUKDGlUbCGj/Oxpde42fMyOT6RW3/t8U885uaCcDMxOZhd203ElmalnNVZ23GSUGVtuI
         OTkBfLTwMkpFT3D58EKTAgjqKObRO9/usP20vvAWRGkHCdmGbOTJR45ergj0wS2FUdcQ
         MR/MUeDvaBnoezU8SAgduxEPV3+fA2eRoSdophymBUUp4TqZlNO1R2g8un20ip5RRTSn
         XmBg==
X-Forwarded-Encrypted: i=1; AJvYcCW6AUtXrFKSF+MbcNnyxOWp9+hvxKbHXKJOUQG6Sju1EO/2UFNT9DKl8PKaaViZ0pOYnHhDlfcVlE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ13FiFHwv8q8A9z2M2M16FpGTIGPy69vyvmQAikeMuZl7d2g2
	2RIYv8Gx3xZeKUS2irDHZTdDB8U3EcuFXo5QBZBZAUJCgkrxCFsOZNvC
X-Gm-Gg: AZuq6aL74371gcvX6mCti9J+IjQbtmH3GM837GcKMq8paK2uITCEri3yWYA7fOv6Fqz
	QIGOfb9Hdg7q5bvbdlH0vGiaKtAfJ/W0SeNVSGACZfaEWctrw3L2DQ0MZqkZSkbVOz8A3xSYThS
	6JXCs01qRrRN0nk/GeRwG6Xk59Bq0evNMql4KXtecQH6mQlFwL6xiIEyWE8uR7xzwBr9O608tPN
	NaK6/Y7UkGou+dSjRcgB2B3YUyOt7DhbbSieMRDPnWNcUabDyuPvP2gVnzhrD0vqUwoSqKl4EFX
	S2ofRE8Z5hOKi/OrPkc4IrPBRIafJJWgk+wNFAGSbnWVrMhhy0k+GcxZBHeoyU9wV26vSYOYAkU
	9/vwBVJU4g4OGI6B53sxIe637JcR5I1XWG2Ksc/hkDJz47rcMTENOeE8Mj2IoaksVmiCgiCwSXG
	iUW1KV35BfdYuHnZPKFuuQIA6R5ihxSb+Ws7cMuw0yK+tmtuQC94Nwko3TvxN5SAfkJTGpvlHVk
	KoO29ZeIa4709c=
X-Received: by 2002:a05:600c:3f08:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-483201dcfc4mr103983235e9.2.1770504650500;
        Sat, 07 Feb 2026 14:50:50 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm16866971f8f.28.2026.02.07.14.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 14:50:48 -0800 (PST)
Message-ID: <110aedf7-9f31-4552-b772-395433d7bdb3@gmail.com>
Date: Sat, 7 Feb 2026 22:50:47 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
Content-Language: en-GB
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-12-kas@kernel.org>
 <907ff793-9b02-4a22-a85e-2873246f6402@gmail.com>
 <412359f2-ecfb-498a-9717-f0a442abd3f7@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <412359f2-ecfb-498a-9717-f0a442abd3f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2026 21:25, David Hildenbrand (Arm) wrote:
> On 2/7/26 21:16, Usama Arif wrote:
>>
>>> +
>>>   int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>>>                          int node, unsigned long headsize)
>>>   {
>>> +    unsigned long maddr, len, tail_pfn;
>>> +    unsigned int order;
>>>       pte_t *pte;
>>> -    unsigned long maddr;
>>> +
>>> +    len = end - addr;
>>> +    order = ilog2(len * sizeof(struct page) / PAGE_SIZE);
>>
>>
>> This doesnt work for ARM. For len = 32 (2MB contiguous-PTE hugetlb on arm64):
>> ilog2(32 * 64 / 65536) = ilog2(2048 / 65536) = ilog2(0) which is undefined.
> 
> HVO should not be possible for that size, and we should never reach that point, no?
> 
> Remember that for HVO, the metadata must span at least two pages.
> 

Ah yeah thats right, ignore me. Its also checked in hugetlb_vmemmap_optimizable_size,
so its all good.
