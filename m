Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF72D238A
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 05:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780463969; cv=none; b=a1eECxywBCETnK2x9xXxufRgk/kz5BWrlL2Z8plQuZ7T2yB4kDtprRVtFWCyr7EQOVq7ZIGt0i3Bh1uFTd08Ug6PPo/xFeGMjTd3+df7bcsH5kk3LAcWQ469fDcsSjJVlfx1tw17uKS2HzAmL2R9LA7Yc6ULvnouEF53uzYLJmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780463969; c=relaxed/simple;
	bh=ernpbc8mYW3pnQ6ReVEaUvPZ/tMCJlEDj12Fyv3+pSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFfAU5zOMVranq3QPZDgw8cyA5ejN73PQawb2UePKMiNnr72Ux5ULihBV/FtJHViWan8OH10FpnSNCTnXx/NmyVQU36TcgkmqB+mm3TkOn/cQIVCYqvDFMfjan7y145614U3/7+86AztCUMu0Wb/6HVV1eAVdVgf+6rEkuhCmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tz4k9u8e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSe6Xnvi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tz4k9u8e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSe6Xnvi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652IY12A1316821
	for <linux-doc@vger.kernel.org>; Wed, 3 Jun 2026 05:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=; b=Tz4k9u8ewVkJrO5B
	99GB3NoAxaV/ZgnBI5djpO9t9CiuxBOwWbgiYZ15Dou2NkfUl8fwbVqvcH43VPdv
	CbvtGdm5wm1S3ktWSq+pyilEiuMMVToFEPobSTan3F5560/XS80pGmmVW5AVHTka
	O/8ly7e9RsUFprK66xn7pC6IE/4WSSuiMoOzXQeNBZA9BdpGzL0Ruv7bIJaWERnR
	odTUeR0vun/2F2aJVwrX5Lj/iykCVQFntqTduXCHhVjh1peZZaYQhw4J+Ygb5VP+
	qxFlqBpRupSQbHc59MIYsSyr4/NOmG4Txf3R0iRg1a5Tb03mfXePTk1nxr3pyR1o
	J6EcXQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vwc54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 05:19:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso5079073a91.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 22:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780463966; x=1781068766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=;
        b=ZSe6Xnvi78f7dpCu/YQ3dVcyz1y9UvPqCPjRXeBmuvNrME6bADNhAc8G2JvM+zsD4W
         M3md03KF7WH5LuddAH1xANrgxB1jLds+y61j1pDQr/Se4zl1wJoMNSWcoCWs8iqi9Gq3
         GwhKMcMMkHAFGUIblHf543U3pMHkX5FAWke3OiR98Qv+WyaZepqGjPhYwsVIFYAnKhae
         cPz9gX6PBn9Q6ir5///3r5BBULeWKqJraHZ/fOLhLhDYi59hg8wGVnlYFXEky5DEQ0zR
         3rM/nhnRPltXzIUbl/f1Zktbn18asrgv8tfS24hCxE4yr7Ls4OAwCEcVX2p8ean3Ib9Z
         GQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780463966; x=1781068766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOezco5+6BfmrPgKfWENo0B2DWVFkDWfjF+LxPufsWM=;
        b=kjz1WOSwSWBnKAA/inPNQ6xlHSvx7wRCXEnY3STewjzN2t/Ig7L3uvGrhjnUKSdB+u
         cukRm+8MyJQRS55b4q6Tj1+GxUdEz9DXh3acJU+EN833wuI6w19Oa4H2EmSHBsutYMG+
         n09qfpgaYDn5vlE20OrQqo00kNnnwphaqn71GfYOB9ypQxwtXP6IQg8DnWS1S83aKhiJ
         1HjSIFMmboprlHWrQrcDhT5sc1NOM9oxT0+4Swk4A7b9MDBpIeXFm3C/TLOQXipmg4P6
         3IpDarY3zsgooNsL+lxsQMuSSuJOy8sXbijBbELADPJ/k/p/9gaAFj4oMqTWNLB/ShNH
         kKcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xEs98NdJNaZ8mKZfgExylvd35jEuG5zTiveDE+aThcaYK1GQsxV1wMaBKwmd7M+cPPjNVz9INyP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4pZVsD5kxziQxPGtF5s4DDniXHpGa6Oq3Zxda/a1QxtfUT+g
	zzwUakyzWEvkS1cjc4lFIXydjNzzAHQE0B73r5XGC3rh4rvsJD/2V4IfrauNR7yOXc7OoA1w365
	qAQ4sHRyaXiDkAQP4B+LxCez8npMwOn905pwYshF/vIvJ9o7w1HXpqOMp3DCQ844=
