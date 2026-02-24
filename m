Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27DD28DB54
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771904227; cv=none; b=ISpAwUp8giukAIuukvAQovWegagW0+9MSZi917PS2/NchHJAS5/M1DxfU6vY6ruyTxXw2PtDOqcL+RdiysOy48hwOVaP9tJQqO/UiSCJr6tuMKUpnTjOX/lnV/kaO8VpWzzJjiyIptxoejQ1eRxuyfu1FSsBjfcgs8yXZjlk6xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771904227; c=relaxed/simple;
	bh=fgDMbbkI8c+IXWYQUxakbEd5u70YDPxmzyTBK+g2NqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cB1/B+JO282dMoRwxZWP5ZZmV/VHWjl0nW6fUBMMnXMgQKcE2GvmALdNlKcaCM1vNP0WVmNGNFjRYY4mnbkHsIy60jyu8yOyKA00rXoEYCHISbdPa2wCGRRePQS4VxwOaGUSMfwweh6mQG9YgMnl6fXewtfMpOtrk5w7ZkXeIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkItp+hZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcDel+PG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkItp+hZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcDel+PG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3V3Qt1143302
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2l9aRmZj0T3UtEEuTkL5ERwtdDS5Px9+WLhMqRSs00=; b=GkItp+hZuCm7WH05
	9p964bScqVkdP7mpzqpRQLQpf6CKx9M6RASUUONCZqsfXbXjSLY/wugfcwq25HhN
	GJr8i5wbmron6tpNfiCF1I5DahUpqDmzP2dmecvuqESQXN11VWXOiwmE7k5swyQ5
	bL3ZGB02wgHrrW9vjmixmHXiiHZUHNX8TINyPjDBmQl9KJX2BDnO/zk1sH0OCYLC
	EU4qe5eOClK3cB/QgD7xTsQ3Wjr8tGHNNLCtBpPYqr8+WgmVgQiO3GujLr71Wxol
	H5QcqwC/FGetiJ5KEdKbJC4Tx5aS4glANr33tMSKfhOe0Yxg9ZlShES6wyYEnKb7
	0bSg8Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch45680f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:37:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso19359367c88.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771904224; x=1772509024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2l9aRmZj0T3UtEEuTkL5ERwtdDS5Px9+WLhMqRSs00=;
        b=HcDel+PGISsAr8aDupbUqXTppiPW+S/hdOcdW5Nl/yp8MDyyIR9Bb0jkKuCQbnSrQp
         B0oqrBSNCszpfaPIJm+1k2owSFPfNUI0cRSxQHGfZ0iI25LDDc2oI1g8FA0sEmannM6t
         633feEjZSR5jLi5bpWozpP3REJBBwv/YJI7+HB0Ca+/3Iq5AuqSTDGcpAmoQO3p91T3R
         NGV2rzjgS5uQhCnoXMNJs+FDKs6iGffNvcystXygTJYJQL7rxZiVO88kYsmg2lXHGLte
         nieoYuytF+pf6OFQRe6KGp1Ut0USRdq9eznaS296urMe/oDpGjEkCU3iUmwY//a1fNZJ
         AtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771904224; x=1772509024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2l9aRmZj0T3UtEEuTkL5ERwtdDS5Px9+WLhMqRSs00=;
        b=FRb0BAAfvuV0Moy71s9TF0ibrH00+5nptQ/dn6+XyEPmr+cgsdZInvhN/4Nx8lWChO
         3RrMEy9ZZz2mziRZ2UAHwBc7A15ZTJs8+b8ON03297ByVp+fxUiS05r1BczkzIeeh30v
         74HJGSV8uiEKBKIAvLZsTgAyQ11avyP9xweJS5DnfGXZLgvrFZz/sxu2GwjHgbBumhiI
         +SSmfD56/QRgFHzBcxjQMcpfA4MfCiDcs+G9dekotmpsLc4eabkGdoXmVo3sD27x7vi3
         oqICafYBrcFMOqvwumNAQGRbSKNgIftzY304uN+JeHfsCpev6eye/r7XvjkldJ+rMBdi
         F+HA==
