Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4EC4C0437
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001377; cv=none; b=KXnhojJZBl6oljj5733j7vklt7i/xWe19wdS/K0TzeVQtC3/Kj7e2LprHKUiLjg9BmUU5+0KwtVSuyhi4WPz+Q7tUZ/LJkTYPfclvKsLw4u4b2E74mhi7GdCrhfb0FSlVMXo4Eb5HpEISu6z1/XMd956TlsGR2PYV5xGcbjhfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001377; c=relaxed/simple;
	bh=3z4XGfcMy7XMqBY7hm2g5kKiNmSrO4d0V2K7Zt7b0eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kAEsR9+nJu9/IfVjSMGQJPRI2IeZdcpO7+SWmaEMrjbwodRWy8jNoizrD8TSwS6cDNqzJu1KDUbYpMK3PjLYAAz9E2hO2S1ib17XLW+Wop8f9NT/UM3iIrwj7sGtmgH4TtDkhKrUZxazwnyqmdZKUzLD+tzOcWGQyQThQrhzUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6K9hwAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KaJ/rXaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6K9hwAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KaJ/rXaJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3d7O560343
	for <linux-doc@vger.kernel.org>; Thu, 2 Jul 2026 14:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ub4zSgemoanhIjfpzZ3REv
	aC3GS2BQ2cg0OZ+TgSOUY=; b=M6K9hwAdt3NhdOrXuvY4lR1JD+h6K0UE22k5zj
	RXYnv8lOwLJ/g2oPkQqCmLaQoScYAw4tGWmbLy1MNdfRBmYvhvkBYn+k/C9S+/Pa
	RhXCIPpccA+10Z3rtQdvhT4XJS35BG3TJSZ98E9sta+/aBa4UwmOM5NPKi3XC5On
	v/twd0aUPQxcpFSzNnCIg0//vfykkRyEwKLDIWZvf25QmcjvEi7FBdIHV0bFl1La
	VwP2edckO6rJQdkKLHIhi05BrHjqprMeb0nIMhBkMpj0KDyDlvwS9WLGjT0H+Cq2
	esBa6YA246eo7S3CLCccb9IKcTNcCuJhZQPKDX35Ox5PzO0w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bh487-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 14:09:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fb51faa63so628046a91.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783001375; x=1783606175; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub4zSgemoanhIjfpzZ3REvaC3GS2BQ2cg0OZ+TgSOUY=;
        b=KaJ/rXaJUHK7fiVvFturn/2wtUH1PQD0dqu8LEVNmLtdBqj+oRDMI9SoFXUBFi5/9z
         DVJu6xEGhbg7OdncPDtBA1a0AhzXk4kF828/w60WUxh8SFjFHPNRGH4Re+sl0hbcwLy0
         bQGE2zw9CGpG3fKB1wVyE8X4l5XK9e5jz7uvHnGHAP2VrzpMSM2+UV5hISvXwRIFAtxb
         4ucAlfuSOy33Ca+v4Q+O1pN8ZYRMmFY25t3NweMkaL5HoMSu5XK4PROr7NQKiQzdP6Rp
         7xDWNZAFBXrAsmU8dBnoun95am0MeFBq6hf2hhH+K//ecN9oAiVRnrPRibDXmDo62XlF
         ahPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783001375; x=1783606175;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub4zSgemoanhIjfpzZ3REvaC3GS2BQ2cg0OZ+TgSOUY=;
        b=EtsLkz9yQ8xlwSZChUJmbfMKHzSKiK5p3pcWrspTGLT1u0v+RGnHhw2kQVfIRPnXqN
         H9gAtGKT+PUrF+ojyaLTnx9/JuRghpD7kX2rC5gteeYwELX2muk/a4r8YCqe3q69adxS
         QZfQuf5PAOO3+WgWfKUUg2dfsdX8m4hBEZwVpDzMrHPBSiZ15KbboXUccaSU4ZGS9JQ9
         9ep8oXyH3+Wc8Hfw7PIGMYScwH4xrq5pOXn3H1vgVq8+PRCSq9ws3fmmxhzg8ri6UedT
         pOgrZ1fDWlBTVaVYvFhnHufrXNn6OKk69EYi5ZVJc4Pz4QYzApl7vUGuSalJCchPaCdA
         +nKw==
