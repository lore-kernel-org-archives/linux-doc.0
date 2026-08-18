Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD393CC7EC
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032330; cv=none; b=kmQuYkgGytuVOhCQHJVBdzTXludUYoFvZbJ9RG/LJDfRZklXIVDjl27I3MSE4L3TEq1CVPg7pQa2ebwcKO/xcsq7JZzR8MCbebecitsUccc8QWd75r16N7cHs8OqtXmUTvxI7IkMeF6LbOZVD+eHKZpPMHpiwMVyi80QDp7TtSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032330; c=relaxed/simple;
	bh=t7zqK2kfTIdM7DeJsFj7PjMFIgkgpjQMOw5BoqQOa/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLfIu8zXfiCvCuYZN6+ohG4VeNTyU0tAoES3mnxs4u403jAkN8pAJbG6oAw7Quu505D1jB7JZ5HYzTPUaAvyvuY1y31YQx9pGttyybWPPLr+dT1NyX1fKptSgmihV2tr8sIQrnVkdGlFd7LDH/EVOz4XTcC5tvGLh+yUIV9PGlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMcr0RWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5HEC0BG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMcr0RWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5HEC0BG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3rFIG478601
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MGPW6/DK7pn6fKMqjuLg89wJJuJK8oCiXQggTwY6zk=; b=DMcr0RWQv+aJkxOq
	gUbCjFe3NzYI3OjesOMkpzJTRXBjrRxwtH6VVpZBWH95TK5T4AdoohWTSaY/Pe+J
	7tE2qg49EPqjakmV9X+lzItNlEm7Ty55bS8kqEOEnwYgmz+Q+l/A0UzCX8B3sPM9
	sDLkI41D8h8nuCTY9rYTbpOgu6mrJUSjA2Qvflpzd0evQ7B++9d1DY/3qUvCF6bu
	zrx997uDw6q4U81ym76aIR6FRJo8UnMBeBbxrACpSQDKGrchomzeg+g28RME5jk8
	9ksRJuowsPPRozywktrveZAJuq887VPVTCAA2SLmyqcwqlWkg94kKRxXskHAGgDH
	aayzoQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp0f9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 05:52:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848662cd2a1so4528894b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032326; x=1787637126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MGPW6/DK7pn6fKMqjuLg89wJJuJK8oCiXQggTwY6zk=;
        b=a5HEC0BGcsVO+fnXI/jcgLBZ1rKBMbq2EGj6+HQ9x6LICKHMO8CqS3nPi8M/g7tFb1
         4ma6ePhK5NWSrgxqOxuTZGC/pjzKefPEwI4biag6nYD0s/2sy8IUPX5kKl3EJs+NWU24
         cHg2csMR9JZGaBahSFruylxq9fK/l0BU1vHyj2jQibTz9/M+tGgJxgOxMyDeQr4rLuZO
         HoYjH5kC+m0pn8hfsTkjDXN8Yn53SECQr/3T73B/2reo4Mw3NyQKbbk7LApaibxAb9ST
         TTpVGe8acvC3Ik4Q3UUvlcYFSlIUs51s5qbBd7oT25735zxxB8k2oJ8zuGUNz98qPPfE
         fxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032326; x=1787637126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MGPW6/DK7pn6fKMqjuLg89wJJuJK8oCiXQggTwY6zk=;
        b=gf8WZGZF6nDvfvtcuIfLndVKO3iWbkHLKaFIPuBAHbkB2qd2aiy1hkNc1fdRz+ApHU
         2BIyQNuLGu9wAvqe4GiURpygILuwAkcUcDkkXfHPITmcSYIuBUNM66o/nzN6Z3jU4bPI
         qR5rpBTsKB6m0Z16pB8dOmy013B1HwfWeePRfTI/pV1D0W9R7cHLWlGFQJR/Z2T0GgM/
         /nZJY2Ah73j5/Q66ZP+hifjciv8g+mmBqAgGT35jDGUs5ADpaFGH6/7HuZCxDwE8/IBj
         n42ktxNZDdjqlXwwN+yPGYvYWvQ/J6BPDY7xWgMh6U2spxg9zyPNyoTSvb9wRy82QVhZ
         /Vrw==
