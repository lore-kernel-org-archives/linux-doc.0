Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB4536AB68
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881473; cv=none; b=VRfC2qcwnqcpdE/gqvyFRowDFX39Fd5dxf9Xa2MmgB42nuMePYSC/SaEUVZWAeAzokK26d7xjhTou2CIR6Xvu7eEsA5zOX6IfHmLqJxhNP4B+sqCKRyEZ9cAmW5xezGyXal0lXhhwJYmBXKzki4U8qNsQm7apaO35BoYbPHZFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881473; c=relaxed/simple;
	bh=mcsMlkfZBrp0xwp5kW6abPbA5/MnShYN1DFsrDFrxvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xc0sm7E12tOOY0vTisp+JiTTQNtePhln0rE1IMx8fRDlNDI5AR1DVgdE3ngmoqwRpuzmPTzhqx9CgvTsC1TssVPLdpJYyuAgvbXY8UgVi89xwryA6yNe2l+C5PzhY9S1WPktj8WvsfBnVhEOrP2/4/zGZYb7iszKMo/KL0xo19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoFxN9xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfCf20zh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoFxN9xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfCf20zh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIoCiV3409247
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1FKuQnvI/JR7GzRu2Av4diW6
	kuTld28E3cs1g9PwsAw=; b=YoFxN9xdqfbroHf6OUjrfeAF5dcbf7gSGyLivvOc
	kkug/Sl/B92VQYI6SW1xgHu+pHZXEwVdpTkCTlQ2jV4IZVg3iFKd6CRtcwcg/TzD
	KGu5qcchqKgXjob0deTMRKfqx51EqgZ7MVFOOGDWxJhYVCXFCRhnasQiB7JYdn2f
	BcAn6lh6U3TIpqUSSj89ZaraZmfqJeP7rR3nnLyt8S3Z8BSG29AeXYU80fRGVz+R
	GDnZgpU2jF1LHs6R2mFCn5srpSXKzfECXKj1HcmdrFZRYC6JZZYKgkH7nr2cya0q
	hhaLZGVnm3jJb9ybOYXaYiCDyCJZWBe98V42AThT0Zw7ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tswpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:17:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so4059625485a.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771881468; x=1772486268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1FKuQnvI/JR7GzRu2Av4diW6kuTld28E3cs1g9PwsAw=;
        b=NfCf20zhS2Ip4PttkRVZV3F8HGtQ2U35VfwPO2CDklsAdL9p9wHvxDsWtw+HKbmxXI
         SbmCnsJMBlmmVy/7XvgSk3KdH1YwUkpzZZbAgNCeLkpuxVuJKboJNDeXWHNENHw0OBjF
         f6Oa+axQiAjDW2+gfR20FbXwsjzadV/dzz5u5sTNYsalxjbZ76OtHruwLrLSK+H6VINf
         VQOwKoZ05fOi58E3BctqcC8v/znR/ZGSCtWTERDGA59Sm5+7nTJ1a1Ys5CfY4rygwZRv
         fTcGGsfubaXAA74+svFdVTxpnikVPr1KZe9anOnD7TY9AD+c5Qn84NnmhVNqCkOXoUyV
         sDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771881468; x=1772486268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FKuQnvI/JR7GzRu2Av4diW6kuTld28E3cs1g9PwsAw=;
        b=t0lSqP0LTBSpg8h/1/COkTR81LNwVcKi/TZcaW/wkCKTc8xI2XtIBuFFkUc35ZgU7/
         jzAthYgOpXKFbbGy+HqCRY6/NPdRw4/sfQOqOgf8S8CkKG2BQ6+VxVwWEpoZsbqoKTJz
         VZQ3a6vLsZPgCgiqwbbJ1TJe7VG7frPWfxUwt+3/baCCnNRKFAcDKShQafdaGf421IBc
         qFSwbbaej+4eXUaHmIhGXnuB3EPAhHXfX6t0Dlzyz8Cu2wI5LR4Zi0MXVz4rnAUhU7Sw
         SP//WbVyW/B4gCECmpVpqTC25BMG6yMU/WJN1+ZwxsTqLZyjPoFOkfUbp3qlCQ+soZnf
         6Qzg==
X-Forwarded-Encrypted: i=1; AJvYcCXmYxTi4ILhsgSGxuZoG0BZkY6Dt7TyYPumXf6SkagmO07l6SiJAEyCEwmlm1GAHgMD2Ewpm9trjJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzErMXBH5ZdZzoGCgwR5EpQ4vV3b3Ei6dkD9Rce58p0D0+5uccm
	WRQ6ZD38Mk/Vt/eAlPtW0QkZGmWXeFY63cj3dIGduYx3OlAUko3ELTh0kb9v8VBDcMTtRKyHRHJ
	WhLqqUwR15wtigwQRjTFnNDiUJ8q9vyT2XQNokdnrUHYtn/VW89oi+ERF2SBtT6g=
