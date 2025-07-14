Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E999A1D5ABA
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454229; cv=none; b=moZeOjJBR2lEvuLie4lUgFfsW406K+zIe0DB/otRIlA750Ncksv5ixapjbVMx+a2JKNVBOW2ZlsjxMSi5dCGShQbfI0v+cE5zHkqlHOs4A/da8G0I0E6lfdoPFeDTbHxLzOpGM9IAUHcrBHvWKFTACOTKIzl5JU6GzhySLKM2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454229; c=relaxed/simple;
	bh=nhZDUeOuEBpe4gtZaFsCxHLG2a7kWizgihFMSQLXv+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sosDX9Al8HFcHazvuMte7iqRVIE1dM/V4OhieI9hm7mWYIONGnOeTQhRBmLM1vBJIQDoIwOyRvI2lCtgfF+cAOG3S0gDY2aGAnlo4I7bT9+pbcqCTIhowLGUc11qKZbHLtKmq4XgbgPP1Qp8N5z02k/H+jLmfL1Wz6qB7Ybh6qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiBFiTjo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiBFiTjo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DJRk8w007564
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=FiBFiTjoRgGWwliv
	A6NRpzvOrEY2F2d1GiOU+gG2D98jldeZyZNBG22V6PrZlHFWpEl/xLQCPSRcULzO
	q0cJQxFLngWl3AwSZMCPnGNa/dyB2lt71XzCbGo/Kk4XG7jH/bHUFmn6ikqJBcsV
	y9j/g6P1dkTPEDY0Uxig5mgd2UjorcNhxy+w+Yz+A92pb4IKFcmPc4b4dVhAPcMa
	RhCmpNIj3t7qJm2/gAZtqZhyogUUhXXtStWx7Ay9TJSE5KaK/JLz5eVVIm9t0LVk
	NrqkvD/GYdR1qL/7LBW+gUho6lXnuv4YVKTAqx4lBs6xgtFsV+iAGI2eUnhFg7S9
	FKvmGg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmtsqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2355651d204so36704775ad.2
        for <linux-doc@vger.kernel.org>; Sun, 13 Jul 2025 17:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454226; x=1753059026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
        b=Zd120HQgV/btrXmTIQzD+GzlDYNOxaasqx4Z3AfK32Y3D9njRLWGVVfvjx40B04cEc
         GK+VhbPeU+R74ItmrJfYFQ7pfOsZ7adKnJTE7eSvx43dHLvsuaTfwL5RVYfHu477bU9T
         aGzOCCToRGisaEbgMhYpcYsRiY5aQNpgbeKsM6ipIY47VHWjgQdZ+CYILRJbp+9F/4/S
         M4SeLcRUTJKsCIpz6LjA9UVbeeTuIW8AwC5K+fl/l8zES4dyAP/uTRQhAYPFmJZnPSVh
         wFIMe7ebFf+Z6WTQ0mGmSV0WMSVkAWNXBvsCaLGpXbzMgX54PEC7JxiiB2Z/7pVNHhkU
         lbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLd2a5cPoR6HS3dDbe3AtaMRvIMFkdIep1uMWybZya60NiEpcAPxljyXPPXzA7e5hypbQ9OZwgSrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpqUHXxnWiV24Uik2gNRJcPog/SzF1+frHepCACnrN2uaByyU6
	Mw6vQvhTELIJfnpZlvYtCJtpKH/0B1clpqnUXHB+JoHevMKmyy3F1Eca7pbH3lHgWRilozPgXgI
	dhsJY+uduunrXVTjuPiX7gbKny2QrlGWjoRi9OLk/uvoJwMzlX4Lib+G3284/3w==
X-Gm-Gg: ASbGncsmNi2tM/d5v1JzxIEuDwvbkcVL+23X+o/wrijEBF2D89GjNbgtUKehakbkUYL
	PdYK6yKHeK4jIyeEr4ZCWRQOLVtW8iv6Tt7lxldcVX5pn+ljpGJ1CH8pMDiDqIHM0jDyvdcuPBr
	YE2HbsQJ4+E/t+EglIwnMlVhmQ3czWlAH9WbT9dWJ6/5Kwhrr02DbLLtui6wgHMd9R62u8NI2yW
	aUSmZ8p/uOhnuePwWY1pvHCODXgqPqAUMuE74xzgHHjjk+/zdSYlh3dRqGPor+iXYXntDqhdsZk
	auqe/d9Na4kO9BT5M8Hwf6lcpqOyy9FusT8ZmQyrkLtNxGHmKXDTIXs4ETA/vrsZxMmBWxdwvd4
	kgb6As8P8005t+gjtsiHnQv8=
X-Received: by 2002:a17:902:fb4b:b0:234:a44c:18d with SMTP id d9443c01a7336-23dede4f2b0mr147211685ad.22.1752454226440;
        Sun, 13 Jul 2025 17:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSKkQ1vcVqMqiNeyFPoUR8IIMJMh4dpPpOY24o/EK6hmUwpEmfMEVSQBsWp82yDp7UsudZ3w==
X-Received: by 2002:a17:902:fb4b:b0:234:a44c:18d with SMTP id d9443c01a7336-23dede4f2b0mr147211335ad.22.1752454226033;
        Sun, 13 Jul 2025 17:50:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:17 -0700
Subject: [PATCH v6 05/12] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-5-697fb7d41c36@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: u14aKyR5PQr5KOaPYAiGecYoK4_5F1fr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfXykW6TrwR0W1T
 GnnuQmfa5PG9yVV244odAaqPMIGCh/TAAp3XOCHRd7m9gvUAP4avn5FlqIq/60RNKwEy/NqfAOX
 XHJZbF4Hw5NePZ+7HdA9SMKel1xJB9Ub6MlAd7juKDZnGmjLcrEZjgl4LUkK20r6ZduyAlJ37kr
 PhcVW1GIECLwwY5wJa1f0fIfhfOOwuYwrb2kXFHl/IqgBYu7iapY5uwngo3f6IaSQNHLur32G/y
 03E6KXZysKeK4sWZAd0smY/5ycIvuyZlUbGQDkS7z0atyy429WMCoLPGykODu89aCzzU6dgSqex
 tmAHp30QpKc05Rk5H4vnLSz4oS+0fTzDBI8oVJ3WytOCEggWtvevFIy2ot5koIlL2B8oJdhyFWk
 as0SPJk/wWOxQY41eq0aVIFe+8qW9CHg0IyNt2asBbNzLtfqe7t1yvDJc1Srd5GM14FhNfMv
X-Proofpoint-ORIG-GUID: u14aKyR5PQr5KOaPYAiGecYoK4_5F1fr
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68745453 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 441d97add53f..71a365afb89b 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1

