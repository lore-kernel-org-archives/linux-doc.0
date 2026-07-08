Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C43425CEE
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512132; cv=none; b=A9bqeaoh0E9Lt73BnJnrPv6jwDYGNlqamd5PiXL9oLjqi+7iua9sJWung/pkOG0Jappjgx48e2tiW93ZMpkipweJoSv2IOTiBVGLTU+Qs6KJ54vhT5ly00lpAGrz9at9ZUnidvcPcwJo4fw+UsQREztxwtqjDIgC0pY9yvRwYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512132; c=relaxed/simple;
	bh=KKRnv4UjKCRy/44k+LpNsrJd3SQJ+S3xeH+6sv3P7uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhrhqByYH8jP3Zl8vb2O0C0q5hatGd/E8GG9B5NqA5TrR6Ox8H9huXZ5NBFfgGy8IBpn1m6Pdh+X2s1opy3LB1HA/nRt5gOGOpZeSuHqW8Nkhcpb3gx7OVIKDSvmlYH6X9yX4nu9Mrj7E3LviNXrLhBoMwW9OCYmotvH0F90SRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ps2KKWGI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqXB6qJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ps2KKWGI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqXB6qJS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BT41N2673720
	for <linux-doc@vger.kernel.org>; Wed, 8 Jul 2026 12:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7bQt0u06R9N2QAk7Il5Eal3gaGNp0zqS15dmFYaOqU=; b=ps2KKWGI7itYh872
	q7+LHNssRO8gXc3uX0HwRA0kQFan/AHg3oaBdh0r3STYajHa+nW1c1iUwswmSuPI
	AmvXnPmUWvgJDyooBAAXrxi2n31zhmxpVY+Jswezsgp+S+76ETqQ6m0oL+JqIgvs
	WSblWoD+AXcpvh6wPlWUWWmJWpPqBkutGHrkao4zp181WRgftBuFuCyi5STzmMyQ
	HTgAkcVyvMzS3snodMaNrM67P8X3S92pqineo8GX5+hogXs2CApLF1XdAX9lq3En
	8OoIBG6BxdivK01wLaD7PBcepN0tPfsFP/k5nqQYBDSCU7ScmY6LLFBTJSW1B8iZ
	9KrKXg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstabe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 12:02:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b57b98bso443792b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783512129; x=1784116929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7bQt0u06R9N2QAk7Il5Eal3gaGNp0zqS15dmFYaOqU=;
        b=gqXB6qJSqOGnyMU7/vi9A3hzHbkIlO23uh3nH4QP7e6t49B45y0mQaCH/CDaNigp34
         pQlpMJUkZuDzDzhnBvZN0XGZqUnDvV5GdxtOkZOL3gbj0joSYe+WTIXHz3Wmvr/QPxke
         LZ8DrElmkjFn4G3MpPiS3p1IKVX1lLzK9/Fv4Gk44Rjk5dqAKJegXm4aBfL6NOEY0pQ0
         uA1T1nj+2R9yMxyoa06YaE2WKErvE6f7CltpkHQwj+6Izl5hiXeh59pCMqyiX87kkygn
         PI89oPZJHsVlIhA9PEgMXlhhoprIEXaDVwcXUy9OIQr8NRpYotOmkcWOj5nirY+6pbH1
         My2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512129; x=1784116929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7bQt0u06R9N2QAk7Il5Eal3gaGNp0zqS15dmFYaOqU=;
        b=S7nQHPrMo2vtsgEtJVY+MlLPqHsP/IQpKpPZER4MUBIIE+9qJwJyL367lzcJmalvY3
         ohLb+nxL61FTGVMojIBzMeu5B+V2BKsxPUFWUEuDnRhwOPGuO/9d+vFqFEXbHFAjLsTu
         PPwvWQw/X5ESVnyGfSF7OnodAmLK2DcW8JPluYxOADbNZH9pRm/Bv9AJbUzcss5s68sf
         t++kCfoCEhcRGfq0hWZpNHn5lHN0itNQG9qFKGeXGD9f09UHxM7eq/bc4Kb1UL+GIc4c
         NG5ejDNvb9tXWbqRGhaLnwVhmQOXC5hVGA/+rK/zMCib6RLlUgsBsxCyTuhRLcJbwrmm
         otvA==
X-Forwarded-Encrypted: i=1; AHgh+RpTVXUv/eYVw+Kd7EmY6+9emXedTPLWbJ5ovwDwPpy4dPzslb2TFWy7kSwctJo4NCmGTK/eAlKJLHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWMQesk2glU+7stHvlcrGvsTHfVL3/syfHRDVBM9B4pIhDS0U
	GCeP4K5uOy2LOh0A8G+zCAIhhCFprA3o5trDSG2eCa5HzgyA3wsDRkH2Bm0pCcJZdXEuRudoEYF
	zWoPBQuTLLi2hHKvn907m3gznWXeKmhTHliYz5BWCVpiIjgZoOb20n0FUzogctPo=