X-Forwarded-Encrypted: i=1; AJvYcCVOR5JYi3fUrM3N+6RIfrSVyTSWS7xWcbTk/Q1ByE2WevmOwnqWsPwUuWFn8nrTekAC02CDPBEp86o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeJcRBpq/eMrsqGKrfGdsEdm5NjYuIzQX/K9Fod0IkNi03QaF
	YtXTmF0hlUSMvcivf78vGbrfBv75LttkyNuvasDs0sMOOzL/WphE8op6EZ3TZh1iiuU0wJAK00/
	f4yPXX4EM5hFrvm8lDvLFG5FhgMJyCwt//JqD+rXThcnGBR00vkS8ztv0Xx2zisw=
X-Gm-Gg: AZuq6aJ2DguY7P+TJLqbQdbIzFeAipI6Ckrvv6Dca3h8qq3tlKrfo13QhbGsaxlr/Kt
	NKkMN4ZCPp2cJiWGrF8A1FuAAkpSftlzq2wNy+7Deuvn/Eq9Mxj5brmC3g+7Kxp1xwN3cKN8kqZ
	H527etNlsWZ5TFu9jsRVmbtOPGhMx6/OjtPK/GlSiprDNXXeMbVD1r7AAEcCPgWaSQyPouoDyFE
	88IkF3PocTEoiv8+3FQmmWVbq6gE46Ho8X44g5AarrhmmoFSr2XnJUCbJv2E9687TM9AXlm1zg1
	9pWUzM/ZIW3W/8jt+41ORlJYiXzsEfVhRGao1zihukXlNxb+gumknxmggBc4/T00B6nx7NNep1S
	cNaxvvzAUNjSpPr2GDo3gSQKvawxvsa+fXkUd/ggA4kYATL1ZeLWb3dI=
X-Received: by 2002:a05:7022:50b:b0:123:3461:99be with SMTP id a92af1059eb24-1276ad1a7e6mr5039289c88.21.1771904223538;
        Mon, 23 Feb 2026 19:37:03 -0800 (PST)
X-Received: by 2002:a05:7022:50b:b0:123:3461:99be with SMTP id a92af1059eb24-1276ad1a7e6mr5039276c88.21.1771904222879;
        Mon, 23 Feb 2026 19:37:02 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm10169712c88.8.2026.02.23.19.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 19:37:02 -0800 (PST)
Message-ID: <333632f8-7cb5-419c-ba46-4dbe4d21ea60@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:37:00 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xWVJPe4VgXMHGJ27jpe7gr2AzCROdgxa
X-Proofpoint-ORIG-GUID: xWVJPe4VgXMHGJ27jpe7gr2AzCROdgxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOCBTYWx0ZWRfX2i3vNTY9tptx
 KJXqL/zA8In9peP4ZEVw3rbzgS56CT292Iuflwf/rh9MavhkwCzgkUZ2fHYeFzl8EuA8RG82ZB/
 cQwcBNEGHeWqqzXR8FcUbQEgm4WSlLFkVGl4HIz8mYlrsoiY5IjV5yTIsLUHY0OvnVAtl+HTB8n
 JJ4uz19/5+XqTXH4/ftgobZPbkcO5yXo5Qt+5inlBWB6RXnIAfAKU3Gz+h52/ElxzhdEGq2Z0+h
 O8/b9MrVpaIp03+frjhze/mMhF4N9GuigRxn8APxJZo0TQi843yoRZUv7Mk/1rDogsBNSZnuqb9
 2IX8kP3bksi8ZBna8MNztjT7WouhiycmTbPicE2QSSxYUURUjokY9oCzW5mhDROlWoFGboixK+A
 r0MaXAryACSzHC4muvSREX7hMRkt0yiBRy8rwyFvggVEDn8sjugW+xU06FD7CMutZKz1NjMUDhh
 FIXW+fZN5txhbsPlfzA==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d1ce0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D19gQVrFAAAA:8
 a=hgqkG84HdUBTOHwo2Y0A:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240028

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
> a modern DRM-based accelerator implementation for Qualcomm Hexagon DSPs.
> The driver provides a standardized interface for offloading computational
> tasks to DSPs found on Qualcomm SoCs, supporting all DSP domains (ADSP,
> CDSP, SDSP, GDSP).
> 
> The QDA driver is designed as an alternative for the FastRPC driver

