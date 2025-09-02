Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3EA2E2EEE
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788984; cv=none; b=n5OXryLXSCcIHCVHEBn8Qyitjsk8Y7GoGQ8ltz9y9EzVrK7ChOAW3OFQJW1ctXpNWR2O607X6m9dBG0RFZrmdlheeWlfh1MdLxOHRlPNQgb71mFZXRg9j7q8bRZCi3E7DPGjSGfhqhQHaqG7SAZbU/oXNOK15iSE9OXvkBHkoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788984; c=relaxed/simple;
	bh=HIg3g05OGtAShbO/iwboELF9InuMVYbucP7U4jl28es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXleks1OMX4EXwmkBJpJxAWgVs4Q90gKhuOdU/nx5Ajqq3XTebT0n2JV96khQvQrT1ppfzWFxVmHv7mnlvsuYL64vQ05WLEvhllzFKOfAQDz2F68rb48ed2R/9Oi6MyrdTV0Oy4DHCB3sB4UeIxutEp1OlW6512SoGnhtOkSbo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMAJKXiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMAJKXiO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5EN025153
	for <linux-doc@vger.kernel.org>; Tue, 2 Sep 2025 04:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feDuMDy+t+CpMSTiKqNe6+B83SlcxbDo9HfHqi8FlIQ=; b=XMAJKXiOB0p6dtlt
	n5DdR4TUo2uUWbcrYBlKZ8fnnwF9FfeMs4+ahZ4HzULscl1XWzWWsnIr9CpjPPNh
	NRZR//0mpVjmGoxpOOU2tDNvqIwIa5sf57om1mE8icA7eNRHgISJZITnz4hk5BF0
	1s2Gta8vwsRbYubZo013enepuCrVpBQGLUYdpQ11fXbeiPKAdeZSaSrcDlay+SwV
	NCbN8JuZt9bmo/bt5mrsxAmgQRLF9HkwlFP/fJzwJWeo6/uNDCAZXtfxlhtDphsq
	VLsHO+5uYby9R/a3lfBt4zy1YzKFQLoHRWjPw0ploYFLFVx3LFykXW39QI+toOnf
	7ioxCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxju1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 04:56:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b2336e513so255525ad.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 21:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788980; x=1757393780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feDuMDy+t+CpMSTiKqNe6+B83SlcxbDo9HfHqi8FlIQ=;
        b=mPs2A/se9PoBAGzjdJob9dsUpA+k5kR/XZzb4Q4wFegMYDhJa2oF8M3IXy21KsmhAs
         QTQ/KNxYQDF/XzcbzskU7wdHaIOGKgk7mgiSA9eKRArCKHZoWamZRroj6AJvrBzbExWH
         MCycD31Hl6/RB/4ZDj3Ftg+rHGBGDo7Xlwxo4PeEii4VbQgPhFbR4/yQn9xPtTMvbD2J
         V8wCk1EZ44xQR/XS8M6x8cEzEfstul2JDCtC9ZHBRL0FbyW3Owu7V00I3PyjX7VkWxu3
         udn0HwS1oI/yNyZ+5MSEy0Io3tYAhDympqyx1rcyNJKFZe2sjARblPHnlY5Nfun1AmNv
         qm4A==
X-Forwarded-Encrypted: i=1; AJvYcCVtetO0/pxpVN6cTb0UEtc2h+DkrzJuTFKnB+oDuEy1bZXHrfmgugbgggyq27YAQI9X67ZVUO6C/80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQmPHG/5VoCd5YpDDz/ikiVr/YRUsE5/xBTNIxyH376qFP99ty
	gPqMAE90cAAdi2fistd7vNIVPBQ18Zv9nh17rarRTcVQOjo3wrwkrfsxB62pjS6RUwh6m3wK4a4
	LGFdmq7Rx6t+FpofG52HoTeqWdSyuvULmBzizTJMPh9JC9sVOA8043rpb5EYHcQ==
X-Gm-Gg: ASbGnctM9i+L7OppNbjNL9HsRHR7DusCu2HfQt8lB6x+1kyPAGfE/c4LB9yFwpVb6Iz
	oVQ/vuEaxTB6YEZYRylsTbdcyh1F/OTg8p54QNBCu5HUJ3bp7tRWc8qfJTtpu8pRcRRokyAIXTa
	oP4OwKPdzWSK1D+PNuFZQvCqQjywNurl0F0thyNc3CVykXCP851oMMKmz2dGhEuCfyVYvXpPPJ3
	wV46oobf+dctioLaQHxCgrUirzPoDAbc2ObSPqdlZxoRQd4YVwkFTaH8K07hvIj66qjULMdd2YJ
	vDk+RxXM+bGrqpASMV65y16H0YvMDDBEbfESqnG5A1+BgZmVhxkuxrynS1vozFBsE0F0FLGKYUt
	ObaMwLgWjlct+hlIJStcuRgs=
X-Received: by 2002:a17:902:e80e:b0:248:f2cb:e52 with SMTP id d9443c01a7336-24944a6eaf6mr134653545ad.22.1756788980454;
        Mon, 01 Sep 2025 21:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETdNKQIb3iat8a9GBL3nBus7ZBSGWhate5yBlD6Q373rsI+EJcFU/B9FTxXRzZmsVwGQ0zrw==
X-Received: by 2002:a17:902:e80e:b0:248:f2cb:e52 with SMTP id d9443c01a7336-24944a6eaf6mr134652995ad.22.1756788979776;
        Mon, 01 Sep 2025 21:56:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:19 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:53 -0700
Subject: [PATCH v9 06/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-6-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX/fr6YpHiyhQl
 Yeyd5pm6owYHXecjaMQUHqZI8cqCVPuNhHa6RUzoFLFfZ/qN7OnCMS4POME6DA7NHh8WAQVIOKn
 WkhjgTNFAucRtXxcw0acMym2Cyr7LBsZ3JJRNluXnWwmnJ4Dp938brbradR9TAsqpN6X9IYfF8N
 cLp/hZ+i0Za8/tljaah2URe8CfRDnakci5atvHIK54HF2kC2FzciQd7lBEsAtpwAy5ekb2GEWNi
 7RLZGrSonFHc33jZ0RZmODxFKAgCPVvj8waCq180ZW17CqNWaEfLV8weodhYEUOpyCZNAw8UEMm
 wPXlIjcQdgjrbnAoX5+l7RdWuK/gANCnsH/5f5xEp8V6Q2LlCQJdgXKGtrXmeEZZNIdoqHIMdmA
 FxWReyDQ
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b678f5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PzCapfnfG-RoPQGsBLHbIbDhAOWIkXiC
X-Proofpoint-GUID: PzCapfnfG-RoPQGsBLHbIbDhAOWIkXiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

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
 drivers/firmware/qcom/qcom_scm.c       | 124 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |   6 ++
 3 files changed, 137 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index edeae6cdcf31..739ee9819549 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2094,6 +2094,127 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
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
+	if (IS_ERR(qtee_dev)) {
+		dev_err(scm->dev, "qcomtee: register failed: %d\n",
+			PTR_ERR(qtee_dev));
+		return;
+	}
+
+	ret = devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
+	if (ret)
+		dev_err(scm->dev, "qcomtee: add action failed: %d\n", ret);
+}
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2326,6 +2447,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
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

