Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C9C38F239
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029042; cv=none; b=cRL4cEYFqdxGHiPWjuY7RkH3FlRffy4Ppk1mm9OeJKtNc9GpNdBb5fyUSW694QqGQCLgvPIobjrbM6+r+2859B+SnEo4xnGcqfuSo4Una2h18BfSrvfzEo70oDjaqaJljIE5ovo1Oiax/R/+GMFpfV5RCUe2Xz958Dp9zdrI5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029042; c=relaxed/simple;
	bh=vlmj78ENu4V6iQt2nHu8920yOHityKAFdoRy/fn73hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DORofsA+2aLrEl1fZd1jFZyNN3OQS9/cKssw2CfdwXw6W9nG75+dSM9rIdtBHG0GZlB+eHTpE6UXEzE31WVz/B2EdEJ5AWtby26kfPn0Mll5GDb0/i5dcdXHuS3SNxx1hfENDAOcKd7sBJuDE7/78HB/IJRzftoAC0erpH+zD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ujpyutbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2UL7kV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ujpyutbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2UL7kV+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TAQ91579465
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghT7JDNMf0qUDVWiQwz9lqduowwivTxtJyYYgUsqveE=; b=UjpyutbfEqKkZYGW
	i6kNlF9sQC7810SDSSgkU8qIP2h1NJNWIAo4UfV0mRnzviKkCvRAo52AoTF2bTS7
	CneBdh+Sr0XyU2zVaDbqwh9u495udpm8r++TK3HGvLUHiaNWDugOI9DATLA063uv
	LkpzZasUEP9ivAozPL1zzagcggPjxVkicPDNpziwIwuiSzI4MiJlfe8j/Yx4KKki
	srhd9JRj5Fk/2/hPWEM4x2Ph1Tpr51ftHEpOcKM1aGxVGV6vLlTZ1fmsClhU6v+1
	A1ko3K8cDD38EZJo9JpgkcsSbRaS1N3EK0YrR22Fb0ZLNHCusRdMWdoMT2zRyXdO
	SOT0hg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sbfhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:17:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82436a49592so3044831b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029038; x=1772633838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghT7JDNMf0qUDVWiQwz9lqduowwivTxtJyYYgUsqveE=;
        b=B2UL7kV+5SPOmRi5257w8KpegbO4aTW3vcdjvbIJ2kEvu0eqyjsWRYdwBBRcMLfPED
         FTxNTJqFc+7d8Keco6RTH5QYYiPRuKzMgH7H5UESTYRG6uIPl8GvEDiLb+vX26R/9khb
         hmtsSdxTkY5AybskCsbu6sskCAWEpNq//dicig06NAMi2xZBwCPvoVbxeBoXOhJBQsZj
         TqtGsUh1d06FNifJ0b5UQ7DmgCutWSwXlrwKTSVACt6XYaq9jV/i2jCOTp0il6+Vf5ks
         RWMNGfH2tFRBpACPGFYY5woseADFnVEmMkZHERD5pD2LdYIqy4S7qSea2d685ciE2OWB
         nc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029038; x=1772633838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghT7JDNMf0qUDVWiQwz9lqduowwivTxtJyYYgUsqveE=;
        b=jU93OAmHOrbrP/WVSMuZsjFygXx6TANXiCkZIxHJKFPL11dNTQFsEoIHzBmUnOi1SK
         6+Zzb6AQTxCGdaOcpWzg15AiYoaog8TXGzIhvnmwy+oM1p7NsV7BWlRBeiyJB7R1iZTd
         gFGyJiG9NdTMHnrU9hkyMZlem7R00HRReX7NdeXK6fVmP/uspVxhhrexDFN6vLhzepf6
         dqckOcHE7nw9MFu/qjt7A7jz7IgeuYo9ypB28dEDygQZRJMvXBCCJpJz1PpXVj+X8mCC
         swgGRvdW28bjR5OgLtx6ImGivc137Mmy4MNBGX7X02FK3FsXXOGe9UoF/wj+ygqXcaSu
         S6fw==
X-Forwarded-Encrypted: i=1; AJvYcCWcAEpIW8VK1GiWG12LYUUxnv5dDCvSycMKgnM/0Jhrit9o0A3obO67UztYp8k7WU2k+AP5Wo+IXHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/4NbhivF6dLA8kumpC7Vr13jJzKw4uDIagoNaaVkuEqBRoSg
	q8ybKAdQdPUisWSZeQESnECjZZPsgl8j0XAqkcIEHIHy65EvrjB/KYFiXM4jbNREuZkFu7Q5y9O
	AbjBeFeLNW1IU4VFnjcQbfvzKb/7njb29Ww7b5N/SfeY5Yp1g8l//dygh2gcklSs=
