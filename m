Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039AD32BF48
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954294; cv=none; b=RKmhHXp1w1lcRHxUCq4y6WzgGmzcrOLGkqN0E+4sAByGU+1XlTuY0p/LoXInC3nCnntyY0Xns8Iv+nK37VOt8mP23Xu+ENMXewx7cIu22tmYAuz5egbSsvZ29BjFILHg+XimA8sR9wPb7A5a4q4k4vBw1t6GMAP8K20h7svB23U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954294; c=relaxed/simple;
	bh=VP+rBUGF7qVbbXP2x/EhbFqX8g8zi65PFtLqGlmueNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hM0/kf22EF1lyCYBdpI4Ge+XyxxDtR4CDa/INUUt72eaFgrHaRKstjoqu9rXIqy84dh4WgTlLoMejtWPVgHQJgeLf0ADbouN1WwwFCf6vFtuzIyAuN/MIKErxOIn2y+2z9YMgDHJkkfW2X1Na66vditFKmDvsD1SH9wbeMOl0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVcZJkyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APCekDP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVcZJkyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APCekDP7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F0CU2023770
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dq7HdBaR+ND
	Ov/4A5+SkcbKsybvvsE5z7g6twcyjF/c=; b=EVcZJkyi+tKjvtCbFZaRg1uqURK
	aKOJWOL1hxwaslQ2c94co3dW7fgwYakXEFWHwOzkJaGhN0HNqU4GtPlBmcahJNI6
	4gKBQLOFI21pcZrAnesZj3sIZB9L0yfqXMjoKy3ceQt51qUAwOAXYBUSrt4pfvON
	sueW3OQ9JY1ikcTWI0MeAIL42EkOJK4gUT/l5wHoq48Mt65rACXtJVA+2rxuGuUl
	UAMWN2vcPyDLd7nwX1Ag3qw9WxevvhVS4zr4on4abzcdw7ZgU/ngEjAHxEgQc2ml
	LxCXvAlMX/gaax7uQG42ydoQIK0JgepSSrDxI0/AOibI7oejcoMU72QXfoQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39gxmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso9382893a12.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954284; x=1766559084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq7HdBaR+NDOv/4A5+SkcbKsybvvsE5z7g6twcyjF/c=;
        b=APCekDP7n77WtoPYL1q1OREvCWNj4vtX6/KWecu4Rdw6cG810aRXa6iYBcj9YhQ8W8
         nFn/5fR+1g6oBLuSn0Z7kcxz/a+7XPXz7f1jnnNF8fHE0emcoVya2V2dAAZtvVUEPxXz
         wj4r8ExJnihgIzoTCk4x06B91pw3/mdemvYa+zkp5OCiIBUwRCd+NjGKYHvuNpSN+tld
         FHufiFpdR3HDoOOPHoP2suzYg7cEP01QZ2UqXIltUkkxhwXiB7RQezj/N0EL0J/AnLnr
         mFrfsgINhww5fKStfS1wQ/lkLT2U8hXCDPjYRAVpk9DqPET2QHFVkOKtJBXFUFBoNKH4
         WuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954284; x=1766559084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dq7HdBaR+NDOv/4A5+SkcbKsybvvsE5z7g6twcyjF/c=;
        b=qmOwxoF3bwiAVqswBjm94WN5k3/1jvJIMZ889UG5uuyvsRrfgnlmPM6NEf5y9c2r+D
         Z/Xa4uE3l8QFXJaEcAwgH64zlhxxhokL8gKJagU1NrvZd1R4usU2+D7sd/xpQYtSi0B/
         bKmAHKEK4+J1/RgsxdnLBsbO1wy1U0lWvHity9iOV1BtDjZGxMiSI9L2E+KkhCg7eUi2
         nA0s7StCmPVTXcU1Hhlh985rHIU6eUYgKP6aCHdbHR8MZLURs7yCEFTEyVrNYh+x35nH
         ByWMOycfIOsD3ADhxApEkui2KS6e8JCJea6DFNPpfvWXAvKBLM9j6FGOsDlRYg3uI5cJ
         chsw==
