Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0711E7C38
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463097; cv=none; b=VJ+5ww4vnPfw8TFvrmf0p1zr3XwEXFpKvJNJyIgIzfiQpM1fHPiRKbUb6ARtf0jewf2et87HkM7Vq7wihZpK//QJzIW8oD2FGiDDZ/K9loCxgTvDRZgtt2rxzsHnK6XrYCYoVYreJ8/PniOqw+LN0/usr2Bgn7pUpqFLd4h5msE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463097; c=relaxed/simple;
	bh=+8dSfgrMG4eFIFtqJ20ROAswX13YmpqsL2XfyfUksAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzlqpQg1CmSnU1eV8CG639YUMZb6EYfbR4Y57qA2mV8hyI5ycU+2JpZvV/qmKoAHagOpEFHui4qyTZukUBTIzfFEz+h2ZlF48Ouy7B2IOx8m2LD7oRJ1z7cqLHQ7XpoAnShuYA6Y1qEQf+jlk2rs6DmB3uHCFFyBtPG++IBWAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BC3nYoKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC3nYoKW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HQtMr020099
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaTc6vdim5GJ1OsrX7tFizDxK1+T66nxGle441QICfs=; b=BC3nYoKWAF+x4oUx
	uSW/wp/q9QFeQaukKqLugvALu+J61wPUbJelViu3Il8TkTI30a/QawtLS7w0OY0X
	tWee6hs6Hy7Vy3n4RJPlEzaXeRxZxBKF8VPrslfsG9oh1UU1SMXGBP5w9RA0etn5
	dVhc+REy5QOt3ABxddgR0ey9erm4ujYjKj52wm67CF+oRi39Q2XEFflxoeqW6XWX
	VFyqGqVJcq7t8TQJ3AqoHLhwbM+BAqJ54CNm5wHZjMKkcMXgbkxKSECtMbjdzP7P
	4tT+u4kA1g20yUtWVG4t5D2REn8B2O3pOB8dqzRVvI0ft85WD5w5Sie4crqIfvKG
	dNpq2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2622c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32bbacf6512so8942182a91.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 17:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463093; x=1758067893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaTc6vdim5GJ1OsrX7tFizDxK1+T66nxGle441QICfs=;
        b=Ys6ns2e3I4aRxPbbQz69BgTwAsBxoifhRzeQxl423CHoOQRhVC3vlD23NcxcR3lHJu
         QmKS/UOVcwkc0bOEl7N83Qkv4XEL0JEd5wvG/1Qq091D5IQVL2SGtWqdD1D3cmx8bTUo
         Gp7G3b8e4FhYQuuOiaTvnlleBfx99ucu+1G8OzWT1Gx5ODDJwx1NoeFNkXNmf5F65of/
         eklfDk0XzeIPyCV8JaZLRuWFl9P5SOv3pcosFOnZyLqw7Z9TsvM10to/i04nZHoLh6KW
         TxHOP+af1gUUUqyGTBfWWYz3sWBNoGTCf3eaMEsH08pVKjTn++ZYvQ+w74uFIzIWQt/g
         XAzw==
X-Forwarded-Encrypted: i=1; AJvYcCXHjK9BYypnIf/3TZcHoRqiXqjpT53LgCMHg/z80dzX2itYM/ldWqFDNK2rmUCVZdeUaaKz1Wn6NAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Wx4wJ9uQx4UrzanJ3zqk4MC/iF6KUJqS5xBDUybhY8ju4z0U
	IkjVG9Bjw5ymBxDfPp1XQcT4PnWre1WOqhYG6LHLvuGVaVENDO8QxEFXQBbwzw0KwUmlLc+gPiH
	emGaQBPNZgt8l+o2DWEZxTsBAM6bhxvTGvKczxYogvWDbMz2ynYVzODHUn3BYMg==
