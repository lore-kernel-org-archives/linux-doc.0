Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E349552D
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908724; cv=none; b=lB7o22dFh/vIXpAW/Ahz59tMIEl2nKoNzIwFdfJaVCbmM2TfMY8KAKdqWDbzZDjNOaw6LU9HTz0yIikreODFhDHl5p0zobR89i00HHkrckq3lI4/oZWy+Q3K2jYQU7xJT4jLi3GFJFox1Rc8renLJ9Gq/NlO1ebvYUIBkAKpr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908724; c=relaxed/simple;
	bh=Uy/e3pYwP42TDDIvFNQ90B89CTw2CPnfTxb4AAbQsCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5Oxhj2bnyWCddz2vIaC40otvmBCHZbj6Ib57/MS5kaDdlIHczkKY5xgPZm7Uwlbw+oRQXVjSpCwkuQwqQJRPVUGN4tw+SQkI7DqnQXg0EmX4c6FoFAWnM/1vFQ7cOojOiQd8gR+rqpYBT90iI6nzp/aLwHzW/NcxLr4XmzymOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmzqmxQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MI+Ip1B1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmzqmxQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MI+Ip1B1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgLpK336458
	for <linux-doc@vger.kernel.org>; Tue, 8 Sep 2026 23:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=; b=hmzqmxQ42BEaEeVT
	IvNKp7PG5jp6hEdrg0XvJzRNv5f6ND/AmKEpWuGd/N5xmhEiJASv/TWngbjQAqzh
	7gCMVK4IQCk3Z8PBOM9Xh6ZkGqqHV+2j+WW8hmFsyWuexQbLjafy+z73SG47xBcX
	vAuyJtWjOgbFifUvlCB9tSXi3R81jy9c33TvL6BpYJg1M5iS8RVvdpjCRTLvPoGl
	UTPT/0dCwtgWp67I0l7aZZViLCVvM+LgN6AZrRF27MyKSN3vxxEiJYL0VbzAGnSO
	R/yKHeK5QEM8WyHi7a0gvAdRlAo/n68JhMLAeMoDRwTKEdMroGjl9mbWdW5fYszH
	KQoBtQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7h3e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 23:05:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980c3b71002so1886916241.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788908720; x=1789513520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=;
        b=MI+Ip1B1QxY5yeADFO7VaNuzwqTkLmOarRGZ2i9BqPR4GzxDKr1VGj6UgeCBvR9D1h
         aCTFOnakpNeJDQ363XVoubAVdltuD3VJhodflbkIuHW/1eJxxNODg09dR9X4qO2w3o4T
         AAukGaVpAmBOfe7Lr5qOXPjat11aXppY0zYIKt7DWbeAwLoFlfOFNmSVFdG6WMXYx0QW
         uX4LI5HyR4vJm74DgU9Qge6nOGxsWm8t9gtvb11ByAm5HgnafNRUpsGR0iwWdKYH0t1I
         WB5KjpiAH2EW+EJ/VTDQNDChxu904RP9lSqq5QAuNHbeJ46ZV9d8iSNXOc9GPCNFFuoY
         JDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908720; x=1789513520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=;
        b=AIHVHAz8sQ1o4toOBl1fIe0RoC9gH7/Z4sEYKOgjJB0muGKLHFdtpso7FLgkhMlIQd
         JNL0JQPRmX3K7ap+nDKYNSHsjxU8XFjqUqlP9r01yYPKypbiCSet94sgTsHHlprJscpY
         ZzDYBuLwGtkwvaRmao5TBcKGSZWiTvjZozDy/qz/6beCdHBbP1C2CDQJfOEp5gwW5oZB
         kZSytdOB+/LJO4awM4fbFq7DOm+BFvk8+cEu+WmbNbgEKU/tXYI29yoVlExdOl2b1Ij9
         BW3gndnjWOyaZifqjcfEjNR2xKkp58kr1YxkyiT5r4gp6f+JlIZMuCpcnK+PvOPXKtPc
         Cx/A==
