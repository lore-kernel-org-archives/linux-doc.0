Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA8375F96
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 05:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464163; cv=none; b=hFnKKJK+6Ow+uqMZLskkJGTIpHhz2V8LTZ8zReOfqcpfVDLW+Ch1kUog0QGITwZ7Y/23iIsUwCtVAZutcbL5PMQIymtzchvIYI3GerBF2lqKE5D3oOb4g/Im4DltdbH82a7XVqsPQDMnhvjk+2YJaPdjLKGvCMaXxGeXZN4HAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464163; c=relaxed/simple;
	bh=IHlNOx2u9RjdKNB0FvSrv1ifBrP1Oexh3O2W41Os9SI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7IsZpYocd7dxL5az3jkyBv3xEl3v5nYPJqx5qAuuOy14BBb0livsVLuWtE2pl3Jo37MVmkKFXwSd+R20oq9kEWRmc4fefvDg36XzlEm2vbMmPvkeoyHOq7kvYsaH30weemj+fHwoEzrEFZ4wG6x8VRdBNdVgvZgrC0v7T2dBiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bz4g0mOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOmT6xiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bz4g0mOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOmT6xiO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652NJUZV3302622
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 05:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4apj65DJiSqJHn1+surZiEdopCJDEvIR6E6yf1J3f8k=; b=Bz4g0mOG1L5kTl0F
	v/yspg6vTGPVLHC5Rn6kp+l1tQldIBBwPt4uOLiZoDrumw7DmxQOFFtP3YMzkPGr
	hRB6uHLewPOlLVJir+yV+XZeAKDkOniIN2yw3xHV+6NVtVaN6IfgtfMIo58j9V+m
	o+khF1upABbERcMQbyIEDPHAhV7X0k3UCHF0eOkm0A22nM6NXd9sWZma4N3qvblc
	fUUVWDLzWHnkJnhBwn6Y/KEUxHtB1201x719i/66+aJu14mHRGPf8BBxFtjIQe2t
	H/DmtAwIPMe1MFg9B/CJwYXqRZPSUazR3iVeeQzb37GJ6WlJP4AhzFtfi2dBnxDj
	+5xI+g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18murt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 05:22:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a366b61fso2315862a12.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780464160; x=1781068960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4apj65DJiSqJHn1+surZiEdopCJDEvIR6E6yf1J3f8k=;
        b=QOmT6xiOI58MUn23Tk0t80gScc5oE+nt6G8t0rOQmuYwyEtK8V9hvqW2BtTIoytqa2
         vlDPyUOQrroWH+55ahw0A2QipNCt7YuOBEMM8fVstImIyLZsHzeOMUKlD23wGowhfQBh
         voFtv1p4xo6HrnVtnhxJsc+mmFpNsY9z1LHLSYckmZEDSvvqOXidW5aSRvjOf0jqMVVK
         TdlanWsvZbMoXcLQtaX4GdjT9WUCyg/PgtfGXfGzxuNxiKi7xWWbFSQMH2JKqqxRjE5L
         QSu0y+P4IdTfOaa1yvJ/y11n+GDJYWG5jckVno5shk3NEXPKJJOMnKJ0F2v0ZbrYD0vN
         3fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780464160; x=1781068960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4apj65DJiSqJHn1+surZiEdopCJDEvIR6E6yf1J3f8k=;
        b=WMZhebPtrYzhvliIm+AfvNmMHMwb+t2Rw3IsrUAMvUTPviNRLuwe5+DMOsu33hcVGj
         fei5SNHpK7JR+BfStbsb9MIoKyEZ5KKvsxo6zlR2k8B1jNaV6arRvy3MI+UC+HsCltop
         kDxwuDYTgJ2k1JBYKj3/7vHlOCNlQfLowXHvLn5qwoi1B5n4QTZvTgJQuTyYzSjJ4qXj
         jOlyfEPFXequwfqlVkWaS0V6yV3CvpDA1IZYG18C0YoUgKOJ6a4hoTJ7fXgzUklcemd0
         zcn9xJj8NBbfx7HFgRTgmFzimaYe/+Tv61kjuJu3aSv9TZZDz4tLOxDCbjfKJCBpa8JM
         bhnA==
