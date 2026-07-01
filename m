Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087B4279F8
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902293; cv=none; b=kUg7VsuYx8erZtXz79qmdyPHXbFRVd0baaDM08Cqm37+xxMzIjir27qkQmUCNDTiHkgsUfyioZC2RsW05mV8tkg2pEJrz3X9b+CZlJ8cjXYYoa9Vq7X3eqB9e8baxUglzMcsgalyYrXeyTIn/pk2N5lWKpN6k8X8CLTxCepHHbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902293; c=relaxed/simple;
	bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSyVUkuiOeVGHGcyy0kOUH2F1lj8Iqv1cSeP4idTfnph538wA89vti4iLToJ5HclMOhhMWeFob/qUGkn0HihdFx/UziUi3YM9p69/yK7hyzn6DgPE2mHCwHNaXKoxVyL3y/zQwEYTHilN+bbSaKKklPJQFjx4wrKlPD0+VcUYKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qc5TLfBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSAutUG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qc5TLfBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSAutUG/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8cMV644532
	for <linux-doc@vger.kernel.org>; Wed, 1 Jul 2026 10:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=; b=Qc5TLfBAKJlWNBp9
	mU7w21Let2SxOXIDqvqX0LyDjJBsjPt2m9fp6yWijD5zg51WM3dAZz6iuZ1Ls94M
	vc4T0ErUVLN6KmCcCo+/zeVWvFjNxQldU8t0USPe2dkLLFsMGI03FipSF5btPFO3
	i2A8Frk+oQDtyDcfWBKVGfWvwWWTKT/gwgpEljRZCU74Jh5lYd5KfBHxsWokPlm5
	lsRSerEp0KB2LGINEsGouaqg40s4XVBuzBg7bOUP75g92E0Rrwi/LHkYLxdaWAo/
	UCBmbkSPrlRVm5Q8xyELPaEBkm3ztQ9nsEy4r42Hc0lg1/oUP36o3DWNoZP7Gg3W
	QX82DA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4ba4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 10:38:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380b630c505so143657a91.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902291; x=1783507091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=XSAutUG/7GO8v2e6bu1zxc2ubgPjoK0d5gP46P6fil3isNYh2wopY6NtebdS0gdNIN
         +txwJw+4Po9ONyKDYgGTyul/0teLYo33jtMekRSUIpit9Lnsjrpg/lOaYxecw+K7dYO7
         SpmCaka2ixrs4iGa+FSetfEhUaQFv8su0ScoAtFKtaLrYcFa2ggn5zZvpRTVoAP4oTSR
         R+cCdKnu/V6QYhev8sMDETBeT7tt80eMzOeCuevVXrTVFy4Pvebv6EehyPn58xGGAUJU
         Sj5qI6B57mKOYVO1jwwgf06ey657IKwcZDMRZDNBL2+/kDZOyz+KdKZcRHYtI9T2u8Rt
         M3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902291; x=1783507091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=GW2PbtWn0Tc+p7iEGB6rnDrFe2k4qK90VsOAGvg5zxlVWjfQo3BaxYwVCe0xJ2T+cd
         tId3iJNNvjhFPaO5yIFlb2he0V+Now3hL0ZEmRt43rTDI9t1JuDG4cH5C+hzK59ti9tH
         T3EpiTMpBvTpWK2VmdSm2vLfJXXYkapv/zF48cJpmKakQMQXoqDs+SeYqIiEdM7eaTYh
         TDzj4+liuNkCvQDV0V9v81ZvYSt4kXGMWA4qV1BGpQDVrgh1RAjUZViuwHPj9kKpj5pf
         flkuZhmGJj3ZffS/XTe85asNWbNL5xN8SO2hxub/i+myqw9DJR4HCbWQVwWrLRKpSRES
         uPKw==
X-Gm-Message-State: AOJu0YwLEyrRXZW47ep+X0t3oBYcm2Uc9GAzKBXO6/lzmie9ggDCxZgW
	/nlSbExifUQTFxxUIQ9spqCxpiAu/Nj+pdA/TJFNr50xHhA+BapTsqtMbIusyW2JzcJbTsKgQTv
	0l5Ip/MQnDwzUjcDOHY+6y/hO75+ua+tnRo24fMDDpZ+dbsC3nplhjerDFGozx9E=