X-Gm-Gg: AZuq6aIe99OnoTAePAAe86mTpNj4NDf7WVHi6m5jWyeGNc3eGapneXF2qvlX+r/WV2w
	IRZGQqWdsl9JIzzXTZNQbUrqhf8Ix4JIq4GIcaLwFwOgAMeRHHp+V3sdzdlu+5HUvgWzJUfqtpM
	M6eEF1qBY8m3Oi2Ce609ziG4LfVnkNe5PrlMzjgLy9WGuYFJzBJWZZDw9opCop/h973NHFKoqQt
	grI6Y6AG/Q3RrhT1VyD5J/KzKjfaQulkDdssSq0zZH1GpoL4XYxAFP/CT2GJQkjoTd5txoe5ICy
	By+H80MtvrrxhROALYysYPdhURlwAzx1Ru95mJe4KOX0j86uP0o4mmIpkPPw0aCWWnFxKM8RviT
	IlYOsytFQkGR1F//prN6CNKcgmch5KcCiz1w6Jdrc9fW4RQnigShLm/drwhxW8ddlVG9jAvYi2b
	hYzFyrU8sky+KbaBR5ua6lNTKihMc/wMZ2QOE=
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr1226695385a.7.1771881468089;
        Mon, 23 Feb 2026 13:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr1226692085a.7.1771881467537;
        Mon, 23 Feb 2026 13:17:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7aab220sm17369921fa.37.2026.02.23.13.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:17:46 -0800 (PST)
Date: Mon, 23 Feb 2026 23:17:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
Message-ID: <jyd3ufisoz4xcfe2dvu26odesaz2czj22jn46qswkzz6ocg4zu@6krzvyvirkmo>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699cc3fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKZUDU7hoNn2ThC74tMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: M_n0QiNS8pmokn2kv1jwDtYcyO6cfVQA
X-Proofpoint-GUID: M_n0QiNS8pmokn2kv1jwDtYcyO6cfVQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE4NSBTYWx0ZWRfX2dELMfkYbeBq
 Afabhg4LjsdBHteBgVHUIipQRRAZ8lCZbFcp5e9HnfCgnMggsYmDxL6C1QabklpZHc6K+INqS+m
 76fHqGeJNV4pWBGAltZ2iE5e/QgkgJlgNpENhEG6haYz+FXO+tWGvZSGOQJKglSE5W/iYQTPSCU
 TV4hbsCWybqDEiIyMYeM+PVRCBhLli3RiFb4hEJnxg14YHAftu120FqZjuf90D6PYjnH6ny+lzD
 agb4S/GOHxUto4WE2dvhhq93+ngGGGJR2zETr22bAW5t1yv7Fw9Wp7YG6HhcJ/y+KeVpa2ii1fs
 ND17cmTrxsKt6/R5GszEgVfQ/4xFIcw3lreHCmHyk7ydAIIo4Dcb+Yr09Rad6j2HRL9fY5QQ7ni
 cxk9AzgKUsRPh/f7t5TUXD3FNq1TmfSJy8RAuz4p1RD8k63X/34trLeX9mwYShNbMfiX5zEk5Tw
 LvyULL+y23BPdhxme1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230185

