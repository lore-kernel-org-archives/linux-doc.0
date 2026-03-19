Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B234FF47
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901937; cv=none; b=uZYcRpcBI8nO3rx/tPyDx4GNZwcjozUpO4yKygNp55ibTlulkV1yJVM/NibbDGax0ulOZ7AlGumgx+i8S8fr6MiPjgjHUK3ukLZeDsQmRpXCf/f7dmZc9yLqzQZ3DOb1h36KpT8+MIK+0To1H/h5M81dGxaPrR8aK/mf6UcpDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901937; c=relaxed/simple;
	bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwHi7QFqLs4rvpocLT4IsxDwak1vwidMxHQvmmO+5yJr4U4iYJMtg50gBG70DTUcce3retzYe4olRTZ02yXUiwditp3WIhd2BPN9CbmT7XSjvHwV9rz+rw18o56C3z74KIoAJS/0hv+5zTjgWLmSvZn8pkw9oYVT04uiUnH+Fes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d92Vgpa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Od/2QhmS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d92Vgpa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Od/2QhmS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xunb1802777
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=; b=d92Vgpa8NFRAuX3N
	+nVgU9lUwaxEKaSZTk8Ip21p7jgIRnlFt2pj+YV/dKyykHtdo44AtPfZlX56lW9U
	5lqSlEvCYqHloW2Ap+4rvIyGCCm4+zPBWNAFrIyXgCj4MjGZWQ3jLz7Oe8fe/hjw
	EOrAsa1/+1KdJMcPREs7jpW1vHobAUthvsLKwEXYFmpUQ4KIimafgaAIrf1YBace
	lNtth1WqAR20221Qv+DLLHhXVepNYmI+4Bj6cLOkGvzubuLWem/ITj4o0L8nEQmb
	WsvY4/cf1rNx7Uwr7i4AkUoR+knYHPM4/HiXyRTFjle8QrzyMnTyB6VHL3YcqSrU
	8AHjQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb3w4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04911610fso7650495ad.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901933; x=1774506733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=Od/2QhmSkwe1x9bzDKAtJGAWo4w3hZtB7/PgPlTxW8sIvH9CUTveuJnWT5g2PDVXj3
         ReK2aqvreUNEpb0Krw2rR3tbGyWke350lXRQUh6N9gT2mmJ0c8uzyzmY/xgxb5haFAUL
         oBHbKE333hB/cnhlOUV8pDiyPfZBDDv93MSkoTPnLI/V3z5ySBPfZzkc5vcryWdSH4RM
         3aiqeQj2IYa0SBf5DUHy9ytEgk0W0H7d+jAYfOtY/UJwSKek2vUqP4XC+aqll136IYE2
         XpH+fCjE2xQYRhXCeFxgmentl2bAQa87kltLB+rtjC+rIan92BeExLK/31JMwOlqOEMf
         wViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901933; x=1774506733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=P+HhET9rePzGr3KfGByy5xccxYh2iw3I6irAajTgJLuzXbDZJbY2Lj7LQJ7vKq1FC9
         oYk1OXwUTdFWtPyMn/SpqqP4hyFzDbsDrOliQgKAQEaUX/E61Ve1FaNas0Cg68RKYao4
         dEgDdNDiHo7u8LyK9Jhn1XSV4WqvXncYeL2jwjAeYcdbQsKzy4UCfeCRsNugf/cm1gLx
         ZC+ktdMofWCWEcuPq4UmitXb2ErVvT8XxEgfMb2Y0MwD2E98tGMBGuE8o9oAYpirdfNd
         BY6s1wjltyx43+9/7UOM9ZSH04Erw0u+oEcoNxlQ1tZ2OzhbCeYhtWRHnP5fhcvAWC7y
         b3qQ==
X-Gm-Message-State: AOJu0YwzNTGMNeg/cBFs51MSb30Q3Ypk8WLCCv4YE5KOjqDXLIXzRfqJ
	Bi8xtWF8+zrcbWdw2iYiIIY7/ue3w7Z4npqEiTgkKsr8bj7LtRMdnKCzjXby+AxwHJwXuANmnvB
	pfLwS+aZf8SoX7MGNToC9iw/ezq2vnIEsZQn+8W6VyUxJwVnc7QeZwFrMVytCZ94=
X-Gm-Gg: ATEYQzxyO75/vV0twI3MoeBn7TdH31G7JgBoE9QzhOnFBmzuF7w5yE8LTgHOQ17w4iw
	SXOa1ini0nX7L59WlW1beRcG8Pc/6/OFlRW6IsdslaCnZCfAOjtGCvrIxPJgI3dYbPz9V1KWKem
	BUFI7D2a1N7IfShhGaG9LfAA9VMKhLTGXhqPfauNgUbPvbN2XbrP2BZWKAqqdpDQrjAfHUddHpp
	h7tNZmryvTyN0o0B0f5ZijhYHVF+wrFlJzJi0JFAlVlT6LH58JbznSE/ES6axz9sfRR3TgOnwfp
	PJZSvsgKCuq8rBY/eemubb73488vFBg2j9Vwv5lOc8uoqKs5uvRxhGN9pw1gsrEsjyw2B06XA6Q
	tNl98pK61mkeDuyGFFH90v7APhx2yKoAkLWMhJ8vNPbNYPY1M/uQ=
X-Received: by 2002:a17:903:1a67:b0:2b0:48ca:a641 with SMTP id d9443c01a7336-2b06e3c3abdmr57658585ad.25.1773901933473;
        Wed, 18 Mar 2026 23:32:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:48ca:a641 with SMTP id d9443c01a7336-2b06e3c3abdmr57658205ad.25.1773901932969;
        Wed, 18 Mar 2026 23:32:12 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:12 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:46 +0530
Subject: [PATCH v4 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-6-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3154;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
 b=P/EiG/Ox8r4P5G4oR1MFzhur+NXMa2Gi7t1dDjAqXLD1FDiqn++C0jyKd+T01VGQHN0sFZPMr
 aMqQNJJLI4PDL60h+ifxRx6Hyyb0ReTpHexQOU9CjbMdJbAk1/mz+bD
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: wYdgrf7-ostKmjFeyAhK1gwvF8nvsTvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX6R+ESUX4RKlO
 +7eORRNJNE/vpBBHMIVz9MU/JfQaj6jXvx9lx3fhvnCIk1zbNbvBEI2btHVbsXzQUHOW7BRbJkN
 pUhxTif1gpVos9s8kcRhCqGdPi9aXCyTE1+vUTtvXbldd7st+hKRbNwN0oAqzeETvvwZNtLhM6O
 DyCB4P/beTFSrFfWekxZQMdA5CZBXwEtL03FvsaPhx0sgjp5S9z31gX8axh2YOUkaTrN8HgzPRc
 peK3Y6dAfbkSQN9a+MJktbIeb453Kkvoz+lmn6loSPEX9C/RkGwwU9M+lW1wMhUmdKHvO0p6uqV
 UdUWGmocxXohZUblKiZ5OO3eY4ehDKcfcY4UT7m0fD2XYGR7QANrabbxRf8kMeaZ6MKW60iPyYv
 yufao/KuHivEarIa2ipfYPRajc1lfle+6ElUhmFSEyTPV94t/h1G/HFZjFOfN75hmYShKbeKSs2
 f4XWEoQPw54DHCXSt0Q==
X-Proofpoint-GUID: wYdgrf7-ostKmjFeyAhK1gwvF8nvsTvi
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bb986e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

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