X-Gm-Gg: ASbGnctDmj5lGD/e80iJv5tasQnmFIx+9GN+rLeyHb63OgKJJOO7I/OXhMTVoKGkXaC
	KCqOC0XtXyOca0SgDZgwe94+5SYDnw1t2A2P6yg1UrCl5RmhyLn0LAr/gkMXsZLVPz1N/AAr9As
	xJNMSe/k2Df+BQkR2fvcUDpfYzFwPkfF8gaCN4e2xPmEfs5sihg9mZqKuxiucjOrpL+nWh7nXGq
	k1gVPLdj4fEEE5sEyapopZUBT3bKiOrirhdBjL8LRRf757dozKYbFiamfIhpikkyB8n2d8MZbpr
	ggpOTs6snJB+H0YQWGMSIDj7ixLBJZhpw/I7A0rwi+dvGiJBL2W7fqAalR+rM6gEwvSecoT8xiT
	PrpNRZoPMcCG7d6pQktZ3lvk=
X-Received: by 2002:a17:90b:1d4f:b0:32b:dbf1:319e with SMTP id 98e67ed59e1d1-32d43f8fa03mr19427567a91.23.1757463092899;
        Tue, 09 Sep 2025 17:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfdjNDr3trg+2+uwFKP1nkdSLQwdtVhJMXU2cH9rXZ38+lLXEee+dSyothar68jtVCvEDvCw==
X-Received: by 2002:a17:90b:1d4f:b0:32b:dbf1:319e with SMTP id 98e67ed59e1d1-32d43f8fa03mr19427541a91.23.1757463092476;
        Tue, 09 Sep 2025 17:11:32 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:31 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:11 -0700
Subject: [PATCH v10 09/11] tee: qcom: add primordial object
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-9-20b17855ef31@oss.qualcomm.com>
References: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
In-Reply-To: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
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
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c0c236 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VpzS5UkGu78tEBsUhx6B_Y1SYeZt8bn_
X-Proofpoint-GUID: VpzS5UkGu78tEBsUhx6B_Y1SYeZt8bn_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX6ySL2oyPhiC/
 YnXoiujVmOBokNXPq8H/GB5tP0j+4rqmbUcDHnzk+OwU5j8MYyzqKFq47j+UK83r6dF6iVfx8r7
 XyIYJdZls6BrX0w3JO0gP3KNm/X9SjkQU0WvtU5pT2jtQgwaXa+CokYrQMMMUxHSi23sls1NoHt
 uBNthvCRN7GykFbgP3LGDxz/SjoA59sHTIJ3C0vyXa7rlSw9w6Ioi5FTivtKmqabb4ysKxbqMai
 4Xk4pzQ9HwrTIRYYhaIRDfXpwloVYfVbtc9s/0vGm3VrZwPpSIxDpL94FrJKrFjX8N0R+hhAAXM
 JJDNrYCAPWHGyBXFbRvpNplMJNF2TH9On+c26Hkl1JSVYM4OUQ22yzwKbJO9aRDcwPixkzTkPFZ
 o4Gy01dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

After booting, the kernel provides a static object known as the
primordial object. This object is utilized by QTEE for native
kernel services such as yield or privileged operations.

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile         |  1 +
 drivers/tee/qcomtee/core.c           | 19 ++++++++---
 drivers/tee/qcomtee/primordial_obj.c | 63 ++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee.h        |  3 ++
 4 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 600af2b8f1c1..78f8e899d143 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += shm.o
 qcomtee-objs += user_obj.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b6931ed6f200..783acc59cfa9 100644
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
 #define QCOMTEE_OBJECT_ID_END (U32_MAX)
 
 #define QCOMTEE_OBJECT_SET(p, type, ...) \
@@ -157,7 +159,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -169,7 +173,9 @@ int qcomtee_object_get(struct qcomtee_object *object)
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 
@@ -261,6 +267,9 @@ qcomtee_local_object_get(struct qcomtee_object_invoke_ctx *oic,
 	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
 	struct qcomtee_object *object;
 
+	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
+		return &qcomtee_primordial_object;
+
 	guard(rcu)();
 	object = xa_load(&qcomtee->xa_local_objects, object_id);
 	/* It already checks for %NULL_QCOMTEE_OBJECT. */
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..0e43f04493e2
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
+#include "qcomtee.h"
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
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f34be992e68b..084b3882017e 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -140,4 +140,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 			       struct tee_param *params, int num_params,
 			       int req_id, int errno);
 
+/* (2) Primordial Object. */
+extern struct qcomtee_object qcomtee_primordial_object;
+
 #endif /* QCOMTEE_H */

-- 
2.34.1

