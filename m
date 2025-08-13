Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEFF1DD9AC
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045432; cv=none; b=kWsLtJ6IclRXnZNt3fehG3Z/rfpIXqWeNG22Rlf/Qr9ZBj72QmDv7t36qgKbxTJTfFooJ5IDu/UMcpBvMtRMA/LxDuyzEggcyBwP3wPPBela1eKt8oVXWE09xPluplr7R2UsPEEUhPyqVe/I8d+wCFnfSKX2k179lp/SZSQwMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045432; c=relaxed/simple;
	bh=l2P7dGtNDbLNv/xg068cPe6Xi0IqjefQehxcflS58Qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZrQAqtueOcdsEXTJ+AN4Lq8vvn2T1i9OnLJKXBeb+Fwih7Wrl+hf7aP+DP8zIok648/6FOHWBL3Oo2n1lkMx/293NhyfLZT8wGIRGBHGNwoBeekJCDRydmvbD6e7nl/Q77pLc+E+QqcJBSHplYz6BesV7j2ie1HVj7poO8hKnXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5iETodn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5iETodn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CMFJUw012365
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgfYqYOzEqvZzDTEjOA+cDrnXPG7DG1jVg7ssY0+cns=; b=W5iETodn8jHBKi4m
	xuRfFmCAak3OCVLbVueIuVwGzqqFWX8lha19wKoPvLgAq/DEA8WOuKipNwL3mZuW
	wpMDy0d1Si8/Onh+e0ci5FITGJxWvv5mg5KBnSRvnaYZhUOesTufRdVn/5GdyTu0
	1mjJBWBo3aba5c8bUu/IAmksohlS84K7FxQyjWHJ/VmQfRCXBORgHOJttmQJ25gB
	+F96f/jScacwI22QmdMWqPIEUyniSerobI1xOdyzWPAGZDJFQ41ZfmBxQqBmv6rQ
	WJWQiWMWf6D5qcHD1jeHF0Hp/lVgB63BwPpkkfvTlbg7JZULwTs7aMUscNlwPpG9
	6tCIGA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv1vm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b46e381d458so4748940a12.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 17:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045428; x=1755650228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgfYqYOzEqvZzDTEjOA+cDrnXPG7DG1jVg7ssY0+cns=;
        b=vnY0NXuCdyWiP8yRMX1zuhjujwNulqkFkItswneNxZG7fznJRfq7ypk0PjLrARWN2P
         W2lNAM1YPF+CzedVs0KoAJ/JFqdgdAOG11uH2ua8qoFzux2BqJHc/oSoM0IqfNsTlN7R
         a6Fi4PUxUY73FpGGPvZjcpvs8Rz2ZW7BtUKIpLvV5/TSBX1FXAspHBBPPNTbu6MQYiEf
         y0dreLCtV9bPf74ZFuJJsiW2yrwhjlf1s28JtFlxsY4yFeKdPJU63GGM7y3yHMvDyUu6
         zVzg/YrJVTeSVRtla+wJLFmbtCqn4+9TzrDS77pgsEjnICc2q2JVIa1+67vDOfHNbwvC
         Ohww==
X-Forwarded-Encrypted: i=1; AJvYcCXrohwaEyDsinR2gmkUUfYPoNWqtH6auf3fZbyJz+WeffZrLOg6LwID8JA4truOSIPQUJCuBW29lx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKadLnr2+Vq70j50h5MKXnrVAHZUa9UZ4tHFatQd9kp5LQSA+k
	pF8Jix/EdAEEKeo6WC5wHb0c7AqNFRSUY9ajfuwsTIv/Pj8TJa6tRAupO38PUiqpOu+G2nqdssV
	WMtkpvhsga4Yi1aJs0FUyvvcZ2xhZPNNu3lrg47pqNFxPj5WSbb6xKMHPRSXOOA==
