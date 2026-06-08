Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0D3351C22
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 05:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895681; cv=none; b=etF6LGpYpcQ7ZveNbvrXnpAMwnKfgkX1ya/vJgjAufQrWB04NQ0oWLxWSCfmsCgcVw2mfAf9MwN/XM3s+K1lWomC6fwjkU/GbBV16K45gHcoLC0O6J37CPjRU10qHMjZZ9lF8999DgEMphvhAyxWv856Hv03wsNAy7AkfUT7Kys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895681; c=relaxed/simple;
	bh=eqTMgek8olZX6BTssVvsPxd40M1iYrM7I1ZtIjCzb4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaG6t58T7CLRKJFsLfmKcvWrZHgKeV1Om68CbZlRTDLpjKnOpZILXEPIscLJjQWW758nKW15J2xBgwAh96PB/JokUaDVKeTD5OYmQ2Y0UP+f+5CvJa7FX//ScaCo4VLcrFcrW+lZDzZwy0kg1AJ8IPH3wNxw8XEM693pBrKKcLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bo+9GAkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViWwmzBX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bo+9GAkH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViWwmzBX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EC5x1535042
	for <linux-doc@vger.kernel.org>; Mon, 8 Jun 2026 05:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06YKS2t9ahDNR8mpib/s6eXRS8K7e5yjLmLG8WJkTSk=; b=Bo+9GAkH3R1PpgxK
	saJ2dHX62iPorEkfzfK4XOBg/Mg3Pwr/8C/EG9G4QXVHmf8kB967RpcnR/3yCTp0
	fXMST16hMyZrpH/XvN270nmSWNqYapUK4NK/KEwlcnabNN4tKFY5l89LGpC+ky1P
	nLYoadq0uWNQPSw5PMvJoigxQhh/R86vzD6gn+f2zDnyK9VlIkoppZUmKs/NtQbx
	tMbRK75T+AM6nw0YVZe2TsrwcF2ddjOiQIjoTQq8AhOTHLA5NJzJ3ktIfSw9ajPt
	IVlTQVWeqvlyYDSZ34nhGodkPDc3JH2srN3Q1eEW0OaZDBPPa0qxHXUjSxAqsUrM
	RCAMDg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagre6hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 05:14:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso40280015ad.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 22:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780895678; x=1781500478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06YKS2t9ahDNR8mpib/s6eXRS8K7e5yjLmLG8WJkTSk=;
        b=ViWwmzBXn9GdjkZxA8d95cIpE4731digwSQIpoGy1h3OLBhZwkqNVbD9RbHyV7drpE
         VGNm+Un04L1n63lr/g7w9I6ItgylHwTCX9JxJnr2ZGrHpMg8IedC3tsGXHPOH0sqExBi
         +YCn3A2v+JlsSDMSve0DvYU2BrFNoJKuQAdlTUP49jcn/bNyl8uk6W/KpYUY5+/qHwpO
         GDpfgRFOW9vvwYruSFoQVnyaHWfAMUIp49eM3Wib3cdscwGJYmqO0BuMitgMnUDuu/CD
         pycAvYhp5EWVEnK6CIFZpjCLiTcmh8wCzqE/9Gpv+YrnU46GKtmB2mVFPYQytL1EM6Zn
         O6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895678; x=1781500478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06YKS2t9ahDNR8mpib/s6eXRS8K7e5yjLmLG8WJkTSk=;
        b=f9/2paidAwLSloIvl7ecy3KIeSogZ4mnH1JkSCOSHQnrCtdUzbvmxBBoqWoicO0sJz
         ySZl6NV5nYp3Dq4ySR4RH/us7O4R28OXj31on0ywiN2RnVsdMLiKf+uK2B0SfzBiK9I8
         6bCKDbYK7e+keCI6z3BSb7DYTuqxRN+HOEc7ScSJqybwoybV4WafB4rODs/i/T4eiR0X
         63BTiZBwUdL96UGYz5H+RS8EFXU/NK4tzNT/xl2CI+vPjBPxo34DYeDAcx6vfeMC0mtC
         7SVNw3MOzT21IwgB0kzR1hXY/Cjy5kkphf7uxFkqvV4TaqqdD3AgpgUIr8CBzh1ijdXU
         RDhw==
X-Forwarded-Encrypted: i=1; AFNElJ+meMOwkfR7cv+S0jg6PJjVBxJl7UTdyu6T5S55M1B/wmuZt8KRvj8S5iqK9rN9DBJmVOuoUi1rDj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYIbxnUrlI0gKnKA0dzBhG3uETo67b1wjBIDynzG8oAgcuEvQ
	BRdjiLPOZhjXCOHxCQzLq1HZTKUjNoWgVbrWnD/Ge2xWc4heVEQWQJPr6FT++3WhQiFbR5PIGG/
	5yrI1XTkLJa0O81NIDN/C6ViEQlW9dakVfAUw4YVXPdO6Y6G3KhkJ04VsWBthnYw=
X-Gm-Gg: Acq92OHcsGkIZRT1WbdHOJQPae+LFdEFlL74OJZl6nB33smklzuJMHUI45s/0blU8+R
	Hgm4sDerIZSNzmpXW+Hhs9Y54k3wqSMOTsjejbOslybdvRCDO2wqKSFz9zkDD/umGmak7yLp2Wn
	Blhok9sU1/z8cCFhtNs6ofc0o3r5KStrWLclzQBgrwBf081/1BsJhj+u6kkvO+MjVXeVShvz1BI
	IBP4HTF2rOXPp8Uwoyly9EC5s0/WNFa5sU0w6EeLbZnuJeyoaUhr8FaJjSb1xh/fnEDKHvZZPQk
	lPrjKeKVlWlCXESoPAErLmnA1Kq1GCa2tCgQNFR+cnDjDuhPWYn1wCEXQ2SyjYssExVK9u75Mfo
	8zidcWYi3PckgdAq3rCCeQIACBAKHSdOTIPLYte0KMbuG4QWV6KBDvs6WwOYC+g==
