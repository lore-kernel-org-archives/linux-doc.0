Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E91E5B82
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454233; cv=none; b=fPJO6lECJroZ5cNlDqmToLliHHBJyo24+DkDzzM4cy9f2JdfJpqvvX7U0imn+L3JXXSwV2kbwEl9xMA5MW3AvIHA8HdnTenOhl2zMWUewkNzUt+5R6VwVw5J3qYgOeeMF+5X/vWQwh3IcVULc5f6C5X38m8v5na283D4Wsykt9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454233; c=relaxed/simple;
	bh=4sISDrGhRvzrnVyaxYAEMv5e7n4PAkRIO/PLmW7kiE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZe8xELh+kxKpAHsk41qA3Wvesba08+o5ITmcozKLzqxTRhGWbivn6lG9BKOUnEckhCLkNFSBzLnmNckV8KU3lvq3ppwaGf59ts+UJvaSYnTbk6OsilMk7XTZaSH11uFq0+GAXRn32P7vCFOtn2vDK9IvdTKE0i26fO4mZgFe88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNJdeMb9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNJdeMb9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMmOcs011638
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtCsRmh8jzrf56uQEtvaGnF/ZyolBNlXVAA72gSdinI=; b=HNJdeMb9smyVNK3d
	hqdELrLLMjefMpu5GvCEEyP5jEGz1Ad/YoSo2c+pF0CJz38Ln3Ed1rbWEXY5BrL0
	vFey9++CqUZoSXnM9SHVtvRfqp5PjjhaDIaM0HctjIZc0LQLNrDeuUjkbJ3i9Fb2
	U8HKdHQ4aCiJHWkZdOQcLv7CEFTDThX51y4PyknoMHrQV58M4pk68ErOLQtxpxno
	Q6s2ODXPMHWxxkBIgDBuCm842HflStjf5LYNTH/Ym1fRsCwH1JahJGjCIEGjrTpY
	hucKwDwk9suN2iG7tDZUDu9/6MPDFouL4mZMRxTwL27L5ChtNkrM5bU9hifoIVau
	ezrdEw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a1b51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b34fa832869so3743600a12.1
        for <linux-doc@vger.kernel.org>; Sun, 13 Jul 2025 17:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454230; x=1753059030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtCsRmh8jzrf56uQEtvaGnF/ZyolBNlXVAA72gSdinI=;
        b=EIBTDU9bne97+1h0ZyWh13xxZAJDdxpQxvSJTV+d66cmJy5GC2SCoFD4K91eHqqhDg
         cwRSmz81tZXRXwZ77ThN0yAbcJlyBx579cjQhhk5nZS8SYQSG9UXpkzfL/3g+AkUBVzZ
         sp5E3/ftLQCsduECasXnDQ2WddcvZyvAwuMFxQiHupygetbzGAtJbkyeQueblSvaSCPJ
         CjHhOttNuOImeeM8J1yEUbFO0291t3rXSjMS5iRPiypshbiNLAXbBBAkaep2u77AvgBR
         GslbMNNmChWtbpmP5ynq9phLMUnjaTnjg9au2gIvaNTaVIX2yMMwc1wsXva+lRqT2tVL
         S3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU997BYkpVLiDncO4+PCG4mGpwHakqLkRKRgzy4pYrdaDVj+sW6+R32TAwX0AlYDZYmGhz29StMyww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3zD19LxKudq8I18E7ltCTuvkhpdHMO7i4lv38ALDIYyGcDOK5
	vANxTz5fjfb8rhR6u0J89pVvFR9q9Cek1WX4MuQ6I8dlW4zK9a+PdpuISFZilxTHB8GJhR99j6a
	q54k4bDEvVvzS6q8C51ydiloUj26Qw6zI77WBMlrdMKogXl/1h4+BUd4ewCBABA==