X-Gm-Gg: ASbGnctHrFm4taZwB9pQKIXYTc8ZFoSqqxEBY5pagkPWPCekC6w6LE/j1e+n9YX90xK
	RFyEW5ZFekcZ/pWtyPClyrTi8LV7c1prpdvMhtllClEIEb/k9lG5Au/sq1lafKukMkcnAeKVZgR
	311BNZPuyn2Tgxo78frLDiCbI2HVkUlq1B6DEsebCQLVog3UWafw7mlBxxGqt7E/81cSeYgFuH6
	Gh+8gETzx+KFdtCya0S0dcQgXnRjMz8Javnff4m/eHnMTeMENr+rW1GV43RbMDIOk4QWY0jqHd3
	/YqTyR9u8APzYLBMzPA5yBZ5dkFZPeBVsyC303IR1kJbVItPjWYHJJxMmuLCdkvX4V1Bsg/3wTa
	HPOLS4HgcrvxkTkc2JBbBsVk=
X-Received: by 2002:a17:902:e542:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2430d1a1154mr13672845ad.30.1755045428458;
        Tue, 12 Aug 2025 17:37:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETQhucWOuyrInlNMjjBgfPxk6ddKB7vzyIdf9uZsC7lDRvSujER8Z4KmqJHik85GdmZw/OCw==
X-Received: by 2002:a17:902:e542:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2430d1a1154mr13672655ad.30.1755045428036;
        Tue, 12 Aug 2025 17:37:08 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:07 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:35 -0700
Subject: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689bde35 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uB1HzxUIQpr-hvknsTF_s84RkuAad78O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5eKR0Wj0eEG0
 tSBukxj/sl3ZoHp0ke5dMTUVHOsBWH0+T+1R/CYpOb3GrQUBYGi+WjA51aegU5TYqoF5IpGo46/
 rL+v1TCWNGvGdlRZXcv8+Hvv1Ms9pq3PpCRST80g6NGpvoj30vUnZ3bUM7MlZO6lXzBvhouKRxe
 /ukuPOdjIVsM4bP7Me9yQ5/XC7H/0vaIfGiYLQ3UJdrStWXNs6NnOTg4GvhIqd5GqYUIrglWZat
 lwdB4G4kf5aTMT3EAKHmz1n2a3Wekhw90AthXMNQaEOkZB6S7BaKrc9cu8AROgFC3vcuq9qU5fv
 QQbmgwKHWZcvW8ieVtlynExv7eCMQRhTYr0VeFdkZt6eu1qGeswFC22ZGUAphevrwboGriEVj/U
 eij4r1B6
X-Proofpoint-GUID: uB1HzxUIQpr-hvknsTF_s84RkuAad78O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

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
 drivers/firmware/qcom/qcom_scm.c       | 128 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |   6 ++
 3 files changed, 141 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index edeae6cdcf31..96d5cf40a74c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2094,6 +2094,124 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
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
+	*response_type = res.result[0];
+	*result = res.result[1];
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
+	*response_type = res.result[0];
+	*result = res.result[1];
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
+static int qcom_scm_qtee_init(struct qcom_scm *scm)
+{
+	struct platform_device *qtee_dev;
+	u64 result, response_type;
+	int ret;
+
+	/*
+	 * Check if QTEE supports smcinvoke:
+	 * This will fail with -EINVAL due to invalid buffers, but first,
+	 * it checks whether the call is supported in QTEE syscall handler.
+	 * If not supported, -EIO is returned.
+	 */
+	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
+	if (ret == -EIO)
+		return -EIO;
+
+	/* Setup QTEE interface device. */
+	qtee_dev = platform_device_alloc("qcomtee", -1);
+	if (!qtee_dev)
+		return -ENOMEM;
+
+	qtee_dev->dev.parent = scm->dev;
+
+	ret = platform_device_add(qtee_dev);
+	if (ret) {
+		platform_device_put(qtee_dev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
+}
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	ret = qcom_scm_qseecom_init(scm);
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
+	/*
+	 * Initialize the QTEE object interface.
+	 *
+	 * This only represents the availability for QTEE object invocation
+	 * and callback support. On failure, ignore the result. Any subsystem
+	 * depending on it may fail if it tries to access this interface.
+	 */
+	ret = qcom_scm_qtee_init(scm);
+	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
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

