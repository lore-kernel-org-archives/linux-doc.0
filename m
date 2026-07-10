Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972373A48ED
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665510; cv=none; b=UUTl7lPgVwv/2zW/R0W6IlPIPyMccNv5Vo8CblAcbaAiOPcYNGkD1tDhR0fsfPwpCaTgTJV2W3eW48ZwVXxjDakXGs1TOIsxxOxLhNEjIUJhl0VjJ1q7nTBD9sL4Jo7N3n/lx8fGzBGHaAt9xyjwAdsuC286XGunPS77z4BOltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665510; c=relaxed/simple;
	bh=VKRIt/7yRmxAz+S9gKURZ4WyeFPoIUvlkDUS5dWUi6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rm490cqNo7GmZd2YvgFL/0TIlIJLDWg4eCleJMUFMH3TH2UZpPHQtatea21Ai5nllfgHR3OgoMR+UyMDAwIELxI9b9oPGPgqGwvUpYoGQh0gBxzjMBcv+ICsr8oVG+R3QxVy5DkFh3NxB7cwUyds96fO1fQ8qvcYd1Uz1/kIcB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=An11jyea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtWjAIvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="An11jyea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtWjAIvc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nStX3803808
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 06:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0K5Opuo8W6vFKvh+gdX8BbeA6S2QAhhORoWXkYpGKec=; b=An11jyea+IvpFq77
	RvyfijqFOM1GQc75OTNGUf2BHZXCyUWplzVX5aEvM6EHLptMMrsfNu1mvMo+rTY7
	C1BFzMsCv8ds8Ff5vzjn7zHge+GVICsoYya1/rxoJQz0M3SCX00lLk+zlaaHif0+
	PjouPLZY81+I0wilKDTy00akcR2TdgU8sBZkqcAFlyPxeAtcAxtzRhjNC5yWIvSA
	VvysduvlLdkC5Vm13vnzGgSmW4Cv+TRQeObmcimleXRkQP7/w7KbvjIYUHwX1BgV
	oG3Y0be2lbXtqMawfhrZQXVIiGKD+OsIfyrNL9jWIA9LD795SI2BU1jmXSUkzheW
	uKiLKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mtw9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 06:38:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso8750025ad.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665506; x=1784270306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0K5Opuo8W6vFKvh+gdX8BbeA6S2QAhhORoWXkYpGKec=;
        b=jtWjAIvcphDWd2aXpGfIE4L3RMtBaOz6Wly+HEMcq7N1etPSDpIuwVRmRvXADoFLoA
         H7KiVMId6AQWOdslDBIKCl+/NR3Y27+2f4hN+5p5Fxo4oDy7Ao5y/F2y2D3wzNu+lI65
         VG7GZ5wugfPm+XTTWvjMsI5r/DuVR+Ho7f/Bg8PW/JrH2qdkqYRE9Zb5BTic/LcxPh8E
         waB8sNK8sujzp+JPXM6atbai0OcIOLAcLls3JLn6PNlbwpOAsuYNRc8kIh1Ql2g6Hw8y
         VKG+n89/3qq0e50h4OJMGBjz2jvLE049zKOsGwTIijFVwjefVMKr5S50XDXkOM5yUjEH
         P27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665506; x=1784270306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0K5Opuo8W6vFKvh+gdX8BbeA6S2QAhhORoWXkYpGKec=;
        b=UedJQ7yojoafcpy4G2spKK8aY9ZaW0ypihBYKY0BVFdBWR3OMb29YFC7eEKWJ7ncHr
         UkaYuFbNuyQoITEHsmUX/SLJhrExlFpUjC9YHBMRH/R02zD+s51pYhdO6yDXUPHBiwgO
         cfK09wDcKvoJnmMVVGFeiEWR3nbUNa17yB6C8KPRreBdWTVIAdabxrfS52tbdyHfOGmx
         jiVyeHdjwwbCk9hnf0GpKzhVYEacNJgXHszsMwdg/6RpWWMErDVV7l2/MXs/98ykh0Qj
         hnnfuG1U++mY1vbYveHsTomBDjZIYLTj0WP+Aya8u+xwbbABqQU4flbNhDw7n5LeSHkZ
         CiGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9KMXfbHtgN5HYiKdH/8ouy2uEqf0Q5o4fF0N3tqAlZ5lpqCe1e5Y0sUwphuRDi8Z4jpwT9gkxoLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH8rC0+NnP/aqIoEX3547yyRuIbNV5B7ee26uOKRzw8XQMf8sA
	CQG5oMwkZUaRLX+Rl/WoQvouIC260XlnvnpVV4DJ1Qf1FGrqkk5BxPFCDwbnine9lqZ490GfGiy
	2f6YiCs0ib7iL2n3cqfdAURYIzFZSZpjAxQVL+EbLrUfe/apSA9wikhKWQjlmR8w=
