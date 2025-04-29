Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF07278149
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906838; cv=none; b=H/Iv5R/Cb6eWJmYe3xtg6+qPsrKPFkxtPEMSzSJ7OzkaZS+qA0Ie2Hb0PhVlZo3jPQ5+5VXvjVBSXonB94ipvVHTi4vz8i05JKWl+AzKXTMb2G1mCcQ3TxmTMkbM8vql0t9EhCZmZxtPPnuYxlOzU8uyZlcxio6+GRiGPZVGV5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906838; c=relaxed/simple;
	bh=4k2KSDPURPddObcXyDVi8RbblAgUWBza0O2dAjpnuac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIkq+8MzQEAqHoGF9jWzfoKGVhha80nPTIGVS6HnaiJRlZjqtsCXtVvA7v7IVjxhyaTffmQBtn4fGrDTKmyzkIMxtSyne6OdbAZCmr8zOvSYqkOLBV8AQVXN6SyhcmxbJPUxlcmNMcPApy2bOZXcw3c87TrI7a2uKtI2OqvX+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxBOyeiA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxBOyeiA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq0Dr000496
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pw0rd5bbftIaO3W4VpK12WfhwQcOHW8+t1g2YsM9EwI=; b=FxBOyeiA9/nLs5A8
	yxpP4lKiNAIbsQKPD1FvfO68PIZINmxdZgmscriQC7jzsVcTK8HAdzniE6y2ARiK
	IusueYOXYq1AdhWakDgyIx+MpYtaX6KiVIEz8zDKHUcjoe57uuVLU1C2WxblVhWK
	wpi0uYRBo3xyHkoNi0XuhlfRpSdVyywSrQstxmY4TINdiQLhNznryq85/gtyQ/rM
	WDrJ/FX45CrvfpkjSwc/jrgoa37ZdlmoqrEEuDMkaNKrf8Z/QLBegB5eFy9NnAtK
	YSl022n77RVgOr5MoERH7t3StTnz9u45ziap4uRsiBQPf/4lOUGaoaDcJ3VTHS32
	Ket7pg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9kd6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b115383fcecso3225834a12.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 23:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906833; x=1746511633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pw0rd5bbftIaO3W4VpK12WfhwQcOHW8+t1g2YsM9EwI=;
        b=RQM0N2bC32QWkc/mTa7+O9lG5OhyPwqmDV6RpISKh01YPqZipYt2ZPxsTmABm5bMVl
         z7IngMTvKs1NnYnmm2vAVJHR5SNs1ygn0EWS9BCFelSPyXlG0NV7rF9x+ika1cT6azzy
         61Pu4w+ylbfv0lDd2PiY2FZgoo5RuR0rMaq5oQqdR+Zsx4G4CPqocab3haiUbcEStX74
         5Z2Pe5cs7+KZV4yOUG902iFOvb1MQ5bR8aTuUGblwe+hT7DvCmFDOgngNGFATvq+AsAO
         lgNa6lhUr8uQXzweG8UWPplrPVKi5Di5l1LfOv39IUT8I+/Ic3IcMuJJAKniZlTPwqgc
         BoAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKc5GqsVTPhNmwZVLFJfTCCKg3V3Aba30NAtqzRIO1p1BnNEmvPsrsT8KY1r7EjFJkPaWgz8Uoa3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUl2+UE8LDXH68YMK0MtaKzhDEQoJ5M9cvGOiabgwUEiS/a+4
	ejEQOiLPMKpngv/Qnx/cow8bts5vRDyFK1m8FrGy2Cn3YDkSuuOCOrCVlGi07XxhMEVnoeY9H9S
	P58ej10BFuYP3asdt0pHDEb2qwMcnZagF8D0MjEhP2DGobK1SHUjYhHSk9zlDyOu9ZngX
X-Gm-Gg: ASbGncskKK4SW5quN6vLJN82Uxv6h3S1KwpWzfa1Vkcxgj/rbTLYnhBo7+Lt8GjGcol
	8owWKa+dfYUwpP5KhiEwnpBfjM+G5L3+FTtbZ70PqY3NtockUpLU58Ot3uVAwz5hclLZyIjlRiz
	v39G/nTtMuOzE6O+M87J8ms69kg/RPbl0F5Lt5U1Ih8Q55O4Rj1gGf5GjquJ3k3EWTfUfTeIIaM
	jQ4u4HQWLdy37tYxyJbTkKUSmk4KjRVGZboVUsC24XB8bs91cxzQ2BVod90YAzvnESacTYmuN7J
	57KOn6w0kl99bDl2YMbJgioJHO+BntfLg1XrOAo8F4+A1yr+DRGQ8kcctLB5ZZsykU8MrLw=