X-Forwarded-Encrypted: i=1; AKwUvBxk0IGrTSbRpBgdVD/MhV2Pr4JepSJBt3qIY4elXKH00ZrNsHJRqniKJIxVLQ5t4Cv9mAVeqroT3pQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nn1pZnciHlf4j4f2Zml9dztdLiX1JEDj74buttpCdWykCZBF4x
	2vhlrbqrA4gFa6mjoq6m60LSIP6QVnktEigBzHXTg3dLiWgdaKdBR4ppDsZsYapgYiPtrkgwGMs
	uCjYs4f8Rg99S0nAylrqNFbcLcCjV54YOwqhf79G81ojNjuKNGHl8UmHJ8Hcp5a4=
X-Gm-Gg: AYBFou2PtUhESu+JkK4ZFVcvPijspvsoaB0mePz3Ao97SQt6RkqKbEFW2h8mD4IjXcP
	5OesaK6G1t9huTWb4ciG5PZdrGNUe7bB3TNBSKlZHIoRxTeSfN6OQ8HXeJSCcvvL7/u0o0kRu2M
	armYpgaBIVAQwxbHYTlAss0PIS+jCli72f97YPTJGsXKyX6SepIaRz8qsCw16VHtfOBGqbY1obx
	hdIvNCSail29/DUnSZ32qDr8TgxlAgQXVt15rI+Yf1w/jsN5sbEy/8cFUcLxOs6nvagwcSoh/Gz
	4JywUDEnw94ul0hkDCeDAyyQP6X+uf0URq/wrGtDsb6pZh7Bzs3+9LpbAPeeb/x15cqCD6e/jxC
	V7FIBbe/tfP4suqsT5n8s8pTm1882QJpGSmrstGEB3/kV2q5lq0mNIfWMoAdrhJx4idunT+v9Nv
	H8lg7ca+97pRBX
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-78a4a97bda0mr14097723137.11.1788908720206;
        Tue, 08 Sep 2026 16:05:20 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-78a4a97bda0mr14097683137.11.1788908719796;
        Tue, 08 Sep 2026 16:05:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37058669fsm36735161fa.17.2026.09.08.16.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:05:18 -0700 (PDT)
Date: Wed, 9 Sep 2026 02:05:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 11/15] accel/qda: Add PRIME DMA-BUF import support
Message-ID: <d4ykcbhd2bqisv47s6hutrpdtlox2aid3j6pkgif6tptivaqkn@tko3tts7hzcn>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-11-69a02e9090d4@oss.qualcomm.com>
 <l7gt2mr3rrnzmkc46ntqw5e5sirdimavv5do4wmdf6jktryp7g@772ovv3qlgcv>
 <c1da4243-36d1-4b65-a5da-f660ab8c63b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1da4243-36d1-4b65-a5da-f660ab8c63b3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI1MiBTYWx0ZWRfX4QWxVE6EM3p7
 8HkDRwtrSvtTQIg4maSdJqUSNftJmY5cb0wNT6BcqiL4OFh0ayCMRvzREkD+XxpKBnBl1UtqHSU
 YeN4bQC6m20A8WsNEzo6bHFNNmit6ko=
X-Proofpoint-ORIG-GUID: U3pplX9-KvLa_YS3mkCo2_xKYegh9Msx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI1MiBTYWx0ZWRfX7BOlc3hx1r0S
 HuJVlp+nlkCSXx51b2ib2F8jMKXxIneFqOVSWF2KYTaQ51VWPCspdD9MTA0LuImtGSSqCMQ1E32
 +0ftvZSKiPKUCbkSO2RbDfErsDcR3957ov3ZreMjUZ+QPTBGUstl8t8Ubow/LUHFopmKa3jfQKC
 Rc4pnKj1ib0WnC4Fl0JgHhOoBfuE/+9M1vYltHoj6yJxKesl3xbiUO59YkpxXASm8bIoqhL7NNq
 7haK9NKpuFfF7VtnfuCxI9EEzvvrSMMAPGc1d9n/zHeszR58g/hFgXIruSvcps7GBp6N6KLF9pj
 8PyC2IdgrpEznOCot0mZikCgp8DX1WEoybgxUHT9zD5ouTzcBQp5g4qd+XKVcpc0GNuwVt1E1sD
 USfRHUo/x0g7EZTPN7CugolA9J4fbfCHFopFIkEH2NANDy9D9mhWmkVK1VBFrVIxTtEU7b6obHq
 LiDl6x5rshuJjnObMxA==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa094b0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pwSLSVGh1Xxsrx2JAEcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: U3pplX9-KvLa_YS3mkCo2_xKYegh9Msx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080252

