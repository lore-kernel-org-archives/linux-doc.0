Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117403E9C11
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286349; cv=none; b=POXuv+zcdz14YPFiYT8RTVRAoFoEj2pkPUkpMeJI5hbGSKJL4/nOE5f/ejhDUoKYH+YoMB9KvWnzzNuBbyxy0gCR2OJ4E/K6gvu0hUANoFhdBYERWn12SpvkRWjkIXmUXC4rfeGINbPFHVVSdYFMZrkbSBf5/lowZ9Oq5hmUTCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286349; c=relaxed/simple;
	bh=phSB63IMl2A6TqoNdQoL+sK0co7BbyjOBYGwKZxoYCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iffFCuys4KvP5/n1s6eo4K6Isq5T8U7vxysZKrJyCI89p1EYrSWkZKxR80C/5tzOFd8jePdJwc8paTZbILAUTtw90pjY1MrpLkJ/jss5A+fOXOb458PAc6ThXk9JMSqwUy1gpfnuOvax6rtQ5M91db2pVjFpxJKZ07WwbB64skQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSDgISG+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fySq+QkB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSDgISG+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fySq+QkB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCUB8X1725558
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fjc/US0eOmCaq8NJVQ5/t7CluwSHuURJ7uN+zaRxrGg=; b=cSDgISG+AOhCmG7R
	DKix72vBfFMmRS7S5JLtuxJgxQ5rA/o91om6pqfXovLaO82aNU3pJLEx7Gv0w3Ug
	qklISnqIKD1ip2d4rvBvU+6XC7jC9BWp+gRYSFso1oPY6GoHyKUX47jeqU9hr37g
	8pWE99iqikCzwkoGHLhOJd11rwpLAsHX9X/w7Lek/kn7r5oD+xRa0sJXoOVy/WnM
	NV+qkDCcoAS8bHvgs08mfpJZKKDCqHndlwYjJWsFwgx1my1puF+DciEmUIXIs2rN
	km8/aItafF6gKi9C0DxV81h2ZXVjN04qiOwEdHsHyj4VN2y+BPsuO4z755cJEnAz
	b6Bgdg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn349-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:12:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57539ff73cbso11207771e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286344; x=1779891144; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fjc/US0eOmCaq8NJVQ5/t7CluwSHuURJ7uN+zaRxrGg=;
        b=fySq+QkBHyvfVg5TFo8gpI8HkNM1Ng/1QHz4IuPGOzl+MfRG2xXAUQIAz9DeOpSbB9
         dHOgYxdxOci0YXFqZ6lk70dv3WLnWbh+diDXc9nfGvlwS21keFRhWlc4TKjQPQYeg9ps
         zV0WxZScCrIjhfRqTnweZP7UqDcROFXSv4OR4uWlD8llItO53gBt2XR+Pf9FoTA7Rxcj
         0/ykAYAc/2/KASmS1rm15MEdEEeAb/oUz5eqwudT7R2aFAbj66jg+i49UIMU/1E0Aj8S
         rUtKS6rnGB0ehHauCOB07bqZKVopvHhpYzci5DOG8Oaj0vgJAtqBXCVLVCo5IS6tOfYC
         fyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286344; x=1779891144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fjc/US0eOmCaq8NJVQ5/t7CluwSHuURJ7uN+zaRxrGg=;
        b=GtyDS0UyNKbzGNbgvAZIUN6HXxIcWSIRxkQKgjwpttNb6xjQu0Z0zg03B31wwBEHwt
         ZByr2fBvSiUCkMBmqHBulzhtUinqLES3WHFIMvh9itAjyItVQGERDCRCf180lvcs/75/
         kgk9ScT+JwgXCGXjpAWG54drrG19DC00+JF2poh7mYU3u7PI+fmtWrQuxpUKgdTn1pSJ
         KZzj9VDKrtUHq6TGonLd3A1kblpTwhSMBZjoa/g3uv42PUVA4DN+c2qAWIX3Sabax9np
         vdJo6z6K2zoF6pb53U934TzM8GhpmSzHNZEWypE8k4+w8RlVRr+Ou1UDeBxv37gA5+Vz
         x+yQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+/AJwmACnvGLzFntBuOEos9FaZjfimPMyE1PLzpjTZVsBiU8FQKkcX+t1a4vFqEAg3o5cVV7qQHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynaecTaYGaeXj4tllkEclY0mHWtADHb0pr8LFpVjwv6a/2a2dt
	p7sloHv0FGldfbivSUTEm7g25NM8ObYAU8cws2KvrDABvSxsqYCZqRm+zAnWs3C4JJ0sQSwGQa7
	E63xhbpKDm3qqU4HHyIdGeIF3BPQ2dnTQ24U1nnaTLEtAc7JP+jOmMb8rKU0V4tY=
