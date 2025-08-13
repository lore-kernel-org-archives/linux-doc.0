Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8782746A
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045424; cv=none; b=ngNcLAmXaiqD0a0OAz1w8uyNsj/96rTdO0WCSA+61vTbL6+80S+KPL68R48XKNHpZp7ebFms/bJ3pmj8WwUy03/nsVqgnY8Wi7gjHBNdxdzfDKWZ6fenhh8aG28uVvWw2zszd1hMCMs85/eMDozAY/1dss3dYdpLAypogjBR7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045424; c=relaxed/simple;
	bh=oYBmYKyNuJgx7AjR/DtMe3YDtEmf5yTSQmNY45/h+Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHp4CN3AW5t20jSGBPs8r7XwEafnZJJHDbNMv/sRbjZK66fOPDoduoq3veW3qXkH9FM2mHguBF50kDSrCIJh6tsc1CMithTEsdf/krlivbzHmhp82dN2q+qzHmE47Wh6avRVxyf2uEaavqFqEvNFQGacStP/L13yHQ6mMZDRyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5JbHF57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5JbHF57"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLSfbN012682
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOcaZQdsCvBu0o12Lc511EeGDT2I7mkwnOLM4V2+Xso=; b=a5JbHF57vjtIG3Y+
	W9ifcik6dLYxdmud4XMvyhpXMtAJgEnVfwGGmbO0UtupfpoDEts8WtUNyKtyMU7M
	1xnLjB5lAP5sdW2bPRkFPZiEyZtjmPSfggk6B1Lv5bZIoBcgodGg19V8hsJgN3am
	0y4pxUNbeJJZDZS4DIWqA4D0MV2OCrxOX355vPVIHcyMB1dKNpiPt7xfNLBZpe0t
	40yumk4FYi8PvHDmEgDJ8khzdpJmnOVVU+OKEQb4VH8bWIPp4XpobsMotIl8tMEh
	4BKi6qJfQATmehkWHM16/CEY/kxVwkXsS7Zoqv+2idXUi6VkptW8BluOXGMqaDyt
	7qTQzA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv1vkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b46e381d458so4748782a12.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 17:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045421; x=1755650221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOcaZQdsCvBu0o12Lc511EeGDT2I7mkwnOLM4V2+Xso=;
        b=rJ2ebvlx+PunEh4H7Sx3r0xkRT/2GFOCNv5VGzaD36kvuf0yhGIANkrKD3tcXuEo1w
         sFvDni4Jl46fAEajwNXIJdhJQ2g4lj5wT6+KtvHLevRICtNgyFbc9VL2YV9UuHsIklEm
         CTXb0n605FZEc76MkLe+F0rM4Y2fW5H3CUVWqQTfPjvnCtZ/OBJ4ns1f7DYuz5t73XoB
         vEublACfmB4gqj6FSsXJ0g58CsS6cMczAY2zJNDwczLpiFetgRwsjRb9YVigSTG0pyLH
         91GTmNIE2bq8v77t1IhX2OMkanIyJSC0wa4Oyy6OwXc70ywHOsVdUYvLX3D5R/LEN7c4
         VReg==
X-Forwarded-Encrypted: i=1; AJvYcCV33Lis85LELxepb62QmTW+VpR0z8c5ya/gDY93UCh7lBKDc+4nh8WBFxI6sOcXoiV7HD1nq4kp7Eg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7RoMAyajURbAlhWCZQe7y14lagNCkx1TE+axSw/hhAd9tv+kk
	hEhaYN+eNuwvRjl49uutMwhiXQQ4zBbwpCD6F+PnzmC9QY+tH9z4OSTfJXPBfSehjqvjAHxtBcX
	Bf4igXhaQ88KfKTMvmQkuADyIiz8oFEgaWFTxRqh0QVnPQ7ThsiVRkFjxiZW6Sw==
X-Gm-Gg: ASbGnctJuVfF1CZDABAuEXBOKrGMx86FjZGMORl/5VbUIDGCNgxcLJE2pNcMkOWj2kW
	TA+ZAKnkfjFtAMlZVHSMwOx1zSnHe+5S12aTqtkij5IUbtiYAxKM+ckgS5MjRE+a4Gdsx33LTjr
	LDiicFz6P6cO0IpsTBSEUYW6dtDFBbtoXh56Hi9N+/oNUT1VpvSyZcoQ7N72F4ywr2vW8/5EiVC
	wM9dI7RHcSKdtJITPIF50xnXhXgC8I4U8P0oefRt6+UGfxXODQFYfKzRRd3JvtCNXdBlu3JGpoK
	+Mmjl3yLjasRqenmB4I7oODupqFfwSONWcZrsk2T+Z3/ssp/BX3It7iRqWOS3k+YLHmwc9ALXEz
	RgbhDTJTBfu8PYwX5qgUw4Bw=
X-Received: by 2002:a17:903:2290:b0:243:3c4:ccaa with SMTP id d9443c01a7336-2430d0d4d45mr18426345ad.19.1755045420806;
        Tue, 12 Aug 2025 17:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF98zX42RSwWdppbMzosqG0TdHr9UoXTpkldnh54KBhgrVV7+MPU1d8WuN43VIfE3fGM3u3QA==
X-Received: by 2002:a17:903:2290:b0:243:3c4:ccaa with SMTP id d9443c01a7336-2430d0d4d45mr18426035ad.19.1755045420387;
        Tue, 12 Aug 2025 17:37:00 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:36:59 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:30 -0700
Subject: [PATCH v7 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-1-ce7a1a774803@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689bde2e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: qxp61kXOWp0p70EcYrFgDwC1YvXy3JBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX47vOsT6JtjK5
 mlS+fUnl2DmG9ldgg4T+YflcaDAMES+CvWk4rlMGWNaZettdl0HMKJZAa5X841uxNzlK+JFaLA6
 jeOS7fwVo/XNRreBVPKszEK/Mh28QMO87jyp5rV/6gCZPk+RQG7p1+7bb/mPZlQ1guQ+X6yL9or
 KqSwx9zfiOuEHNRW+h7SSVP9Dks60XMk5uQz3E03ZVAjPuJKbC/GkLwj839sUp3h8NO1KdMlRXb
 lHcv3gr7in5w9kwsD8sxpK8SwKyI/Wx7PxQWYOzlUUy/YnwlhBMgzXLEOljY3iSBGrLaNGpfIlS
 928jjxGvm3Wg8z9OJavfm4hxsm+eWfK0+B3zlA4kvvDm7+2bSKIkZjp1cc/nr6r0/P5ZPwGYTle
 kJEiYCM3
X-Proofpoint-GUID: qxp61kXOWp0p70EcYrFgDwC1YvXy3JBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 944f913f8592..e47a68d337b4 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -889,7 +889,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