X-Forwarded-Encrypted: i=1; AJvYcCU6gpcZLQP2v0MjL9CAkgoOlS6zodWAXy5ytj/0kgCpGynKJ6w+XTKId9zsyVNQLhnhW3apLgdIlq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXVEfkU0Ta6iZxBRKSlKK6vzaHSDcdFU9zc3Y9TSR3J3nyDiFE
	dWgrT7EkKWtB/vQmhCwwVn/r0g+UoE6aZV9BqmMIX1mzrH5QKGfICUbZmaN8ua4AUJYrjSUzm5s
	4ni68XNSpaIa9fmrpPBqKSSKti/4fMZh6n7LNTYYl/ytxkLDAqjM07T5q/70dtaA=
X-Gm-Gg: AY/fxX7Cg42dUWqq+a05DBsqys+u4yh3ByRL7fjE1uYL0/tIhtL8WRjxQ0rr2F0O4a3
	mKhCML195+kBEqu2RpuTITdtG199zxZKP4/sP+c6RnnlQI08sM1+TVU8VWFEb3qWURSvWdtKOca
	wZbfphJuOw2+4XXZSaX9ZOEEsISJNcZYrQ3JdJLIL6+kLbO8QN8UvPulihwiHFwW1CA1aVJX9cE
	5wI36QCY5zGOA8IrdoFoQzBP0yV56TuXwhi5qho562aOlZNT5d14JyV8BF6eSUHAg8LYkVlfuBV
	1IswK3+leaP6w/gSq46xivPqszWINtOmG/Msfy4cYWC8LD156KBiA45UkmlMsC3KUVoacHpQ6X7
	knr5cICEXMyJn9NQipniaCKZFinyVia/WGAcXwUfE7/PPrFmZRVeuRItEw4OMiySnNW+8pzbTa+
	QD
X-Received: by 2002:a05:6a20:72a3:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-369adbc913bmr18285868637.4.1765954283763;
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZM57x3z2KMv8n/8dDpTON5UMcn+/BZFIjIc6sGg09joQLGKprkmLRzvfNxzJGnpGzmQ8N3Q==
X-Received: by 2002:a05:6a20:72a3:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-369adbc913bmr18285848637.4.1765954283344;
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 2/5] rpmsg: core: Fix incorrect return value documentation
Date: Wed, 17 Dec 2025 14:51:09 +0800
Message-ID: <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX+7xaU/zYnXBQ
 HDTjaDJfNM4C7cZhHb6ZLKC1oRyVKKm38eN0vwaHx5xcTfL43XjOI/DjIPsGspn+8xUOhUA2tHU
 p0NBEVpEEWyDtPLQzhLEXvcxkAMkXaAQmdK3lOHH/u5TBwLqqhDtUVhV6kYWsMYLfHBp8ZZ6f2+
 r7M6Sx/67sZkb+Hdkyl9rniCkFgWgGVh7BFDwgGU6iGdcHe8f2B5Z0FxIJMQoQOpDK8TKKneWtx
 oIJ64v45qybPrcEUu9mxed94AW6NTZ9Pf9FpOd9bZFbYfJG2cmYlxtWNQjEQ6p95wmfw99Uib2Q
 Ei5jAuejVxndF/tO3V15bAxgzQa/BO6QJMmjoPkQEYY2lCIgMAdsay/BPeLeOI1eqWUjh2GpSI0
 UrkBZCyneCqRl/7UIu0oKckODWBWvw==
X-Proofpoint-ORIG-GUID: qS7JoqRNTeTFOcoLf20Am5gnw56ecupE
X-Proofpoint-GUID: qS7JoqRNTeTFOcoLf20Am5gnw56ecupE
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=694252ec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EyzG0aFrAOtqPBJHxvMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

The unregister_rpmsg_driver() function has a void return type but the
documentation incorrectly described a return value. Remove the incorrect
return value documentation to match the actual function signature.

Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 Documentation/staging/rpmsg.rst | 1 -
 drivers/rpmsg/rpmsg_core.c      | 2 --
 2 files changed, 3 deletions(-)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 40282cca86ca..11fc22f3736a 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -212,7 +212,6 @@ be probed with.
 
 unregisters an rpmsg driver from the rpmsg bus. user should provide
 a pointer to a previously-registered rpmsg_driver struct.
-Returns 0 on success, and an appropriate error value on failure.
 
 
 Typical usage
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index bcfd17e5309e..a5dd09f19b14 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -627,8 +627,6 @@ EXPORT_SYMBOL(__register_rpmsg_driver);
 /**
  * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
  * @rpdrv: pointer to a struct rpmsg_driver
- *
- * Return: 0 on success, and an appropriate error value on failure.
  */
 void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
 {
-- 
2.43.0

