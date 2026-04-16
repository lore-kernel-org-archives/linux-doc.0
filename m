Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2C383C64
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348614; cv=none; b=u64tP+65ugG+0u30Sh2C+Uok+D2JDQoOZj7qnoVX6o6AoTb6GC5QVIEBWcaHqiRYH3+8Xtn0GuiJ0Rjuld0TaTB+tznWC6ipI9mxHN7XXf9aFRp+8BeCQVst0mU8EnPi/W1V/xZLtJ0+1tmqKvJF5Yf1n0r9hC8Ni0WKB0c/KpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348614; c=relaxed/simple;
	bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCJD0ro2TeEAs4s8eHCLo6p+mSrm8IO+Na3B1c+reYJDhoxu2OwJx+Io/qY0PhjDr+10iCPq+MGhfJ7ecWoIXZhUk5i9smg1Ydsw/hV9RT2OvJS9VbrUj1BC2nUyucTJpa8tsW1MqPKj5+Z/Aa1z2VvTYJJl2lqDox7u+Ryn8rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wi5LYv24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1sFHRaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wi5LYv24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1sFHRaf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9DGdH1553115
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=; b=Wi5LYv24L2Ke16ql
	qrqz8yStjLRrhnlnod+4GLrSyMDWKgi0/zShk5LR92dtCtH/KLO0vGpByB5rl3eR
	cX0KgVAx2vCc/XVGJ32H+fwVmpy6LnjEaWeX8A/7W6/L0yPhQ1VB6X4+0geH0G8w
	v3Mq2a2RgXLf3nwu7P5Vs8qAP1wPOpaCdOe8Tj919JpROUqzHEbq4s7q6sa2xzQl
	0qspG3BJBLj1oxVE1RLUriKhpIE17cB5xvqOGcNm38nZD4Vdqbs5S8FxMgOSkQgv
	/D3JTtflcx5ezuP7t27rOmlJsX7IPX5gFL3JQmvblLzbRkaINGSimM3g1rykBivO
	xlOstg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn9yfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:10 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6507a833e63so16759615d50.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348608; x=1776953408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=S1sFHRafdA54KWVafaKCTbPTx55N+wL7h1J+Q8C25Wie1hatZMFtp+2iogSIbmzeZO
         nMzFhUxIJ5gbg774/+sJ4C5h0RiTCLSo2M7HFHpEuatKwmUY1yblntzon1ApUrdHLHX8
         HFzX2Cb0TD31lAALJ3RGyAfL2XIPWL+PpCnZsZo4eXzkLTWuwKG1FxZo+BvX+arG09tU
         xIJ30p3+bZbFMMNvo0wJQUB98nplJ40il/8SgKk1+tLjFVqhWT9xAcMA0LhNhH7TfD34
         m/EOcOW5gcydwKWPyRBuKmujGQXLVCQ3K2UbcmjvLUrER6+FBhd3pwBaas3cYuINeOc4
         usxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348608; x=1776953408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9CGLii7+KdkxqW5GSTDgBYsnFCYt35AgEJQIXwVb6iw=;
        b=HIWq9SwLQDut1ApTYcjyZLz50TSfD48+FXK/cUYhNWVvCgUoRsUcEONBgLa6YibE4F
         dLEvmUa1ws6z8CRqIpP29lhTtCKjJoBPyvpSD3XjkKtSVWEszctKCxYlcXo/cPCk0PiA
         VigWo1FWYI7tSBsSEuDTFltOXyuB5mliM9BEOulEmAmitngiWPtO60t2lPfMlS7dY/c2
         HFWaT60Mb00mRcvaA/KfH59YoiyktxCFWmgr5xaOevoLUEpYKP17oahauOrYhXrgVMqn
         H2V1/++7N7ZURee2KlJwTbWiI7Nk2m2tf2S/FO4xMGH48IKAQRGE6w3OTVJSqM0aYD2V
         938w==
X-Gm-Message-State: AOJu0Yy4Tulk33Xtk8Uwo4E6baDFuTWLLFxoe/M7agsvaHpZ/lXGJxXM
	yFGb18s9muvvLnBO9kfMECVQ3gsiOP83uZynYWZm+lPVILcjDCUx0D+p/hFSrIFMnTgi5V2YhQ4
	TNqWhOL+DF6ILZ+A2WTmFy5Je2nbQzphdA34ms4IEVAfoRChoczuvTJbMkByFf5k=
