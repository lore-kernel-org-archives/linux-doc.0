Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7F2E267B
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733154; cv=none; b=AInLCEE25kaAu8GNowyVOQlWIpmxzVXurBGsfAOfV925Sw8BMwo6U8RWRUqDEIz99tKQogqy40xcZJHTH1F42wMjf94yImkIQVOS7Q8CwXRRtIWieNCAn3Wxswg4y7PEmhiT5htdD1tZ/YRWXrI1ePSipHhjlSraCdUZ6yOf4Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733154; c=relaxed/simple;
	bh=nhZDUeOuEBpe4gtZaFsCxHLG2a7kWizgihFMSQLXv+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBDNXKBPO5knZD9IfWqd3AQuwACHiDzaOZ9yzfa1lC7+cdvO9q+H0AF0KXckjBXH026qG2SnEz2oMpSAgBtVIKAxCvNFMRGKGX9TgdS3iBqlCGRvBp9yUdY0clbq5UNBEjKKg2Oh6eW8Z4ziHxsVghW6v52f6Pm0YnT0T4B7HO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCWZUO4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCWZUO4a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIJY2w020040
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=PCWZUO4aCsixtpoF
	ZFGaRiI/6mzDtjoEH40urxBiBbP6+XNt3WvN4/qYQsr0fqBATlGs6cJR1+romPz0
	ZSHD9uWkf8dQeqx7lef6lfm4tn/VqwZPFqnoHAr2zjvtMmN0srjxjmxQDwW1rK2M
	YfsXkmo2edya5VKqK90hmv3Ews9/uixj7AguCvnrt3k+Y9Zi+MyHZbZo+CiuS6Q2
	NwIfZ80OyNi3rOn3CnM+IOLEGoeXD5fceAWlDqohdSvOTCMo1M2Zdfg5ALM+RwKU
	zfCtSOwoEcVuUQitrXscftqWHOkiBOK6s8PZMHZiq/o3/oSRfXybseTb02YY4wBM
	aATMBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293cta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458264c5aso3859525ad.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 16:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733151; x=1756337951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
        b=Z8Qa2Co0vNEJVvFkm3Wo3pPqKP46DlY+MN2LsqNe6uEQkKkWuqz6CTxXDxJYgWW6B4
         D+CDKtZPeZ51cS02aB652ynogzPEY0oQSqlWbVVlzmHzXHuQj+8if1cJTn8WzqQia9OT
         4l91ISwgNmzYFI495YjmINHLEqAeeWOUEhF+TJqeg4L9cSApq7OBDGQ1PBtDlEJCpGvS
         W6UyheORkmxIQOO7puz3yyu5b/2zsKh4+vwsaUypYeQoxovUKDdi/dAWE7d9nzfkImp2
         xLQKSimBUTdPVkCfFKA+JAyPMH+XAF0GBLzkX4sF44wLa2cS2jXEcOwhs4+ZDXFVe2eC
         gO2g==
X-Forwarded-Encrypted: i=1; AJvYcCU6mWBdX4vf7+AjGj87k0XXDV09KTyKR4gidAYDvOldRC27anPZodDnFP5LxCivhIcG9Ue38CBMAoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHutpYOnUm9D8Ej/vJBPe+7FuBo19oe+p0oXkd+tEzNYH7iAZ
	MDG18uhGoj+C/tZaMkUGSwxFciMofJcbq0xVZeK/ekm6/II+d4S0Q47UrqH3DygE67ytbwurKk7
	ZffvKBPA7OlGDk/aqX2eNQ4be78Q0Fg8AZOQRYeLscmQiuK0JaWgc0EDzt97JuA==
X-Gm-Gg: ASbGncs8GJCsU25hHW6NwkREkRX3Oyh9vDAM9NCtIHCBYin8yh7dQqOD4vW9RHmCs9H
	8DO8TcgGVMM6HKSSt6OkUaDOrLE/FY3FoO+k2qUwBTY6Lvz1t5Jc+pIU9+EsO4+EvUR6nk+85lr
	TyJIn0Rog1h7xvFuIn4PRn/PD0UIYm2hBjrQiw7FAd3eoHmKEhzxwP8/cjxoCZ6kDg73nNADFNZ
	ejSS96qj2IU2c1Nids5ac0pqpG5EGxvoTyCoZge/waXL9Fzq/pt3aG/CdY9UVOcMwP99AKnX+WG
	mEhTaVjDolSBumdWMuMR7FCKvXseMGxm1MGA+NqzYGZUW6cezJ5rVFljVMsoM1zKfZifMNVrQhZ
	6ysssRBJws4yxn/UNvu3VSQw=
X-Received: by 2002:a17:902:db0a:b0:242:c66f:9f87 with SMTP id d9443c01a7336-245ff87a0acmr5982665ad.51.1755733150828;
        Wed, 20 Aug 2025 16:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJciBVPvgUAISLnaeCIDM3TBinhx3jI5VVAs1yjKKv+IWNyYEVSSEyv5G7WBqrbl04hMo4gQ==
X-Received: by 2002:a17:902:db0a:b0:242:c66f:9f87 with SMTP id d9443c01a7336-245ff87a0acmr5982475ad.51.1755733150316;
        Wed, 20 Aug 2025 16:39:10 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:09 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:52 -0700
Subject: [PATCH v8 05/11] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-5-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
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
X-Proofpoint-GUID: 0SumLvFUVlcMSdrVpgUGM94a0daN4cuo
X-Proofpoint-ORIG-GUID: 0SumLvFUVlcMSdrVpgUGM94a0daN4cuo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2K+BLNQQOh2q
 Ob6zJlKEZ2BCe/jOjmGwYDdb2ve00UNu7X0n0IsKRamfOR7SOvKVqDoV9/GR+tN91yqpvsqCgrA
 X3v4p42Fges0ogTM24B9tcwySgWrKRUgmCDDR0lfNg5lWUvYKDtnO79ApCdOoqRYUygTU3WaBHY
 jsPgox6ZZ3Z3q8Tce04xAmyXHNNbCgznmiHJrB/qaKQYV8omIfOe+0hhidvpzuJJZ2d93zB8aXw
 YVs7eZquEIgq3JQfteNszTU3ZIa0h6ptx1Lx15sH7Kdr2p3q6ZQpbkULNNmfwA1yscLKbPlXpUj
 w+lQbncrLDvv8XPVlzpnox1rY3y7ISi9dtBRbRUEXw9cBVRI+HpRDkJynJ7jZraqgtfxIihFDmD
 YtNyyoDX+e+4oDLbbbZYblDLz69RRQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a65c9f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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