On Tue, Aug 18, 2026 at 11:55:50AM +0530, Ekansh Gupta wrote:
> On 18-08-2026 09:25, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 10:17:46AM +0530, Ekansh Gupta wrote:
> >> Allow user-space to import DMA-BUF file descriptors from other
> >> subsystems (GPU, camera, video) into the QDA driver via the standard
> >> DRM PRIME interface.
> >>
> >> qda_prime.c
> >>   Implements qda_gem_prime_import(), which is set as the driver's
> >>   .gem_prime_import callback. On import it:
> >>   1. Short-circuits self-import: if the dma_buf was exported by this
> >>      device and is not itself an import, the existing GEM object is
> >>      returned with an incremented reference count.
> >>   2. Attaches to the dma_buf and maps it with DMA_BIDIRECTIONAL via
> >>      dma_buf_map_attachment_unlocked(), obtaining an sg_table whose
> >>      DMA addresses are IOMMU virtual addresses in the CB device's
> >>      address space.
> >>   3. Calls qda_memory_manager_alloc() to record the mapping and encode
> >>      the SID in the upper bits of the DMA address, matching the
> >>      convention used for natively allocated buffers.
> >>
> >>   qda_prime_fd_to_handle() wraps drm_gem_prime_fd_to_handle() under
> >>   qdev->import_lock, storing the calling file_priv in
> > 
> > Why do you need a separate lock?
> Will add details in commit message,
> The lock serialises the `fd_to_handle → gem_prime_import` call so that
> `current_import_file_priv` is valid for the duration of the import.
> Without it, two concurrent imports could race and each see the other's
> `file_priv`.

What is different from other DRM drivers which can use
drm_gem_prime_fd_to_handle() directly?

> > 
> >>   qdev->current_import_file_priv so that qda_gem_prime_import() can
> >>   retrieve it (the .gem_prime_import callback does not receive
> >>   file_priv directly, but the context bank to attach to is per-process).
> >>
> >> qda_gem.c
> >>   qda_gem_free_object() is extended to handle the imported-buffer
> >>   teardown path: unmap the sg_table, detach from the dma_buf, and
> >>   release the dma_buf reference.
> >>   qda_gem_mmap_obj() rejects mmap requests on imported objects, which
> >>   must be mapped through the exporter instead.
> >>
> >> qda_memory_manager.c
> >>   The DSP is given a single base address per buffer, so only buffers
> >>   that are mapped as one contiguous range can be described to it.
> > 
> > Is there no IOMMU in front of the DSP? Can we remap the buffer to a
> > linear are inside the DSP map?
> The DSP firmware's buffer descriptor format carries a single
> {base_address, size} pair per buffer and it does not support
> scatter-gather or multi-entry page tables on its side. This is a
> firmware interface constraint that we cannot change from the kernel. So
> imported buffers must present as one contiguous IOVA range, and
> non-contiguous ones are rejected.

I think the main part of the question ended up being ignored. Can we use
_IOMMU_ in front of the DSP to make buffer scattered through the
multiple pages to look linear? Or maybe I'm misunderstanding what you
wrote. If I have a buffer spanning three non-contiguous pages PA, PB and
PC, can we still use that buffer with the DSP?

> 
> Will add this information in commit message and during the check.>

-- 
With best wishes
Dmitry