X-Gm-Gg: AeBDietC0oKnYJky0pkhzNfzNxxdLL7Mm9JrVN9CRswAzqzoeRCOtuVAxyKyx2oYNz5
	ccVDsTNbvMtoq/Ft2TnijSAimlpxUL1eWYklcL273tntfdgTsdKTS/WkzzdG6zr7cIa9d8qLP9d
	S/juWiEBXQ/6ZJKkbCRh+DLfF7R700FH8vp7b+455x3h6uDe6PW3b3EB8i6qY26NzB+uwj3KZrb
	THoy/9oTxt999NZY8jDNIRwt7ZFCfFUruUup0UXtt3KIotxtczRDjwqbNX/Ek2yJm8Z/KxGj4JY
	wlRYfj0ErO/ZuypwGrgkwkUGf0r0T9/gDK5sWwsZpRid184LP/a2vW4ldmXMvhv4KCP8SxuOoyJ
	tuOYF4GinSsKBB1yZJnXIZzvaa5YgkT47dsDxscKsVogDIhfANwo=
X-Received: by 2002:a05:690e:ec4:b0:650:7b5b:ed00 with SMTP id 956f58d0204a3-65198a82f55mr19690048d50.23.1776348607834;
        Thu, 16 Apr 2026 07:10:07 -0700 (PDT)
X-Received: by 2002:a05:690e:ec4:b0:650:7b5b:ed00 with SMTP id 956f58d0204a3-65198a82f55mr19689991d50.23.1776348607308;
        Thu, 16 Apr 2026 07:10:07 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:06 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:43 +0530
Subject: [PATCH v5 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-2-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=8314;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=wxmxFNTxmH1BxvnW9OL8EFs3pxurc8AKng1CYfcu7cA=;
 b=67FcuWucSZqFHCHyX67DHEpx9YKqUBfr8Q2ACSNXqo4VdYY55XSzvWRev3aQYf+FHm/PjYUEr
 feCqZxI8m0jDJ2ZoB8rfJ8dOmxAagkFDqOs4yTk871cWCvpiLIZ5R9q
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: azy-yx19sFqKiEYMD8Cz2jMUKPk7A9nv
X-Proofpoint-GUID: azy-yx19sFqKiEYMD8Cz2jMUKPk7A9nv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNSBTYWx0ZWRfXzo+8XKi7/Y6x
 9C5zAETT0taFwXiXzV51LQZuNMrzSlMrLhLm9813xgp7vb2X4GNWja6YBPb4TH8uNDeqUzcizZP
 14qk7dN7DiVTiDtU2GNW1HRxPHJDWV5nU2eU6YuRs+nmNwYTRm2qtxjKOLqhT8twEcD2oeZTfDb
 RdpWbzlS9p+5eNxyJj+DF6hP6cMItyYw/aDRyA3doE5CrZx0wPYxEXUg8rVvpLawkWJEMAfui/B
 dtLPDrK+qT65s1Bqk0uyemi3b1W2liKreolgEGaW0kO6iRgoJM8J/ytIEP2prrvXRoR/mrIipTP
 1ua8Lo4vjBOOosQ2jm5KB2qLaCZ9Uc26TqwrfrFpUdGbG9RWikRGX2brjjpvVsusMjg7/VqfkEI
 4PM0CZMKk6ympJpyRXDBKaO+N9g/3fUFaVHlAi7Ko5Ch+GgZnEbjjo/Kp7CDBAr3AO0DyWmixmb
 +SWfQxLPgECb0WMsJuA==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0edc2 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=h4jUYMdnt1ASHzOZM6YA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160135

The Sahara protocol driver currently lives under the QAIC accelerator
subsystem even though the protocol is transported over MHI and is used by
multiple Qualcomm flashless devices. This makes Sahara appear QAIC specific
and complicates reuse by other MHI based devices.

Move the Sahara protocol driver under drivers/bus/mhi as a host client
driver and build it as an independent MHI protocol driver. This keeps the
QAIC driver focused on the accelerator device while allowing other MHI
users to enable Sahara without depending on QAIC.

As part of the move, add a dedicated Kconfig/Makefile hierarchy under the
MHI host client drivers and convert the driver to use module_mhi_driver()
instead of register/unregister hooks.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                           |  1 +
 drivers/accel/qaic/Makefile                          |  3 +--
 drivers/accel/qaic/qaic_drv.c                        |  9 ---------
 drivers/accel/qaic/sahara.h                          | 10 ----------
 drivers/bus/mhi/Kconfig                              |  1 +
 drivers/bus/mhi/host/Makefile                        |  1 +
 drivers/bus/mhi/host/clients/Kconfig                 |  5 +++++
 drivers/bus/mhi/host/clients/Makefile                |  1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig          | 15 +++++++++++++++
 drivers/bus/mhi/host/clients/sahara/Makefile         |  2 ++
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c    | 20 +++++++-------------
 11 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..af90fdfcf77eeb6dd5ad309b33d793d4fdc91b1e 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	depends on MHI_SAHARA
 	select CRC32
 	select WANT_DEV_COREDUMP
 	help
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -13,7 +13,6 @@ qaic-y := \
 	qaic_ras.o \
 	qaic_ssr.o \
 	qaic_sysfs.o \
-	qaic_timesync.o \
-	sahara.o
+	qaic_timesync.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..3907b13e426064f4fa069e803cc44462feea4063 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -32,7 +32,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -791,12 +790,6 @@ static int __init qaic_init(void)
 		goto free_pci;
 	}
 
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
-		goto free_mhi;
-	}
-
 	ret = qaic_timesync_init();
 	if (ret)
 		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
