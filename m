Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95D3B19A6
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146377; cv=none; b=fdUXpXkg8AzxJJeB88eaX1F3/RXcVJI92tzwN+r5jhD0jfJSsem1czYWdWk+kWDDJ2XkKnmHwJXS4WYKewydPPLtY6PlqlY1pIb100Q+qnoJRZTkDUVKtT1pXAzn2EInWcTfDmAlCSYkW88FbLZZ3GY65Tz45aLJzWvGJi90KV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146377; c=relaxed/simple;
	bh=A7CwfanBROg561MIuoX5kXiuN05/yn54DzFQiaQ6MqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfWJbiUNCi2MOqETEi6y7DSFkh0nUwGd9WBXcsRC2NpyBcZB3qr1z8cKEEWWkrAFbguSMRLe7/yLMjc7otAADsRMvavU/QVTQHfnO46Mr7sxuEeTdJEB9kgQSAqlhkdB1uAzJ44tcHtRqnvekDrLzj0dlwJ5IMk03H+FCC9EAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHjacTG+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfzsBTKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHjacTG+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfzsBTKZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0E8T693417
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTId9XKzJdmK9pl/QhfL2y+iUTYqNrNHb4dCZaCmqBQ=; b=hHjacTG+o/1f+FLQ
	0Wt5mgcQokO3Wzj+KILqQXnlkcspkXSMQhTeRPHB5hvnS7z24vKBKSTx3K54BVUH
	QwUesNgUBpgIHw8oKk3iEmCyfsPzF/5hDkwkSDzGqt6Hbr4v1l7G9lO+Yu4+wXU1
	WDEq7RtWeFwbuVrRlCFLk/iYm2t2YaxK8gROTxzrZ6jkuKisGPUKbY7BCB4is3+e
	CPm/GNAn6XzCU0bPL2b6u5sh2r3JO/NtYzSvONL01rUd52W7yTUnNh+FI/yCcsx6
	ZBVlQdXOEtJyAeUmsSXX1bWO2eNGtr551RWOmuixTf+80T1Ttz7JXS7x5Azrrpq5
	NNV/Jg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmbdwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:32:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2769955a91.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787146373; x=1787751173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTId9XKzJdmK9pl/QhfL2y+iUTYqNrNHb4dCZaCmqBQ=;
        b=JfzsBTKZXmYkkPQ4lCyLaHl3RHceEoYe1XclGaaS6AUJpEuYRoeaCVcFbUO1GTZa+U
         UFFUIkWX5/rEXD+ZVJ+mypOTxzkSfrdWyLOMnYQYBvd0f/6dFKqxKgB8TWU0N2uAXIum
         +sfuP+9EJm/Cz90HmJrFRNBj1eIqM69Wp/YbcJXGT611ZMw9cUsXUsGZ5gG//0c7BTW0
         gzaQm7jncXu/biN7/8Zvs/Rq/R4p+xobmg9jfoedWxuyKIh3IMsUxO0MsZ3xs7Z7wtHo
         fmxLocpXDJIm5KGIVN2KjcQlrggFioj+xg9BAno2K/u8qAN+PzcEVE/M3nP1bTUrU2Eb
         XkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146373; x=1787751173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTId9XKzJdmK9pl/QhfL2y+iUTYqNrNHb4dCZaCmqBQ=;
        b=CQKDn/RC4czsv2vN+YBY6LJxsoNPzS22V+Zql/qleTyrTi1RzbVXxd/MJxrnMFUbOM
         p4KjZjScr4n2fdZfq6DXqR90IkDOTvNtllmdYCH75hKGvpTEOllnxqX8OG5vG3NDRTu0
         7WiV8+RnPhSWgncQYD/2eHeFHWs5QxMirJT5GlUXUfoIlIIAGyQonoMcieZeF+NiMcRZ
         wEPKa1tAzokAg3g/jxu5sfktEkqgqSkKpKz9Q7IpXGvhGsURJXyDFFbH2XAl2sCKjQtW
         p5aPQRYBo6reJRb4XN5yUQhtRCtETcvHsGwk+b7iEjs1564j50svB1WO+2NF/WBl+yj+
         1Zwg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9bM6Qzpizy+9jGPLrf+vo7DMzJ9SsbXG5xKliFK9IlkwictqPdHJ+U+31juO8BLEsWoRocRTc3Uo=@vger.kernel.org