X-Gm-Gg: Acq92OFyuGQajer/HyqR+Vv0UkU5llr9G45avA0Rj3gQimghD15O3K0fJe2/nqSBDxT
	POQmwpOOqUILAM6B0sVyzRqedUqZ5iNHmUEWobDcuqz6fjgjzMM2EgY7LVrcXYG9JpPlzYrZ5pZ
	naWYMMRZRxnd1tq4n3SRYMxFboWYN8E3sRigw/wKVcgJXKNyZcaYuBV5VcEEPupSzBLypVBkjOm
	+LuBnIgE35OnzzXWs3pLJXbvLv/UGNdnTZUsjiJjegU5Xl/HW9DREjIBlG+il/vrzFm5ugpswmw
	PK/UxaehkNVRLfcIFGlenm/W6TmvdnCelyMUSXRQlgKo7ngi+RxFV4Q1dv54zJhmNvSv55BwUvn
	+flroBW5NDvGvD5qSTVK5UbDJzRo3HbVsPaN3uA4kar6sYwfnumgFbV7JzRbLre2lYMY1IRlcEZ
	DYBGVEMqHuUSen9aRSagSeeF8bNLboR/QbXRI=
X-Received: by 2002:a05:6122:2676:b0:57d:6d56:11ff with SMTP id 71dfb90a1353d-57d6d56133cmr2372261e0c.9.1779286343934;
        Wed, 20 May 2026 07:12:23 -0700 (PDT)
X-Received: by 2002:a05:6122:2676:b0:57d:6d56:11ff with SMTP id 71dfb90a1353d-57d6d56133cmr2372208e0c.9.1779286343311;
        Wed, 20 May 2026 07:12:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cec52sm4960154e87.72.2026.05.20.07.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:12:22 -0700 (PDT)
Date: Wed, 20 May 2026 17:12:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
Message-ID: <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOCBTYWx0ZWRfX8SHQ95liMu8p
 gqtVU/qVRmIpb5DhOHUwRyfFjgTMSnx/XTJulv5L0Zvgr5KMZTzj7/naPzRawSPLzrwymvQm6iM
 U5S6jkFfozTouvWgsXeVGHeejNhocU4afgtutFD+D3RFOCrnlaaSnaaXGHm5LpZCANKu14YzZue
 4y88LwtYH7w3PA761ZJw539EWiS4gPRtV6MAewTkFIkLeZcsLuBSM/3olXNEllHr6pfziiRm+Q8
 gsKmznxEQsWlRULAS8QTXWNj+1A0a8oNQWsCIe2wpXxkbpHU4xlKKpzt3/1Odwxa5zOVyJHCZhT
 WJiXTBaYrXnJTCJYg4+V+Ht7GeXig4WUM8JGUh1BVoNkYLm0VM+glbuSs8dnDllWOzwbC4asVwW
 pTMQMEf8Pljr49eYjdtYWCGIBOyCf0AJfvLyQbHVWVEtjwFm6VICYuMUgrGQWRq2qq2tM7UZksz
 AJ8e8+BNrAU+np4y4rQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dc149 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=x97SpM1XRKmEcGPL2ZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: c2wDIQwNojJ78t4mje8xdF83-TYbMTiV
X-Proofpoint-ORIG-GUID: c2wDIQwNojJ78t4mje8xdF83-TYbMTiV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200138