On Tue, Feb 24, 2026 at 12:38:55AM +0530, Ekansh Gupta wrote:
> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> integrated in the DRM accel subsystem.
> 
> The new docs introduce QDA as a DRM/accel-based implementation of
> Hexagon DSP offload that is intended as a modern alternative to the
> legacy FastRPC driver in drivers/misc. The text describes the driver
> motivation, high-level architecture and interaction with IOMMU context
> banks, GEM-based buffer management and the RPMsg transport.
> 
> The user-space facing section documents the main QDA IOCTLs used to
> establish DSP sessions, manage GEM buffer objects and invoke remote
> procedures using the FastRPC protocol, along with a typical lifecycle
> example for applications.
> 
> Finally, the driver is wired into the Compute Accelerators
> documentation index under Documentation/accel, and a brief debugging
> section shows how to enable dynamic debug for the QDA implementation.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  Documentation/accel/index.rst     |   1 +
>  Documentation/accel/qda/index.rst |  14 +++++
>  Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 144 insertions(+)
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
> index 000000000000..bce188f21117
> --- /dev/null
> +++ b/Documentation/accel/qda/index.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==============================
> + accel/qda Qualcomm DSP Driver
> +==============================
> +
> +The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
> +Signal Processors) within the DRM accelerator framework. It serves as a modern
> +replacement for the legacy FastRPC driver, offering improved resource management
> +and standard subsystem integration.
> +
> +.. toctree::
> +
> +   qda
> diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
> new file mode 100644
> index 000000000000..742159841b95
> --- /dev/null
> +++ b/Documentation/accel/qda/qda.rst
> @@ -0,0 +1,129 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==================================
> +Qualcomm Hexagon DSP (QDA) Driver
> +==================================
> +
> +Introduction
> +============
> +
> +The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
> +accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
> +interface for user-space applications to offload computational tasks ranging
> +from audio processing and sensor offload to computer vision and AI
> +inference to the Hexagon DSPs found on Qualcomm SoCs.
> +
> +This driver is designed to align with the Linux kernel's modern **Compute
> +Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
> +alternative to the legacy FastRPC driver in `drivers/misc/`, offering
> +improved resource management and better integration with standard kernel
> +subsystems.
> +
> +Motivation
> +==========
> +
> +The existing FastRPC implementation in the kernel utilizes a custom character
> +device and lacks integration with modern kernel memory management frameworks.
> +The QDA driver addresses these limitations by:
> +
> +1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
> +    management, job submission, and synchronization.
> +2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
> +    including DMA-BUF import/export capabilities.
> +3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
> +    isolation between different DSP user sessions.
> +
> +Key Features
> +============
> +
> +*   **Standard Accelerator Interface**: Exposes a standard character device
> +    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
> +*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
> +    GDSP) via a single driver architecture.
> +*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
> +    (FastRPC) protocol for communication between the application processor
> +    and DSP.
> +*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
> +    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
> +*   **Modular Design**: Clean separation between the core DRM logic, the memory
> +    manager, and the RPMsg-based transport layer.
> +
> +Architecture
> +============
> +
> +The QDA driver is composed of several modular components:
> +
> +1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
> +    and bridges the driver with the DRM accelerator subsystem.
> +2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
> +    layer that handles IOMMU context banks. It supports pluggable backends
> +    (such as DMA-coherent) to adapt to different SoC memory architectures.
> +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
> +
> +    * **`qda_gem`**: Core GEM object management, including allocation, mmap
> +      operations, and buffer lifecycle management.
> +    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
> +      enabling seamless buffer sharing with other kernel subsystems.
> +
> +4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
> +    to handle low-level message passing with the DSP firmware.
> +5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
> +    enumerate and manage the specific compute context banks defined in the
> +    device tree.

I'm really not sure if it's a bonus or not. I'm waiting for iommu-map
improvements to land to send patches reworking FastRPC CB from using
probe into being created by the main driver: it would remove some of the
possible race conditions between main driver finishing probe and the CB
devices probing in the background.

What's the actual benefit of the CB bus?

> +6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
> +    marshalling arguments and handling remote invocations.
> +
> +User-Space API
> +==============
> +
> +The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
> +to be familiar to existing FastRPC users while adhering to DRM standards.
> +
> +*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
> +    and capabilities.
> +*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
> +    domain.
> +*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.

You need to explain the difference between these two.

> +*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
> +    execution unit).
> +*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
> +*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
> +*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
> +    DSP's virtual address space.

Do we need to make this separate? Can we map/unmap buffers on their
usage? Or when they are created? I'm thinking about that the
virtualization. An alternative approach would be to merge
GET_MMAP_OFFSET with _MAP: once you map it to the DSP memory, you will
get the offset. 

> +
> +Usage Example
> +=============
> +
> +A typical lifecycle for a user-space application:
> +
> +1.  **Discovery**: Open `/dev/accel/accel*` and check
> +    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
> +    compute workloads).
> +2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
> +    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
> +3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
> +    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
> +4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
> +    functions on the DSP.
> +5.  **Cleanup**: Close file descriptors to automatically release resources and
> +    detach the session.
> +
> +Internal Implementation
> +=======================
> +
> +Memory Management
> +-----------------
> +The driver's memory manager creates virtual "IOMMU devices" that map to
> +hardware context banks. This allows the driver to manage multiple isolated
> +address spaces. The implementation currently uses a **DMA-coherent backend**
> +to ensure data consistency between the CPU and DSP without manual cache
> +maintenance in most cases.
> +
> +Debugging
> +=========
> +The driver includes extensive dynamic debug support. Enable it via the
> +kernel's dynamic debug control:
> +
> +.. code-block:: bash
> +
> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control

Please add documentation on how to build the test apps and how to load
them to the DSP.

> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