X-Gm-Gg: Acq92OE9u8KFqG1BLWcnfLUsMaBIi4fBkPnvV9Yno5MmbWS49Va1hkznGfSlz/xmZPf
	sAM84ljfw+utXhjLM2XAc23ZsrVSVw55JETX16ZDfScFIcE7JS6ySJjT5SaU2s/RQ0N4EzO/XX3
	t1tBiq7tegpHYU7sks55roUNtyHQXoiyD+OI+D0/C8mJl16UcKuWd2VDz4VKFVpv7FoTuWGk8e7
	Rs45BrMxSu0IBesv5o182NAGF+Vv10FGunnWoevDuR6oquOJ+zBFm4opDwIj1rGfCPkydHwVBGL
	PCtrILCOWk5HxlVFEtb9SL02owYe+y8spOOslgjGI8z9FINf6KO3iUSgG1Z0g8FEAPnYcNrb52Y
	WTvX60s1kZIazqdjO529jkTjp4xI11t+pM+xCdwlCgZgSe8XfUMQz3bY+1Q+V
X-Received: by 2002:a17:90b:540c:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-36e2f3c32demr2076748a91.9.1780463966261;
        Tue, 02 Jun 2026 22:19:26 -0700 (PDT)
X-Received: by 2002:a17:90b:540c:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-36e2f3c32demr2076710a91.9.1780463965719;
        Tue, 02 Jun 2026 22:19:25 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a14485esm1695509a91.3.2026.06.02.22.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:19:25 -0700 (PDT)
Message-ID: <77511905-1dac-4605-8195-68ec770740d2@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 10:49:15 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: brIq9TXs9q9DUol6IwSNsVLavjBR1wKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA0NyBTYWx0ZWRfX4p0R0YvHeSXP
 D/hzL4PGESxGrSXXXYsMRqiZStg5Isr3VaOhFAUlztMvHFSFHAAv6cNkflmyHMycWpgi7ptKwCh
 6LeR86b7RjjQB+KyNeaJ1n83QJgnvda4pV9qWvM033Qq0WTHVFmGJ+F6MzBY1+Pzuw3wMJc8PrD
 EKEHMp3CLVdE3t4lBRcm/+zvOZReJDBKf8YFj+kphzVsOGtBhos6xEA7Ib9vspybKVgJgMNX1sH
 NFsPm2HQ4frRImSIkbDZxL22s4dCsR+4c8QYQFqlbcjCTd5R1DQ0CaFU4IQGZ8gWKORSxKm1eYK
 raxfCj9K7GubgzYCkB1RlEcZTqlE8a47lP02fsV4nYrjnoImX+7aIHD40O9daSytmgeSvjFJ9E5
 tkppRzpYNh+fC4T1AEbslqVqvVCxMT46xxqXkQ22dS7r9qLP53Chd9pTVtNchRrMs1HRD4G2+8W
 kADDEDfbGv0Jh0gbNew==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1fb95f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yE1-P__lAf5keu_9ItMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: brIq9TXs9q9DUol6IwSNsVLavjBR1wKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030047

