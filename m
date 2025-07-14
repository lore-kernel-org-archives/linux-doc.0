Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF371F419B
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454235; cv=none; b=WzXvQQb/++AW7iQtCDFtyMMyO3PbxO2m3P/UZ9+bK3atayGnTaGwzjQhhbF7Q75LDpwJcTmZLlEU1WGz26DzPRNrhemsC3ixByXHgEVyZeyhPGMGMgGVN0LryyU0hmI4ko3jCV8KMidCsOM1ZujSTYEzfanIjhVySdB/KznaXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454235; c=relaxed/simple;
	bh=LngZWuqGTcAyjaZms8R/hflUlpdupIY3ruEN7UGo2Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1R2LG/c/Lu2++piXyTfvsidiTmmAl6U5EfB7fsrAVBJ+APFnnCy+hpS+c//3iTWttySuCv7LFy41XQNYxIiZ0tDOJHwoDj0NSRsH8dMHQd4ieMdVXZUfhjonThpi+0dCIfaT4JL8UQDQa4Y9+b0mmgTN1oaYBwXf5gXvBODGq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABKvJtLD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABKvJtLD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLPJxW027407
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5ZMFVD63Ff3BL9GgM0LUadXZ5oipT6BmREzK1uu+zI=; b=ABKvJtLDl5/6w8cX
	ZfFcm+Eb23kIrjVXIhXiZpVDHxkbYKOC+9aoYxWS3yAxjEykcB/bFqEOlmOlWdxJ
	eOGFu6Fa8sJjTmC5v4Ckqlshfsgf1XCToY3/03ohWJCz+DZh8nABuLwIMvxTTsPv
	RC0gFv1S5V8PjP/WxmNZG27rGGNHdz7+JQ/gCpdHbSVx/nD5I0G9IDxmf9NBns7g
	+nngRz7SN5F64kiokwpIsihh4qHPLXx3OVMQFNzEmEbRfWh7Exs/LRQH73os8x4V
	XaJmQRKH1YqucJgsVS1PreDPPP2a5ASWyTyO/mx6D4nBgc80CEefrTwS4ImFEw0o
	d7nl7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvxauh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2369261224bso43013815ad.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Jul 2025 17:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454232; x=1753059032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5ZMFVD63Ff3BL9GgM0LUadXZ5oipT6BmREzK1uu+zI=;
        b=IXQNJfxD5qDWfiEmR8hq1rEevM8PFPscZJ+Chu/GXT6YFe1I2jtaOT+RajTN3caU6l
         +UqWhA88/OJgCFJD79f2TiAJIHdS8xI/xqrvEFzIbR6b27LfraAfB/OvM/UVHDnPXYUM
         SBxTuqHKhiy9d2+w8fU0slRrsuSkMks/fyvzyNyKYOlOK4bnhSMLxm1wx1TFtn/9X62Z
         VW/iw14euGjATkmtYu0Hx0s4ZTbo7k64pXdY12Iug2Oolh6qqH2Ooje4h2dtmG8JMcQ7
         9MlM0yi7AgO1HRLM2EXCE6mfMozS8kpsWcyefgW+bvjKcuqG/mE8eyuyieCYD3Y1iDl2
         dblw==
X-Forwarded-Encrypted: i=1; AJvYcCXeOjPt6IOlx9t1rB6k6Nzj3i8TbTrW8KjvXDkZcenw/GGV60vPWUL4F8Muw+es9KH26v3/RbU/+2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyFXX77nuIIXmSKU6iO8C5GS8xLz950UO0tJdqi5uU99/xxliq
	bpcqFrCzaQEN8LoFLrOUODpeV/VvvQdZGcaBz8U/r/AZodDgLNS8BBi3d0h4ZiR/+cSO0oEPYkp
	ccE/S0Dy9k2E8byT1jCy6y7FNc63TrK0DowDnbX4nMblkOdftL3dc4u+s9ulnKA==
X-Gm-Gg: ASbGnctixGrfnN7oYIpkK+BISCvCcHfM3sBs984DHTWQsST+c9BRTF1/Aj3UajYUMr6
	ziwX7lR1ol/F0rKsH2Fd5eQdoEqJLp0swfnbpIhdpV7RLUF0Oapix8FrBVKoxtAUI6SIOf22Vj2
	lAjKfK8gdRamqVEAkkWu8J4u6Mby8b0VFQA3Ux4g8Y55F5ybKZ4zOvLD1bSbR5gVlhy1CXFAE8v
	XwTrKlIbERodAnT+Q8NPrT950UlxSdUhfm2PP+C5bt2HkOK0tGs128uj5TR+oRj+GVNAu0JLHHA
	tE7LX0PzuyhyhbI2uNq3RBUF5F/HqJTfjUhJG536FH0B6Wks8YXa2iFRuxF67DQmku4Yw3dEZLJ
	OU82qqU/Aa0v+5LsxDEd9sqc=
