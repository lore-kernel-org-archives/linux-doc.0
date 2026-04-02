Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A06389446
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118973; cv=none; b=GFVG2DRe2crXHaLxcmRJ+13FI62/yQ2nrzFPaUmscHieCWo0AkIpVHJPOZKWAGrnFiGM1zaAs9JGJC+F1Z0ouk4xo00UYwJSybY0wQDkkU5RdjRbBd6DcWiB3WOTCAIqi59oDXna657fXgEt2eq/g27Qj0u/l1ryKUwBgh/Mbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118973; c=relaxed/simple;
	bh=efq6KExaXloGlu4W+o6XXI3jit5Ma9jZElLXNdRwpoM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KBxRG1Lub4x3UCFRWV9QsHmP72EsspTvNDQyeqZSqsTkbsHO6FOEIUxC9QWRyqMjcmOrJbmghjpZy4kcmgTQ8sUfz9ez33BwnlwivahbqZ87mrW1bGMuJohPHqZwiQXCueb14bCQYfdcLfhoNlzih5/uL5eSY5LSmYgOT03gj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHma4SsO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0agQ9jh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHma4SsO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0agQ9jh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63270TtC1128397
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 08:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZz3msypn/iPTQp7pBZHHsP/2F3PYJPj/B+Z6Rd1qmE=; b=RHma4SsOd/81yQFQ
	xAx6QCQAEfsXUYd1eiP/9KcSKt05B/8+nzzL65Ik3f6iUQz9+9v40os1eMNUM4Om
	IS9+3uV9M7/lJ0a6VZGq6psD7b30MCA+yw5iTekmwvuLomU4AkZYSi58G9jG5Mpa
	iOp2Y8QzPE972/fofH+xbDT6h1kVAjUtirRtXOJD/iBWVX/JGnpdt+p1fi87apVD
	1BHkr0w3slGvST99Bky9/WwAq3wJu5E2rRTGZuY1HvKgHB9TediDxYiK2oU1nnOM
	VB+ogu469E8DK5gDXnhY4WdZGMdplI6U/29ywBKz1Vr1nrk+2NFbY0oyylNTCK//
	s0HIyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9b4m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 08:36:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e9b4d82so18389815ad.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775118970; x=1775723770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZz3msypn/iPTQp7pBZHHsP/2F3PYJPj/B+Z6Rd1qmE=;
        b=j0agQ9jhpGOlLpuYokhwwOgFcvdrH+A8TotNKbbz77s0c7uoAGzwy1JHIP9u1qcFHm
         zWkBbPsOF5yz8vgoD5EfArOkunccFyaHrL4X40vudnPbqS99fDYbwH4LvDPVRf23C36R
         BR1z5LrhsTmjzSBOW09YOCOov3MR6s+bfQLh+NIJhU2M0kUjx9MVHBbkbFZ3QS3QAQBx
         peltmcVVy7LIWI8cUIpNaM1hmIxR+5izrZhR8K4PLxd6UKqVBF9O4OFk+U4i+tC7XSoP
         l1JZuXkVxz2Bmw5ePUePxAFlv1MbnpvT2fPW6X1FIg2y6mmdRLlata4cenJh60fCWN9t
         hO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775118970; x=1775723770;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZz3msypn/iPTQp7pBZHHsP/2F3PYJPj/B+Z6Rd1qmE=;
        b=htIe7gr9qaUEpORDGk2nYyg5dFSuYx/HUGK+4oC+est4mTmnZV0LyyE7vl/VWL7pSB
         XQzNrKIDDg81nLphE7EKBH6dR23iMPa/XXEvP2Q7P6rbpReTGSC7FMbojgQcsIMvwr//
         IJCemI5bdb11865AUZ13ol8wJStqraXmTw7jSdP9PrGKbmLu6FjExzk6h471rUGhjDjg
         gAau+iZXlYSDtPipmQQ4vkPdSRYBVc2neS2HJyY9zsgqDr1PXcvIWTPt583Bh2ucpM+J
         oMb/qIf/iKGIsI5zTvLaos9Z7mqXWgPLzqoQr7xT4kdEzqGsrzpWF8WkrkIv/qnHHbKG
         xh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC5t07ozJRLMuoa8Eq7K1M28ApEhYKM93ZRe7bxmjI4CBc+OlNaF8zeYVvVypKYm0QjJMsPZYlYBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTmiTethq4mAHOSOmE8Nml89f9qDrajmdKGLIlPt4h4GQxfw1n
	ypXHKzd+uLskTFlTiEaXwNtdhf415jICPetd/Ia3ET2GTgUJG2C2V1Vjzn8CzCdEGusi/lPev0s
	/dXUrCNM1DaVYBTORO4nHrhrmiFB0iu8TZ1mb5J9lplT7cVOjSrjIhO7Sguo7Hyg=