alternative or replacement? are you going to keep both drivers? 

> in drivers/misc/, offering improved resource management, better integration
> with standard kernel subsystems, and alignment with the Linux kernel's
> Compute Accelerators framework.
> 
> User-space staging branch
> ============
> https://github.com/qualcomm/fastrpc/tree/accel/staging
> 
> Key Features
> ============
> 
> * Standard DRM accelerator interface via /dev/accel/accelN
> * GEM-based buffer management with DMA-BUF import/export support
> * IOMMU-based memory isolation using per-process context banks
> * FastRPC protocol implementation for DSP communication
> * RPMsg transport layer for reliable message passing
> * Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
> * Comprehensive IOCTL interface for DSP operations
> 
> High-Level Architecture Differences with Existing FastRPC Driver
> =================================================================
> 
> The QDA driver represents a significant architectural departure from the
> existing FastRPC driver (drivers/misc/fastrpc.c), addressing several key
> limitations while maintaining protocol compatibility:
> 
> 1. DRM Accelerator Framework Integration
>   - FastRPC: Custom character device (/dev/fastrpc-*)
>   - QDA: Standard DRM accel device (/dev/accel/accelN)
>   - Benefit: Leverages established DRM infrastructure for device
>     management.
> 
> 2. Memory Management
>   - FastRPC: Custom memory allocator with ION/DMA-BUF integration
>   - QDA: Native GEM objects with full PRIME support
>   - Benefit: Seamless buffer sharing using standard DRM mechanisms
> 
> 3. IOMMU Context Bank Management
>   - FastRPC: Direct IOMMU domain manipulation, limited isolation
>   - QDA: Custom compute bus (qda_cb_bus_type) with proper device model
>   - Benefit: Each CB device is a proper struct device with IOMMU group
>     support, enabling better isolation and resource tracking.
>   - https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
> 
> 4. Memory Manager Architecture
>   - FastRPC: Monolithic allocator
>   - QDA: Pluggable memory manager with backend abstraction
>   - Benefit: Currently uses DMA-coherent backend, easily extensible for
>     future memory types (e.g., carveout, CMA)
> 
> 5. Transport Layer
>   - FastRPC: Direct RPMsg integration in core driver
>   - QDA: Abstracted transport layer (qda_rpmsg.c)
>   - Benefit: Clean separation of concerns, easier to add alternative
>     transports if needed
> 
> 8. Code Organization
>   - FastRPC: ~3000 lines in single file
>   - QDA: Modular design across multiple files (~4600 lines total)
>     * qda_drv.c: Core driver and DRM integration
>     * qda_gem.c: GEM object management
>     * qda_memory_manager.c: Memory and IOMMU management
>     * qda_fastrpc.c: FastRPC protocol implementation
>     * qda_rpmsg.c: Transport layer
>     * qda_cb.c: Context bank device management
>   - Benefit: Better maintainability, clearer separation of concerns
> 
> 9. UAPI Design
>   - FastRPC: Custom IOCTL interface
>   - QDA: DRM-style IOCTLs with proper versioning support
>   - Benefit: Follows DRM conventions, easier userspace integration
> 
> 10. Documentation
>   - FastRPC: Minimal in-tree documentation
>   - QDA: Comprehensive documentation in Documentation/accel/qda/
>   - Benefit: Better developer experience, clearer API contracts
> 
> 11. Buffer Reference Mechanism
>   - FastRPC: Uses buffer file descriptors (FDs) for all book-keeping
>     in both kernel and DSP
>   - QDA: Uses GEM handles for kernel-side management, providing better
>     integration with DRM subsystem
>   - Benefit: Leverages DRM GEM infrastructure for reference counting,
>     lifetime management, and integration with other DRM components
> 
> Key Technical Improvements
> ===========================
> 
> * Proper device model: CB devices are real struct device instances on a
>   custom bus, enabling proper IOMMU group management and power management
>   integration
> 
> * Reference-counted IOMMU devices: Multiple file descriptors from the same
>   process share a single IOMMU device, reducing overhead
> 
> * GEM-based buffer lifecycle: Automatic cleanup via DRM GEM reference
>   counting, eliminating many resource leak scenarios
> 
> * Modular memory backends: The memory manager supports pluggable backends,
>   currently implementing DMA-coherent allocations with SID-prefixed
>   addresses for DSP firmware
> 
> * Context-based invocation tracking: XArray-based context management with
>   proper synchronization and cleanup
> 
> Patch Series Organization
> ==========================
> 
> Patches 1-2:   Driver skeleton and documentation
> Patches 3-6:   RPMsg transport and IOMMU/CB infrastructure
> Patches 7-9:   DRM device registration and basic IOCTL
> Patches 10-12: GEM buffer management and PRIME support
> Patches 13-17: FastRPC protocol implementation (attach, invoke, create,
>                map/unmap)
> Patch 18:      MAINTAINERS entry
> 
> Open Items
> ===========
> 
> The following items are identified as open items:
> 
> 1. Privilege Level Management
>   - Currently, daemon processes and user processes have the same access
>     level as both use the same accel device node. This needs to be
>     addressed as daemons attach to privileged DSP PDs and require
>     higher privilege levels for system-level operations
>   - Seeking guidance on the best approach: separate device nodes,
>     capability-based checks, or DRM master/authentication mechanisms
> 
> 2. UAPI Compatibility Layer
>   - Add UAPI compat layer to facilitate migration of client applications
>     from existing FastRPC UAPI to the new QDA accel driver UAPI,
>     ensuring smooth transition for existing userspace code
>   - Seeking guidance on implementation approach: in-kernel translation
>     layer, userspace wrapper library, or hybrid solution
> 
> 3. Documentation Improvements
>   - Add detailed IOCTL usage examples
>   - Document DSP firmware interface requirements
>   - Create migration guide from existing FastRPC
> 
> 4. Per-Domain Memory Allocation
>   - Develop new userspace API to support memory allocation on a per
>     domain basis, enabling domain-specific memory management and
>     optimization
> 
> 5. Audio and Sensors PD Support
>   - The current patch series does not handle Audio PD and Sensors PD
>     functionalities. These specialized protection domains require
>     additional support for real-time constraints and power management
> 
> Interface Compatibility
> ========================
> 
> The QDA driver maintains compatibility with existing FastRPC infrastructure:
> 
> * Device Tree Bindings: The driver uses the same device tree bindings as
>   the existing FastRPC driver, ensuring no changes are required to device
>   tree sources. The "qcom,fastrpc" compatible string and child node
>   structure remain unchanged.
> 
> * Userspace Interface: While the driver provides a new DRM-based UAPI,
>   the underlying FastRPC protocol and DSP firmware interface remain
>   compatible. This ensures that DSP firmware and libraries continue to
>   work without modification.
> 
> * Migration Path: The modular design allows for gradual migration, where
>   both drivers can coexist during the transition period. Applications can
>   be migrated incrementally to the new UAPI with the help of the planned
>   compatibility layer.
> 
> References
> ==========
> 
> Previous discussions on this migration:
> - https://lkml.org/lkml/2024/6/24/479
> - https://lkml.org/lkml/2024/6/21/1252
> 
> Testing
> =======
> 
> The driver has been tested on Qualcomm platforms with:
> - Basic FastRPC attach/release operations
> - DSP process creation and initialization
> - Memory mapping/unmapping operations
> - Dynamic invocation with various buffer types
> - GEM buffer allocation and mmap
> - PRIME buffer import from other subsystems
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Ekansh Gupta (18):
>       accel/qda: Add Qualcomm QDA DSP accelerator driver docs
>       accel/qda: Add Qualcomm DSP accelerator driver skeleton
>       accel/qda: Add RPMsg transport for Qualcomm DSP accelerator
>       accel/qda: Add built-in compute CB bus for QDA and integrate with IOMMU
>       accel/qda: Create compute CB devices on QDA compute bus
>       accel/qda: Add memory manager for CB devices
>       accel/qda: Add DRM accel device registration for QDA driver
>       accel/qda: Add per-file DRM context and open/close handling
>       accel/qda: Add QUERY IOCTL and basic QDA UAPI header
>       accel/qda: Add DMA-backed GEM objects and memory manager integration
>       accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET IOCTLs
>       accel/qda: Add PRIME dma-buf import support
>       accel/qda: Add initial FastRPC attach and release support
>       accel/qda: Add FastRPC dynamic invocation support
>       accel/qda: Add FastRPC DSP process creation support
>       accel/qda: Add FastRPC-based DSP memory mapping support
>       accel/qda: Add FastRPC-based DSP memory unmapping support
>       MAINTAINERS: Add MAINTAINERS entry for QDA driver
> 
>  Documentation/accel/index.rst          |    1 +
>  Documentation/accel/qda/index.rst      |   14 +
>  Documentation/accel/qda/qda.rst        |  129 ++++
>  MAINTAINERS                            |    9 +
>  arch/arm64/configs/defconfig           |    2 +
>  drivers/accel/Kconfig                  |    1 +
>  drivers/accel/Makefile                 |    2 +
>  drivers/accel/qda/Kconfig              |   35 ++
>  drivers/accel/qda/Makefile             |   19 +
>  drivers/accel/qda/qda_cb.c             |  182 ++++++
>  drivers/accel/qda/qda_cb.h             |   26 +
>  drivers/accel/qda/qda_compute_bus.c    |   23 +
>  drivers/accel/qda/qda_drv.c            |  375 ++++++++++++
>  drivers/accel/qda/qda_drv.h            |  171 ++++++
>  drivers/accel/qda/qda_fastrpc.c        | 1002 ++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_fastrpc.h        |  433 ++++++++++++++
>  drivers/accel/qda/qda_gem.c            |  211 +++++++
>  drivers/accel/qda/qda_gem.h            |  103 ++++
>  drivers/accel/qda/qda_ioctl.c          |  271 +++++++++
>  drivers/accel/qda/qda_ioctl.h          |  118 ++++
>  drivers/accel/qda/qda_memory_dma.c     |   91 +++
>  drivers/accel/qda/qda_memory_dma.h     |   46 ++
>  drivers/accel/qda/qda_memory_manager.c |  382 ++++++++++++
>  drivers/accel/qda/qda_memory_manager.h |  148 +++++
>  drivers/accel/qda/qda_prime.c          |  194 +++++++
>  drivers/accel/qda/qda_prime.h          |   43 ++
>  drivers/accel/qda/qda_rpmsg.c          |  327 +++++++++++
>  drivers/accel/qda/qda_rpmsg.h          |   57 ++
>  drivers/iommu/iommu.c                  |    4 +
>  include/linux/qda_compute_bus.h        |   22 +
>  include/uapi/drm/qda_accel.h           |  224 +++++++
>  31 files changed, 4665 insertions(+)
> ---
> base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
> change-id: 20260223-qda-firstpost-4ab05249e2cc
> 
> Best regards,