X-Forwarded-Encrypted: i=1; AHgh+RohBb2Qqcbj5A/TfllY0YK5ROTJPCoX3megcVz41xncGWpvqr6EVtaUee1ZxkWeekiS7GktBxQ3+Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsRDmfBSBAKdUDLdi7G7Ys+ySuB1hozTYy1NaVujLh24bCcBG
	kECbeSmdpGfRAQZbekxLE+soN6+hWSmO5sr4yOt+qKmHotoSMybceKBoiFcmIb6/WquLtTB8IJu
	SyxNjv1HFOHfS3fBAWV8PUgDibmwh317ZKgwpRsBe3jm5cxY7bjloJk9FJeFWnyA=
X-Gm-Gg: AR+sD12paEldEUvfWNrL3jhveFUkfB0NrUYlNF9y/oSE34/mcnwGQ1IKUKlmZIS5BCz
	zh0aDDZsh7mSnXJoEfZY4MJwcQ6f1tLfSBW1oFuajt+KI/q1+1c+ZpRTw46CgoskKBZDHCxLJsH
	1e6vLGzB3kO7rf/QWXPjOkjp2n87AcJtIxF0SEZJmxGdYYnj5/ZuN8XVf1oUg+c1euoWMuMeGqB
	8O97HC8gR8/iUHkoeLQsOQ3ux8kuePGg8cg//djARAzcMmgw2ua/HwAfELlcedOm2RBS+XsNFF/
	PVtmZqnaLTT9+ZG1jHQLK485pLBfuLwkUH+iMKYvU735P2Vp35YxxmWpWWJBUr96yxvlzAr3j+j
	nS/AoR2eZ2HP+m/RtZSeRXH8hNLWGqQ==
X-Received: by 2002:a05:6a00:4395:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-84fde14ffecmr33705023b3a.7.1787032325954;
        Mon, 17 Aug 2026 22:52:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4395:b0:845:31a6:d84d with SMTP id d2e1a72fcca58-84fde14ffecmr33704931b3a.7.1787032325493;
        Mon, 17 Aug 2026 22:52:05 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b4072c39sm1284034b3a.26.2026.08.17.22.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:52:04 -0700 (PDT)
Message-ID: <2d092339-a691-4539-8419-c9606ea35f68@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:21:55 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
 <g3dkltejtlzrrelv77kjteqbkny6vhedyuet7d6b2p7yfix3ys@sop7vjvpdvzb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <g3dkltejtlzrrelv77kjteqbkny6vhedyuet7d6b2p7yfix3ys@sop7vjvpdvzb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G9t4J2d_Pu4JiUL0qAbil8xtRCDTleQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX8CnxMDDM5Uyy
 Hec2kUwrdVwgEA3t26dZpyUswF2Ijre69S52VbAy3Gsw9ZTULPqjjw2n4seiJh57BgPRY+YscjF
 P04zbBUtFSsE3nJd53Ma/+Ea1y3XEI6ehKQ0tTlOxInFSBqczeFJOTYJc2f8OgrJggTyA7w+NpV
 +Zvz/Q2/Ak9mR4vYVWm2Px7kVQTSBDSKbfAWnd20yB+wQanA9sgHk7V/zUuydxa0kZZSfC3Jxq5
 0guqfPz/odgOCeYOX5zUNCG+bCJiA5NG0uxMjx13DoBy7awKK/pe8iAHMvjqtKbnoo7FFRQvhVV
 Zv7qvgQCitD77lAdD+uh1dzUaNy/T1P6dFfs2ePWmk/cJjgcsKUGTgjGZnHnZNqhkq2Xgvwoimu
 OO8OySZE6XMJBt4vu5F1W3rht/Nrlr+zWNs4kbkp9fIwtbDk913OMlQakX4edapQGTKqdNHa7v5
 n29tdV9QsHQn/DhRnDw==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a83f307 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=U_ymhupkC0DnaqHl0NQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfXyLEjHQq4pZpD
 mtGnEsx83Igo0yLxHH4hqeRy3qgbX7jnwwuTK9iBPVyng1brDcDeaxXGR8rHBlkGQtTN2+TMpy9
 md5DV85KOFxT5a5UvLI/EZAIAPtTAQA=