X-Forwarded-Encrypted: i=1; AFNElJ8sfK+p0NBiA+fNa4GFFVWbfsQrP6rIIrB70t1P/k/GTn52D3u71LOKKmFZCdawfnZVqX7wG46LNm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy569EsXu3aajFBJslBA+uvG9ZLQqYjhQZjhS8dSukGWQu26X7l
	J8pNhhArTqH4lByu3PGn+63uUNmNlaI64ekk/ydBQzitXNjbux4Wr4acqsUQC9rVjNcyR+nfUd/
	NLqb2ZMDeUCUkUBlHKFQVL3YSiNI4uUjxsYTzZpP2TTfJ0eEmfrdYvLEoyP/v67M=
X-Gm-Gg: Acq92OE4shzRvmq2HoM8/ObJ6O8Giqq7Dco4Gkm2mul66t31xkUJl8sC6fS9HfDi2vx
	jCUAVkQsYQWJcJZa4VtLB1hbRhKzzPyFgK9wkxmL9DCqOFXAI/aLGfve46qedRLDV5mPb9RnDUj
	DXYtL0CVcgUuoQT8Uu+GtKn1F8uIGvNAcH/ZhgPAFTtz3NXn64Zw4FIKsx3GVJRGX0OmSCuA5Ly
	I9YDNrVwnYpKthPndgQAU8/A+dIpWc5ub4E1iI8RtslALV/DDlileeK7FjBqlMMQH2ak3kX6x2h
	8ivZhuB+koDqvmlM1MUCpdJ2KdkiE7222Tdb0LM+cH9so5tgwYnvo8KuVJhNRkU21njQ4/CktQp
	clKY6F2P8daAjo1oqEtUMNBMnna742fU8/H6udVF90ugkd4YmZuBgurzk4cns
X-Received: by 2002:a17:903:384d:b0:2c0:ca99:3d8b with SMTP id d9443c01a7336-2c1646ee9ffmr20964015ad.40.1780464159576;
        Tue, 02 Jun 2026 22:22:39 -0700 (PDT)
X-Received: by 2002:a17:903:384d:b0:2c0:ca99:3d8b with SMTP id d9443c01a7336-2c1646ee9ffmr20963525ad.40.1780464158991;
        Tue, 02 Jun 2026 22:22:38 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm10928475ad.3.2026.06.02.22.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:22:38 -0700 (PDT)
Message-ID: <9879f670-8a23-407b-ab45-673904ad4a86@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 10:52:29 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com>
 <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
 <CAPsqS2Tt0JbHhJLHBsbJ2YfZW913WNfoSXpSa+8TD1T9CV8V3g@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAPsqS2Tt0JbHhJLHBsbJ2YfZW913WNfoSXpSa+8TD1T9CV8V3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1fba20 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8 a=jjORMhuGWfTR70FdTIQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA0OCBTYWx0ZWRfX6JHF3KxzkKBJ
 nMt2fxlfvI9aL99pKO6kSn1V2UJhRxtsv6/mviBeARb1XHXdH8PURsj/qzAIOtZKFU9xKcODsd8
 WlsA71dxFQ7J36yKxeJc/9f9ef6lTLnJyJFImPPDoLS8yKV3t8TSdUSSPVQxAJwNR3KzzGOpKAd
 nRAP5dlIOt8vISTwYyz674KuhYCSL272vqwtWdhAozSkZggBWGmI13hsKgjLPdwwFqJkYfspxsp
 VSlK+s9emDnKOamobLWv51wik8+06XASuyNdUUa1dC5Fk8IUAzNjP/mW+noGnsu4EN/GDu4xnOr
 If5ZzQBvzJi4bdWa0r9PApuLvVoVSNj8BHVRWWuiU1GIGb8sjhf4hOqHM0YKRKlLZZ7T8bqgA3J
 tncny08BXDGZIrEP9tGLMTrpsPJMpjnVlRwPjHMmpU+DQU7NZ49Ic8YvUtJcYSGzStjKJL75Pxg
 pNhPtSDf5LIRS9ouvqg==
X-Proofpoint-GUID: Z47Dc1IY9sgqoddj6XdeqBCHdWgXFvHa
X-Proofpoint-ORIG-GUID: Z47Dc1IY9sgqoddj6XdeqBCHdWgXFvHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030048

