Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771A3DEFFE
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348627; cv=none; b=l7sm+gBW1ZlzDvvXTKfa1aFWbu+z1SxHn3sAqvZysc7qYCBryyMYw/6WdHR9Pab9wZdObIxsWm5FFjGxXYFub8JtbZs8cWhKfMKXXXZn6D1B6v1OrPRtUtk6WvSTSW9+U8Vn2kI73DN4q4rml9W+FM79PcRCj9v9MFGWmjEAlfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348627; c=relaxed/simple;
	bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFYMrUrg3FbHqnlS8hXgCLN0PznYDM6qEhzB6MJXaUitx7ti4BtXcv8YWXagqSLKH4CCYyqCvtIGeAWnmC5S8r5u2Txvp5G+TBEfqC7f2Qmwua14zFAlYEZjg5sES+gubVnj6LSL/XWIEXMDXIAmxz2wTSgGGnbsboSYn0knBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXJghhS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDqSNpMO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXJghhS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDqSNpMO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G90WTA2979221
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=; b=NXJghhS5Y94uTiXh
	vlaoOzTtkgnGrV/O/geMhThLlUVMw8E1bxPcKsZvAgXcoJPChVCz3IMqMo0wbfE0
	EySpjaAInNHKjpobrxamxOBMsbIdPCRSMh9oBk+C9LG0vhofKInNpjITY+Qz1Bay
	FreF+ohwj+wyWwe407n7DgHPNivediP6JqFGifIDQKMkeSBXKSqQF9a2nTgBbuGt
	IcqjyXefR6/DkUFclSaMwi963/nxTlVxtzidNvIrc6xVBozHmQ15fbmh6guJaUs1
	aIBR/WSgiF7tWlYcfW88XNVmR3grySvdTGisYgZmZTcydd71Lu1yVf9FzgX8GAdM
	kUtt6A==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvru91q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:24 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-651c15e69d7so10556355d50.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348623; x=1776953423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=XDqSNpMOgaL+S6ASmDDne2lpVIpAyeXbeFWWvfob1FHbGxHiPg5lMtfMRG0OV+aQrm
         LShIzHlWUC6wKK/bwCULjFVXbV9DJ6hO31EmkfYyI8XkmpD0oqJLpCi7OoFhxMbiH3ii
         +LPnRGIZdKRLsZXsqE3GTaEtVa5FJRkyu8oLjMl0BhCmVXAohzjoN7XkhGcwnWmmnRtC
         oFqW6rd/+brc2SbLFJiEa5bWmeEfGFDFkEtpBOPnXxqo79qRXAt7hFI19KDEhRZ8KBg1
         OTGcMXRQx/OInvsaPEyea8luOtPBRGMDIV0K9bn50po9vNF9kxduJm49YRkI3btkDMRn
         JUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348623; x=1776953423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=tHhxfm8FWQayNhYwWiq2cTHhn/NCZXsMzm37djnSWHNN0OyuyVEshPPfAXJvsV0bU1
         WV5+DqwQIAGbZlJPMW/UdwYxm49Ll3hGzWadPoFTDgobKw4Y3l7ZBt5fo+hoSRF4Yp7K
         QtLJYvBGyTZifaSdlRjyRKvXrBeySQKg4O6i4pwTuSme8A6S3+flIHeaPp8O62PuewGA
         /tNgppmz4ghY7hyITZNpDg/7oJIGU2pHQ4252pEPbnNXmB6He7fP6AYnrFaAbkWD8YIH
         soYtYM1ZOlic/dr1XsDpNjCgbpq5Tru54ayzZQSsRe5VEtrRtMJTDys6csEjG10O0DqJ
         vGCQ==
X-Gm-Message-State: AOJu0YwlzLM+lKlreDCTkjrOJl/xJnP9LaXko3t3ydowXSjtxsO4GDI0
	PdKTQ0oId/zzs+JVNZlcpsBsb4H5o+AnWs/s0JR/fV5WANTAqM/k8cskyGwepIpRv/fGhWZIiEH
	ptBRxWbkTdloUrt+ARlnEP87hzKU0Q6YBBhENzDZOtJvgAdy2dK3GqvPjYpcuJ2M=
X-Gm-Gg: AeBDieuV3RqkGbSfrz14mmXv2E0SieQbtjT3cjTVS7DhESZFBJt0SwhK7X+ZY2RrcRY
	d6MmmNwoxlyBOMIxasz1C4tXCrCyQiHavKYUjLMNn5CVFCRu0AM5U54iVFaakHbGE9HZeMVcD6G
	MpkLlJh25HLViIpKAZM9tJbw3f57Cn4nkaitAMWRMIxyCRYqlhIZ+3M2q5N4cmM8yVcTjnephiY
	/OLuq15JaWvIpcDOhjy+TsLNown9jSo8/e43MaWPVY6lWsrvCbXLXJzT0qOM6wHCZ3GYle5j0NV
	b33EdbEDeIH2YGS0dRtnwMSWBDqtZae5IH9s8kk+i4NTzF1nqu16XTfZcRKXIZHkfNIP8fV4vWo
	QBmfnhfQNTSw4oGQOGJeUcxespUMG8ms/tYQYagiJtcVRcKrvzds=
X-Received: by 2002:a53:b6ce:0:b0:650:7846:f326 with SMTP id 956f58d0204a3-65198bb5341mr17653934d50.51.1776348623072;
        Thu, 16 Apr 2026 07:10:23 -0700 (PDT)
X-Received: by 2002:a53:b6ce:0:b0:650:7846:f326 with SMTP id 956f58d0204a3-65198bb5341mr17653845d50.51.1776348621719;
        Thu, 16 Apr 2026 07:10:21 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:21 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:46 +0530
Subject: [PATCH v5 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-5-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=2770;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
 b=WWlNVMISE32YzOacAObQV7dNIdXlO1BGZ6LObollUK2JIrhEPezGqcUbkpsBTUSpn3s2vLrDp
 UNhQYOZM7PhB+Q1nzHDwRgrwZHLL44tf02jQlSCFTctKmH9zRJSHFeq
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNiBTYWx0ZWRfX5use0pIx++iW
 rWuE5AfSONOFOc814O+jy1U7Sg95W37s999r6Ox4EAZbhTusma/xNmdLujEWujpO5J8JBjdNyDf
 YIm8pxOgdUwPFs8+8FOJIanIirvbeaKrhQ9O4hQr3HxpA3QCBuONma89SOSGyq3C3AO0OheKhJI
 avAM+0xs0pSzWUycP0H6gvEsdDL9EqNPo+HweaQ8DMPocVaw+gk/U5bhgMm1VADc334/4j9c/wm
 aoy5Y4a8WYEB1kmcVE0a+QZxKUuMDTpVrHdGv0Y0eTD1D7lqRSAcA0pbfQMXHQT65ft3SEKFRIL
 PRZfPKMuEkcT+11x/l//8dcnR5YmqAAKQUESZ54odxPsPgVZG1v83/WXmNSeLNNRKRzple5Pu+q
 jsRWA07VVtEP8D9nLT2j83sXM2yn18msRHZTOlXvE3A0iJqFfDURQshHQ28s74lNn6sfyoN23Pf
 8WDqEdZ1mbHcMjJwZnQ==
X-Proofpoint-GUID: nMmiqUS8xBGocW3DzPwfbZdnjpUZeH9c
X-Proofpoint-ORIG-GUID: nMmiqUS8xBGocW3DzPwfbZdnjpUZeH9c
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e0edd0 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160136

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