X-Gm-Message-State: AFuF++kGNL2x+Hi7v136YDF1rpUJwEMykWjBnFfGRfKXod6TryVebO7q
	dwK/UZfATm/nxNU8L/QriXLDo7mfmuA9tN2LsX2yiH/zo5/PkiNj1qoF1xaKVC7W3RhjJUIWWsu
	WX1IN4v/MA1stFZG+Ns93UG2JokBIU8VHl97eGpsyUDsJdq/+H9gOBlZYHMLqP4Y=
X-Gm-Gg: AR+sD11EcTOPzA8OrgX3AbLooOjNDRvOiQZu/MH2VmwCv3Mg520y3tnh1vxUy/Ms6NI
	aJDxiWdNa/p7miUEBpVuwRNlg7Y9rNDBde2KT8pPsjLB/Tt3jC5vUb9+9tV1JRL3jCUh3/E4dfY
	fZ181Ke2IgUr6wWWyOGcZ2iU20YscueDa/r9jBBFwSQZ0tfoUFwoDN/R9CkLzUMVRbN0aKRGIPz
	X9B+DFQHLTHX+zpb9xHDwCvoLP+prDIQPhVkQwa2elm9JtsXe5zoSoGxXlgf7cn9X0oGd+hT4Uq
	gAiiKdmtXjnWPokDlcQmuWMtgKCa/1OeACMF2u31SCzHnPY1QeEPRMpoHgkpNaV8jXpFUTksVOx
	bVky52GNAriIWayUd3eP6YlypRLBhVw==
X-Received: by 2002:a17:90b:4fd0:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-39580a53469mr9337790a91.4.1787146372812;
        Wed, 19 Aug 2026 06:32:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-39580a53469mr9337596a91.4.1787146372105;
        Wed, 19 Aug 2026 06:32:52 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm12708409eec.14.2026.08.19.06.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:32:51 -0700 (PDT)
Message-ID: <4000bb8b-20a7-4ab0-9330-49395022e78f@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:02:39 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org>
 <3b235b4c-0c1c-400a-b081-0df881cab06d@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3b235b4c-0c1c-400a-b081-0df881cab06d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s8as8g4-Jg3fIDgL_GXuPpVHboO0v4cv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNSBTYWx0ZWRfXy6R2SIhrbx+t
 5Yx+UBx+xbLdTclbyxcC+1ANQc7TzAr0C0L19PTblg8dTuRXOloN4lsuObjlH+enAHoecTsrLPg
 cCMMSzMPwfWkj09WSVE+JJoyFCwgCDE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNSBTYWx0ZWRfXy/WIJUtLrsSh
 afSFKca85ZTEJZulxytWVDNpwA9Ypg7dOK8BYlThT/t3jnlCPPfG6Is37z/stQclci1/yc+gKzz
 1AhK3vb23OiKYlFTzEIwALp/qKiwHSs71X1FyU6f4Va94MntD36D04CL8p9zI6gfduaheE+SV+f
 7TZ6OSZupRtCP0OWRpsEmCQJ5LSoI6YyGIAM1ZdViCA8JDD4bITP65nyOVudLdgTu8lCaccAGEr
 kjcLn3lRHr3wMOw5fC2f+WShSY5/lQgSRg1nVhstuFcy5YniZA5x1ZW0ReRzw8dYqOLvXO0hcDc
 7uEni4ZBNxWiK05ybBR3U7mtR/C6P8EpAB1sHKuzf/wx3ZbT23fQ9IKUsDYRjMwfvXV8zj1gX93
 uNJVrI6owp4BC54b77o3NV6Mb4BmhrsQD0RQ0QBC8r/1WRUqHbC1610k3AFcs5ilo/FMZKZ3HMB
 ESIiW08oBA8o7PSUIeg==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85b086 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=fzXO4qjsq376CjcKnqIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: s8as8g4-Jg3fIDgL_GXuPpVHboO0v4cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190105