X-Gm-Gg: AeBDieugeULmuha9vsDf/qsDRHvHvMai3PWEH8o9Viyw9yKBMAz6wysKWfiArM9T5xc
	uBrvgXQ1MNDgEoydXRUKnV9J36Hl0t/+J2PObSPUESQmsAAH1mvuI7jcZQnHsOZdDpcrSKd2Sb0
	7sIribq/Pzs27zKegQhXDTjSaj6vMXujrCVmR5EPWfk6dDpdDIFHRPyRAVAsOFN3MlqQzzPy4PB
	b2nrfuf3Qk5/zrYK6azfpIPal5Xq2sJqGExux1q70jjahhXwJU/1LAQYpApDIV3No6TlUwoCRMm
	ll8X+VEdi5ofnWTV0WTVR4sgKPgX0lljLhMZQVu5EGw/u1Djsng2/9y7FemG9SKV/knOhAPrX5t
	8aFoICFgUqAEH5VCtBqlWsQ3p5Z1dQubZQDlvkyOOmASAAmKs68bY
X-Received: by 2002:a17:902:db12:b0:2b2:4c30:e6e2 with SMTP id d9443c01a7336-2b277e256c0mr15094555ad.16.1775118969704;
        Thu, 02 Apr 2026 01:36:09 -0700 (PDT)
X-Received: by 2002:a17:902:db12:b0:2b2:4c30:e6e2 with SMTP id d9443c01a7336-2b277e256c0mr15094325ad.16.1775118969177;
        Thu, 02 Apr 2026 01:36:09 -0700 (PDT)
