Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FD8239E80
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562092; cv=none; b=gehz1A4DolbW48QwOobt+5upC8sf+OZePRbCbkykxz5WStvK9tlbgi6Pqz8aiYNY371jtKRG0XquTmLGeTAHNIaM5fH2tb11590UnhL0QtKGfpodv3YCUKLlN9WikebaId/oRFg832rXbvXt5qzvj4w/zqVjKf/VK9XY7yDhpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562092; c=relaxed/simple;
	bh=YQcEFnOl6kY4qFaLVPv2nJjyrWQl03MYHwKFS3Sg01k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEOyMKUKEaNUPDlNkT4i968ahXoCee9nKuzUt2Z1zLQuvEknpGN4TlJBPNXEqWG75lELFV9U+O6FUZq2tl375E7oYW4Zdbg6HNVdvtQjFcutMhtEaUSlWYDysQtx1qmcyKBf7opG2bBxPUEDvJdVVHvTXF5uTOt+RGztfGpxlHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NusHSjON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NusHSjON"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J3jH026568
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKbqXe7PMoUiJg4m7VYYPBBjDC8LJ5A/UZIjVDLkyUM=; b=NusHSjONBcCZHeO6
	NNHtprFSfWfZeWdl6bd7CF6//A2hSDg1yDm2z6KzBrfynLDbcKNLqmeB7kTrwhAg
	4v9QCD/rBeVjTh7dbZZIdqTbDyFGbgMVn4/KsH0WTMITAtCtR54omKhMWWvpPdFw
	twwNg0yzbcjFBNogTU5KNGgbsFLXNxVYPd3I/AGHzvr8gVmq6uVa2yq7XhSGfieP
	Qok5WUVXNsN5F18iGfhWtawoMBS49tkJmHdA1j8yo55fmXjZM+fgOQyXJz+GszFT
	5HDnIHLthlYE0+c+pLRxLtqH+Jt3mSWnWxRhOzxXC3sgh77BJxeNjOE1Yf5WI/ka
	nJIiiQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0x2vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2507ae2fb0fso2320575ad.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562088; x=1758166888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKbqXe7PMoUiJg4m7VYYPBBjDC8LJ5A/UZIjVDLkyUM=;
        b=AVJLU/H++w4jOwNF1TwdR7TarRL3AubpK6OaO2LhwpFYka/FyMSZhACrifj35Zwl71
         pdyP+IB9n840ZBnBz+aoaQubVmE6GTHi/bg6IvijwNlBThRlup9SuX6msxWuJIGqsEwJ
         FqIa9Fk+Y4bvQq6CxdKh80YUf4C8Ml5XO7XI7jK17qwpvN4KEUAQUiGP4D3Cv6077d9F
         ve5PLzxd5i6YAk0qTsQGk7f+MBzhRBFtBx0wO2xlxUbCWUvlVUqnzD/uBZ2VMsxvkKtz
         +C/Lut4ClJH799PSqVjZmxiGI7BNFrzFBfdSc9ys3HZOu76tsCKMAMoByXe2n+pXadhj
         J7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvCODcsMoE4/e/s0FUjsJc/d9No2M4gJzjSZkypd9FsPw+ZgXwMtmYN8P93FYbkqHg/Hw5+xtgUIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3SZ197G1x9mkiJSS9HknqwzE7NiGmXN97+QVcBEvWU5wjsKpu
	RNRbaNdVeg6PSCPMIf5M4E5weZ1wvpZEwZx9lRpCTjrOT7crQ1csOZAVW47GkbM6Xa2bgI+xEKw
	P1xS4s+VqtpQJeks31UTkeA3vI5lJpkWVm6UxIYH3rM1VxlLByEksF39SYGIUlA==
X-Gm-Gg: ASbGncugP7eEfU8tLeIOej0GPnJZwqQE3BCKKc0AAqoMOo4KMs7OGWLQJpyCmugqovY
	dMDwsaHV3Bl0sYyvE9xE7LQ2NId16bIsolCpflHBxPh62G+Mu9HS4naM367VPihmn5M2eXT+Ij3
	awNHadDMGps6xCj96H8FoPHD+mYvPJ4lh5pU9jR9kj9ew3qWFQPA+5FJx2jSGhMbhZ5ThdO0MGk
	HbN2MrmC/7dRS+yxmBSC7pfkapxufrMOmYf3YEPXFpLNUPe8OfoA9kq+m0aoKBRvaADx8LkqDG5
	nr6etGq7YE6aBn9joxjBOscTEPUu+14pE+/xDwl3amDqDi5lwcYzo71HZtqkw2mirsbDN3PGJGL
	rTdR2wWPoh5p1ON44g1LXXO4=
X-Received: by 2002:a17:903:38cf:b0:245:f7f3:6760 with SMTP id d9443c01a7336-25175f72ac4mr220641315ad.55.1757562087460;
        Wed, 10 Sep 2025 20:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2kwOIrXlQY9Hp2LbT+Ha1VF4JSti2xLqtCO4iZN0yyVAUste29kkfj5azPlxcC0nrkqPLFA==
X-Received: by 2002:a17:903:38cf:b0:245:f7f3:6760 with SMTP id d9443c01a7336-25175f72ac4mr220641085ad.55.1757562086931;
        Wed, 10 Sep 2025 20:41:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:15 -0700
