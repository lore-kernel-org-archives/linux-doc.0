Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5FB211486
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 02:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130112; cv=none; b=PmL7sz5OHtn5uORUJ2I2gV/pAxL2Qx/l3Emb+g4I/DHEAN5LOYAU1LpbZYLphaeeHOgFp64c1BGswGOf7ObEaypLttFV3Fvaht/gxWyZPB8pssrJWJ/PEn9TChr2jpQRcaoVyfyZNNbdY8jdkWC/qnZiqFFn7tlME7BhP4jLQ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130112; c=relaxed/simple;
	bh=NZ9UoQrDtsa/bdxaCCDtRbtSyRUdRiMoDWerA6WxR6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6kpJOYIBI3zUNEa/rgptrOgOwdBll46CiAv/IBF8k9q3RuARgLYMmLzAksmOVNWTzHlH7WbSxQijK8KWuiTFWz2rQctpJrNcmHhGvg1K/cpdUUVGYcDv/So4l60OHi+aCs5juLDspUB3Whw4QSgonjThj1V0Y+XXHg5Ai0kUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmm9uEWV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmm9uEWV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REen1L023247
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 02:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=; b=cmm9uEWV1oeL8jPl
	MZVPPVx/4ZLP/0uZyhNkOysZJYIlURsbiOcbhp9287dAHOSzVN0owQEWzpoX/U8M
	u8oYodI8dXj+TQxf3nKFcTYpAi4L9fGBEUROs7Js74yaAxRGvgOO7Rbpep+2tcOe
	xwqrtdBlTdc/5NQH+ntXoKRX+LR8MR046dAHHNV/t1RfGB9EuzQJtSZ9B/VM5Kqv
	bQkOQ+jHKDRYEvqfKXAlZnCaTB6YHWYadkg0U8MCQmNmBeRvg0Bnq8RGE90NCqcG
	DGrU37NkA8q4LlNmN2Ig/EOany7qaIVdGR3LwCdLHEeeyGcJXWdoYVbQDZAE1Kk4
	e9q2qA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mxp3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 02:48:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224364f2492so30011165ad.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 19:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130108; x=1743734908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=;
        b=jLZ2n6s3icSIC6ZE4YB4PhHtYSZoLEnU3OeBJzd3knMPpvC0OXWeHtLdn83kO2Hr56
         PxBOHuxUF7ADWL6KcLccPbtGumQP3GSN0PFkLU1n6PXwQXI+D76SOze561zB7A227QVO
         98rRrrVtI3sTKbuefVoMsyTIsGvChTRAcLB4aCiccE9QeVNrp6sO4NKtdUyLEPM4IQxU
         8e+ZuR4B5MP1J3afpgmlGuFKknQ3vI6MSyirODPptl/BEYpLHhEmoguCv9ISa/klvywd
         t/a3PZEG7etYCRHolzvhJK0zOOF0KQS36JgAnO+oXXJCZwNQ/3LLel5k/s0Z5u3OJorK
         VebQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvPm/XQhlCEaa4xXCtHH+3EGwuxEvwHFgO0nq6Yt5B5hxcyy57inFxq8g2LN1Tnq7GdeuKjBuDIEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkRwqFSSQoBM4ALNCu1D6TFy/El9pjqz2wTY1zSN7CJ+ikFlMr
	mg+g2Xjf2hHSpjuZpyFLWlQBCNBxm6Z5iVFUPyQXe2ctxcvhRnfxCSjhH03J6lrWarzejxkmrCb
	NjJCl5mTERIeBN4dkZKlsPdsa/7jxm+l0x6+o+9Yi031iGrmMJyhZ9z4ymw==
X-Gm-Gg: ASbGncv5ghIbPWeZjYix2V6riFYhc5Tr7UneaMHQPyjkM5K01BRWD56zs+wzOuD8nDk
	yEirwTiu/wKg/mJLsgSukyDSz/JSFVADk55TcitUE2J8/ehTwuxIGQORoROR3lsblF6a/GDQmgi
	dZCjruvwBYzPSfTWYobsdUQ/nOzdpwkVUEU5BSn5KclDIrJRUlaZnXo6ttSxAyAnpFcJtKXbnHA
	jZZxTzHXb9QXoKFZ+b3yQlpJ03yMZlwe9SWLHeUigTHYsU6MqpCSwmyGdxGnE2cpKpss+NpWnHF
	PnmNunmAj7P9mee/Ofm3DUOlAu/v56l8k+oFuT9neHv2XwDTalnk0uKq0+Jh0KISVxyWoKU/CDE
	=
X-Received: by 2002:a17:902:cccc:b0:224:584:6eef with SMTP id d9443c01a7336-22804931682mr102373975ad.41.1743130107545;
        Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG376plMAvRztvVxrFSFDPsbw7FDsAlz+S1si6EBOZRDE9gW0Z4qYLof7JAVDpMRLsJ8rwJEA==
X-Received: by 2002:a17:902:cccc:b0:224:584:6eef with SMTP id d9443c01a7336-22804931682mr102373515ad.41.1743130107044;
        Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 19:48:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:29 -0700
Subject: [PATCH v3 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-7-7f457073282d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e60dfd cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=F9FMNDSCD7THEPBdllMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BPLjxAJmEyuismCbLselvOo0c_b6MjeA
X-Proofpoint-ORIG-GUID: BPLjxAJmEyuismCbLselvOo0c_b6MjeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 548dbd346b1b..a02913665801 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -107,25 +107,61 @@ static int qcom_tzmem_init(void)
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
-	int ret;
 
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	if (qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+				       size_and_flags, QCOM_SCM_VMID_HLOS,
+				       handle))
+		return -EINVAL;
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
 
@@ -138,10 +174,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

