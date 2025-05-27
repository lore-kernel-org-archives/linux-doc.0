Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF2205AA1
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329051; cv=none; b=ZPiMULEXkKxcyNQ3hsQBr7oKGoNmKNB4+iOj8x7/WyUMeyQAEm5e5Fv7QWCSA6l7hhZA92yrjEYXq9+EmaWRVX90LfoLx2/evLWOKKg58m5ptRN3Lt0uxiWtrU+2NtSWF++8W0uTDsrLPdjEOwLyOXsP2NbKdaLwQgtoBALL/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329051; c=relaxed/simple;
	bh=Zth/3P/FjsXFcXOPT+DjG5974NddOP5SrXJoKFpW5WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFaLvW5GUxkWXCphkXwmOfGNBbOZAhS/xXvwyZ9RDpf9kPNDiioIkD8C0uqZQdD2arhadNy4YbeRqbd/oe4xz5iYy92vMEIzGriqOVHSwRQf6AS+vtWaTdS48F/WbuOxYipfxC/M2HcTTc3MFG7UkFBknr1e9uat7K3CYhMk1Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWHmPsAS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWHmPsAS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4Tanw013944
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8VjfmWoJoDXBpYwZyd2P0w0BU5tyeVntRTG/sihbWg=; b=VWHmPsASvegByRyw
	WczWGexUVZdgO11kVlRtNY3jNcZlPNDXPu2E4w2nrwXOuhJofYYCofy4N3N3/Zxn
	c4AF26N76SAmzvNrSzLwMGIG8H3Upcu0LrA//O/bOHJ/FYtKblcA9hq0czTOmLey
	7ZAwupKbEEY6OSFqJDyF8A6zdjbckwiWdtfSjCQS1WzhoTHBgS3rpsVB6048CWxA
	zL/2hYhQlxSBnX2nz0rQhAkvQzvjnas9u/LzVkPb8tFAzN39wkyG8R7iYHTP6eGQ
	NDD9+Lf53PtxB1XfsRhQzPV9wKmaEuQAjK6UdaD5VB0LMkB39JK0bG76zr4bFLv2
	lf8z8A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549dyd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742cc20e11eso1859192b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 23:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329047; x=1748933847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8VjfmWoJoDXBpYwZyd2P0w0BU5tyeVntRTG/sihbWg=;
        b=izO7XJJn+NCLlDLmRaz3GJmiOVwnTLvPbacaQO0S1nOcTxqyvw3/zPY2xap2emekp1
         wZeYGc4JbXRlxa1nJ8H1l9BjOKAN7yqTJdruEk9MNj+rQ3iWSGk3L3NpKWyyI1xcM8DO
         35XBcIVJzAV1ircNjMHTWRbow4RTDs7Vs7IuUZeIeNutC9KRPzvkmpb9nbNOZz76L4YG
         Y/kKpR7P6cOjxYrbdIR5a6AKhiaQ5WpEykydqiPh60YDMUODk9nTLHHH6v/pUns9v2lA
         0jWUDwjRRvJNxxoyInETLm79Wvpz5Ia6XXR/i9LIuC2zqpmOSrGcy7Dj0y3I0bnJIOS4
         W06w==
X-Forwarded-Encrypted: i=1; AJvYcCU814i0MTCOGB746GZRJetPO3yeCL8voocTbYqydoQHyg9fsbCof4i9eFuETZ0bjWY+WXWXx7vJUrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuw+SN+3c4mJt9co0mZfIY9JqtYmkFN4kQyrCQsbl7KkB02y0t
	A+v5NKyI9kqEVubNshNrN8HxLoKLAa7YP+a8AWAM9TnSuH4vhSpPSuB0VLqwpX/9l8A/tHzpxL+
	2PXlfV4rAU6sUYI4kGStMYstuaywKCDJ/K4Z5zhiRwx7lxHyUCDdBywOcJTbdvQ==
X-Gm-Gg: ASbGncscnoLxi3QovSL0fdjJB+vs2DOVhfc+ZrtRhi7+WIekMoMFLM3I3UtwMA5wZyA
	LjkOs2MuJlJjGXxZ1Tm+Mf6FSYkqgoUbOlvo4FFOI4da3CXx1MHVIJqfLNPwsnVyi2+GVctUpyc
	dsySl/NleF5bO4tiYZIV9ldNegRASsUdfLX8Leiwje2X6h8FXqoLrtFcaXEjWTKfa4qCWhSVgz4
	UNlnYUXdOn3+/K3+bYbaPjqjinbgbZPkPrdWe+3winE4VaC7LyTpSbpD1rBYPbQrZSn8tcjEd/3
	T12dyG2oPa039r1GtKlPTX82QoHXOAfcHUWv/KNFdY1f94q2VZLUSXCSMGFEnY7i3Y3/HHM=
X-Received: by 2002:a05:6a00:801:b0:730:9946:5973 with SMTP id d2e1a72fcca58-745fde6003bmr16336353b3a.5.1748329046832;
        Mon, 26 May 2025 23:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu3CU3ay8afRL2sXBe8+ebw8AHA7te8dS/i0NED7172wSL2eRoWnyesqmcAWty/3PYQAF30Q==
X-Received: by 2002:a05:6a00:801:b0:730:9946:5973 with SMTP id d2e1a72fcca58-745fde6003bmr16336323b3a.5.1748329046422;
        Mon, 26 May 2025 23:57:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:52 -0700
Subject: [PATCH v5 07/12] firmware: qcom: scm: remove unused arguments to
 the shm_brige
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-7-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Proofpoint-GUID: jg0BG6ANWfdQNsY6N0eKkdL8d9eekWMX
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68356258 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX0XKETx20h9dM
 ZuhO8QBVWUgW/Cf0i5lYMs9yMo8yYmeUh7lxOYwA5X9bjDInPXjGAJOuQJCiH4tvUDgI7vF+AE7
 bGrCcRLHiRu/DqPPNF18PdGo6WHugJ2quAVh/3fO075FajHYGVSXGdWorJKyklWGve1ChhJoTvD
 9BS1wpAF1SKACoVyPz1/HMlZWwx+13c8rTJzxB4rvF1KHP0L9Vnc2zMg/pJOBHvUXGH2fF04+q7
 GoLVLPhJ7n9Vml2rDTrwJiQrEFCm9nuE+FxE8vqqcuigmzyaVx39cMthJDtgM3LCufUUG6K6sc8
 KuLlnZLS0rjgf+8lRBZEi3rMyza4u8XtjGB26vpfXfaFkrUT550XcYIzh/YG+pMbhaW2qN8DAcJ
 HhNXtAotoJA/5XSuOTnkWS7gCXTCBQt8GK5oM4OPSoUcRbbxNE0SrpJeMgZAgPw4sTBViLVl
X-Proofpoint-ORIG-GUID: jg0BG6ANWfdQNsY6N0eKkdL8d9eekWMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

shm_bridge create/delete functions always use the scm device.
There is no need to pass it as an argument.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
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