X-Gm-Gg: ASbGnctvlEn8c6ELd1FE/ESHVVHCeiTbaalD+WV9AVukYorDcVkS7OW1Fo20mkfuMpW
	nadn2E1nBkjAWiNHBwdY+3uXUXD/hkTVl5WS0lKjdm+Pf6flQENNXxdd5kTNpn0fMv0PvV18xuT
	NsxT0QhLcsU2N7LQOE6Y/ozMmpdBf3qs5e2O/enbbEXm2CvzvO7YqbFlfOQE8N5SouE+IEFuArM
	zkx1aevhCMJQijFJt5ws8uf+GrvF+fPisXIaKs85YqLKTGKo40/la+zKHXeL78u57rb64v6p9EK
	tFZ+Q+9mc4P38dyuyrn8x3LsownGVe62al2BkpDtn1qndgNsBUo295hLj/pXv0IYZMb1a0GSm04
	601WN6tk/ExhDg+zweBoMyho=
X-Received: by 2002:a17:902:e841:b0:237:e753:1808 with SMTP id d9443c01a7336-23de2feb28cmr210286345ad.20.1752454230210;
        Sun, 13 Jul 2025 17:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwgOuMB01t9d/8iPExWoQH54161e+s537wrXhm1aY46pxdDIukSkyHhGxM1PtdRNmE8e9+NQ==
X-Received: by 2002:a17:902:e841:b0:237:e753:1808 with SMTP id d9443c01a7336-23de2feb28cmr210285805ad.20.1752454229772;
        Sun, 13 Jul 2025 17:50:29 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:28 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:19 -0700
Subject: [PATCH v6 07/12] firmware: qcom: scm: remove unused arguments to
 the shm_brige
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-7-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RSfq_BMxKgPzwonBlYPCu_qYlZgVUIVJ
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=68745457 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RSfq_BMxKgPzwonBlYPCu_qYlZgVUIVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX0D5CTLHxGwGN
 y5wY19Jjj0K78koQvXFwnH78rXRI1nj3+E936A2p4f2vBj6h9vxlDzFKgz03SfBPwKLa6d3SJYq
 DmgD32Rb+zhYDc0nj3pi6kgOIPZtQa72zgJ0LmpSiihxPe1Fah+4kqZmSSvFK/2Rq+vIlGKMJNN
 U3FJwSwgdOiLPOuxKRTbQ/rHurkHwNQpFE1zxYCCAmkHP1vJTt3NoTns+6sDVxR3FIUlKBQ7Vzc
 jKHw/4z8wgPN/rl8YxlgMMAErlWPrFzK0/+dEtnwCsRd6m5CHNzM3+gJegztzu+lU97rVDtcSRX
 Y+HywBTjIQkvJ12fKN+Em7S8Lc7ksYBwyGl0pA/WL1I9i/Vf70m+sdbTsSOFNqFY8Ijbnclton2
 pdQHnq98vSY0agI1LGy2iO/3CCO+ODsdEQQvtXZQCpxPC5xfqFi6XWxsqEo2EloGigSBEn3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140002

shm_bridge create/delete functions always use the scm device.
There is no need to pass it as an argument.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 4 ++--
 drivers/firmware/qcom/qcom_tzmem.c     | 8 ++++----
 include/linux/firmware/qcom/qcom_scm.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e3207a9d2de6..72223d7dc33d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1631,7 +1631,7 @@ int qcom_scm_shm_bridge_enable(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle)
 {
@@ -1659,7 +1659,7 @@ int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
 
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
+int qcom_scm_shm_bridge_delete(u64 handle)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 94196ad87105..4fe333fd2f07 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -124,9 +124,9 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
-					 ipfn_and_s_perm, size_and_flags,
-					 QCOM_SCM_VMID_HLOS, handle);
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
 	if (ret)
 		return ret;
 
@@ -142,7 +142,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return;
 
-	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	qcom_scm_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index b3a7cc20e617..796de61c7e9e 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -149,10 +149,10 @@ bool qcom_scm_lmh_dcvsh_available(void);
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
 int qcom_scm_shm_bridge_enable(void);
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle);
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
+int qcom_scm_shm_bridge_delete(u64 handle);
 
 #ifdef CONFIG_QCOM_QSEECOM
 

-- 
2.34.1

