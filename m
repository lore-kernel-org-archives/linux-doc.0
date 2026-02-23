Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD6236AB60
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873780; cv=none; b=EnAl9TmcxIl4kVX7tDINBjCRrvduUY52iMJ2NBaHDFwTnRgGZqIdHEzfZClp4HInFhYFfC8XIAqVrFgLM39xdOlebpuBlZZReKMfP3RYTPSisj9/c9/2IJjo5fzQNaDWphLfH0k4yXK49zgIpRNLVT9+kYUEiOPy2d6h3mjq5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873780; c=relaxed/simple;
	bh=Iw0hzhN8TNwgA9xnHeYqChSsZ5/vTjuUaVZUYGjv0iQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZ8T7YNoS8bwku7BcW2BCpMxUYuvuBnx60ZABKDn2qS+SneCeNnwxZa9c3ax/oMwbdDsqi+uiI1LtAGJnObJmJTaQePU2K9kGyXSKvw8xhTbjKISuEkX4I/HAEmRLpWUwPUgmzyYu1Scg3GnV5JuBRPFMvu+MiUuXtjyM2gj1AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdNsNsWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7vOr3oF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdNsNsWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7vOr3oF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRV271640979
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=; b=XdNsNsWvxZaLB+WO
	1c9je4mRHs9lemIwzNeVaBTfpwvKr7B0M6jAGIFkItnEmwzraStnPI+eLsvh+Xg1
	9tqJOYWOtxI5zGygqqarte6g8YKv1SPyRAjTJDK/H1eUgLiAWwJbOlM+R5ZVO7Gu
	Zlidsi74Xn3WIUeJeLdS6qj+zGxJeuJaICoHVkiD27kVX2tzYfA0ZOwCh1kXu4+5
	JXAy4aZ6r6X+Z6maQBc488mYwlT3XgqPa5XsPeu0Kvlf54tMIfsLd/itCow9x1rM
	D5dq7NJNCG/xoZz2ALOSMmFhUqbSS2og4rxeBOS6jyP69+IusIvhhoGOhRfkNw7B
	1fcYwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rhc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:09:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76f2d7744so51012195ad.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 11:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873777; x=1772478577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=;
        b=Y7vOr3oFBu6loEOhL60SwpqQNEmwKz8hQI987ebowlzT/RYI+p2mVQ7J4Lm78wFUlQ
         i3nhGnTafB2r/yOvNqLgtAX6iZsRLAETP+9OIdvdj+93R76HuMcfIoxELmOLBho7tPAy
         itCe4+kllW6TC0hqO4HtEwgW3htFjyzDzgvuaofd7D7lc/eBozWBjikfLd8zCGg9TnEB
         k+HsbsnurM4XiEwNGd+vL2mjBuUVtYBxiT65MrxlAXRGo/i9i3j3QmrM3lmEAcdIWvrA
         ecFldb1ctXW3jZWq/GDuI4YZLBxU6EeWh3gbV7RFkOJHllNG9k25gJYmqTBDMCZR5fY8
         tLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873777; x=1772478577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=;
        b=SVWUVn9+8wz2VW9zgkDgJ9J0uG1oq6qtEqDZCOhhMiBm8qQkkuJGNxxDVm2ZKwd7hN
         KsmIWJFPbOlxu0rRBOpdW6HAo0GbnHr9MeAI/7//FxrGvim1ja9mAe/Qwr6NHmaC/+wT
         twLyQ3d5Rtl2+9e4kY+KSG3R1B6yXmKbD+MDlIhrNMDV1PwB+CmalZn6dKSS9QLekWak
         Cuq+ZBYJ7kng72EW9+6v/50y6zTM+ULJn9Xc6Hkw6MSmFYTBg/zq9OyWtP6JMHXya57Z
         1+JwOIpwtf2LBKHZEM8XHZYIB38BnHq24WV2gLaCidfzfy5qMhir9MD7F7EA4wdI9ZQZ
         2hQg==
X-Forwarded-Encrypted: i=1; AJvYcCVtq7R+ZUgJtXYD0h5s6odgu5191sDkloQfinsSI4WiXlc08t50BVucnS5HCjpYI5X3b39mpINCFkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH0O1zOPenESs/nhnKrkKfkdCgK55adQv5TbCBzyqkHSeUIEFa
	o13Tkoq3XFvqUu26oSgTLuPocJBajI+zP0V8HArfGzd9l2CcZI+ctoLNX4iZoGd4S5GJuXAsuim
	64gVBCEddiYJ0QoELcYT02aBWdIdA4z5UbBQNt3h4/LQEyF0wQGGSw104Kph+QFQ=
X-Gm-Gg: ATEYQzwfNetd8TyHAQxsCC0ZDGQa+IzjNL7Fc873Rkoiw343EfCULKcCRFbufShMyOj
	vn4jB/iNwPhSA03+CH8GBQjVSjLO0YctEpQuDl/zQOhRObpG9qdOCAi5UvKCYcTWdDZhg3QndYQ
	fICaB1z8XAvUPcIvgy7JlQgqt5a091XMWaMfsWU1/BNa0n492Q21X8b0++n2Ia4OlpVcNoRsVnv
	BnthX4LvhqLWcMQ85p+vma5d1AgmoUHnr5glnNf+F1050Azojk0J7joqjBCftKL1/t4WIvjxiET
	mSkUmhIJ+nUT4S3daQEO11tZpJfYAjoo06YqC2wodW/19qIyTNtQnoXXhjk8ScdCwQz8pC230sW
	cP+0rut/9KdsCfGLCsScA4tMM9XAWx6EObZtIayh2Xikpm3YNEkwbxg==
