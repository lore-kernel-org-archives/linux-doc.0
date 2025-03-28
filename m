Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E21212B05
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 02:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130115; cv=none; b=RGaTx6OU4eH6Urgeq5NWUQ5FkD90aHLIuIuY+8O89xa4mLHnzysTG4Y29j7K7mABUKefNcJ4pJ6bLOANsAHnLwMegcd95Pes5qZRTgMiXtXRYwPlTMorRHjgiXX35sqsg8PMLWZwMUGF/3GBH+nIRVOoYOEEkXH//HY55ZHw03Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130115; c=relaxed/simple;
	bh=g5/VyZP+pdW+4xerLwCvGtfu0d1NX7AdPGdSj8+rwx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=id1rJ6bIUjmEEMnEBJWDvLguQXtEvdfZiojMCNFOH6nj7bV3jeaCSn7uQQfzhrsrfSiCNYlSTgWVDtsd0JbpFcvL8WfCGTkI4UFm4PgxpKUD59xbi2RySBQHCh03DSoZqnOCg6RNnWp7FPThY3J5dZRN2aljnQJFXJDSe0he4iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/3IDTKM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/3IDTKM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RF4iT2004923
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 02:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCGSU+KPDQuHu1vRudNrdfJOihDwMebMNug8NPCN5yg=; b=B/3IDTKM8cHJ6OiQ
	asGwbQ6Ur/b5XGIZd9AJ1FcxtqnPaTzU3RU07zcEeTf6FTb2ICSrW+qgo7c1zcbc
	adjnJXAtMUNq3KhqFfEDOHJ5+uS0HHPnIFFvC/QIbt5Ik/Vt61ACEo9vC2Iu9HYJ
	ye3U0VasXPYOEu9To04M5NI53ud1sRsEzT7UJoujZOnap5VnM2Kou2uvVcpclruv
	7qJZDpfLpZWnsPUY3Q4/32eBPPoBGbBqUmtWI3p1kqyTQv28sPW9AZc0WN0wn//f
	S5ifIM+UG4qiDw255TploEvza//YquWS9fcI/scdBYSb3eeTonOEurTfFfNXi7s0
	6wdE4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xe03x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 02:48:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2241e7e3addso27759225ad.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 19:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130111; x=1743734911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCGSU+KPDQuHu1vRudNrdfJOihDwMebMNug8NPCN5yg=;
        b=rxXfDj4vYV9oPp0nvcbCt2A9buRAfGdEZyHYAXkJPxjTfBGSaOXCkkU2fJPanjwxa/
         daxTBFWaWCQ5ZiJveLi/mnXnTWr6QQOyzouzSADVoXL0wwt4uEgfQyWh7OexKfFYdc6e
         lG9VmI/yj3k0zCmO6kqjBXki3pMkDvPHn7r3kOSd9HFNeVt948YxYE0P/IlhvAdJYBe7
         Z9iM+UpHvmxwE8fshE3r2dgojEoWlOorzQMeS09z3AxdDSnSydv+It/RePeA29DpGmLq
         73Hn5+59m/aqNnaNnC8T1nyYCKTIpVQ1o0EkARofX9iCgMpVmv6cckRUKKq0hh1fC5W+
         8z0A==
X-Forwarded-Encrypted: i=1; AJvYcCVvAjfcS8OEs40mckNiwNSJOC/uzPYQz+vQMAptefGVhUi8FyEwQXXyVfOKDEny3UaQwaBxFsrTofA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4LlIOiHjlUW6uxdpbXfHJgJkDv/YOcCMELDPfyDulZM5JUlM
	Jj5e/GQV3D7G/Or6Q1m6mD+7N+MRb8bb8MwRDguS7i9GIZ1iogzjUb3hvDrjtV8463sOqp1eYCy
	ck8RWRAWYuMxDf6II+7R+frsIi+vl4QJNc/c99CvkyDlxKBYo+HNppw3qHw==
X-Gm-Gg: ASbGnctXksAcYU7S8Rjl8QvLRGVO0b3V7vDyYWAOAF1bfTChWTqWnfatBdrzxn9gkLZ
	d6tnv83EVbszcPMJNHVgKTkgKNxqF6roH505j82dxvX49X4WVCQWKKSA1xkkaxnAONw0a05DzY+
	e5e3N6N1Lzgpc2u8KlYMma8lwXZbspT67vNBNNIoETOFZPqC3ZjjdBXTrTBdGxkdAdjXj+kOLKd
	vH7B9E13/4+fokpNFXzQ2zEMnpT8+nP51INqSx1BhruqD+9+41PlioaZo+kLNiL85sOgVvrhqIZ
	dWyIqXYNbGEOUpRiy/mgQhXcCuHbvRos6sknMA4IRBFbLsFCKZjpSURZl/vkiy1ZQbhNpgKBH/A
	=