X-Forwarded-Encrypted: i=1; AHgh+RrmRW/XcVyrDyrgZJkQZL6oGLlcN2p/SrQYF+0KwzFlYpNNJsIehf3mlctI2HlRkJY+gfza8fmNLJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YznWzGYlwnmhhGZMiEJJT9P7IO+NSJLHP6OEQnatn8d1t9mW3ye
	RgeXQn1X+qvYkgUv4xsBQNiBOORP71H2MnPqdAK+WsTGelxS0gZGmx3fJTQ77Kh3C6T/mTOxtl1
	2YlhQMfPUPbpKHOWl38vypfhoDPhlAz0ACmq1zLv9++Z+HQVprTkj6WPrcUYjP98=
X-Gm-Gg: AfdE7cmoBxrOhqQ4buO3mbet3oUzLdsT2T3LoPeyi7JrNDFCRyDn3v2QNjQO5YoubPM
	+SWrMgCjkhY9aBYjStzm90ayaXlb5GIBSaYk/CjEOdRRgSTUhyNIuNT3UCorOKpvaaFdzaVU40M
	SmL93TpNp+hDls9He5uZPAbYJ4EgQAlUJZs42s8BNw9CnkMy4H1m31VhQKTMNwmBQao6yXfhlD7
	fCwTTAqn4MTPSdfjeoM3l+uA6cOPPFDAvMpR+vgmUh8+Zk2/cCLlsVKcnxH2PmnBXrDtzzcoRFY
	CL0l8EI0XeY/DofIuQv82gb1O/Ez0qIkWnlH6I9PHl5H5h8FBd0K/06286BMXZTe6FMGxMM75wP
	8nEyLwmYa0CBHabLYZ8hNEf6UFSyLWOo9j8U8Q7Ay3Q==
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr57031a91.11.1783001374432;
        Thu, 02 Jul 2026 07:09:34 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr56973a91.11.1783001373904;
        Thu, 02 Jul 2026 07:09:33 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm10345928eec.21.2026.07.02.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:09:33 -0700 (PDT)
From: bibek.patro@oss.qualcomm.com
Date: Thu, 02 Jul 2026 19:39:02 +0530
Subject: [PATCH v2] swiotlb: introduce Kconfig option for compile-time
 default pool size
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-swiotlb-v2-1-9205f3ba5408@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP1wRmoC/2WNwQ6CMBBEf4Xs2RJaFBJP/ofh0NatrAGKXUAN6
 b9b8Ohlkpe8mVmBMRAynLMVAi7E5IcE6pCBbfVwR0G3xKAKVRWVrAW/yE+dEVbJk8XCqNLVkOw
 xoKP3vnRtfsyzeaCdtvpmtMSTD5/9apGb97+6SCGFNg6xdNodUV88c/6cdWd93+cpoIkxfgFbZ
 1I9twAAAA==
X-Change-ID: 20260617-swiotlb-c215ce0b23f7
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Michael Kelley <mhklinux@outlook.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Jagadeesh Pagadala <jpagadal@qti.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783001370; l=6208;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kVEbuoWJCcNQDz8pvT3LfzliuBTEakiXdTZHRmvxfbg=;
 b=TQ45i30a++5Dd9N3bkXoBr5oGg9ldelzZ4IQwDdX7HiG6PCwv2Cr6Kyqn4DwEqQfH6FT8Pg5G
 hdDvJDaSHjLBrnmoej2Sq1ZwDjp6wUurEKuhsRjorRrJYhqcdH9OkR5
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: RKUgOjDvjwJiU_sbz8pjVMmQt8cn0F2F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0OCBTYWx0ZWRfXzGTL7o1Lidb3
 1FXdAq30Q77ROnnCNmyIapYt4eiIeqrZX/ta0wZUH3/SzlC7oQr2VIqROkVXJoYAFt77/uDGlYf
 ixsx8yBcyofEhDEVv57+sZfSV1LCkjc=