On 20-05-2026 21:17, Tomeu Vizoso wrote:
> On Wed, May 20, 2026 at 4:12 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote:
>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>
>>> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
>>> Documentation/accel/qda/. The documentation covers the driver
>>> architecture, GEM-based buffer management, IOMMU context bank
>>> isolation, and the RPMsg transport layer.
>>>
>>> The user-space API section describes the DRM IOCTLs for session
>>> management, GEM buffer allocation, and remote procedure invocation via
>>> the FastRPC protocol, along with a typical application lifecycle
>>> example. Sections for dynamic debug and basic testing are also
>>> included.
>>>
>>> Wire the new documentation into the Compute Accelerators index at
>>> Documentation/accel/index.rst.
>>>
>>> Assisted-by: Claude:claude-4-6-sonnet
>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>> ---
>>>  Documentation/accel/index.rst     |   1 +
>>>  Documentation/accel/qda/index.rst |  13 ++++
>>>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 160 insertions(+)
>>>
>>> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
>>> index cbc7d4c3876a..5901ea7f784c 100644
>>> --- a/Documentation/accel/index.rst
>>> +++ b/Documentation/accel/index.rst
>>> @@ -10,4 +10,5 @@ Compute Accelerators
>>>     introduction
>>>     amdxdna/index
>>>     qaic/index
>>> +   qda/index
>>>     rocket/index
>>> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
>>> new file mode 100644
>>> index 000000000000..013400cf9c25
>>> --- /dev/null
>>> +++ b/Documentation/accel/qda/index.rst
>>> @@ -0,0 +1,13 @@
>>> +.. SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +==================================
>>> +accel/qda Qualcomm DSP Accelerator
>>> +==================================
>>> +
>>> +The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
>>> +It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
>>> +for device and buffer management.
>>> +
>>> +.. toctree::
>>> +
>>> +   qda
>>> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
>>> new file mode 100644
>>> index 000000000000..9f49af6e6acc
>>> --- /dev/null
>>> +++ b/Documentation/accel/qda/qda.rst
>>> @@ -0,0 +1,146 @@
>>> +.. SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +=====================================
>>> +Qualcomm DSP Accelerator (QDA) Driver
>>> +=====================================
>>> +
>>> +Introduction
>>> +============
>>> +
>>> +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides a
>>> +DRM accel based interface for Qualcomm DSP offload, supporting workloads
>>> +such as AI inference, computer vision, audio processing, and sensor offload
>>> +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM and
>>> +GEM infrastructure for device and buffer management.
>>> +
>>> +Key Features
>>> +============
>>> +
>>> +*   **DRM accel Interface**: Exposes a standard character device node
>>> +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
>>> +*   **FastRPC Protocol**: Implements the FastRPC protocol for communication
>>> +    between the application processor and the DSP.
>>> +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
>>> +    allocation, lifecycle management, and DMA-BUF import/export.
>>> +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory isolation
>>> +    between different DSP user sessions.
>>> +*   **Modular Design**: Clean separation between the core DRM logic, the
>>> +    memory manager, and the RPMsg-based transport layer.
>>> +
>>> +Architecture
>>> +============
>>> +
>>> +The QDA driver consists of several functional blocks:
>>> +
>>> +1.  **Core Driver (``qda_drv``)**: Manages device registration, file operations,
>>> +    and DRM accel integration.
>>> +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory management
>>> +    layer that handles IOMMU context banks. It supports pluggable backends
>>> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
>>> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
>>> +
>>> +    * **``qda_gem``**: Core GEM object management, including allocation, mmap
>>> +      operations, and buffer lifecycle management.
>>> +    * **``qda_prime``**: PRIME import functionality for DMA-BUF interoperability
>>> +      with other kernel subsystems.
>>> +
>>> +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg framework
>>> +    to handle low-level message passing with the DSP firmware.
>>> +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used to
>>> +    enumerate and manage the specific compute context banks defined in the
>>> +    device tree. The bus was introduced because IOMMU context banks (CBs) are
>>> +    synthetic constructs — not real platform devices — making a platform driver
>>> +    an incorrect abstraction for them. The earlier platform-driver approach also
>>> +    had a race condition: device nodes were created before the RPMsg channel
>>> +    resources were fully initialized, and because ``probe`` runs asynchronously,
>>> +    applications could open a CB device and attempt to start a session before
>>> +    the underlying transport was ready. The compute bus makes CB lifetime
>>> +    explicitly subordinate to the parent QDA device, closing that window.
>>> +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic for
>>> +    marshalling arguments and handling remote invocations.
>>> +
>>> +User-Space API
>>> +==============
>>> +
>>> +The driver exposes a set of DRM-compliant IOCTLs:
>>> +
>>> +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
>>> +    and capabilities.
>>> +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process context
>>> +    on the DSP.
>>> +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation (the
>>> +    primary execution unit).
>>> +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP usage.
>>> +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memory mapping.
>>> +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Map or unmap
>>> +    buffers into the DSP's virtual address space. Each accepts a ``request``
>>> +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGACY`` /
>>> +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
>>> +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).
>>
>> Explain, what happens in the users don't map the buffers into the DSP
>> space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
>> is the difference between those two modes?
>>
>> Would the driver benefit from using GPUVM?
>>
>>> +
>>> +Usage Example
>>> +=============
>>> +
>>> +A typical lifecycle for a user-space application:
>>> +
>>> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
>>> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
>>> +    device node.
>>> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
>>> +    establish a session and create a process context on the DSP.
>>> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or import
>>> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
>>> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass arguments and
>>> +    execute functions on the DSP.
>>> +5.  **Cleanup**: Close file descriptors to automatically release resources and
>>> +    detach the session.
>>
>> I'd have expected the description of the actual example. I.e. clone the
>> app from https://the.addr, prepare clang >= NN.MM, QAIC (https://foo),
>> run make, run the app, check the results. I'd remind that DRM Accel has
>> a very specific requirement of having the working toolhain in the
>> open-source.
> 
> We have been getting submissions lately that don't fulfill that
> requirement so I will point to the precise part of the documentation
> that explains it:
> 
> https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> For an example of a submissions that complies, see:
> 
> https://lore.kernel.org/dri-devel/20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net/
> 
> Most importantly, notice how the proposed Thames Mesa driver generates
> machine code for all the hardware units, and doesn't use any blob for
> that.
> 
I believe QDA checks all boxes for accel, as there is available
opensource userspace, opensource QAIC compiler for IDL compilation and
LLVM supports hexagon arch.