Subject: [PATCH v11 02/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-2-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: mRed0VtQvVxizgzyQZJ2TjQuz8kk948u
X-Proofpoint-GUID: mRed0VtQvVxizgzyQZJ2TjQuz8kk948u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxy+Kdd+cb9Ab
 FUVE9FbZlPWvwRKyUJPBUNIOGqBEG2K3OVSnNWDfA+0SBYOS0riuM+NNQew1O4pjYV9CWXHCXOZ
 CO0R+3Oj6Mzysc7XQKlKfw6BS+khJfKVs/IT8EuXbx+lD/28FqjWaxBv9WhR/SFLN5T/eP6NuqY
 2yMiIywJ5dFGa4SCCxmESfSDhPNgNsaaAvrLFlZSR59ZqiDsU68JEHC4s9k/NnQhTdGItt+0CyG
 UiXrFP7ytSDikJzjxnS9mw/lZA8E1qdLK0DMkl34QKSvMpfd+wOdyLdgMQ7FJLis9R2V4CgzNiR
 7LbJytn085SukwIsJ2bMHbf3xUxKEhu4Eo0eDI+kUi7yBv0aiyC6OP/POxp5kEIa9gt9a0L5mNY
 yoQWckUm
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c244e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
the secure world, accessed via objects. A QTEE client can invoke these
objects to request services. Similarly, QTEE can request services from
the nonsecure world using objects exported to the secure world.

Add low-level primitives to facilitate the invocation of objects hosted
in QTEE, as well as those hosted in the nonsecure world.

If support for object invocation is available, the qcom_scm allocates
a dedicated child platform device. The driver for this device communicates
with QTEE using low-level primitives.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 119 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |   6 ++
 3 files changed, 132 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26cd0458aacd..9b5a9a0f68cf 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2093,6 +2093,122 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
+/**
+ * qcom_scm_qtee_invoke_smc() - Invoke a QTEE object.
+ * @inbuf: start address of memory area used for inbound buffer.
+ * @inbuf_size: size of the memory area used for inbound buffer.
+ * @outbuf: start address of memory area used for outbound buffer.
+ * @outbuf_size: size of the memory area used for outbound buffer.
+ * @result: result of QTEE object invocation.
+ * @response_type: response type returned by QTEE.
+ *
+ * @response_type determines how the contents of @inbuf and @outbuf
+ * should be processed.
+ *
+ * Return: On success, return 0 or <0 on failure.
+ */
+int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+			     phys_addr_t outbuf, size_t outbuf_size,
+			     u64 *result, u64 *response_type)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMCINVOKE,
+		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
+		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
+		.args[0] = inbuf,
+		.args[1] = inbuf_size,
+		.args[2] = outbuf,
+		.args[3] = outbuf_size,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	if (response_type)
+		*response_type = res.result[0];
+
+	if (result)
+		*result = res.result[1];
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
+
+/**
+ * qcom_scm_qtee_callback_response() - Submit response for callback request.
+ * @buf: start address of memory area used for outbound buffer.
+ * @buf_size: size of the memory area used for outbound buffer.
+ * @result: Result of QTEE object invocation.
+ * @response_type: Response type returned by QTEE.
+ *
+ * @response_type determines how the contents of @buf should be processed.
+ *
+ * Return: On success, return 0 or <0 on failure.
+ */
+int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
+				    u64 *result, u64 *response_type)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMCINVOKE,
+		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
+		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
+		.args[0] = buf,
+		.args[1] = buf_size,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	if (response_type)
+		*response_type = res.result[0];
+
+	if (result)
+		*result = res.result[1];
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
+
+static void qcom_scm_qtee_free(void *data)
+{
+	struct platform_device *qtee_dev = data;
+
+	platform_device_unregister(qtee_dev);
+}
+
+static void qcom_scm_qtee_init(struct qcom_scm *scm)
+{
+	struct platform_device *qtee_dev;
+	u64 result, response_type;
+	int ret;
+
+	/*
+	 * Probe for smcinvoke support. This will fail due to invalid buffers,
+	 * but first, it checks whether the call is supported in QTEE syscall
+	 * handler. If it is not supported, -EIO is returned.
+	 */
+	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
+	if (ret == -EIO)
+		return;
+
+	/* Setup QTEE interface device. */
+	qtee_dev = platform_device_register_data(scm->dev, "qcomtee",
+						 PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(qtee_dev))
+		return;
+
+	devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
+}
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2325,6 +2441,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	ret = qcom_scm_qseecom_init(scm);
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
+	/* Initialize the QTEE object interface. */
+	qcom_scm_qtee_init(scm);
+
 	return 0;
 }
 
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 0e8dd838099e..a56c8212cc0c 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -156,6 +156,13 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_SVC_GPU			0x28
 #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
 
+/* ARM_SMCCC_OWNER_TRUSTED_OS calls */
+
+#define QCOM_SCM_SVC_SMCINVOKE			0x06
+#define QCOM_SCM_SMCINVOKE_INVOKE_LEGACY	0x00
+#define QCOM_SCM_SMCINVOKE_CB_RSP		0x01
+#define QCOM_SCM_SMCINVOKE_INVOKE		0x02
+
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
 #define QCOM_SCM_ENOMEM		-5
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 0f667bf1d4d9..a55ca771286b 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -175,4 +175,10 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
+int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+			     phys_addr_t outbuf, size_t outbuf_size,
+			     u64 *result, u64 *response_type);
+int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
+				    u64 *result, u64 *response_type);
+
 #endif

-- 
2.34.1

