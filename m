Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CDF1D5AD4
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045430; cv=none; b=lgFbmkrdWstl+fgo5UaVihEvUMennjNtxnPv5FgMVs2g0T4UqqkaDu/1lTRCLMJZwJnpH3Trca0LqAXCjsCpeZ1U+yoRScrZ/SE3ncRK58DLgaMCftvY01LUWlPajzDMU5xlmoS9eLB/YteUoH5EPGp+0o5eYuKZT0t2IbOI4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045430; c=relaxed/simple;
	bh=nhZDUeOuEBpe4gtZaFsCxHLG2a7kWizgihFMSQLXv+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKcnoQtyCZiwNUTMyUcPnRSODem0mB5sJGg+IZsj/fU1CiYEd9dppxAMLLVo0HLaF9NO5jOMFHI6D6j3ktKgRoH0OnZ/gD6O0SVwdJUNzGbB9jDeZxcz+vrcAcjOuBnGE/ZOvQ5Qy9HmDyHEKX0QmzIggctPc72TwH5P2sqjIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpBhiATq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpBhiATq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKWEaa017899
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=hpBhiATq/lYNQoNl
	JU0LE67zXI73ccU1PvZFZjE6yyrHd6m+Rex7gpWZXVjKmVucI0LExqgRMNhd0J98
	9LH0ei/1XvHw7Bjhh90eu6VvCtoJ2dnUsaGkCTQs+sXNwK8JudT7rxMIcpW9t54d
	KWyPtiMr1bEO9bWZanKSUoeqx3C7bs46ZQ9e7TEIYovgNoDN3M4/BrpqIsDnZ2gE
	CC9qnem/iRSbNs15mScprIvuAeZSl/Yoj/TAq8IQoxpi9J2bPjDiFm+lteTwdnCz
	P7+grhIauu1rR6yPuSwvZO1FLPfM7Ee1lqPxDahF437iZV+vk563+0j+eJZVv2vK
	eYKKOg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4dvkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b46e799ffc7so2163661a12.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 17:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045427; x=1755650227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
        b=E9EyKHGUH0WXtxBlL/wS/e/IZ7bN3wEmsk5Jy3YPYVRFTcUUdSrdKsx+H90FH5SOwS
         MzCgdBi90UvxAKAE21BnyjCNrD6r2262GKN/vHcmWJrjxydjSmvlwXkWYd6gSS6yMP2L
         WGQl16RbMHdaDpWyZPbOpp3UcxvgMBmPQ5o7A4CPva/rh9i99D5sTfcjRfVl91wO6zYq
         7gC5ggXrgeZiaO7yDZLTZpnFcIXr5nafsUi5GMSU+M24nPUOciS6k4fLFTWkfEBq8Yqc
         Mykdng2+W0rTM2Yt3oUQImCqSbVnXPI78w71+fnXlUfShoS6H9IHDf4nP21KusDu64Jh
         33Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVwC5YEHmju87XFpUiMOZvRJeXVmhs9sYnhkENImVlSZUg2VB9s+ftbS1VLGS5bGjn5mCkbjinvh7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3bZ1fw+cLg85g3CicwGev4yRsqlhNn4kdlZCOHpirt+EXAv2j
	YhGCmA5ZMurDsmz/BtmVAv/KIRgpQmYBFNTJuXl22oSIYab9Vp0dHLlev+4RvnutD2zvVlgvSow
	9OjKvoo2N3PKcOn0K4Fpf9fgwfD6tSAHbZFGk+otanRbo7fW1ZTrD+T0U8NDzsg==
X-Gm-Gg: ASbGnctPZrGQpJfCPxxbc5RxCfVxxv0qQ7eBuJH90bM7n82oDbcmQV2tVPFSyRVkLnq
	ReQQNsaGhEt01T+De20CkMNyhiHZYS5vV57Z/9GGEFPuBxu5x/jDjZjKDOO8Q1fry6K9kkvYzs8
	vTM7uTfkoQnyO5L51wrHmyg8eDII/3nTt9fyx0eQp6VknqTd2pNOGqX78BXLJwrPd+RQmzcIuB2
	9ib2UIcBPDvAOC0yfyFWmLxGsZ4LOSB3wUXkq2PyQiw2oNg3e4dialwQ8JGkapYAaQ4ij8lV++T
	EkclU0DSb5ckBHzm8HpztMv/rfaIBnz4ASC+S8a90vwO/jb9BESgHgFZ8QIw9X6H3wP9vRQU13m
	uykBqSNU+8b3CyaZ8Puc4dYA=
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id d9443c01a7336-2430d0dc1c7mr17668625ad.3.1755045426970;
        Tue, 12 Aug 2025 17:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq1Kn7j1C7ztFuBwXBgmFYHdC9nyMf6zyzl32DpAdGpojtxsRNAvOz4Khl5wCYv7bj+v3xFw==
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id d9443c01a7336-2430d0dc1c7mr17668205ad.3.1755045426556;
        Tue, 12 Aug 2025 17:37:06 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:34 -0700
Subject: [PATCH v7 05/11] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-5-ce7a1a774803@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: VGXRYU5hvSuoar3HgU2nvuSKCewWtSYo
X-Proofpoint-ORIG-GUID: VGXRYU5hvSuoar3HgU2nvuSKCewWtSYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX6F6zSxzW7Ib5
 YzpzNSfrUy8fbWWC0AJ8k6sX8iW+5RDJ46n3lqiOWbGRqLfLRI/FsniC13lM6wOIYwFS0bED5LC
 Kr67l0U0Y2NQDQNt6mYq/dXrcF4ZrvO8gLTkhFEvCGSQ7lxqHo0WApADlMYAfx8La5OSaywwMUc
 hHnNksd9ISp0S1Wn5/cucZ9rRW37BGnhw3B9V4y8G8igdB3VJlv8C0nhQTxnR8lUuF83f2x7dVi
 XN/NSrtfnXoGNkPLKOayHQQL1/FwLWT0KE0zm+ZzTInns0KIOtHiWJuOXL7IFxydYmPTKDjok3R
 jSVA5CT9L5lL58j3VT1qnEEs98AebsCUnIDhrlPXH05RWJB876CA3G88MGBeFnPgmE96lCQTQOs
 Cct/MaCS
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689bde34 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

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