On 19-08-2026 00:51, Krzysztof Kozlowski wrote:
> On 18/08/2026 21:13, Krzysztof Kozlowski wrote:
>> On 17/08/2026 06:47, Ekansh Gupta wrote:
>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
>>> standardized interface for offloading computational tasks to DSPs found
>>> on Qualcomm SoCs, supporting all DSP domains.
>>>
>>> The QDA driver implements the FastRPC protocol over the DRM accel
>>> subsystem. It uses the same device-tree node structure as the existing
>>> fastrpc driver in drivers/misc/. The approach for binding the QDA driver
>>> to device-tree nodes while coexisting with the fastrpc driver is an open
>>> item described below.
>>
>> No. Grow/replace/improve existing driver instead of coming with a duplicate.
>>
>> That's a standard upstream requirement, basically given on every
>> upstreaming guide.
>>
>> Please watch old talk from Greg - "I Don’t Want Your Code!".
>>
>>>
>>> v1: https://lore.kernel.org/all/20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com/
>>> RFC: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/
>>>
>>> Changes since v1
>>> ================
>>>
>>> The v1 review raised two architectural objections and one correctness
>>> issue; all three are resolved in v2:
>>>
>>> * Christian König (dma-buf maintainer) pointed out that the imported-
>>>   buffer path silently assumed the IOMMU maps every buffer as a single
>>>   contiguous range, which is not guaranteed. v2 walks the scatterlist
>>>   and cleanly rejects non-contiguous imports; contiguous imports (e.g.
>>>   CMA DMA-buf heap) are accepted. (patch 11)
>>>
>>> * Dmitry Baryshkov objected to three different buffer-passing formats
>>>   in the invoke IOCTL (DMA-BUF fd, direct/inline, DMA handle). v2
>>>   passes only GEM handles; userspace imports any fd to a GEM handle
>>>   with DRM_IOCTL_PRIME_FD_TO_HANDLE before invoking. Packing and
>>>   overlap handling are left to userspace. (patch 12)
>>>
>>> * The memory manager (patch 07) used a fixed 16-entry array without
>>>   justification and leaked the device descriptor on teardown. v2
>>>   allocates the array from the DT context-bank count (as Dmitry
>>>   suggested) and frees it correctly.
>>>
>>> User-space staging branch
>>> =========================
>>> https://github.com/qualcomm/fastrpc/tree/accel/staging
>>>
>>> Key Features
>>> ============
>>>
>>> * Standard DRM accelerator interface via /dev/accel/accelN
>>> * GEM-based buffer management with DMA-BUF import (PRIME)
>>> * IOMMU-based memory isolation using per-process context banks
>>> * FastRPC protocol implementation for DSP communication
>>> * RPMsg transport layer for reliable message passing
>>> * Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
>>> * DRM IOCTL interface for DSP session management, buffer allocation,
>>>   and remote procedure invocation
>>>
>>> Architecture
>>> ============
>>>
>>> 1. DRM Accelerator Framework Integration
>>>    The driver registers as a DRM accel device, exposing a standard
>>>    /dev/accel/accelN character device node. This provides established
>>>    DRM infrastructure for device management, file operations, and
>>>    IOCTL dispatch.
>>>
>>> 2. Memory Management
>>>    Buffers are managed as GEM objects with PRIME support for DMA-BUF
>>>    import. This enables buffer sharing with other DRM drivers (GPU,
>>>    camera, video) using standard kernel mechanisms. Only contiguous
>>>    imports are accepted; the driver verifies contiguity at import time
>>>    rather than assuming it.
>>>
>>> 3. IOMMU Context Bank Management
>>>    IOMMU context banks (CBs) are represented as proper struct device
>>>    instances on a custom virtual bus (qda-compute-cb). Each CB device
>>>    is registered with the IOMMU subsystem and receives its own IOMMU
>>>    domain, enabling per-session address space isolation. The custom
>>>    bus was introduced because IOMMU context banks are synthetic
>>>    constructs — not real platform devices — and to ensure CB device
>>>    lifetime is strictly subordinate to the parent QDA device.
>>>    See also: https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
>>>
>>> 4. Memory Manager Architecture
>>>    The memory manager maintains a registry of IOMMU devices in an
>>>    array sized to the number of context banks described in the device
>>>    tree, and coordinates per-process device assignment with reference-
>>>    counted lifetime management. The DMA-coherent backend allocates
>>>    buffers with SID-prefixed DMA addresses for DSP firmware
>>>    compatibility.
>>>
>>> 5. Transport Layer
>>>    RPMsg communication is handled in a dedicated transport layer
>>>    (qda_rpmsg.c), separate from the core DRM driver logic.
>>>
>>> 6. Code Organization
>>>    The driver is organized across multiple files (~4800 lines total):
>>>    * qda_drv.c:            Core driver and DRM integration
>>>    * qda_rpmsg.c:          RPMsg transport layer
>>>    * qda_cb.c:             Context bank device management
>>>    * qda_compute_bus.c:    Custom virtual bus for CB devices
>>>    * qda_gem.c:            GEM object management
>>>    * qda_prime.c:          DMA-BUF import (PRIME)
>>>    * qda_memory_manager.c: IOMMU device registry and allocation
>>>    * qda_memory_dma.c:     DMA-coherent allocation backend
>>>    * qda_fastrpc.c:        FastRPC protocol implementation
>>>    * qda_ioctl.c:          IOCTL dispatch
>>>
>>> 7. UAPI Design
>>>    The driver exposes DRM-style IOCTLs defined in
>>>    include/uapi/drm/qda_accel.h, following DRM UAPI conventions
>>>    (__u32/__u64 types, C++ guard, GPL-2.0-only WITH Linux-syscall-note).
>>>    Buffer arguments are identified by GEM handles; the driver never
>>>    accepts DMA-BUF fds directly in any IOCTL.
>>>
>>> Patch Series Organization
>>> ==========================
>>>
>>> Patch 01:      MAINTAINERS entry
>>> Patch 02:      Driver documentation (Documentation/accel/qda/)
>>> Patches 03-04: Core driver skeleton and compute bus
>>> Patch 05:      iommu: Register qda-compute-cb bus with IOMMU subsystem
>>> Patches 06-07: CB device enumeration and memory manager
>>> Patch 08:      QUERY IOCTL and UAPI header
>>> Patches 09-11: GEM buffer management and PRIME import
>>> Patches 12-15: FastRPC protocol (invoke, session create/release,
>>>                map/unmap)
>>>
>>> Open Items
>>> ===========
>>>
>>> 1. Device-Tree Compatible String
>>>    The QDA driver uses the same device-tree node structure and
>>>    properties as the existing fastrpc driver in drivers/misc/. A
>>>    mechanism is needed to allow the QDA driver to bind to its device
>>>    node independently of the fastrpc driver.
>>>
>>>    The intended coexistence model is: platforms that require the
>>>    complete fastrpc feature set continue to use "qcom,fastrpc"; new
>>>    platforms where QDA's feature set is sufficient use a QDA-specific
>>>    compatible string. New feature development is directed toward QDA.
>>>
>>>    The options under consideration are:
>>>
>>>    a) Add a new "qcom,qda" compatible string to the existing
>>>       qcom,fastrpc.yaml binding, since the DT node structure and
>>>       properties are identical.
>> No
>>
>>>
>>>    b) Introduce a separate qcom,qda.yaml binding that references or
>>>       inherits the fastrpc binding properties.
>>
>> No
>>
>>>
>>>    Seeking guidance from DT binding maintainers on the preferred
>>>    approach.
>>
>> Grow existing driver. You do not get new driver, you do not get new
>> bindings.
>>
> 
> And this was already questioned at v1 (the true v1, not v1+1) but you
> ignored the comment.
The discussion were around compat layers in v1 patch (which is not yet
concluded) and on whether this driver is going to be an alternative or a
replacement. Please excuse be of overlooking any NAK on the true v1
series, but I can't still find it.

Thanks for your review, Krzysztof.

//Ekansh>
> Great, so here goes away trust.
> 
> NAK
> 
> Best regards,
> Krzysztof