X-Received: by 2002:a17:902:db0c:b0:234:bca7:2921 with SMTP id d9443c01a7336-23dee236124mr154227085ad.33.1752454231953;
        Sun, 13 Jul 2025 17:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnypaVo17t4xCHlw6JEOmfm/XfLJ6d6mcw7BNhB61avFNU3lRTWBaNVX54usp3AIPAx45Lg==
X-Received: by 2002:a17:902:db0c:b0:234:bca7:2921 with SMTP id d9443c01a7336-23dee236124mr154226815ad.33.1752454231502;
        Sun, 13 Jul 2025 17:50:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:30 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:20 -0700
Subject: [PATCH v6 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-8-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-GUID: PJLo4iGcFfvbp414TEuh-3JUbEwAhc6w
X-Proofpoint-ORIG-GUID: PJLo4iGcFfvbp414TEuh-3JUbEwAhc6w
X-Authority-Analysis: v=2.4 cv=achhnQot c=1 sm=1 tr=0 ts=68745458 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfXyVU2odPUNWm2
 hrqqYgSBQMu6/VNJi2fSu8bDqODWcfS/unIkq2qZZUQQJq73/u0S6tGx9W2VFGcFN+NWlkskjdg
 ad1qbBfI2eRSWvQ6uK73I0DLKRz0doDXmKiSixv5rKRZEemcLCJOB790wPixaEgxKiRgUtSFVKL
 XVYnFcxqjl+Xf9giHT3MDhyPKrdjq6qzx7ju+/YQPxDtHRkJIMVQQ2inKwi5Xxs6UymZN62nNq+
 SHWDNlSiVeGHwvTScg3rUE46tBVsQQ+yF6SG8AM8DXnVI76b+SMbja/UbjU92lG/2gmOeGZlfms
 N5Mdu6o5ibtFS9ipph2v2cJYMTKkYMmpLNkfTRB6eZWu0OiSmC9hzrggASEdgSfxf0oK/fTXEyN
 LTq88ZTid7l3+FoKfxWJXisp5g9MsFe2mqg6RJTEkIRH7hVwUAqQ8ytoKzfFGXl7i/sef3SI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 62 ++++++++++++++++++++++++++------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 ++++++++
 2 files changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 4fe333fd2f07..f78404a8d9fe 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -108,7 +108,19 @@ static int qcom_tzmem_init(void)
 	return 0;
 }
 
-static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+/**
+ * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
+ * @paddr: Physical address of the memory to share.
+ * @size: Size of the memory to share.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function creates a SHM bridge
+ * for the given memory region with QTEE. The handle returned by this function
+ * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
 {
 	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
 	int ret;
@@ -116,17 +128,48 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
+	if (ret) {
+		dev_err(qcom_tzmem_dev, "SHM Bridge failed: ret %d paddr 0x%llx, size%zu\n",
+			ret, paddr, size);
+
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);
+
+/**
+ * qcom_tzmem_shm_bridge_delete() - Delete a SHM bridge.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function deletes the SHM bridge
+ * for the given memory region. The handle must be the same as the one
+ * returned by qcom_tzmem_shm_bridge_create().
+ */
+void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+	if (qcom_tzmem_using_shm_bridge)
+		qcom_scm_shm_bridge_delete(handle);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_delete);
+
+static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+{
+	int ret;
 
 	u64 *handle __free(kfree) = kzalloc(sizeof(*handle), GFP_KERNEL);
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
-					 size_and_flags, QCOM_SCM_VMID_HLOS,
-					 handle);
+	ret = qcom_tzmem_shm_bridge_create(area->paddr, area->size, handle);
 	if (ret)
 		return ret;
 
@@ -139,10 +182,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 {
 	u64 *handle = area->priv;
 
-	if (!qcom_tzmem_using_shm_bridge)
-		return;
-
-	qcom_scm_shm_bridge_delete(*handle);
+	qcom_tzmem_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index b83b63a0c049..48ac0e5454c7 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -53,4 +53,19 @@ DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 
+#if IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle);
+void qcom_tzmem_shm_bridge_delete(u64 handle);
+#else
+static inline int qcom_tzmem_shm_bridge_create(phys_addr_t paddr,
+					       size_t size, u64 *handle)
+{
+	return 0;
+}
+
+static inline void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+}
+#endif
+
 #endif /* __QCOM_TZMEM */

-- 
2.34.1