I'll try adding these details as well.

Thanks!> Regards,
> 
> Tomeu
> 
>>> +
>>> +Internal Implementation
>>> +=======================
>>> +
>>> +Memory Management
>>> +-----------------
>>> +The driver's memory manager creates virtual "IOMMU devices" that map to
>>> +hardware context banks. This allows the driver to manage multiple isolated
>>> +address spaces. The implementation uses a DMA-coherent backend to ensure data consistency
>>> +between the CPU and DSP without manual cache maintenance in most cases.
>>
>> GEM usage?
>>
>>> +
>>> +Debugging
>>> +=========
>>> +The driver includes extensive dynamic debug support. Enable it via the
>>> +kernel's dynamic debug control:
>>> +
>>> +.. code-block:: bash
>>> +
>>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
>>> +
>>> +Testing
>>> +=======
>>> +The QDA driver can be exercised using the ``fastrpc_test`` utility from the
>>> +FastRPC userspace library. Run the test application:
>>
>> pointer
>>
>>> +
>>> +.. code-block:: bash
>>> +
>>> +    fastrpc_test -d 3 -U 1 -t linux -a v68
>>> +
>>> +**Options**
>>> +
>>> +``-d domain``
>>> +    Select the DSP domain to run on:
>>> +
>>> +    * ``0`` — ADSP
>>> +    * ``1`` — MDSP
>>> +    * ``2`` — SDSP
>>> +    * ``3`` — CDSP *(default on targets with CDSP)*
>>> +
>>> +``-U unsigned_PD``
>>> +    Select signed or unsigned protection domain:
>>> +
>>> +    * ``0`` — signed PD
>>> +    * ``1`` — unsigned PD *(default)*
>>> +
>>> +``-t target``
>>> +    Target platform: ``android`` or ``linux`` *(default: linux)*
>>> +
>>> +``-a arch_version``
>>> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>
>> --
>> With best wishes
>> Dmitry