X-Proofpoint-GUID: RKUgOjDvjwJiU_sbz8pjVMmQt8cn0F2F
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46711f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=07d9gI8wAAAA:8 a=ag1SF4gXAAAA:8
 a=hD80L64hAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=SP_X4jjkrvL9e0aunNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=e2CUPOnPG4QKp8I52DXD:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0OCBTYWx0ZWRfX2fy4z3wFaRwj
 mFPnhnv8kGUEMnTLQ/XChzA7KBkT6Y/3qp23NfUqTI9ZgJYfCQS6th6ldWUUgwyxcuZB0AjDCQp
 Fb2R8eZdbfUms/t4+CaApWG91jF1nPU/smsqurSpwLne8xtJmy3J4thBYoaK59vHsrcsX+k04kv
 FCkkOQRMM6p/BpY8DZOmiL0Fbg80e/o/c2+0Sjn+H2T1yhZ2ImlW4ZxzAhQOg9/9vkDS5B+zybS
 nCQbAavMEJRnnuWPkfeBPTxpDXJh7ztn469md0jvnT5631AttVdBK0HEVFjdm6LfHSGnqxD682i
 phFkwNVegE4kTQDBFnZCr6Ptk1JAADfIl+HCHS3u21Ycna6gd7tJuKGD/cD3qQg3SGz/MaKh59e
 LLWCyCECCfbANNbQXO84ei3xazg0CbWySNaCpkig+6ybI1LLfJxOaDhuQxAzRmmuMAHx7++22MH
 yEwLwex0uEyN/D2eG0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020148

From: Jagadeesh Pagadala <jpagadal@qti.qualcomm.com>

The SWIOTLB bounce buffer pool size is hardcoded at 64 MB via
IO_TLB_DEFAULT_SIZE with no compile-time knob to adjust it. On
memory-constrained embedded or mobile platforms equipped with a
hardware IOMMU (e.g., ARM SMMU) covering most DMA-capable devices,
reserving 64 MB at boot is unnecessarily wasteful — the SWIOTLB is
only exercised for devices that bypass the IOMMU or have restricted
DMA address ranges.

Introduce CONFIG_SWIOTLB_DEFAULT_SIZE_MB, an integer Kconfig option
(range 1–64 MB, default 64) that allows platforms to set a smaller
compile-time default. IO_TLB_DEFAULT_SIZE is updated to derive from
this value when CONFIG_SWIOTLB is enabled, preserving the existing
64 MB default when the option is not configured.

The runtime "swiotlb=<nslabs>" kernel parameter override remains
fully supported and takes precedence over the compile-time default.

Signed-off-by: Jagadeesh Pagadala <jpagadal@qti.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
The SWIOTLB bounce buffer pool size is hardcoded at 64 MB. On
memory-constrained platforms with a hardware IOMMU (e.g., ARM SMMU),
this reservation is wasteful as SWIOTLB is only needed for devices
that bypass the IOMMU or have restricted DMA address ranges.

Introduce CONFIG_SWIOTLB_DEFAULT_SIZE_MB (range 1–64 MB, default 64)
to allow a smaller compile-time default. The runtime "swiotlb="
parameter override remains supported and takes precedence.

Before (default 64 MB):
  [    0.000000] software IO TLB: area num 8.
  [    0.000000] software IO TLB: mapped [mem 0x00000000fbfff000-0x00000000fffff000] (64MB)

After (CONFIG_SWIOTLB_DEFAULT_SIZE_MB=1, 8 CPUs):
  [    0.000000] software IO TLB: area num 8.
  [    0.000000] software IO TLB: SWIOTLB bounce buffer size roundup to 2MB
  [    0.000000] software IO TLB: mapped [mem 0x00000000ffdff000-0x00000000fffff000] (2MB)

After (CONFIG_SWIOTLB_DEFAULT_SIZE_MB=2, 8 CPUs):
  [    0.000000] software IO TLB: area num 8.
  [    0.000000] software IO TLB: mapped [mem 0x00000000ffdff000-0x00000000fffff000] (2MB)