X-Received: by 2002:a05:6a20:43a1:b0:1f3:40a9:2c36 with SMTP id adf61e73a8af0-209561ed550mr2627421637.10.1745906833294;
        Mon, 28 Apr 2025 23:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHdv2z3Dz3XdkSIvWGqI4vBe4abfk4+xgF4r2Y6iDadu24W/3/ymgSO5Ode7BHoDl3Xv8RUQ==
X-Received: by 2002:a05:6a20:43a1:b0:1f3:40a9:2c36 with SMTP id adf61e73a8af0-209561ed550mr2627395637.10.1745906832886;
        Mon, 28 Apr 2025 23:07:12 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:12 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:32 -0700
Subject: [PATCH v4 11/11] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-11-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=68106c93 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=4VYrYejmMApVX9KxlZkA:9
 a=QEXdDO2ut3YA:10 a=M0EVDjxxv-UA:10 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 4pomrXl9WATmTl71QuGPSpt-RyIR9anb
X-Proofpoint-ORIG-GUID: 4pomrXl9WATmTl71QuGPSpt-RyIR9anb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfXzyTgXTKH4Xsw 0MJn9T7aPB0SuRrEstivwsZbu+QIEuqGmDjh4fCsJdRJm0M4p63xnpvi9CFsMxqSIbESIMwrKQQ QjvseQJVz9/6bG3WZrXEEQL9n2YZlBufncicSRqKwl7KlOy2qbG0klwwn2TCIcu5LGgQN0iJNFY
 LfwCgVcQpfOvwRDHcjZLAX0El3zgg80eRDDhu5+ZRe10NoWfuyA1IwCyk37kb+eksooC2dN6Tya CNULL89V2/feVYR2WfDdiBgEcGOHK0UlbKsW1jEBLWr1Ab/J8Ws2jm+JamqRAAmn9dGkx3akgKg bskGbvL/b/Ug+zGJZiG/WkyUL/nb2t5q3bTfD3v2WpQ8f+1opOnlxfTpkAIfYbqHSKbP+j7Q+hg
 A4NY+0Z7EAr8m0ksgqJoPoNQlqrQmEbEaaKsRAhjXtbJFBpOdFxjfukFRsddw6vLwcvoFCGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

Add documentation for the Qualcomm TEE driver.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 Documentation/tee/index.rst |   1 +
 Documentation/tee/qtee.rst  | 150 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 3 files changed, 152 insertions(+)

diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
index 4be6e69d7837..62afb7ee9b52 100644
--- a/Documentation/tee/index.rst
+++ b/Documentation/tee/index.rst
@@ -11,6 +11,7 @@ TEE Subsystem
    op-tee
    amd-tee
    ts-tee
+   qtee
 
 .. only::  subproject and html
 
diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
new file mode 100644
index 000000000000..8ae4da17c3a7
--- /dev/null
+++ b/Documentation/tee/qtee.rst
@@ -0,0 +1,150 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+QTEE (Qualcomm Trusted Execution Environment)
+=============================================
+
+The QTEE driver handles communication with Qualcomm TEE [1].
+
+The lowest level of communication with QTEE builds on the ARM SMC Calling
+Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
+Manager (SCM) [3] used internally by the driver [4].
+
+In a QTEE-based system, services are represented as objects with a series of
+operations that can be called to produce results, including other objects.
+
+When an object is hosted within QTEE, executing its operations is referred
+to as direct invocation. QTEE can invoke objects hosted in the kernel or
+userspace using a method known as callback requests.
+
+The SCM provides two functions for direct invocation and callback request:
+
+- QCOM_SCM_SMCINVOKE_INVOKE for direct invocation. It can return either
+  a result or a callback request.
+- QCOM_SCM_SMCINVOKE_CB_RSP submits a response for a previous callback request.
+
+The QTEE Transport Message [5] is stacked on top of the SCM driver functions.
+
+A message consists of two buffers shared with QTEE: inbound and outbound
+buffers. The inbound buffer is used for direct invocation, and the outbound
+buffer is used to make callback requests. This picture shows the contents of
+a QTEE transport message::
+
+                                      +---------------------+
+                                      |                     v
+    +-----------------+-------+-------+------+--------------------------+
+    | qcomtee_msg_    |object | buffer       |                          |
+    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
+    +-----------------+-------+--------------+--------------------------+
+    <---- header -----><---- arguments ------><- in/out buffer payload ->
+
+                                      +-----------+
+                                      |           v
+    +-----------------+-------+-------+------+----------------------+
+    | qcomtee_msg_    |object | buffer       |                      |
+    |  callback       |  id   | offset, size |                      | (outbound buffer)
+    +-----------------+-------+--------------+----------------------+
+
+Each buffer is started with a header and array of arguments.
+
+QTEE Transport Message supports four types of arguments:
+
+- Input Object (IO) is an object parameter to the current invocation
+  or callback request.
+- Output Object (OO) is an object parameter from the current invocation
+  or callback request.
+- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
+  to store parameter to the current invocation or callback request.
+- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
+  to store parameter from the current invocation or callback request.
+
+The QTEE driver provides the qcomtee_object, which represents an object within
+both QTEE and the kernel. To access any service in QTEE, a client needs to
+invoke an instance of this object. Any structure intended to represent a service
+for export to QTEE should include an instance of qcomtee_object::
+
+	struct driver_service {
+		struct qcomtee_object object;
+		...
+	};
+
+	#define to_driver_service_object(o) container_of((o), struct driver_service, object)
+
+	static int driver_service_dispatch(struct qcomtee_object *object, u32 op,
+					   struct qcomtee_arg *args)
+	{
+		struct driver_service *so = to_driver_service_object(object);
+
+		switch(op) {
+		case OBJECT_OP1:
+			...
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	static void driver_service_object_release(struct si_object *object)
+	{
+		struct driver_service *so = to_driver_service_object(object);
+		kfree(so);
+	}
+
+	struct si_object_operations driver_service_ops = {
+		.release = driver_service_object_release;
+		.dispatch = driver_service_dispatch;
+	};
+
+	void service_init(void)
+	{
+		struct driver_service *so = kzalloc(sizeof(*so), GFP_KERNEL);
+
+		/* Initialize so->object as a callback object. */
+		qcomtee_object_user_init(&so->object, QCOMTEE_OBJECT_TYPE_CB_OBJECT,
+					 &driver_service_ops, "driver_service_object");
+
+		/* Invoke a QTEE object and pass/register 'so->object' with QTEE. */
+		...
+	}
+	module_init(service_init);
+
+The QTEE driver utilizes qcomtee_object to encapsulate userspace objects. When
+a callback request is made, it translates into calling the dispatch operation.
+For userspace objects, this is converted into requests accessible to callback
+servers and available through generic TEE API IOCTLs.
+
+Picture of the relationship between the different components in the QTEE
+architecture::
+
+         User space               Kernel                     Secure world
+         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
+   +--------+   +----------+                                +--------------+
+   | Client |   |callback  |                                | Trusted      |
+   +--------+   |server    |                                | Application  |
+      /\        +----------+                                +--------------+
+      ||  +----------+ /\                                          /\
+      ||  |callback  | ||                                          ||
+      ||  |server    | ||                                          \/
+      ||  +----------+ ||                                   +--------------+
+      \/       /\      ||                                   | TEE Internal |
+   +-------+   ||      ||                                   | API          |
+   | TEE   |   ||      ||   +--------+--------+             +--------------+
+   | Client|   ||      ||   | TEE    | QTEE   |             | QTEE         |
+   | API   |   \/      \/   | subsys | driver |             | Trusted OS   |
+   +-------+----------------+----+-------+----+-------------+--------------+
+   |      Generic TEE API        |       |   QTEE MSG                      |
+   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
+   +-----------------------------+       +---------------------------------+
+
+References
+==========
+
+[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
+
+[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
+
+[3] drivers/firmware/qcom/qcom_scm.c
+
+[4] drivers/tee/qcomtee/qcom_scm.c
+
+[5] drivers/tee/qcomtee/qcomtee_msg.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 88a9ad34bcf6..79259219d292 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20261,6 +20261,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 F:	include/linux/firmware/qcom/qcom_tee.h
 

-- 
2.34.1

