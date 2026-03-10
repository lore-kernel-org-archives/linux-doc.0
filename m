Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3773E7179
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127361; cv=none; b=sCjQzCL2XUuS0OLG/PmgplFSpukZJvxzXB2m9/VBUbNufKG45HyhyVkUswBFN25EwPa/2VW14MNd19oQRbPFkh6m0RdWQ2Q9TlV5cJ3RNDBeo10oDHqeuWSowV1EF6bF+NJ3JDwitZ0CWsZu052UN5nTnuypQO68JesmAnFHXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127361; c=relaxed/simple;
	bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTDnqsqrGi4KXL9gS8RHQm2r+qQGuHg2DyTXxKIaAbweM/y4Y4fx59OvqSHmkbVOrRtO+O8lspZIFpSX18BmQdNoaxfe1dCfjhJ3kaVmS9dHWvMyQhutu2pWE2LUTgWOvGO0b4FxusdzYYF6PvnloSP6UUe0gkx8SqR7aLqy7J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiqGaWm4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7I5nZ8l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiqGaWm4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7I5nZ8l"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EcuY3587440
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=; b=hiqGaWm4wM/zo3m5
	4B8q15B09kHMejvtUdfuy/Z/8rTnEEbOVRPm3wXG8sFkfoyywcMrkcDXsrCCYUTd
	srUqqhQr2B/OrjxtmsRaIFuKM489ITCnlsx9ekFFTAxcdmfvf3Pio+B/iSDZXk+K
	CK94vRV/HLxIB/4wWU207FlyqJ+q9q3g0B3yiNWXpWOrBQTTcu7u7kOpx9sAPK2p
	bdzR6/EuD16zZ0pP14CsrnVnoROMYZD7/DUPVS+C+nQjpYZzf48GLLuOj5UVCQE1
	TgVfISsfx6H7nSUPH1W+Qx0gp6/iAvgDRMQgSxHtKzTtJ/PwbRIC3SfbAXVi/ytT
	DnTTdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ektpsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae669a8ff1so362517645ad.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127357; x=1773732157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=c7I5nZ8loE9i6ZQgMMxiSyhPh9Z7oBlJ4Rwc3okly7d03biW6g0r3U9QaNZO2z4r5h
         y6UhU9D78EOmFKPt9Le6KC6WiigmBKsltZDcfxP2b5byl0N35cIvgto60R206qR2znvi
         CCIX7LTqyig3wf76n0LpT3lnM809SjQRg2dD02o/cjnttXOrE1cLia5Je2J5z86XB8/y
         m9jIncjyZ4+wS1AeFRJt7wYKMuDjMiZLdf1vi2Jdtjurl+laXTcaFIqA9Oseja8pLvDV
         Z7cRDycBqMRXAMYZPed4cdIQWQ0M5GVzCjNnW0uf0Cfi/rywCXsHkGgru3Wi0o3Bb2oA
         HzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127357; x=1773732157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=Yk91YLNcaewumxXbBiHIbe498TvqRmtfvlwA4XhlAw+ymxeGr8P+WH0T8J6Z3L+nVB
         7JCO6AhjesBf6Ih0xS+eBj1jZpb7hCzoTlAUR+y/wavUl6XzBoknlDU4pC0GWcmN+ONh
         VSqmZtZ8O3fTqhCTC5E2NDFiOesKicjXUaTug+Xn4JbsysfdJXCbs6y2tdkpT5RYnPMT
         2XtaA5A2scij06ovIgHY46ACp7QdPlCnN1Uvxby8n7NrCIsPI21ygAcIodZwUlnaGq4n
         aGhV8VzFJL8K5f1l3obxYaK6pafeDNbQ8W10J8TVW8kqfdGdKDOP4rWgBqsHWgbetmxh
         yi2Q==
X-Gm-Message-State: AOJu0Yx++2kwKDil5LH6lHHYSvlbcU9mBjDEdVmRW7PLATSqbaaWtwHM
	NFQc5FZcaoRzkmXQ8cyndHke6dgzTG1MjUhRmI2by/3cUlqZOOHNX6fXhaYlzuvTuVD6cfbu2Kf
	o5GNrL+SMTD47jNBMMGze0XpLDIOjk/OHfeTq71TAV1n+3bTz4hiK3DzrGSI60N1lb6qQPcg=