---
Changes in v2:
- Fix incorrect boot log label in cover letter: the roundup message is
  produced by CONFIG_SWIOTLB_DEFAULT_SIZE_MB=1 (not =2) with 8 CPUs.
- Update Documentation/core-api/swiotlb.rst to mention
  CONFIG_SWIOTLB_DEFAULT_SIZE_MB as per Michael's suggestion.
- Link to v1: https://patch.msgid.link/20260617-swiotlb-v1-1-abfee3faf4ea@oss.qualcomm.com

To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
---
 Documentation/core-api/swiotlb.rst |  7 +++++--
 include/linux/swiotlb.h            |  8 ++++++--
 kernel/dma/Kconfig                 | 22 ++++++++++++++++++++++
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/swiotlb.rst b/Documentation/core-api/swiotlb.rst
index 9e0fe027dd3b..71b4e4c27eb5 100644
--- a/Documentation/core-api/swiotlb.rst
+++ b/Documentation/core-api/swiotlb.rst
@@ -140,8 +140,11 @@ Data structures concepts
 ------------------------
 Memory used for swiotlb bounce buffers is allocated from overall system memory
 as one or more "pools". The default pool is allocated during system boot with a
-default size of 64 MiB. The default pool size may be modified with the
-"swiotlb=" kernel boot line parameter. The default size may also be adjusted
+default size of 64 MiB, which can be changed at compile time via
+CONFIG_SWIOTLB_DEFAULT_SIZE_MB. The default pool size may also be
+modified at runtime with the "swiotlb=" kernel boot line parameter,
+which takes precedence over the compile-time default. The default size
+may also be adjusted
 due to other conditions, such as running in a CoCo VM, as described above. If
 CONFIG_SWIOTLB_DYNAMIC is enabled, additional pools may be allocated later in
 the life of the system. Each pool must be a contiguous range of physical
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 3dae0f592063..1665a9ce8f94 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -32,8 +32,12 @@ struct scatterlist;
 #define IO_TLB_SHIFT 11
 #define IO_TLB_SIZE (1 << IO_TLB_SHIFT)
 
-/* default to 64MB */
-#define IO_TLB_DEFAULT_SIZE (64UL<<20)
+/* compile-time default; overridable via CONFIG_SWIOTLB_DEFAULT_SIZE_MB */
+#ifdef CONFIG_SWIOTLB
+#define IO_TLB_DEFAULT_SIZE ((unsigned long)CONFIG_SWIOTLB_DEFAULT_SIZE_MB << 20)
+#else
+#define IO_TLB_DEFAULT_SIZE (64UL << 20)
+#endif
 
 unsigned long swiotlb_size_or_default(void);
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 0a4ba21a57a7..3830a63ae032 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -86,6 +86,28 @@ config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
 
+config SWIOTLB_DEFAULT_SIZE_MB
+	int "Default SWIOTLB bounce buffer size in MB"
+	depends on SWIOTLB
+	range 1 64
+	default 64
+	help
+	  Sets the default size of the software IO TLB (SWIOTLB) bounce buffer
+	  pool allocated at boot time. The default is 64 MB.
+
+	  On memory-constrained embedded or mobile platforms (e.g., those with
+	  a hardware IOMMU such as ARM SMMU covering most DMA-capable devices),
+	  a smaller value such as 4 or 8 MB may be sufficient. The SWIOTLB is
+	  then only needed for devices that bypass the IOMMU or have restricted
+	  DMA address ranges.
+
+	  The minimum allowed value is 1 MB. This compile-time default can be
+	  overridden at runtime using the "swiotlb=<nslabs>" kernel command line
+	  parameter. Refer to Documentation/admin-guide/kernel-parameters.txt
+	  for details.
+
+	  If unsure, leave at the default value of 64.
+
 config SWIOTLB_DYNAMIC
 	bool "Dynamic allocation of DMA bounce buffers"
 	default n

---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260617-swiotlb-c215ce0b23f7

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