X-Proofpoint-GUID: G9t4J2d_Pu4JiUL0qAbil8xtRCDTleQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180042

On 18-08-2026 09:12, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
>> Introduce DMA-coherent buffer management for the QDA driver, wiring
>> together the GEM subsystem, the IOMMU memory manager, and a DMA
>> allocation backend.
>>
>> qda_gem.c / qda_gem.h
>>   Implements the GEM object lifecycle for QDA buffers. Each buffer is
>>   represented by a qda_gem_obj which embeds a drm_gem_object and
>>   carries the kernel virtual address, DMA address, and a pointer to
>>   the IOMMU device that performed the allocation. The .free callback
>>   delegates to the memory manager, and the .mmap callback uses
>>   dma_mmap_coherent() via the DMA backend.
>>
>> qda_memory_dma.c / qda_memory_dma.h
>>   DMA coherent allocation backend. qda_dma_alloc() calls
>>   dma_alloc_coherent() on the CB device and encodes the stream ID
>>   (SID) in the upper 32 bits of the returned DMA address, following
>>   the Qualcomm FastRPC convention for IOMMU address space tagging.
>>   qda_dma_free() strips the SID prefix before calling
>>   dma_free_coherent().
>>
>> qda_memory_manager.c
>>   Adds process-to-device assignment: each DRM file (process) is
>>   assigned one IOMMU context bank device for the lifetime of the
>>   session. qda_memory_manager_assign_device() first checks whether
>>   the process already has a device (reusing it with a refcount
>>   increment), then falls back to claiming an unassigned device.
>>   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
>>   to the DMA backend after resolving the correct CB device for the
>>   calling process.
>>
>> qda_drv.c / qda_drv.h
>>   qda_file_priv gains an assigned_iommu_dev pointer and a pid field.
>>   The .postclose callback decrements the IOMMU device refcount and
>>   clears the process assignment when the last reference is dropped.
> 
> This provides a nice summary of the patch, which is pretty useless.
I'll fix this for all patches.> Please teach your AI instead to describe
the reasons and the design
> decisions instead of just assessing what the code does. Why do you need
> memory manager? Why can't you use existing GEM helpers?
I'll add more details for this in commit message:
The DSP requires each buffer's DMA address to carry the stream ID of the
context bank that owns it (SID << 32 | IOVA). The memory manager tracks
which CB is assigned to which process and ensures all allocations for a
process go through that device.

`drm_gem_dma_create()` and friends allocate from `dev`, the DRM device
itself. QDA needs to allocate from one of N child CB devices (each with
its own IOMMU domain), selected per-process. There's no existing GEM
helper that takes a per-allocation device argument.

//Ekansh
> 
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Adapt to the dynamically-sized device array introduced in patch 07
>>   (kcalloc'd from DT node count, replaces fixed QDA_IOMMU_DEVICES_MAX)
>> - Protect register/unregister with the process_assignment_lock mutex so
>>   the device-assignment and device-registration paths are serialised
>> - No functional changes requested by reviewers on this patch
>> ---
>>  drivers/accel/qda/Makefile             |   2 +
>>  drivers/accel/qda/qda_drv.c            |   4 +
>>  drivers/accel/qda/qda_drv.h            |   4 +
>>  drivers/accel/qda/qda_gem.c            | 134 ++++++++++++++++++
>>  drivers/accel/qda/qda_gem.h            |  52 +++++++
>>  drivers/accel/qda/qda_memory_dma.c     |  82 +++++++++++
>>  drivers/accel/qda/qda_memory_dma.h     |  17 +++
>>  drivers/accel/qda/qda_memory_manager.c | 239 ++++++++++++++++++++++++++++++++-
>>  drivers/accel/qda/qda_memory_manager.h |  30 +++++
>>  9 files changed, 559 insertions(+), 5 deletions(-)
>>
> 