X-Gm-Gg: AfdE7ckesqKh4NycYU/udbFoWbY7/Mq6GpfNNHBsWE5BA5RetDRJ6WiAqF8gTn2IgMC
	dP8/jqclh4sc8Q3Oe/A9sZJMMooMKMesXvaP36QcQmNT0XOGOy279Oc/0vF8ofdWUbfOqgtl/h2
	vWywv+ki7SLyfrpEWDwZRWuuqT5o9QjoyWzXMd4REI1VhTttb/cuW7fc5AmP7ZgwGhox7tPfK4E
	XLV1t74m08i2Q+k1VsVuNjzsk/mZB3rxseByS4mIYhh23zjy6BsPv2iVUyo8inkEAn0a8l2p5xe
	KAHLaJWhXFXkZKxcZa0QHeso2SH3ZqjCRh3RmK+K4IWFgGsARsaEA+d7L/xoBDVLAZ/ez3tSISi
	nNIPiKA1IyA0qj7xD7qHEn1L9+zxPv9sROq1WN77U3OGGn5gmHgIdF6TLEK/Ec6bqpARsDTJQoK
	K0eUIej/VjRk7zBPKkyG5fmBHybfa0
X-Received: by 2002:a17:903:32c9:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2ccea2d8029mr109938245ad.9.1783665506290;
        Thu, 09 Jul 2026 23:38:26 -0700 (PDT)
X-Received: by 2002:a17:903:32c9:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2ccea2d8029mr109937745ad.9.1783665505631;
        Thu, 09 Jul 2026 23:38:25 -0700 (PDT)
Received: from [10.193.24.221] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfb7aesm54996575ad.29.2026.07.09.23.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:38:25 -0700 (PDT)
Message-ID: <0d1398f3-c2d5-4717-adf6-bdbc6055606b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:08:17 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/pci-dma: add "any" keyword to swiotlb= kernel
 parameter
To: Robin Murphy <robin.murphy@arm.com>, m.szyprowski@samsung.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, akpm@linux-foundation.org,
        bp@alien8.de, rdunlap@infradead.org, peterz@infradead.org,
        feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
        elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
        lirongqing@baidu.com, ebiggers@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        aneesh.kumar@kernel.org, alexey.kardashevskiy@amd.com,
        thomas.lendacky@amd.com, jeff.hugo@oss.qualcomm.com,
        thanson@qti.qualcomm.com
References: <20260708114244.246176-1-aakarsh.jain@oss.qualcomm.com>
 <7c21e121-9bce-469e-a983-adbdf3781842@arm.com>
Content-Language: en-US
From: Aakarsh Jain <aakarsh.jain@oss.qualcomm.com>
In-Reply-To: <7c21e121-9bce-469e-a983-adbdf3781842@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EueS2VdxGFF6ywcNT3oVH1kTU29BPQUQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX1OId5yU1NX1c
 5vmPqOdY4/VGGjgRhGR1OVoa13mypTka8l97lYPDXK0O/fNqWvWSInPLIW0jHZgQfXhXiPegZDE
 PPVFd5xVmQ3Yt7z6k70FAiFvkY6tE7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfXzLO+JdC4pxaX
 wKke3dOpO7r7TZmSb4QzhkA1ZAeHC0qEXNq5cVQYgdpaYwxvVqhS363vPeccpCyqitQ2cVtek8E
 giggUsqjdHQsC3zktjRqWL7Wvt7H2zpEHY67wDorWBbEQ3kUoYWSK/1HNkXrY0M7fcL/+Tg7za3
 QDeC1zFU+esTVV/8vMkDuQKMwsY/iXKb9irbWsvoV1KmkOgjbJrSv4CenVjTgNQnxHbpI5ygTSu
 ho/X3I8Dc6al25vo0sOkH3boTs+TPHnAt87DljUYWeKB87BL6uPvkkzFpfJhQaJBFldxA3d1TN8
 rTEbi6+oikgW+irXJF3B92PN4NEO46BCJDQWwPcsBzfD37Cjv+vnTP4XGBbh1CnWdzm8UGo46lB
 ZDiu72mzDSRvKt6YOfW2HMCsJpJjnhoDostwGceJi7/fOplzTFmyQLqqjb+mfTN+6x/rhRAfeZM
 +eEJbYI5YKlnktMVZyA==