X-Gm-Gg: ATEYQzwAk8cPR5qd8rv+Yk9019pkLyPqrjq9iJzjw2erYUmm45nL5NBPngXPPCvyclU
	Eey9udiJSvkMY59ZIobFRouixaA5Eh7+iYl1oif6Q6pz7/RaDMRMX2P5waXyArlk8FbjApP83Gj
	holG1m7+C7eQwT/5VK4hLrByj6c0BTAqtJrUQnz3hkq3EFA7wCKaTDX7f4LcPsy//iFBN7a/sj5
	MLZtXp7jFqB2sAl2KrWCXrTHf1UphinyJm5UYGpnJ1gstUTUK2IhgwyRcsjgDadxehOOtBwce2m
	V/wO0bFNM0mAhMi8OywZaqDz/1K/cMsSkN1I7T4AbL8KbNjWxqmK4wYJWQJAuFO1MlOeNbt9WNR
	mQSFOCay2zY9QUIGgr88Z1+NhpbAULnHBaPTvq/5v2OpNTRZdp4A=
X-Received: by 2002:a05:6a00:2407:b0:81f:33a6:e9cd with SMTP id d2e1a72fcca58-826daa82b31mr16934489b3a.57.1772029038307;
        Wed, 25 Feb 2026 06:17:18 -0800 (PST)
X-Received: by 2002:a05:6a00:2407:b0:81f:33a6:e9cd with SMTP id d2e1a72fcca58-826daa82b31mr16934446b3a.57.1772029037741;
        Wed, 25 Feb 2026 06:17:17 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd641040sm13758026b3a.10.2026.02.25.06.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:17:16 -0800 (PST)
Message-ID: <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:47:08 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699f046f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p29BN9gyRe82g0miaHUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: iKGNlLz-wrzwgdR5Spur62jnERoAuEcU
X-Proofpoint-ORIG-GUID: iKGNlLz-wrzwgdR5Spur62jnERoAuEcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNiBTYWx0ZWRfX0FhlEGoVIlWl
 WkAM2jVqbcoLK0ADDwrEcfKhFCvVEjCd7+ARzSLbj6pSPtO8HGKgyR2KhdS5s2sBI6r8x68nPTQ
 qTPEKnGP3ZkCNFCsgJTxBKrxFI1FRwVX1BzP/L9JEhvX3ZbeB1Kz/hQFBPtLv/w0WkdlqoWRcPR
 KSCe+q97StZjx5DHNO8GKc6EZKUWfxYVlsdQLfmDShaN+F8GR2/LiOXPw3NP0JejkFSB8LHWGqA
 iITRNiupnaWPx8f3pjFrdsuCQudGRoctY+RHH9OpW1XsNuSu4q244lgS6poKz8YAyrAv8/6XQOz
 gUgn7DVlzdjPxMX2A2rT9OHsZegv5Vjh7VTAEau7N4ChzH+//PxAHwuoT+KPV6FFiImGo+DmsXB
 bDf6ebdaA2Cwm+I6JZyAzG0M9pvefjXmrNshJ+yM5/5lx9xQe/1SanpLaHo75bDdihCtjwZVkvj
 7tKyLe+pPSNnXGAdcbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250136



On 2/24/2026 9:03 AM, Trilok Soni wrote:
> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>> integrated in the DRM accel subsystem.
>>
>> The new docs introduce QDA as a DRM/accel-based implementation of
>> Hexagon DSP offload that is intended as a modern alternative to the
>> legacy FastRPC driver in drivers/misc. The text describes the driver
>> motivation, high-level architecture and interaction with IOMMU context
>> banks, GEM-based buffer management and the RPMsg transport.
>>
>> The user-space facing section documents the main QDA IOCTLs used to
>> establish DSP sessions, manage GEM buffer objects and invoke remote
>> procedures using the FastRPC protocol, along with a typical lifecycle
>> example for applications.
>>
>> Finally, the driver is wired into the Compute Accelerators
>> documentation index under Documentation/accel, and a brief debugging
>> section shows how to enable dynamic debug for the QDA implementation.
> So existing applications written over character device UAPI needs to be
> rewritten over new UAPI and it will be broken once this driver gets
> merged? Are we going to keep both the drivers in the Linux kernel
> and not deprecate the /char device one? 
>
> Is Qualcomm going to provide the wrapper library in the userspace
> so that existing applications by our customers and developers
> keep working w/ the newer kernel if the char interface based
> driver gets deprecated? It is not clear from your text above. 
Thanks for raising this, Trilok.

This is one of the open items that I have. I'm not exactly sure what would be the
acceptable way for this. 

As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
without modification.

I was thinking in the same lines as you have mentioned and  having some shim/compat
driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
character devices and route the calls to QDA. The compat driver could be built via Kconfig.

However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
before, so I would want guidance from maintainers on whether this is an acceptable
model or not.

Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
unchanged in terms of definitions and expectation. The same project can be build for both
FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
not face any problem if the libs is built with proper configure options.

I have noted your point regarding the doc not providing clear details, I have added interface
compatibility information in cover letter and will try pulling the same to Doc.
>
> ---Trilok Soni