On 20-05-2026 19:42, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
>> Documentation/accel/qda/. The documentation covers the driver
>> architecture, GEM-based buffer management, IOMMU context bank
>> isolation, and the RPMsg transport layer.
>>
>> The user-space API section describes the DRM IOCTLs for session
>> management, GEM buffer allocation, and remote procedure invocation via
>> the FastRPC protocol, along with a typical application lifecycle
>> example. Sections for dynamic debug and basic testing are also
>> included.
>>
>> Wire the new documentation into the Compute Accelerators index at
>> Documentation/accel/index.rst.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  Documentation/accel/index.rst     |   1 +
>>  Documentation/accel/qda/index.rst |  13 ++++
>>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 160 insertions(+)
>>
>> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
>> index cbc7d4c3876a..5901ea7f784c 100644
>> --- a/Documentation/accel/index.rst
>> +++ b/Documentation/accel/index.rst
>> @@ -10,4 +10,5 @@ Compute Accelerators
>>     introduction
>>     amdxdna/index
>>     qaic/index
>> +   qda/index
>>     rocket/index
>> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
>> new file mode 100644
>> index 000000000000..013400cf9c25
>> --- /dev/null
>> +++ b/Documentation/accel/qda/index.rst
>> @@ -0,0 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +==================================
>> +accel/qda Qualcomm DSP Accelerator
>> +==================================
>> +
>> +The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
>> +It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
>> +for device and buffer management.
>> +
>> +.. toctree::
>> +
>> +   qda
>> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
>> new file mode 100644
>> index 000000000000..9f49af6e6acc
>> --- /dev/null
>> +++ b/Documentation/accel/qda/qda.rst
>> @@ -0,0 +1,146 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +=====================================
>> +Qualcomm DSP Accelerator (QDA) Driver
>> +=====================================
>> +
>> +Introduction
>> +============
>> +
>> +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides a
>> +DRM accel based interface for Qualcomm DSP offload, supporting workloads
>> +such as AI inference, computer vision, audio processing, and sensor offload
>> +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM and
>> +GEM infrastructure for device and buffer management.
>> +
>> +Key Features
>> +============
>> +
>> +*   **DRM accel Interface**: Exposes a standard character device node
>> +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
>> +*   **FastRPC Protocol**: Implements the FastRPC protocol for communication
>> +    between the application processor and the DSP.
>> +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
>> +    allocation, lifecycle management, and DMA-BUF import/export.
>> +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory isolation
>> +    between different DSP user sessions.
>> +*   **Modular Design**: Clean separation between the core DRM logic, the
>> +    memory manager, and the RPMsg-based transport layer.
>> +
>> +Architecture
>> +============
>> +
>> +The QDA driver consists of several functional blocks:
>> +
>> +1.  **Core Driver (``qda_drv``)**: Manages device registration, file operations,
>> +    and DRM accel integration.
>> +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory management
>> +    layer that handles IOMMU context banks. It supports pluggable backends
>> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
>> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
>> +
>> +    * **``qda_gem``**: Core GEM object management, including allocation, mmap
>> +      operations, and buffer lifecycle management.
>> +    * **``qda_prime``**: PRIME import functionality for DMA-BUF interoperability
>> +      with other kernel subsystems.
>> +
>> +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg framework
>> +    to handle low-level message passing with the DSP firmware.
>> +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used to
>> +    enumerate and manage the specific compute context banks defined in the
>> +    device tree. The bus was introduced because IOMMU context banks (CBs) are
>> +    synthetic constructs — not real platform devices — making a platform driver
>> +    an incorrect abstraction for them. The earlier platform-driver approach also
>> +    had a race condition: device nodes were created before the RPMsg channel
>> +    resources were fully initialized, and because ``probe`` runs asynchronously,
>> +    applications could open a CB device and attempt to start a session before
>> +    the underlying transport was ready. The compute bus makes CB lifetime
>> +    explicitly subordinate to the parent QDA device, closing that window.
>> +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic for
>> +    marshalling arguments and handling remote invocations.
>> +
>> +User-Space API
>> +==============
>> +
>> +The driver exposes a set of DRM-compliant IOCTLs:
>> +
>> +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
>> +    and capabilities.
>> +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process context
>> +    on the DSP.
>> +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation (the
>> +    primary execution unit).
>> +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP usage.
>> +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memory mapping.
>> +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Map or unmap
>> +    buffers into the DSP's virtual address space. Each accepts a ``request``
>> +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGACY`` /
>> +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
>> +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).
> 
> Explain, what happens in the users don't map the buffers into the DSP
> space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
> is the difference between those two modes?
I'll add more details for this, this is specifically required when
persistent type of DSP mappings are required.>
> Would the driver benefit from using GPUVM?
I'm not exactly sure how this will fit in here, I'll check this and get
back.>
>> +
>> +Usage Example
>> +=============
>> +
>> +A typical lifecycle for a user-space application:
>> +
>> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
>> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
>> +    device node.
>> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
>> +    establish a session and create a process context on the DSP.
>> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or import
>> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
>> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass arguments and
>> +    execute functions on the DSP.
>> +5.  **Cleanup**: Close file descriptors to automatically release resources and
>> +    detach the session.
> 
> I'd have expected the description of the actual example. I.e. clone the
> app from https://the.addr, prepare clang >= NN.MM, QAIC (https://foo),
> run make, run the app, check the results. I'd remind that DRM Accel has
> a very specific requirement of having the working toolhain in the
> open-source.
ack>
>> +
>> +Internal Implementation
>> +=======================
>> +
>> +Memory Management
>> +-----------------
>> +The driver's memory manager creates virtual "IOMMU devices" that map to
>> +hardware context banks. This allows the driver to manage multiple isolated
>> +address spaces. The implementation uses a DMA-coherent backend to ensure data consistency
>> +between the CPU and DSP without manual cache maintenance in most cases.
> 
> GEM usage?
I'll add the details here.>
>> +
>> +Debugging
>> +=========
>> +The driver includes extensive dynamic debug support. Enable it via the
>> +kernel's dynamic debug control:
>> +
>> +.. code-block:: bash
>> +
>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
>> +
>> +Testing
>> +=======
>> +The QDA driver can be exercised using the ``fastrpc_test`` utility from the
>> +FastRPC userspace library. Run the test application:
> 
> pointer
ack.>
>> +
>> +.. code-block:: bash
>> +
>> +    fastrpc_test -d 3 -U 1 -t linux -a v68
>> +
>> +**Options**
>> +
>> +``-d domain``
>> +    Select the DSP domain to run on:
>> +
>> +    * ``0`` — ADSP
>> +    * ``1`` — MDSP
>> +    * ``2`` — SDSP
>> +    * ``3`` — CDSP *(default on targets with CDSP)*
>> +
>> +``-U unsigned_PD``
>> +    Select signed or unsigned protection domain:
>> +
>> +    * ``0`` — signed PD
>> +    * ``1`` — unsigned PD *(default)*
>> +
>> +``-t target``
>> +    Target platform: ``android`` or ``linux`` *(default: linux)*
>> +
>> +``-a arch_version``
>> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
>>
>> -- 
>> 2.34.1
>>
>>
> 