X-Proofpoint-GUID: EueS2VdxGFF6ywcNT3oVH1kTU29BPQUQ
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a509363 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=LWuNMJU_oDth5YTcOp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062

Thanks Robin, Marek for the review.

On 7/9/2026 5:58 PM, Robin Murphy wrote:
> On 08/07/2026 12:42 pm, Aakarsh Jain wrote:
>> CoCo guests (AMD SEV-SNP, Intel TDX) require large swiotlb pools for
>> streaming DMA workloads such as high-speed NIC and AI accelerator
>> inference. The existing swiotlb pool allocator restricts placement to
>> low memory (below 4GB by default), capping usable pool size at ~1GB even
>> when a larger pool is requested via swiotlb=<nslabs>.
>>
>> The SWIOTLB_ANY flag already exists to lift this restriction, and
>> swiotlb_init_remap() already handles it correctly via the flags
>> parameter (see CONFIG_SWIOTLB_DYNAMIC path: io_tlb_default_mem.phys_limit
>> is set to virt_to_phys(high_memory-1) when SWIOTLB_ANY is set).
>>
>> However, there is no way to set SWIOTLB_ANY from the command line. The
>> only existing mechanism was via arch-specific code (e.g. powerpc SVM sets
>> SWIOTLB_ANY in pci_iommu_init). x86 CoCo guests have no such path.
>>
>> After Aneesh  series ("dma-mapping: Track shared DMA state through
>> direct, pool and swiotlb paths", https://patchwork.kernel.org/project/ 
>> linux-arm-kernel/cover/20260701054926.825925-1-aneesh.kumar@kernel.org/)
>> removes SWIOTLB_FORCE, x86 pci_swiotlb_detect() leaves 
>> x86_swiotlb_flags = 0 for
>> CoCo guests. The pool falls back to low memory and caps at ~1GB:
> 
> This is entirely irrelevant; SWIOTLB_FORCE has no impact on allocation 
> behaviour anyway. x86 wasn't passing SWIOTLB_ANY before and it still 
> isn't, although there doesn't seem to be any particular reason why the 
> well-reviewed patch for that hasn't been picked up:
> 
> https://lore.kernel.org/lkml/20260625012616.2992535-1-jun.miao@intel.com/
> 
You are right my commit message incorrectly tied SWIOTLB_FORCE removal 
to pool placement. SWIOTLB_FORCE only controls whether bounce buffering 
is forced at runtime, it has no bearing on where the pool is allocated. 
Placement is governed solely by SWIOTLB_ANY. I'll drop that paragraph 
entirely.
I see both you and Marek are pointing to this patch, which fixes the 
issue architecturally. I'm happy to help get that landed instead of 
adding a user facing knob. My only hesitation is the 32-bit concern below:
auto-enabling SWIOTLB_ANY for *all* CoCo guests carries the same 
breakage risk for limited-mask devices, which was flagged here:
https://lore.kernel.org/lkml/0a08cea7-62a2-4b33-8d8b-dd14b3c74235@amd.com/

