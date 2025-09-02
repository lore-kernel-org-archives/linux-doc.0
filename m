Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520632E3AEA
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 04:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788986; cv=none; b=tZIJLKQ28kkXSq4b9goqHQTmumai3g+WMiisPhRdFedFbjW9nZFn/yBx61hVxyRRU8YurhtLuf9yYcCA2bq6hnl6OZ10WYNmmcpYnohsFNlydJQtd/jd1UsRaBWP4zHSenuZDIofEGouzCxkm2P3K2iW2K+Gfwgh0n1XWjO8a/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788986; c=relaxed/simple;
	bh=14ZTHl0WyMlTosvSsdQcfG20Corab0amwL7v8YXssQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUjdXFgi5wQP4TFE1x1fipQTs/G9FIjrs6fZ7zvJAzanoIjOq4CvbzKERBO8kXvWDe+Qk9vE5H/floQJKOrAeUkKdZpfR5VIbaP7MShlQdWVoxunMljqF0uE+VqSHdn18+VT7rYqCEUKd6giH/FowIRTc/7lGeTZJ5NF3QzpAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXg/LiFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXg/LiFV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822TUM6027881
	for <linux-doc@vger.kernel.org>; Tue, 2 Sep 2025 04:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=; b=YXg/LiFVAsACtXPJ
	+FHkmpIRGMsYlEsL0KYdLYbObGiQRj/cX6RuLEEzDDPlXk3kDAw/H4NGVYAL06QL
	8AqO0Yk3wWtFZqZTHpBr6SoVNaZBlL7NHOrDD8GsQEOtDVh9IC9Z8PopLkodv48C
	Nuz8FCGn8dKw4iQUK2nRC0xt/LzErQ28L/PAaeynvIVKiSREsFt8Hrs+iaMYEaUM
	ZUCPEYSy94EKx863nLQESFDzlyLhD8L2YO99/+oOMnHrKpGedGlT+d2E69ewvwcw
	emY0dj2eWKheYm3ynZsAZgLChtQCtV99W2fJBY7swROvrg50EIvNb1xY03x23nWT
	QPp/qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxju9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 04:56:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-248981c02cfso54469935ad.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 21:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788982; x=1757393782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=;
        b=B1xbvKBIS0kvclIsAs7Ok8KKmgFisl371Q6AXLZG7Tqiv8flGGhh5iOTQkfTAhCM/5
         G3z/fy8M1vQIpZOmJ1sdytNWatmxnSEqHbv5Ysp0j1LBBPyxA2jxacNBmvl9R4Q/l4/J
         Rn3LzUTwqXFi+AjGdNdp5SqjWmvawtmf49poWJ1zI8mMTKtEcmmkcyQJEegYJYJJkKHH
         6gX5bMrCNahl5gHw41tvt9CJgG2MNShFHm7Qy+HjIEBEaXU4ZKxmXHy7aLHETB2WBBaw
         02jjob6D1iaiD+aPogBQ9/TpfV9RsYSyyPJC2I6L+CmkG6TIcL0Xljy7DrbK/xALWRLE
         OEYA==
X-Forwarded-Encrypted: i=1; AJvYcCXf3qGTxex7dKCwyI04CNJ1IEXbdlK5w2cXlSYLRbCKuWUG1vI2VfoRS8ZTxQLeTjx2XEP7+uiD2NA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwETJFx/IHSiON02U2YqXNle56Cy4J5XI8me4lgI8HjALB0jwjw
	Vi1k1ggARCuDUwQZzkRtpP1pblFGVUOQ34DJYqZc42uZcdOC/cTPcGQVm1rK11lXXqXodq9TzD9
	IAfEW0k9M/Z4wz45NrkqKV1SAPIABkwlDk5GJynMTbXgabgWrFNfI4Yij93aJ8Q==
X-Gm-Gg: ASbGncsa9rrTfev2cINLmxnVpVzhZbdhR25sFEbj4z5sRKbNTifY6k5bvFawRkTA3S0
	va/oXZb+UtxFkuDl1MUI2uIyMMeSXHJ7idQFlCcbEazIMiFXxdSB1OFZB4tWoETL/6qOzEX16/i
	slr2HC4b4JOkImxTstP7BI4yjqHal/BlZ7PlYJnzxBpok44K5XNkBxsEm/9cEf78TTxctE58D8I
	Tv1XKOaVmK3lznhJi7kXVVnWmlC4+nyy/GEToBK+r2ygIPMdFkXDNhL9tqbae9p8o9Mo5Nl1tdr
	o1chdHHEf9bf12n74mdkvIIqxwWeM/t/zL5OVfni1L9+MKm5xDN9MJO4oX2DN3cZHqFUR8bG5lP
	e1D8mRy9+aILHpjbKL2+j3mQ=
X-Received: by 2002:a17:902:ce8e:b0:24a:d582:fb9f with SMTP id d9443c01a7336-24ad582ff3amr71120425ad.34.1756788982042;
        Mon, 01 Sep 2025 21:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwKlUPTcvvuepjIGRNGAAh0Ajjaqx7aWVyJoqopok9+dG27RrtPW9DkeRIgzIE6PKFiGoxdQ==
X-Received: by 2002:a17:902:ce8e:b0:24a:d582:fb9f with SMTP id d9443c01a7336-24ad582ff3amr71120045ad.34.1756788981551;
        Mon, 01 Sep 2025 21:56:21 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:20 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:54 -0700
Subject: [PATCH v9 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-7-a2af23f132d5@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuldeep Singh <quic_kuldsing@quicinc.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX3Mj3MIYaOJnw
 qwFuBzU8ZtQZWJVtNlRFNjxQCtMUe5otoIM8bJn5gUQeqzqqlQ4G7q6TSWwNRsOwqPH/CeOd8HB
 QaK73F9e9nlb0YGBdOS0bOqGjbNhuU1mWwjFt5nHaN59GfJsPfv866W/NpmfWE2ZudCa0vbo/PP
 o7REN/nSISCblcS+vtBQWXQnC5ta3rDzYy04E3JXpkeGGP4thyERqWyBUHC+ptVnQRHNy94fj2q
 8/ApL9nXwd+z0HZxxVXqLPS8sCUKBgpLlOnClfbFxb4duKA925ZpjNL2xBxhrkFdSkIS+hMyEbR
 7pUUb4PjRve+vVOmKdkHsUl2E8qIEF/NsEuFeVB1iAQO2kJhzRy/Ng69jJI2YaEjxdqESJ+qB8n
 dIDKojMV
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b678f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tQw02tdEtyy7jKy0unyvIGftwTPVCMcU
X-Proofpoint-GUID: tQw02tdEtyy7jKy0unyvIGftwTPVCMcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

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
index 12e448669b8b..9f232e53115e 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -110,7 +110,19 @@ static int qcom_tzmem_init(void)
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
@@ -118,17 +130,49 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
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
 
@@ -141,10 +185,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