X-Received: by 2002:a17:902:ce0c:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2ad7447b9a3mr88580415ad.25.1771873776713;
        Mon, 23 Feb 2026 11:09:36 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2ad7447b9a3mr88580215ad.25.1771873776239;
        Mon, 23 Feb 2026 11:09:36 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:09:35 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:56 +0530
Subject: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=4540;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Iw0hzhN8TNwgA9xnHeYqChSsZ5/vTjuUaVZUYGjv0iQ=;
 b=6mfusuznwiKRoFz7lqPVV796aoLzrrTOSWeY7E+k/o91H+68GH9DCi4JNH+MgsD4WTZjhKMWZ
 rfXsJyoI0+sBQzXiPtXlgnu8MwGhwyzA7WTUYFVKS2pm+ZpHc4bQxcZ
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: HdbhhuL9rSJ3kyTEnTj_gQnj8TTF4pQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX0L/ZgXbvNJCa
 PmPDPLuYlUMqmfqisYujJCBbYo9LZBMLcskX2mNuT5X6T2B+EFAXnNd9nFsd0bOTPzW7DLBxbo3
 RELthqmlDIzSaQs9QDKHB0xRLAoRkFCzM8GZ0VvxVGAQr3qFYVlv1ewifLRimUuTO3RWPOdWjfD
 +hip6FgpJ5mjsDyB5vc6qxBxd1AHhvUQ+Q7uxp1Mio6ZIwRtnORce9aBG0Lg72rLfrSeO/RPOPW
 0ElSaiU12ZA/cTr5/E6JBKo2XP9Ixp+Eohku7z3+Fv4+9pcnMYJB2n6hqMoXd8zLmztUOC8AFVV
 NZXW44ptLLJZ5Q+qnNsKAi49EYqO9v+PXn6VZ5Q+SnxvVBRUoA3CwzoW5Gi2QozOodydyva79uM
 k0t3GExQVbgiNX/7tqHMj7gf14vLJHyjI7/0TKWB2UOjbIODwPee2uRTHRxJURwRFjSgt5sm4TE
 sH7kE9jRvwsNNVzkO6g==
X-Proofpoint-GUID: HdbhhuL9rSJ3kyTEnTj_gQnj8TTF4pQp
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699ca5f1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YXnACfkLeW4vfmpQHhcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166

This patch introduces the initial scaffolding for the Qualcomm DSP
accelerator (QDA) driver under drivers/accel/.
The new Kconfig option DRM_ACCEL_QDA integrates the driver with the
DRM/accel subsystem, and the accel Makefile is updated to build the
driver as a loadable module. A minimal qda_drv.c file is added to
provide basic module_init/module_exit hooks so that the driver can be
built and loaded.

Subsequent patches will add:

- RPMSG-based communication with Qualcomm Hexagon DSPs
- FastRPC integration for userspace offload
- DMA-BUF support and memory management
- GEM, PRIME and IOCTL interfaces for compute job submission

This patch only wires up the basic driver framework and does not yet
provide functional DSP offload capabilities.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/Kconfig       |  1 +
 drivers/accel/Makefile      |  1 +
 drivers/accel/qda/Kconfig   | 29 +++++++++++++++++++++++++++++
 drivers/accel/qda/Makefile  |  8 ++++++++
 drivers/accel/qda/qda_drv.c | 22 ++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf2..74ac0f71bc9d 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/qda/Kconfig"
 source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..58c08dd5f389 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
 obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
new file mode 100644
index 000000000000..3c78ff6189e0
--- /dev/null
+++ b/drivers/accel/qda/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm DSP accelerator driver
+#
+
+config DRM_ACCEL_QDA
+	tristate "Qualcomm DSP accelerator"
+	depends on DRM_ACCEL
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
+	  This driver provides a standardized interface for offloading computational
+	  tasks to the DSP, including audio processing, sensor offload, computer
+	  vision, and AI inference workloads.
+
+	  The driver supports all DSP domains (ADSP, CDSP, SDSP, GDSP) and
+	  implements the FastRPC protocol for communication between the application
+	  processor and DSP. It integrates with the Linux kernel's Compute
+	  Accelerators subsystem (drivers/accel/) and provides a modern alternative
+	  to the legacy FastRPC driver found in drivers/misc/.
+
+	  Key features include DMA-BUF interoperability for seamless buffer sharing
+	  with other multimedia subsystems, IOMMU-based memory isolation, and
+	  standard DRM IOCTLs for device management and job submission.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qda.
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
new file mode 100644
index 000000000000..573711af1d28
--- /dev/null
+++ b/drivers/accel/qda/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for Qualcomm DSP accelerator driver
+#
+
+obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
+
+qda-y := qda_drv.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
new file mode 100644
index 000000000000..18b0d3fb1598
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/kernel.h>
+
+static int __init qda_core_init(void)
+{
+	pr_info("QDA: driver initialization complete\n");
+	return 0;
+}
+
+static void __exit qda_core_exit(void)
+{
+	pr_info("QDA: driver exit complete\n");
+}
+
+module_init(qda_core_init);
+module_exit(qda_core_exit);
+
+MODULE_AUTHOR("Qualcomm AI Infra Team");
+MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