X-Received: by 2002:a17:903:2ac3:b0:2c0:b932:866e with SMTP id d9443c01a7336-2c1e8934f70mr152930915ad.27.1780895678309;
        Sun, 07 Jun 2026 22:14:38 -0700 (PDT)
X-Received: by 2002:a17:903:2ac3:b0:2c0:b932:866e with SMTP id d9443c01a7336-2c1e8934f70mr152930605ad.27.1780895677843;
        Sun, 07 Jun 2026 22:14:37 -0700 (PDT)
Received: from [10.204.79.117] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm169055115ad.80.2026.06.07.22.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:14:37 -0700 (PDT)
Message-ID: <dd014e3b-96fa-4019-a1b7-5826a877b87e@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:44:28 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] accel/qda: Add PRIME DMA-BUF import support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-11-b2d984c297f8@oss.qualcomm.com>
 <3dddb7e8-5837-4038-9823-ce419cb49ec2@amd.com>
 <e465ed15-1568-467b-ac6b-94f903b46776@oss.qualcomm.com>
 <0feaad40-8bde-46c4-a251-07a1bd6ac79d@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <0feaad40-8bde-46c4-a251-07a1bd6ac79d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NSBTYWx0ZWRfX9RzDRBNkRd0G
 /It3NxpkzOQ5qBPY9dPkk1vIdnci5dakAvCBoiwLljHzA2f/KRy8kbrn6ZH8bYVxvr7ujA+PB9H
 IH0GA5vgHY7ixGakIwuuROhs6DDINgdrJ6BVzHUJywffZOnsVIu7yqtUyEcF7G+MqQoAVMt/7rC
 J8juipu2gw9OcuUr+9T7iiOgsoBqCBcKgeggRZR6HEGihYzD8uoZe6470BKVPabf/JoQaYaVhED
 +nmtThcTJscEnpDn4kympX6z1W6ibTy5HT/yKuI79a+NvTCYD7TezIROslQ2Qk3rhasSvy/7Uar
 iR9iYVkM7KkI3fZ5h1K0uQ+f70eA/8UZL1yEOq9l7ueoLiEc5Kk+1IUUnrGNgJyN4ZVDYX8txeb
 RWdS2L41VHurql6Cx1p5RelpIeUS71F0wlyflUOvEWkPZQuwoEHhs84f0uW4ssr2habPIFLxyv+
 E0HGQ/+woi3XziTlmMQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a264fbf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=h427B1VOWG0w3MIzYIMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: L9UcmAGP2wkC_1ZKpN7YWnuqGhr9s1EK
X-Proofpoint-GUID: L9UcmAGP2wkC_1ZKpN7YWnuqGhr9s1EK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080045

On 03-06-2026 19:10, Christian König wrote:
> On 6/3/26 08:11, Ekansh Gupta wrote:
>> On 19-05-2026 12:25, Christian König wrote:
>>> On 5/19/26 08:16, Ekansh Gupta via B4 Relay wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ...
>>>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>>>> +                                          struct qda_gem_obj *gem_obj,
>>>> +                                          struct qda_iommu_device *iommu_dev)
>>>> +{
>>>> +       struct scatterlist *sg;
>>>> +       dma_addr_t dma_addr;
>>>> +
>>>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>>>> +               drm_err(gem_obj->base.dev, "Invalid parameters for imported buffer mapping\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       sg = gem_obj->sgt->sgl;
>>>> +       if (!sg) {
>>>> +               drm_err(gem_obj->base.dev, "Invalid scatter-gather list for imported buffer\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       gem_obj->iommu_dev = iommu_dev;
>>>> +
>>>> +       /*
>>>> +        * After dma_buf_map_attachment_unlocked(), sg_dma_address() returns the
>>>> +        * IOMMU virtual address, not the physical address. The IOMMU maps the
>>>> +        * entire buffer as a contiguous range in the IOMMU address space even if
>>>> +        * the underlying physical memory is non-contiguous. Therefore the first
>>>> +        * sg entry's DMA address is the start of the complete contiguous
>>>> +        * IOMMU-mapped range and is sufficient to describe the buffer to the DSP.
>>>> +        */
>>>> +       dma_addr = sg_dma_address(sg);
>>>> +       dma_addr += ((u64)iommu_dev->sid << 32);
>>>> +       gem_obj->dma_addr = dma_addr;
>>>
>>> That handling here is completely broken since it assumes that the exporter maps the buffer as contigious range.
>>>
>>> But that's in no way guaranteed.
>> I'll collect more details and will try to implement this in the right
>> way, maybe by iterating the full sg_table.>
> 
> You could also document explicitly that you can only import contiguous buffers (e.g. DMA-buf heap CMA etc....) and then cleanly reject non contiguous buffers here.
> 
> We have quite a number of drivers/HW with that limitation, so only accepting contiguous buffers is perfectly ok.
> 
> You just can't silently assume that IOMMU would always map the entire buffer as one contiguous range, cause that is certainly not true.
I understand your point Christian, thanks for the suggestion!>
> Regards,
> Christian.
> 
> 
>>> Regards,
>>> Christian.