Received: from [192.168.1.14] ([110.225.167.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749e2e97sm27595375ad.82.2026.04.02.01.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:36:08 -0700 (PDT)
Message-ID: <998ce121-e027-441d-a3f4-2f3e41e10830@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 14:06:00 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
 <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
 <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce2a7a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=GstQyB7T1i92F5dDEt+vJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_EeEMxcBAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yv3-IXtlHroiPP0bXpQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: OWVI_qy5yas8Y2N8wmUm0ZOIN9i7DEur
X-Proofpoint-GUID: OWVI_qy5yas8Y2N8wmUm0ZOIN9i7DEur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3NiBTYWx0ZWRfXxnyQWhugZdG/
 imNiQdm5gOEB+TSxpOAOU9byJdA2pK4SUH8VpA6QLJlI9SqVgPkpstDbLm+5SF+H9kCkr1ZHIk1
 qA0HQzI7fu2hFTBuYSB0wLCE+t9k7Czk3k6vRX+jgEEOKVfhRItwDU99PpNvP/OK7zyDgQIuWfl
 /BYl4g7Z8r0aLxYeLpR5HDSabrKAa5g4k6GTNNhsoJFjyLk+Ql2OSJH1AKjGj4MTiQFuXXpbxOL
 du7DhJRX1jgUopQiM/9+52kUu/SHc+EUgDwNniHdZyEsCH9xcjB7D3OBw/D/RHLmiZpd4E4xUJN
 MOSI6iI2gRquAfQwm3dqRVWmGVQHsQl6pqaTdkEqY7iRR2w9uKc6gfmmekiW19mqWKkZeY2lbTx
 25Dn92P38g/Etm2pvJiuWxnC5y0tv+U3ljqXlabBNsqRdAmRCev/t1cgMYJYjtFYV65JHgR7C3z
 gx3PvKuYydWrmSx6qgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020076



On 3/9/2026 12:29 PM, Ekansh Gupta wrote:
>
> On 2/24/2026 2:42 PM, Christian König wrote:
>> On 2/23/26 20:09, Ekansh Gupta wrote:
>>> [Sie erhalten nicht häufig E-Mails von ekansh.gupta@oss.qualcomm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
>>> it with the existing per-process memory manager and IOMMU device model.
>>>
>>> The implementation extends qda_gem_obj to represent imported dma-bufs,
>>> including dma_buf references, attachment state, scatter-gather tables
>>> and an imported DMA address used for DSP-facing book-keeping. The
>>> qda_gem_prime_import() path handles reimports of buffers originally
>>> exported by QDA as well as imports of external dma-bufs, attaching them
>>> to the assigned IOMMU device
>> That is usually an absolutely clear NO-GO for DMA-bufs. Where exactly in the code is that?
> dma_buf_attach* to comute-cb iommu devices are critical for DSPs to access the buffer.
> This is needed if the buffer is exported by anyone other than QDA(say system heap). If this is not
> the correct way, what should be the right way here? On the current fastrpc driver also,
> the DMABUF is getting attached with iommu device[1] due to the same requirement.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n779

Hi Christian,

Do you have any suggestions for the shared requirements?

I'm reworking on the next version and currently I don't see any other way
to handle dma_buf_attach* cases.

//Ekansh

>>> and mapping them through the memory manager
>>> for DSP access. The GEM free path is updated to unmap and detach
>>> imported buffers while preserving the existing behaviour for locally
>>> allocated memory.
>>>
>>> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
>>> which records the calling drm_file in a driver-private import context
>>> before invoking the core DRM helpers. The GEM import callback retrieves
>>> this context to ensure that an IOMMU device is assigned to the process
>>> and that imported buffers follow the same per-process IOMMU selection
>>> rules as natively allocated GEM objects.
>>>
>>> This patch prepares the driver for interoperable buffer sharing between
>>> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
>>> lifetime handling consistent with the existing GEM allocation flow.
>>>
>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ...
>>
>>> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>>>                 qda_err(NULL, "Invalid GEM object size\n");
>>>                 return -EINVAL;
>>>         }
>>> -       if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
>>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>>> -               return -EINVAL;
>>> -       }
>>> -       if (!qda_gem_obj->iommu_dev->dev) {
>>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>>> -               return -EINVAL;
>>> -       }
>>> -       if (!qda_gem_obj->virt) {
>>> -               qda_err(NULL, "Allocated buffer missing virtual address\n");
>>> -               return -EINVAL;
>>> -       }
>>> -       if (qda_gem_obj->dma_addr == 0) {
>>> -               qda_err(NULL, "Allocated buffer missing DMA address\n");
>>> -               return -EINVAL;
>>> +       if (qda_gem_obj->is_imported) {
>> Absolutely clear NAK to that. Imported buffers *can't* be mmaped through the importer!
>>
>> Userspace needs to mmap() them through the exporter.
>>
>> If you absolutely have to map them through the importer for uAPI backward compatibility then there is dma_buf_mmap() for that, but this is clearly not the case here.
>>
>> ...
> Okay, the requirement is slightly different here. Any buffer which is not allocated using the
> QDA GEM interface needs to be attached to the iommu device for that particular process to
> enable DSP for the access. I should not call it `mmap` instead it should be called importing the
> buffer to a particular iommu context bank. With this definition, is it fine to keep it this way? Or
> should the dma_buf_attach* calls be moved to some other place?
>>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>>> +                                          struct qda_gem_obj *gem_obj,
>>> +                                          struct qda_iommu_device *iommu_dev)
>>> +{
>>> +       struct scatterlist *sg;
>>> +       dma_addr_t dma_addr;
>>> +       int ret = 0;
>>> +
>>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>>> +               qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       gem_obj->iommu_dev = iommu_dev;
>>> +
>>> +       sg = gem_obj->sgt->sgl;
>>> +       if (sg) {
>>> +               dma_addr = sg_dma_address(sg);
>>> +               dma_addr += ((u64)iommu_dev->sid << 32);
>>> +
>>> +               gem_obj->imported_dma_addr = dma_addr;
>> Well that looks like you are only using the first DMA address from the imported sgt. What about the others?
> I might have a proper appach for this now, will update in the next spin.
>> Regards,
>> Christian.

