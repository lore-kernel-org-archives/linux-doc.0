Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E4D20E033
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650072; cv=none; b=M5NAmPjaAJvgJt68VkKsVXsxnkWNd1U0RtSUbpoqwWjIZZQ0FlwAxrezHv5Zx4maJpL5oY5nQ/3HPxlncHT3pMbACd6+L/sHY9+VvTYDI5mP1m03iEwRzlfxq4JJ6VauFxRiJ7TyiE4RkLQH8bveEtBVKUr7ZTkh335sxG4SGhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650072; c=relaxed/simple;
	bh=lgp1LOhLLp/W5q+GFi1cI9hy6O6fqjuRWo/O+rRQgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YEWHEOugEeelB2xcUa5/GnTKF2UBeAQuyNyk5QVsyJGDmfngM1MJzIgMMI4wVtJ+ph8hQBh64sYfw/zNirOH5MPiy19eUeDoMYzPLJB2Q+8H0wf7rTLrFwesLI7WDXHpM5HVpX078dAMfDdLCOMnKMonh3+pVXg59w4j7KUzvH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpRy7/pW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpRy7/pW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BKJlPe031037
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=; b=fpRy7/pWGVZTP1Dz
	e1t34cDlD/ZTGfskyE/LL6vIYand7oenVD9yQVWch8rrYP+a3kdIqLPeBh6CQCw8
	wxTElaiRDoGt/Wogw+ZsQ09EWh8GVRb4p+b+PCp80AUzZxABlMhvc6poTwPfzHJ7
	ufkpi1TfRSxduaJmlqk6hvjvfvvNfa3KZMbz7J0wCXbd/WzT+4Jh7GySmAFqdX5F
	HcxJ7K58TVZsZKpjfs3uA6NbWFNrK9nICcp6PnKMf9g6/51FG26/kTpcOFR9WCTG
	FjjksPAbOki4XZZxkXvwxFoahWUkjzH19Hylj7H1QWWqCIAbW2P1TDKPtF+vQbHB
	r86uaA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg9x2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:07:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77264a9408cso2905976b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 21:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650067; x=1758254867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=;
        b=GpNwwgqtiQDVZj07266jNC8xN5sOepCh8mm3AEMKQhVQbMfoMq5TV33v3GJwb4NOmm
         WFlEjPms229lFvX3CiocQKVwIKrQyajfdorAg4pg5xh+P7cm3YuYII7Rta9hdWLpIpnv
         lVgJbsMz1h87R5oHATiZyjPIHOTzz0GrBH/wFiuhAxn+9TD3KzO5hHhhihZnl/sPLerL
         gn0hvSd+k70DucsE3ac+7PvA4qTFqQgi395abqXqsSIaTNCORGS5FBQd+Y4o0dIwjmO9
         C6LRX2/ppM4B8Yyd77c/RINFQYM/r6URpvunRLl/a3ks5w/F4yxSm4ZtXAS40/4KDFhy
         RdPg==
X-Forwarded-Encrypted: i=1; AJvYcCW+CG0jXX34+zahuSwgKkGCSonpr9IZSMMV1b70nCcRDxdFPqeQ6dcGUzK8PV67SBAWg0yzeKo/UF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bK5azKnRflN3f87IaRKDIBh3ckOm2vu/X0wR/Oz77Rrzuq4u
	exDffYs//cp0qaYOzMpcjwMqkCSE1HfIcrSLFO8GtnRcREqiLHOUHz5uv1GSp0AbVztCwKOX7Z8
	9V0G3qYjVNuDVnSr8U7jY9B1TMGSvZvdmgXqhUEHUjsPa72aVPJj4azXU/2vSyw==
X-Gm-Gg: ASbGncv2dde3uVpKkhy00+22Y4VvzTGltLIuzis8vZNBUxJ7lhhV1B4AF/BKkl8AzWh
	mFKosIz6DDd19BA0+bgOgdi3IM2vIDEhW1ZupVgASCwfZdxyMsaG2sQcXhHFQgUgyuh5JSc0VVi
	olS0xHu3noRFU6EwwSntne/4n4HThPGqo0XEWcQH1hiF2JI1mQexsUAvKg4zYYUjTP4MBJ+fAud
	f1U/XMJDfgYxpqCrnu7mukjm/JE32wQMw9S+uLrntNbPEgCyvDkTirrXyNu/LytYQ/km9BU85pB
	vMcK11cAHlSgBjBvz9COKAjhKj2E85SY3pzRcjj3fXjrM7Odm3YaHwXo+ZZavytdmpDk7EuehN5
	5BGDiIxbsdwyeG76sxIwYXoE=
X-Received: by 2002:a05:6a20:939d:b0:243:78a:82b3 with SMTP id adf61e73a8af0-2602c71d516mr1871822637.59.1757650067474;
        Thu, 11 Sep 2025 21:07:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHevztzKn6DXhvylSu0O6F+lXoEaD+zI7oVZzqteG9Gk7d9QFgPnS+w+PLRXJqMaYWSBzS4UA==
X-Received: by 2002:a05:6a20:939d:b0:243:78a:82b3 with SMTP id adf61e73a8af0-2602c71d516mr1871794637.59.1757650067008;
        Thu, 11 Sep 2025 21:07:47 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:07:46 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:40 -0700
Subject: [PATCH v12 01/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-1-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuldeep Singh <quic_kuldsing@quicinc.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: 8_fpMzHu1K5ySu4VKkRA0DOdQUl_DMYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX/B/Qu6hMuvQm
 XoU3O+1yh2+XSeh2yixMH2vaX5LtmSml5bqCpXizEbgz9GbVXvkhIsgTretOJUpoVIkdxnd8eFo
 WjznoFuHhc1TMOpRmpSXgxFpGH9DKP/pwS6S3EFDAVrNzCOWfsERAsKGx6QW/xTChw6s9p0woma
 RfL6JaD4jN3yPRraGgkD6qoBaQJ5kYM4iA7S0t66KJcyoFJeO2GknQcKHp9PlWe19pWUQN1f8D2
 j+xa+avW7592a35oZPjGQXY9zRmGcgR/06fbme9/Qw2n2ScJzTo7x9czD2/nGjSGo6/Yq8mqdSK
 mpke6waMUJF48nlmxTXMy0ehbQw6QfvE5d4rVghRPJC9PrulDZBS6DW4Q94BUKUcaZrNPenfMZk
 dgueghEz
X-Proofpoint-GUID: 8_fpMzHu1K5ySu4VKkRA0DOdQUl_DMYQ
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c39c94 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Reviewed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 63 ++++++++++++++++++++++++++------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 ++++++++
 2 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index ea0a35355657..186511ced924 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -109,7 +109,19 @@ static int qcom_tzmem_init(void)
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
@@ -117,17 +129,49 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
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
+		dev_err(qcom_tzmem_dev,
+			"SHM Bridge failed: ret %d paddr 0x%pa, size %zu\n",
+			ret, &paddr, size);
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
 
@@ -140,10 +184,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