X-Gm-Gg: AfdE7cnW0ybiqbFiDvLcZvUt4KhabcGxrs/sL/zXAxnRWZOVflIwPy1XLnhLF6KCzaz
	NzRraKVL4Neox7J3B9PFgDZ2TF14C+5KpnvCTc3Ok2Ui4fQYoPL1Q/+Buw/6UWgT6EN0p2KqXLY
	vXmrRFnZm1dSNGGa+UrtzJPApjlXYP8QOl7/XT9V0bOYxMD2t8JJqIHHbEkwmKHY6JSSv25BhnB
	gMVP48GNaitXtzoBU6gzTrpTxZj3jsYiUK3L3bD4DdWMTWTAEaA+k8il2GedQVlKyT/TSCRynKq
	Pd9bsRr1IQAHER/zxvKvDVFBF5hAIvFWQKfJeiA0M3GsWBpjdb6R0a6qixQ6yJJy4zA7eeRZDUo
	3Wg/nnKfSGVrrVMPtiEn80z6C31zCudSp7m94GoiO
X-Received: by 2002:a17:90b:4acb:b0:37f:d6f3:450d with SMTP id 98e67ed59e1d1-380aa1313ecmr1126579a91.14.1782902290389;
        Wed, 01 Jul 2026 03:38:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4acb:b0:37f:d6f3:450d with SMTP id 98e67ed59e1d1-380aa1313ecmr1126551a91.14.1782902289832;
        Wed, 01 Jul 2026 03:38:09 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:09 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:39 +0530
Subject: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=2770;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
 b=BKtlMZwrym34uRRohN8XfpdmrzJadvkke8EGBNPb2CtSD/iNT9JzObFZ63p+0UdfBGN2gBcjg
 vZCSL+IrFqhDaUq39Jju8Jp2hy+XGAwYBbHnN7Czqme0mSNZ0EQ3f31
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfXwTwWKpFCQUvv
 TOlVothURon9vVtN57LNQKIL4TuQh5KqkPOMspCOITDAmw1HdXcxrnDEkDImRpxp/nvIar0/Gt2
 D3aCiM0WDfmIuE07X7yqXt1tzZ1lOsk=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44ee13 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tX5SJqxYkYu4xR8i2XjnlMHt0C5pK-kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX34TBI/OakTXQ
 TCECVurv6GBG+VSPb86ECpNDzu9ysIUBr+pppARBPyuxjWBz+A+Qv+PftVPcef+xjcuj0LGDYjl
 ZYQR82InRF3iuUS+dIK4yMQU/76h9dP8yD2i5UvCea1JWX4Hs2bobA4Q9agxBEOFXxKavmxdmWD
 VAZJ1PeN/B6hsE1jT1L6sUl858HYbkNndf+6F+1Cp6a9UnMJjXvr73oaZR/cPTbVv3EPxq/4hzE
 NWPAvx6bKfKt73BXgHlQe4Kf6tT7rx395yia31de7L5KQ3mvLR4taYue8JAHLIdAWmxGmnQvKlx
 0AhhraH6GFlT8Pv93w275dzALktGW3pwi3bcVk+aeymQS+hLkV6pJ2asuvXkGFMo0bjV1klVFUb
 NGq+sZZoAgP5KARyUXrDYABe9pe7qHDp6M6ivExiSEBslOqLKKAfLyL4mYSex8kps80aYytPIAD
 r5LH8DiEGBpX9DPiPSQ==
X-Proofpoint-GUID: tX5SJqxYkYu4xR8i2XjnlMHt0C5pK-kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010111

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -59,6 +59,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an
@@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 				      context->image_table[image_id],
 				      &context->mhi_dev->dev);
 	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
+		dev_dbg(&context->mhi_dev->dev,
+			"request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);
 		return ret;
 	}

-- 
2.34.1

