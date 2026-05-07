Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772739EF27
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146547; cv=none; b=njisOp5V5We/3N94QPsyVl5+lLDSBAkOl3i/ouZX/0VGLtc14rf8b4PCkBeqeYI+EeHblous7KhZDQpuAm9MnL/kJQsvHWLAqSAwa3SYhdR+grWOgSu1Q/iNbWolITcplsf2RDu5BzdTC0KLkvE0UKkmGmu6hv9sGnfSRGIL9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146547; c=relaxed/simple;
	bh=+3dXKo6HEaUqbiU1d7YF8vYNCW370gD7bBjtPgCjrC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A23K9Ijj3GSRlUiaGRknIbEXICKHKvrD94kYDAexGkjzCx1dM7Myqp7TWsDknhayFuYqA6ab0NgnZKVN0wWsl6/c/iCPMPdF6mwA8VROU9hoTsIDV3Fe43M6rSLL27i9FakowVtlH23EFnQRPgiuxIiIvya9aWMEbl3/iIW0BCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HToJXD+J; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HToJXD+J"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-366089e42eeso276187a91.2
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146544; x=1778751344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=HToJXD+J506QCMSh0DddG91zeZL31eJ0besnF2YsJ8yfu62YcvUwSmA0d55atHDhki
         78abCjPpM3c1o0CoJKt7/ohxBuh1U7AhVHvX1fPB0Am6xwsIfF0oLCxdGX+68b3JinRu
         3xwYesbeMHMrHFAd7qN7o3OJ4zdHyqiXq3HgwR88I5x/lihLA+VfNNCqmrEyDzLT6uUK
         JWnlwuZnXaGezzOGFLH3TCwPzEkpaPz/GUJ0jeDbS5wRMySduxyo1U0wIszaiw/Kng1A
         b3XyyLHAUw5q9SIZ9MSJqT24LGAx5jpmJTmLMTnSI3APGjCcxt92o2nAh45b/tq6Gxkm
         MKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146544; x=1778751344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=otXaIlv4KWeUEYJ5QUNKzgvIDTBVog7gW5SQDWICNp6nazhqUBFewfBH5FpWTREvmy
         4G83DmG6dAptDBmMrphRuKzCRI6nfI1E0op4hUsTnZMESW0ih73VxS12/9ZWVyXkRF33
         ocERNs434nG2Mg1DFmj7cdAW2RKvQrpyQKzbzCPsUAS8B+JjsDDUwZ7jSW+0ULIjuwro
         BQdsfWENz6msvF+GmUZsMid84DLtjcUH4oO1GqRc7tA4KgBsRhQBGwlQk3bRJKGyBsjg
         +Cj+a221xHLan8WGo1qHqVl2bR2E9KKRSD8GmPRQIaSUBpnsr731qEVV3Z7F/TQglJfs
         uYyg==
X-Forwarded-Encrypted: i=1; AFNElJ9SHwNoSFMYkrTidLprN423QiV6TQZNIgammNXJ4xn3FWNU2Nb7JCXyNUVcLerNwS//R+VWgOoxwdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3zFciRtQPloeXpwYyOs9zOYs80fQI9r99F3pPvCVmz2N1oAz
	yGJ7Th1+TSyRhQvL+F5v5sdN2sUfkfs0oG4nSb6fHrldFVIyzFmhpD/V
X-Gm-Gg: AeBDietkicupj61Qw4Vbu+pcsWzSMkmOk/IrzTU6o3JOSQaB+LwtPrAXAIuiKbHVZG9
	ksYugSc8cEbAjKCqjY5uk3YNpZEEjJNrV19YD1HGChBygg1K46n6/cQf7AZNW60Qfb+FJV+o3+I
	WjFBxS/uHel1xJL+xx40jtaVXkaqxKIhB7FihAhdvZX/RrBiCyrSa7J4Q8TlSBHtq8gcjuAcMSe
	DmjqIS7txjwo+ZbL4Kxc4gb6HhPAgIm6rhOUfX5b/VudcDf3et5syAWgYoBzcTlBFmqyzjqZPrN
	hhj/5FpMhtHGVdTYTY+R+f4/dZGQRRmr2cYoMTV9Ihcl5HTny26QXaGVuxcbRefeMc9uBLWFCSx
	Mut2LQjWgh6GY5WvLu73kdehqhuxt2Ld064E5cy8APY/5ER6FytoP1d92bqUT5Y/QNs6MwLHrB4
	peBCKz/JTnmkAXjdkW+hhS1bDAI3eVSlAnmBA5Ks9g/g==
X-Received: by 2002:a17:90b:1c8b:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-365ab9b8e5dmr6393838a91.4.1778146543874;
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c19387sm6651310a91.7.2026.05.07.02.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Message-ID: <1a8af3cf-5edc-4ca4-b340-12ebeb2ed982@gmail.com>
Date: Thu, 7 May 2026 17:35:33 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] of: reserved_mem: reject reserved memory outside
 physical address range
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-3-chenwandun@lixiang.com>
 <20260506015112.GA286568-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506015112.GA286568-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/26 09:51, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:22PM +0800, Chen Wandun wrote:
>> early_init_dt_reserve_memory() does not validate whether the region
>> falls within physical memory. If a device tree incorrectly specifies a
>> reserved memory region outside the physical address range:
>>
>>   - For the non-nomap path, memblock_reserve() blindly adds the region
>>     to memblock.reserved, creating a stale entry that refers to
>>     non-existent memory.
>>
>>   - For the nomap path, memblock_mark_nomap() silently fails to match
>>     any region in memblock.memory, but still returns success.
>>
>> Add a memblock_overlaps_region() check at the entry of
>> early_init_dt_reserve_memory() to reject such regions before any
>> memblock operation takes place. This also simplifies the existing nomap
>> guard: the original "overlaps && is_reserved" condition reduces to just
>> "is_reserved", since the overlap with physical memory is already
>> guaranteed by the new check.
> While I agree, I suspect we already have cases abusing reserved-memory
> like this.
Sashiko reviewed this patch and told me:
"Historically, the reserved-memory binding is often used to describe 
hardware
SRAM, DSP memory, or IOMEM carveouts that reside outside of system RAM."
IIUC, nowdays using mmio-sram DT binding is more appropriate for SRAM or 
IOMEM carveouts.
Should I drop this patch or keep it ?
Thanks.
>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 9d1b0193864c..03c676052dab 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
>>   static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>   					       phys_addr_t size, bool nomap)
>>   {
>> +	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
>> +		phys_addr_t end = base + size - 1;
>> +
>> +		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
>> +			&base, &end);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (nomap) {
>>   		/*
>>   		 * If the memory is already reserved (by another region), we
>> -		 * should not allow it to be marked nomap, but don't worry
>> -		 * if the region isn't memory as it won't be mapped.
>> +		 * should not allow it to be marked nomap. The region being
>> +		 * physical memory is guaranteed by the overlap check above.
>>   		 */
>> -		if (memblock_overlaps_region(&memblock.memory, base, size) &&
>> -		    memblock_is_region_reserved(base, size))
>> +		if (memblock_is_region_reserved(base, size))
>>   			return -EBUSY;
>>   
>>   		return memblock_mark_nomap(base, size);
>> -- 
>> 2.43.0
>>