On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
> Documentation/accel/qda/. The documentation covers the driver
> architecture, GEM-based buffer management, IOMMU context bank
> isolation, and the RPMsg transport layer.
> 
> The user-space API section describes the DRM IOCTLs for session
> management, GEM buffer allocation, and remote procedure invocation via
> the FastRPC protocol, along with a typical application lifecycle
> example. Sections for dynamic debug and basic testing are also
> included.
> 
> Wire the new documentation into the Compute Accelerators index at
> Documentation/accel/index.rst.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  Documentation/accel/index.rst     |   1 +
>  Documentation/accel/qda/index.rst |  13 ++++
>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 160 insertions(+)
> 
> diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
> index cbc7d4c3876a..5901ea7f784c 100644
> --- a/Documentation/accel/index.rst
> +++ b/Documentation/accel/index.rst
> @@ -10,4 +10,5 @@ Compute Accelerators
>     introduction
>     amdxdna/index
>     qaic/index
> +   qda/index
>     rocket/index
> diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
> new file mode 100644
> index 000000000000..013400cf9c25
> --- /dev/null
> +++ b/Documentation/accel/qda/index.rst
> @@ -0,0 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==================================
> +accel/qda Qualcomm DSP Accelerator
> +==================================
> +
> +The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
> +It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
> +for device and buffer management.
> +
> +.. toctree::
> +
> +   qda
> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
> new file mode 100644
> index 000000000000..9f49af6e6acc
> --- /dev/null
> +++ b/Documentation/accel/qda/qda.rst
> @@ -0,0 +1,146 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=====================================
> +Qualcomm DSP Accelerator (QDA) Driver
> +=====================================
> +
> +Introduction
> +============
> +
> +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides a
> +DRM accel based interface for Qualcomm DSP offload, supporting workloads
> +such as AI inference, computer vision, audio processing, and sensor offload
> +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM and
> +GEM infrastructure for device and buffer management.
> +
> +Key Features
> +============
> +
> +*   **DRM accel Interface**: Exposes a standard character device node
> +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
> +*   **FastRPC Protocol**: Implements the FastRPC protocol for communication
> +    between the application processor and the DSP.
> +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
> +    allocation, lifecycle management, and DMA-BUF import/export.
> +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory isolation
> +    between different DSP user sessions.
> +*   **Modular Design**: Clean separation between the core DRM logic, the
> +    memory manager, and the RPMsg-based transport layer.
> +
> +Architecture
> +============
> +
> +The QDA driver consists of several functional blocks:
> +
> +1.  **Core Driver (``qda_drv``)**: Manages device registration, file operations,
> +    and DRM accel integration.
> +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory management
> +    layer that handles IOMMU context banks. It supports pluggable backends
> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
> +
> +    * **``qda_gem``**: Core GEM object management, including allocation, mmap
> +      operations, and buffer lifecycle management.
> +    * **``qda_prime``**: PRIME import functionality for DMA-BUF interoperability
> +      with other kernel subsystems.
> +
> +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg framework
> +    to handle low-level message passing with the DSP firmware.
> +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used to
> +    enumerate and manage the specific compute context banks defined in the
> +    device tree. The bus was introduced because IOMMU context banks (CBs) are
> +    synthetic constructs — not real platform devices — making a platform driver
> +    an incorrect abstraction for them. The earlier platform-driver approach also
> +    had a race condition: device nodes were created before the RPMsg channel
> +    resources were fully initialized, and because ``probe`` runs asynchronously,
> +    applications could open a CB device and attempt to start a session before
> +    the underlying transport was ready. The compute bus makes CB lifetime
> +    explicitly subordinate to the parent QDA device, closing that window.
> +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic for
> +    marshalling arguments and handling remote invocations.
> +
> +User-Space API
> +==============
> +
> +The driver exposes a set of DRM-compliant IOCTLs:
> +
> +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
> +    and capabilities.
> +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process context
> +    on the DSP.
> +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation (the
> +    primary execution unit).
> +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP usage.
> +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memory mapping.
> +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Map or unmap
> +    buffers into the DSP's virtual address space. Each accepts a ``request``
> +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGACY`` /
> +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
> +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).

Explain, what happens in the users don't map the buffers into the DSP
space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
is the difference between those two modes?

Would the driver benefit from using GPUVM?

> +
> +Usage Example
> +=============
> +
> +A typical lifecycle for a user-space application:
> +
> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
> +    device node.
> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
> +    establish a session and create a process context on the DSP.
> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or import
> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass arguments and
> +    execute functions on the DSP.
> +5.  **Cleanup**: Close file descriptors to automatically release resources and
> +    detach the session.

I'd have expected the description of the actual example. I.e. clone the
app from https://the.addr, prepare clang >= NN.MM, QAIC (https://foo),
run make, run the app, check the results. I'd remind that DRM Accel has
a very specific requirement of having the working toolhain in the
open-source.

> +
> +Internal Implementation
> +=======================
> +
> +Memory Management
> +-----------------
> +The driver's memory manager creates virtual "IOMMU devices" that map to
> +hardware context banks. This allows the driver to manage multiple isolated
> +address spaces. The implementation uses a DMA-coherent backend to ensure data consistency
> +between the CPU and DSP without manual cache maintenance in most cases.

GEM usage?

> +
> +Debugging
> +=========
> +The driver includes extensive dynamic debug support. Enable it via the
> +kernel's dynamic debug control:
> +
> +.. code-block:: bash
> +
> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control
> +
> +Testing
> +=======
> +The QDA driver can be exercised using the ``fastrpc_test`` utility from the
> +FastRPC userspace library. Run the test application:

pointer

> +
> +.. code-block:: bash
> +
> +    fastrpc_test -d 3 -U 1 -t linux -a v68
> +
> +**Options**
> +
> +``-d domain``
> +    Select the DSP domain to run on:
> +
> +    * ``0`` — ADSP
> +    * ``1`` — MDSP
> +    * ``2`` — SDSP
> +    * ``3`` — CDSP *(default on targets with CDSP)*
> +
> +``-U unsigned_PD``
> +    Select signed or unsigned protection domain:
> +
> +    * ``0`` — signed PD
> +    * ``1`` — unsigned PD *(default)*
> +
> +``-t target``
> +    Target platform: ``android`` or ``linux`` *(default: linux)*
> +
> +``-a arch_version``
> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
