Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D271E5213
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045434; cv=none; b=rohe3S4hJAMJEwbn1YTQwwyxVuvlONCnMZ4V+6QpnYklmvKZiTzUM3cM3YwENOF6gvBKB+Si41gjoE0tNv2GBeypUWBXIbyxw56sPb+OxYEOoX0AR+7d/UnhgqkfpoA6taMgqU1813nPQNkz6U3WqpsY+zVCDWfZ31DlYeSQW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045434; c=relaxed/simple;
	bh=pKHQi5q0rF4Zjn7LuFjE5W8ncYtz1oBEEOgTdSaapz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lymhHEcb/wrkkZF27Gfdqx3IDAAeLbPa87p4nz6VtLbE5FcpaikeqbuCbaj/TM2+B87Hy0Ow58RaGTprDRo6Jw6+RoQWxJjAX8wMT4W6oSF7ECTHh+TbOZnb7V6o7gDQyUnfOZ+9BwzUcpZH1JxkR92vt6J2hOJV/X7qbZePRQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoP9mL0+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoP9mL0+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLFNTb018173
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+IO/mYYyn556/HWuKEpMTj/0Tt68TcQ9XKAg4TOT0A=; b=KoP9mL0+5p9sVY5g
	DB+MjLf0Ot0KNG+qSe3KtuAJNplE80NHP1+TMqGVmsHUGck7syVisYXR8IH28s1H
	WiRuZXFRqr60rH9Npqn6JVrO/C7Hm1kl/XjrtCLkxMWZrM3jgOpxHReTp+/vKWHg
	RL8lFgwJYj/EIJ33JFiCfQaqb0n0qbErhvvhClbPcS1YoqcFqmq0pXP3mLWeHCT+
	x+UqLi0ReH3XZM8tHJolPV/d2kYu63MOPaY5rf/edyfRBNRA2VQJex+G9nY3NXvU
	pRHuj8GCoxixxiMAku5PnqQFto+IjLolHKzGQlJ4u4Juy2z6U5s6Efwac/XKHXzZ
	BmMMxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4dvm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23fd831def4so51476395ad.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 17:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045430; x=1755650230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+IO/mYYyn556/HWuKEpMTj/0Tt68TcQ9XKAg4TOT0A=;
        b=DxnXdylkgsPIbsPzkMq+EO99Q3cpZXki7z2ftgPDzFKSHX/kMh38hQnjCT73fHXK6d
         XYDpWxRQwpUwQsceCnFjbRn1LF8ulX52vE2rqFxvtywPnV81P4YDAD16Ug+pk2PWZyyG
         8fhsyB6+hwg6ypexjjRSDj5H9xwHRvxxCtM/JOh0DcbAz638J+1IzsXQl+SWEgsXHTTR
         RtZjKoUuJaZAu12tdMZkZBtthTEApMxzICYxg3QrPFBiQnXLP/lTLi0eP/O5avIV4+62
         DPNKarVB7gPmlyD8pFYCuueoXOHjqZj7tm0hoG1+vlIT11XZ4seY5IKRXxZ+b5SYyNzf
         qExw==
X-Forwarded-Encrypted: i=1; AJvYcCVd5WxvYV8u5sK7Agc/wPXHUsL+i5RJM/2bIYjN8fS6fo4QozMgaxf+sdz+3o4X7SDLjEo+TXEnvow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6JANN7ryQm9pzTPJjvmWU2k8DQAf2aVx5kTGnojmSGtmwY8H3
	8tRVsVKmkrCyoaelGXdAgVssplhOqYjIHPEourZIms1aAkcrrJ9Y3QLuRlG6O0em6qfA+RAv6eV
	3DuTpJK0Yl+aShnHYB6AQlcSJvHbFBnDLqxDKTWPo7Ijhm1FwC+FFaxhTURI0qQ==
X-Gm-Gg: ASbGncsL0SNIQfIsgsJ+oIOUgWEnuMsAT3CR/mQ+pY4ZRSLwsRzUE29AegbrtkI8fYL
	mSa3Ji/KcuT1+0HUmkon45SvMOpu0HMcejqja3D00gOU9bvZn9Legnti3z3+57bEo1j6FXhJ5eR
	5Z9Ia1PH9Jgw206AtuRVq36dANYHGHIZu4H9qmayzP10ZZvI3WfZnNKAvi2u3MeEtdJx3AVaWRz
	1i58TAzJJDMHD0nk/whbdixXciOKmUtXL8SsQEQkro6adP3lkVz8BmOBpGpC5VFBmYgZiu3ZF7w
	/2bv0zCt+Vd7yX+1/RXpwF8p02Ua8n9W5Mbvb870FXdYMFgm0rbFQf6BKVt7KDyflCgQ30NU1DJ
	Y0S5B+GJGsXN2MvePcNB5U6Y=
X-Received: by 2002:a17:902:db10:b0:242:86e4:3d86 with SMTP id d9443c01a7336-2430d10df6amr19174245ad.8.1755045430209;
        Tue, 12 Aug 2025 17:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXqDrIPqSDRuMX+/u3XPMvQEItZdm1JDG7Hzxm2pbqkxQe9lDrS+2GxflzEd97bkgHKl+fEQ==
X-Received: by 2002:a17:902:db10:b0:242:86e4:3d86 with SMTP id d9443c01a7336-2430d10df6amr19173735ad.8.1755045429681;
        Tue, 12 Aug 2025 17:37:09 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:09 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:36 -0700
Subject: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
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
X-Proofpoint-GUID: ryO8ncMUV7CrkXpvpC1B0t3f3DxBlYJ7
X-Proofpoint-ORIG-GUID: ryO8ncMUV7CrkXpvpC1B0t3f3DxBlYJ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX5JCwvFFFhekX
 19CZcsNH0WJN8NxamcljjMV5EYWy57DOOCoxIN1EYH4+SUzT+9OuuFQ97y/7sj2IrIJgWauEc3S
 dMEAq39HbQ0sGWyzSGCUfoiV4LfIbIkebkiMS9r+9f/fSijd6CmIafJRKahuuc35ZEbjTZqxSIP
 96/9KddZA3C+Z1Y4tKobi/TGmPbYStmx0I0OOGPKco0gozc4YPCBFMILbuI+znyLW3Jx1jGe/mz
 5p3163aeF1GauAD6eA2sOvp2qY8Rj3Qqw0Vfy+F8gPpZ0sB+IYaABo3vOkimdQuPtMZ2dYAXdp2
 MuglMfpdgA51e7WRVA70NUR0VQbKTHY+nFOBIGAKLMp2yCLH2ZO25EoEH2szBiI4ybRf6QQNekQ
 RcJ7uqVN
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689bde37 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
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