X-Gm-Gg: AfdE7clBY/ccGq+42qxlKxO0VivrTd+k8vRHyK+V7s2Ib5i7ZKo+IJgfCq/sGsCXGuJ
	PPsTrcE+gOK47J3Q4X/LbeQMgykfgU70TCESqtf4cMklVB2bA9cJ7/0D0g6q1PeY9QtnEDmLqsc
	8L9U11neOavOW5Y14WY1tMhY2NEANeNkFdLvgNRnzYcjwZsRI1iyrwRXNM0F97710pPbx0cW3Nz
	sZe2DSySYMhqPhX/A12SKbEYnT9TRrw1/1egAy4oUhvcj8qkLyK3zYasT4XUFPBtqAiIWLiFAbO
	LGgORdakTgHdwetTHaTFTFObaU8UQDrFaLzU+fh7lIbJqnLaQDMoYrdZgi3jHGIcKn8u9mPf26i
	FrrV1qBTTDUUMBZHg1hpW1JPMTlI8DDziKWKnAGkp4Ikw/WhzG6K8KDivgh9yQ9GutfhaWxIWs2
	xG7XljCqFs3EAtAxiqDdbFWQvNE3tu
X-Received: by 2002:a05:6a00:3026:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84842e7e06cmr2431303b3a.0.1783512128260;
        Wed, 08 Jul 2026 05:02:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:3026:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84842e7e06cmr2431270b3a.0.1783512127719;
        Wed, 08 Jul 2026 05:02:07 -0700 (PDT)
Received: from [10.193.24.221] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484123ce87sm1044591b3a.58.2026.07.08.05.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:02:07 -0700 (PDT)
Message-ID: <4daa72a5-ace3-4dfe-af62-06508335ee38@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:31:59 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/pci-dma: add "any" keyword to swiotlb= kernel
 parameter
To: m.szyprowski@samsung.com, robin.murphy@arm.com
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
Content-Language: en-US
From: Aakarsh Jain <aakarsh.jain@oss.qualcomm.com>
In-Reply-To: <20260708114244.246176-1-aakarsh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e3c41 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mjj5p7DPCNcABA9DeKYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX8rCVNSZECSsO
 1K/n8LSoFFvSRUraqK9+7DdYjLV4DBO8o/+iQqUDXyUSoYqVPAZCIGkThMUJbXrgm03wPf1qIec
 n4xc3uHqLnkswgy+4ofsVfVUYi7JvPYCSJ/9kOabc2NLVZ+7MKDeNq0TU5BKPyOLjG+wJNbiMgR
 vzIW4sSD/OZFViay15RCR0UFeDcEynrZvoUDckSIDQvmAjeW2eHDRBpdMHhW2ryLa7X7/0ZQqRZ
 F4xA48ZgsvnRx8nNjZdweZuLgtz1VQly6Ovv1GF0ZuvDcqahGZKyzk5fQxnwl+2fUCmhBsXC4iH
 Dncb4ZScCgoAqSF822H/kPLJLYpu0TvOxx4v0850J7E/tMuTE2A49pgVVAMQDl9SydapdCIrEza
 Akr4G7ypG7OK3FmLxvCvIY/gIf4qbQ/Oj1KdXMuR7lWHAHeNmIeFZxZvrygdUtGSB6F//5h3sLi
 pg86FzzYVtYYppy54yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX6dIyF4PnV87c
 yQCY7Mgaw9b9LiAyx7vp0Kdr0SwrgVAPwhrk0JlhXUJ7x3wdOByg7XkbtT59QFZ8m8SVkFH7fqH
 T9CDODKJbonsPovklOUgjOBXWA8n+Ts=
X-Proofpoint-GUID: mKmtRM0Hd6Vhu4BeLNrXL71WBJnrN8rv
X-Proofpoint-ORIG-GUID: mKmtRM0Hd6Vhu4BeLNrXL71WBJnrN8rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080116