>>    Without "any": pool at 0x35a9c000 (~900MB, below 4GB boundary)
>>    With    "any": pool at 0x1df9c00000 (~120GB, anywhere in RAM)
>>    [Tested on AMD SEV-SNP guest, swiotlb=4194304]
>>
>> Add "any" as a new keyword to the swiotlb= kernel parameter. This is an
>> explicit, opt-in mechanism that sets SWIOTLB_ANY for the default pool at
>> boot time, without touching any arch-specific code.
>>
>> Devices with 32-bit DMA masks are not affected, they still use the normal
>> low-memory bounce buffer path. The "any" option is only meaningful for
>> workloads where all active DMA devices have 64-bit masks.
> 
> That doesn't make any sense - if a user passes this option then any 
> devices with DMA addressing limitations definitely *are* going to be 
> affected, and quite likely broken altogether. If anything, the 
> documentation should be even more explicit that this should only be used 
> if you do know for sure that no devices have DMA addressing limitations.
> 
You are correct here too. My statement that "32-bit devices are not 
affected" is wrong. There is a single default pool, once it moves above 
4GB via "any", a device with a <64-bit DMA mask has no reachable bounce 
buffer and will break.
The opt-in nature only means the admin accepted that risk, it does not 
make the risk go away. If this option survives at all, the documentation 
must state the opposite of what I wrote: use it ONLY when you are 
certain no device in the system has DMA addressing limitations.

> As a general SWIOTLB-behaviour-debugging option for orthogonality with 
> force/noforce I'm not opposed to the idea, but it is definitely not 
> something that real CoCo use-cases should rely on - if the general 
> consensus if that CoCo environments want a different setup by default 
> then the arch/CoCo code should be taking care of that.
> 

So my takeaway, this patch, if kept, is at best a debugging knob for 
orthogonality with force/noforce, and not something real CoCo 
deployments should rely on. I'm fine positioning it that way, or 
dropping it.
Which brings me to the actual motivation behind posting this patch.
what should be recommended approach for large streaming DMA workloads in 
CoCo guests(high-speed NIC / AI accelerator inference)?
Is the intended direction to move such drivers to the coherent DMA path 
rather than growing or relocating the SWIOTLB pool?

Thanks,
Aakarsh


> Thanks,
> Robin.
> 
>> Signed-off-by: Aakarsh Jain <aakarsh.jain@oss.qualcomm.com>
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 5 ++++-
>>   kernel/dma/swiotlb.c                            | 5 +++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/ 
>> Documentation/admin-guide/kernel-parameters.txt
>> index b5493a7f8f22..8a1fccbd9b25 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -7477,7 +7477,7 @@ Kernel parameters
>>               Execution Facility on pSeries.
>>       swiotlb=    [ARM,PPC,MIPS,X86,S390,EARLY]
>> -            Format: { <int> [,<int>] | force | noforce }
>> +            Format: { <int> [,<int>] | force | noforce | any}
>>               <int> -- Number of I/O TLB slabs
>>               <int> -- Second integer after comma. Number of swiotlb
>>                    areas with their own lock. Will be rounded up
>> @@ -7485,6 +7485,9 @@ Kernel parameters
>>               force -- force using of bounce buffers even if they
>>                        wouldn't be automatically used by the kernel
>>               noforce -- Never use bounce buffers (for debugging)
>> +            any --  Allow the swiotlb pool to be placed anywhere in
>> +                system RAM, lifting the default low-memory (4GB)
>> +                restriction.
>>       switches=    [HW,M68k,EARLY]
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index 1abd3e6146f4..34773ae7c770 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -80,6 +80,7 @@ struct io_tlb_slot {
>>   static bool swiotlb_force_bounce;
>>   static bool swiotlb_force_disable;
>> +static unsigned int swiotlb_param_flags __initdata;
>>   #ifdef CONFIG_SWIOTLB_DYNAMIC
>> @@ -198,6 +199,8 @@ setup_io_tlb_npages(char *str)
>>           swiotlb_force_bounce = true;
>>       else if (!strcmp(str, "noforce"))
>>           swiotlb_force_disable = true;
>> +    else if (!strcmp(str, "any"))
>> +        swiotlb_param_flags |= SWIOTLB_ANY;
>>       return 0;
>>   }
>> @@ -445,6 +448,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>>       io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
>> +    flags |= swiotlb_param_flags;
>> +
>>   #ifdef CONFIG_SWIOTLB_DYNAMIC
>>       if (!remap)
>>           io_tlb_default_mem.can_grow = true;
> 