@@ -818,7 +811,6 @@ static int __init qaic_init(void)
 
 free_bootlog:
 	qaic_bootlog_unregister();
-free_mhi:
 	mhi_driver_unregister(&qaic_mhi_driver);
 free_pci:
 	pci_unregister_driver(&qaic_pci_driver);
@@ -847,7 +839,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
deleted file mode 100644
index 640208acc0d13d423bd9220e6861b7c141af74ff..0000000000000000000000000000000000000000
--- a/drivers/accel/qaic/sahara.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
-
-#ifndef __SAHARA_H__
-#define __SAHARA_H__
-
-int sahara_register(void);
-void sahara_unregister(void);
-#endif /* __SAHARA_H__ */
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index b39a11e6c624ba00349cca22d74bd876020590ab..720115218c2401c99b29f79bbd4113cd877503ac 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -7,3 +7,4 @@
 
 source "drivers/bus/mhi/host/Kconfig"
 source "drivers/bus/mhi/ep/Kconfig"
+source "drivers/bus/mhi/host/clients/Kconfig"
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2e8949f1a2fe6f3f3b2e1dc541f97d2c393d6a0f 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-$(CONFIG_MHI_BUS) += clients/
diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..a4f2a3c1d20c887cc474646ea91532d775a13f57
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Kconfig
@@ -0,0 +1,5 @@
+menu "MHI host client drivers"
+
+source "drivers/bus/mhi/host/clients/sahara/Kconfig"
+
+endmenu
diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..62e2fa161565225be7f6a23d3cdf4f2f169cb7ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MHI_SAHARA) += sahara/
diff --git a/drivers/bus/mhi/host/clients/sahara/Kconfig b/drivers/bus/mhi/host/clients/sahara/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..f1fc7013a2dee0be645c50f32305659e591de7e7
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Kconfig
@@ -0,0 +1,15 @@
+config MHI_SAHARA
+	tristate "Sahara protocol driver"
+	depends on MHI_BUS
+	help
+	  Enable support for the Sahara protocol transported over the MHI bus.
+
+	  The Sahara protocol is used to transfer firmware images, retrieve
+	  memory dumps and exchange command mode DDR calibration data between
+	  host and device. This driver is not tied to a specific SoC and may be
+	  used by multiple MHI based devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_sahara.
diff --git a/drivers/bus/mhi/host/clients/sahara/Makefile b/drivers/bus/mhi/host/clients/sahara/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
--- /dev/null
+++ b/drivers/bus/mhi/host/clients/sahara/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
+mhi_sahara-y := sahara.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/bus/mhi/host/clients/sahara/sahara.c
index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..858dc5bc39c1ad42922cabef3b1abcd43bc4f0f4 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -13,8 +15,6 @@
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -923,13 +923,7 @@ static struct mhi_driver sahara_mhi_driver = {
 		.name = "sahara",
 	},
 };
+module_mhi_driver(sahara_mhi_driver);
 
-int sahara_register(void)
-{
-	return mhi_driver_register(&sahara_mhi_driver);
-}
-
-void sahara_unregister(void)
-{
-	mhi_driver_unregister(&sahara_mhi_driver);
-}
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");

-- 
2.34.1