X-Received: by 2002:a17:903:11c7:b0:224:1c41:a4c0 with SMTP id d9443c01a7336-2280481ceafmr79424405ad.9.1743130111068;
        Thu, 27 Mar 2025 19:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJGZ0cJVQzXI2U87eVFkSCI1ZGWBVrXJkCEIpRZnSXSiYSN2x5VOSHicEkZLgh3lhf/YMtEA==
X-Received: by 2002:a17:903:11c7:b0:224:1c41:a4c0 with SMTP id d9443c01a7336-2280481ceafmr79424155ad.9.1743130110538;
        Thu, 27 Mar 2025 19:48:30 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 19:48:30 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:31 -0700
Subject: [PATCH v3 09/11] qcomtee: add primordial object
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-9-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 9OXEJM-d2l9ss7ZQDKBBvsMSyAbfk3SB
X-Proofpoint-GUID: 9OXEJM-d2l9ss7ZQDKBBvsMSyAbfk3SB
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e60e01 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=9rWlDpKKD8PBIGPBT6cA:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017

After booting, the kernel provides a static object known as the
primordial object. This object is utilized by QTEE for native
kernel services such as yield or privileged operations.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile          |  1 +
 drivers/tee/qcomtee/core.c            | 19 +++++++---
 drivers/tee/qcomtee/primordial_obj.c  | 65 +++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee_private.h |  3 ++
 4 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 1b14b943e5f5..a3a2d00e83f0 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += qcom_scm.o
 qcomtee-objs += release.o
 qcomtee-objs += shm.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 162e32db656a..76944241e8e8 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -31,10 +31,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
 }
 
 /*
- * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
- * of the QCOMTEE_OBJECT_TYPE_CB type.
+ * QTEE expects IDs with QCOMTEE_MSG_OBJECT_NS_BIT set for objects of
+ * QCOMTEE_OBJECT_TYPE_CB type. The first ID with QCOMTEE_MSG_OBJECT_NS_BIT
+ * set is reserved for the primordial object.
  */
-#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
+#define QCOMTEE_OBJECT_PRIMORDIAL (QCOMTEE_MSG_OBJECT_NS_BIT)
+#define QCOMTEE_OBJECT_ID_START (QCOMTEE_OBJECT_PRIMORDIAL + 1)
 #define QCOMTEE_OBJECT_ID_END (UINT_MAX)
 
 #define QCOMTEE_OBJECT_SET(p, type, ...) \
@@ -112,7 +114,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -125,7 +129,9 @@ EXPORT_SYMBOL_GPL(qcomtee_object_get);
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 EXPORT_SYMBOL_GPL(qcomtee_object_put);
@@ -215,6 +221,9 @@ static struct qcomtee_object *qcomtee_local_object_get(unsigned int object_id)
 {
 	struct qcomtee_object *object;
 
+	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
+		return &qcomtee_primordial_object;
+
 	/*
 	 * This is not protected by an RCU read lock because we are
 	 * confident that QTEE does not issue a RELEASE request and
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..a30967d89c91
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+#include "qcomtee_private.h"
+
+/**
+ * DOC: Primordial Object
+ *
+ * After boot, the kernel provides a static object of type
+ * %QCOMTEE_OBJECT_TYPE_CB called the primordial object. This object is used
+ * for native kernel services or privileged operations.
+ *
+ * We support:
+ *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
+ *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
+ */
+
+#define QCOMTEE_OBJECT_OP_YIELD 1
+#define QCOMTEE_OBJECT_OP_SLEEP 2
+
+static int
+qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				struct qcomtee_object *primordial_object_unused,
+				u32 op, struct qcomtee_arg *args)
+{
+	int err = 0;
+
+	switch (op) {
+	case QCOMTEE_OBJECT_OP_YIELD:
+		cond_resched();
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	case QCOMTEE_OBJECT_OP_SLEEP:
+		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
+		if (qcomtee_args_len(args) != 1 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_IB ||
+		    args[0].b.size < sizeof(u32))
+			return -EINVAL;
+
+		msleep(*(u32 *)(args[0].b.addr));
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
+	.dispatch = qcomtee_primordial_obj_dispatch,
+};
+
+struct qcomtee_object qcomtee_primordial_object = {
+	.name = "primordial",
+	.object_type = QCOMTEE_OBJECT_TYPE_CB,
+	.ops = &qcomtee_primordial_obj_ops
+};
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
index ab3acad40359..a5d05a72af15 100644
--- a/drivers/tee/qcomtee/qcomtee_private.h
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -219,4 +219,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 			       struct tee_param *params, int num_params,
 			       int req_id, int errno);
 
+/* (2) Primordial Object. */
+extern struct qcomtee_object qcomtee_primordial_object;
+
 #endif /* QCOMTEE_PRIVATE_H */

-- 
2.34.1