X-Gm-Gg: ATEYQzxGI+Xtm1gkGZN7fMj0PLXUb33blbMBEGBPanrm8zf1TuaY8aCLhEPpEz45/aj
	ODs7Fil4lwIMZPHXWVwx9PcqA2yYcTUP2PI6TNt2raUhiXpKuzXMB7IiDbsGvakSXb69qftDsMf
	iVJL2xLBiNesaqWC55MgHATaCB1QVTg8MHhq+Nx3xeVR9gomm7FxB23V/1l30asK75cXHQw4Bbq
	sRSiZDRcg05ZEaeMVuodiFKnMP7uiwcxwxWqTrX8XCc//aSERIb+EwImbJdkn6E3fJLwzrIYzzC
	IA4YtM21zc+MdkL1Ab2dssm/jc0rWrvdOLyqhd1PyHytd7ohyNIsu7mFN7GrnitXkVPPItvMPI9
	UYyCuOzHpMl0aX9sGZfzXvtDHq6hfRmujurGJH8Nf9ovLN/SUPLw=
X-Received: by 2002:a17:903:3510:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae823679c9mr142880605ad.8.1773127357225;
        Tue, 10 Mar 2026 00:22:37 -0700 (PDT)
X-Received: by 2002:a17:903:3510:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae823679c9mr142880315ad.8.1773127356698;
        Tue, 10 Mar 2026 00:22:36 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:36 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:03 +0530
Subject: [PATCH v3 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-6-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=3154;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
 b=jGY5fnLsLQTR3pxOzCMF05KRfsJnnBISbNlEOkTYIaDuFNBt328cRi62kblnpXDbp/jYHl6h3
 Qjm9GgWdCf6DGz76s0BGNvrnj7HqC45wHyAkcYNbIM5RGCOe+hQ0tPX
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: i0N5IUv4k6UkhUmYmnBaXygLI4VxKevA
X-Proofpoint-ORIG-GUID: i0N5IUv4k6UkhUmYmnBaXygLI4VxKevA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX6eaJwc5+FjD0
 J9orWhh3br8RniJH3OM+6ziKJONk6+AY2z9rUmUAkrSMU4g38EL8c0+3FIPd6Po/mIRGDvz43+r
 qS0P398cV76eMeQJCVAGCS0Tkvf8WZpbovKQlkyQZYNRSHQeN3Wbwa6m+yOASJaq7vWHfLK1NHT
 fwlhkOTugErG9g+b7OwfLPVtyjtMw9AXlfstjLmqBI0thust/MP/8g5FE4cNd/R7XAqvYp97Iwc
 zAWEPNjbSkykmoxIxYRJpYKWOURghM/0EG1zpfanlZ9th7sTPilvpO4U3+ZA5P2+3Ez8qa9F0bf
 S4BsrPJkL3fmWpFJHqnvKohPDPZpSs1n6XKT9xt4hbi5agGnGvxkP/LhfxeYC3KOV19HKNt0Xzy
 j93JYfNWOICrItMwiNo2yprQYYJ0BLtK/l2DYIhxxeAUEgTkRksrZy8dEM8xWX7OlrWwkTzNuXs
 dbhxx/7wDCTBu5b3+iQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69afc6be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

Devices may provide device-specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
per-device training data is available.

Extend the firmware loading logic to first attempt loading a per-device
DDR training image using the device serial number. If the serial-specific
image is not present, fallback to the existing default image, preserving
current behavior.

This change enables DDR training data reuse when available while keeping
the existing training flow unchanged for devices without saved data.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 47 ++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 4ea14c57774f51a778289d7409372a6ab21fea60..0a0f578aaa47ab2c4ca0765666b392fb9936ddd5 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -61,6 +61,8 @@
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
 
+#define SAHARA_DDR_TRAINING_IMG_ID	34
+
 struct sahara_packet {
 	__le32 cmd;
 	__le32 length;
@@ -365,16 +367,41 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
-	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
-	 */
-	ret = sahara_request_fw(context, context->image_table[image_id]);
-	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
-			image_id, context->image_table[image_id], ret);
-		return ret;
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
+		ret = sahara_request_fw(context, fw_path);
+		kfree(fw_path);
+
+		if (ret) {
+			ret = sahara_request_fw(context, context->image_table[image_id]);
+			if (ret) {
+				dev_dbg(&context->mhi_dev->dev,
+					"request for image id %d / file %s failed %d\n",
+					image_id, context->image_table[image_id], ret);
+			}
+			return ret;
+		}
+	} else {
+		/*
+		 * This image might be optional. The device may continue without it.
+		 * Only the device knows. Suppress error messages that could suggest an
+		 * a problem when we were actually able to continue.
+		 */
+		ret = sahara_request_fw(context, context->image_table[image_id]);
+		if (ret) {
+			dev_dbg(&context->mhi_dev->dev,
+				"request for image id %d / file %s failed %d\n",
+				image_id, context->image_table[image_id], ret);
+			return ret;
+		}
 	}
 
 	context->active_image_id = image_id;

-- 
2.34.1