On 7/8/2026 5:12 PM, Aakarsh Jain wrote:
> CoCo guests (AMD SEV-SNP, Intel TDX) require large swiotlb pools for
> streaming DMA workloads such as high-speed NIC and AI accelerator
> inference. The existing swiotlb pool allocator restricts placement to
> low memory (below 4GB by default), capping usable pool size at ~1GB even
> when a larger pool is requested via swiotlb=<nslabs>.
> 
> The SWIOTLB_ANY flag already exists to lift this restriction, and
> swiotlb_init_remap() already handles it correctly via the flags
> parameter (see CONFIG_SWIOTLB_DYNAMIC path: io_tlb_default_mem.phys_limit
> is set to virt_to_phys(high_memory-1) when SWIOTLB_ANY is set).
> 
> However, there is no way to set SWIOTLB_ANY from the command line. The
> only existing mechanism was via arch-specific code (e.g. powerpc SVM sets
> SWIOTLB_ANY in pci_iommu_init). x86 CoCo guests have no such path.
> 
> After Aneesh  series ("dma-mapping: Track shared DMA state through
> direct, pool and swiotlb paths", https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260701054926.825925-1-aneesh.kumar@kernel.org/)
> removes SWIOTLB_FORCE, x86 pci_swiotlb_detect() leaves x86_swiotlb_flags = 0 for
> CoCo guests. The pool falls back to low memory and caps at ~1GB:
> 
>    Without "any": pool at 0x35a9c000 (~900MB, below 4GB boundary)
>    With    "any": pool at 0x1df9c00000 (~120GB, anywhere in RAM)
>    [Tested on AMD SEV-SNP guest, swiotlb=4194304]
> 
> Add "any" as a new keyword to the swiotlb= kernel parameter. This is an
> explicit, opt-in mechanism that sets SWIOTLB_ANY for the default pool at
> boot time, without touching any arch-specific code.
> 
> Devices with 32-bit DMA masks are not affected, they still use the normal
> low-memory bounce buffer path. The "any" option is only meaningful for
> workloads where all active DMA devices have 64-bit masks.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@oss.qualcomm.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 5 ++++-
>   kernel/dma/swiotlb.c                            | 5 +++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..8a1fccbd9b25 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7477,7 +7477,7 @@ Kernel parameters
>   			Execution Facility on pSeries.
>   
>   	swiotlb=	[ARM,PPC,MIPS,X86,S390,EARLY]
> -			Format: { <int> [,<int>] | force | noforce }
> +			Format: { <int> [,<int>] | force | noforce | any}
>   			<int> -- Number of I/O TLB slabs
>   			<int> -- Second integer after comma. Number of swiotlb
>   				 areas with their own lock. Will be rounded up
> @@ -7485,6 +7485,9 @@ Kernel parameters
>   			force -- force using of bounce buffers even if they
>   			         wouldn't be automatically used by the kernel
>   			noforce -- Never use bounce buffers (for debugging)
> +			any --  Allow the swiotlb pool to be placed anywhere in
> +				system RAM, lifting the default low-memory (4GB)
> +				restriction.
>   
>   	switches=	[HW,M68k,EARLY]
>   
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 1abd3e6146f4..34773ae7c770 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -80,6 +80,7 @@ struct io_tlb_slot {
>   
>   static bool swiotlb_force_bounce;
>   static bool swiotlb_force_disable;
> +static unsigned int swiotlb_param_flags __initdata;
>   
>   #ifdef CONFIG_SWIOTLB_DYNAMIC
>   
> @@ -198,6 +199,8 @@ setup_io_tlb_npages(char *str)
>   		swiotlb_force_bounce = true;
>   	else if (!strcmp(str, "noforce"))
>   		swiotlb_force_disable = true;
> +	else if (!strcmp(str, "any"))
> +		swiotlb_param_flags |= SWIOTLB_ANY;
>   
>   	return 0;
>   }
> @@ -445,6 +448,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>   
>   	io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
>   
> +	flags |= swiotlb_param_flags;
> +
>   #ifdef CONFIG_SWIOTLB_DYNAMIC
>   	if (!remap)
>   		io_tlb_default_mem.can_grow = true;


One correction to the commit message:

The testing was performed with:

   swiotlb=4194304,any

and not:

   swiotlb=4194304

The larger swiotlb pool allocation above the 4GB boundary was observed
with the "any" option enabled.


 From kernel dmesg logs:
root@ubuntu:/home/ubuntu# dmesg | grep -i sev
[   21.191917] Memory Encryption Features active: AMD SEV SEV-ES SEV-SNP
[   21.192883] SEV: Status: SEV SEV-ES SEV-SNP
[   21.401897] SEV: APIC: wakeup_secondary_cpu() replaced with 
wakeup_cpu_via_vmgexit()
[   22.117267] SEV: Using SNP CPUID table, 28 entries present.
[   22.117884] SEV: SNP running at VMPL0.
[   24.164260] SEV: SNP guest platform devices initialized.
[   28.815142] systemd[1]: Detected confidential virtualization sev-snp.
[   30.063831] sev-guest sev-guest: Initialized SEV guest driver (using 
VMPCK0 communication key)
root@ubuntu:/home/ubuntu# dmesg | grep -i "IO TLB"
[    6.743607] software IO TLB: area num 4.
[   24.164169] software IO TLB: mapped [mem 
0x0000001df9c00000-0x0000001ff9c00000] (8192MB)
[   24.331266] software IO TLB: Memory encryption is active and system 
is using DMA bounce buffers

Thanks,
Aakarsh

