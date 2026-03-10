Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A358F3E8C59
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127357; cv=none; b=guDXtm83Oz5WC56r6i1RqPDHLofkql0gAJGauFDSQ8p1eejABcqrkv9tprcDBA8Rt7c8X6K88xDZXMirUmgjGBTb9+5Dk+CkT4MQJ+GBXPRFqCu4Q+bHxdACktvjhpcWN5RiFDrXpYtC5rVpH9bFTOmCnlvjppYmvqKzfQZwOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127357; c=relaxed/simple;
	bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIH057pTFNabU8ky5S305byEEiIUna0qyOvJoFL3cjktKkkUQDzQ2FemNq91Q/h2HhgEGD8JqZPeYYV1lAmmEtZGK5nvE3YP4A6MwF+q5oLxbB4//hEQmud5CmY8Hf3Lz7AeFlISKO++N/bU9Imb/llcacR/AsjW7sFPIGFgArQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6/Hrakx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOLS7+av; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6/Hrakx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOLS7+av"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EQIE2817548
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=; b=D6/HrakxRUbaY0yc
	AiUzk5o3nE8Re/VbNXda+Hj6Kat8Bq2Ld9G3m7IASBI/HexLvJPNRla49BIA0jl1
	t4wgnGgAdaPuZatlUst1ra5G8RynhRmCzkKiVisIkaBAvKyEPm+1sIVFsi05xQj1
	W6UR0sdvuSa2mQE0VEWPHnqzLzp9/jpyyzvBPWamCqnaIJgve0rzF0JRFgl/y97E
	p4/nwLZ1Xrs2DjpdYg9g9TlyWK4hgYLtEB5YmEGymI4KRm8S2d+R+2tNptUgmOvu
	Gof4OMd8nomh8nJL8ugN9t6ssRHCg/IGmdVBkgF8dUBi4RCntL3401zQGWNT5WBs
	3EIxAg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr430ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4e9577ceso448379845ad.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127353; x=1773732153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=MOLS7+av9SHxQ4BhOHbWQmKjNmszAl+ZSO6CfcJal4bdeYvX1NiPopNjfucxXxERNs
         tYxmCWFtTenmadOwsbyFzLHYGP/+hToWuXCzPH0aMXHxRkGT2WBljijINvYHzMg/99GB
         OUXeRlHhpeK7YyNV/iVgcpdYrYYsc5ScCdBWKvAhhM+q01Pi5QCMXrtAkmMlotfISlXi
         v6WlIby6PheTipiqpNf++CgKDFoO95/NAaSQQlOPen7+FlMqlkKa2s0cgXloVG+0vI5B
         M3vrIAbUx/1W1f15OwAN2iCyK8i1DcR2HcOlqixz8t3eGkrJwVOV2SZGBXWC1ine3OMI
         Z0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127353; x=1773732153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=BrWmZzGenatyvTpN3PROxheFHEt0qoLCkG0unEz6a0t77k4FalckBeBpMkgze0uV3R
         hutvubMkQOp3uHr3qmhz7K+lI5YqRpPgOukbgIOFjP7I0KD2y5zAC2yMGt6+mYvtQjJn
         psqsnVWqiC5O4DaKrfHl03MOZbhFQtJwcdHX5cmbfwlzl+8FYo5YtjGYZ83VRxkIeBr5
         AyHJ7uR73+G7PS0KUzED8SoVDilGoOX3qR4/5yD1ZTTO0zpiHWKCk5Bo17F0g/J8yxsU
         T+yLoU22iIIiirj2i2eRJ8gEStu8rXDThhoWcd0UM0EEinh1sCcEsLZk4b1qfg4ngVKe
         0rkw==
X-Gm-Message-State: AOJu0Ywfzlnkp6xZI7kHNKZA7HVtzI/9Zpp6ovJD6RLgpOXeuiTAhGlM
	LGQfqkBfNprpzHYuUC9WI5ncpPbUtJDZXj1OzbE3tOge/BtTEWoStOhfWrh0TH4xy1827Uy5Qok
	2pmWZBD47NRXyJkOyjR5tJHZlLXlTjHGuVStPeSziJ2ZuLZUBS4+kWBc8XSFtc8G2bhh5sbU=
X-Gm-Gg: ATEYQzzRrkATqVfYqh7J26nqL0ZWFFbMfcY/5/FrJx+Flb6JIEuGGrnGKf4BxTDLYxU
	JOzehDTAJRWI4v+Uo/iNOyHUX+2rrQkI4AVtcRSUzLNxzpnnQfpn9EQQiaMRm9fp+bN/FU/apY6
	qsbUf41DlqCZHXfXAimK8tSDy5D2UB6p3d0a3cFn2IKrDWTCsELhTt0tZ8IiFjnRoDvZW0+nm2q
	VUu7m0vokkfa56N7+diDRCVfAX4DvoJbXYJwmhi/bwRYIRBfyXscr1MxDHXkjIx6slpouRBHNSh
	yIBdkSIAhvxmJq2exuzadIty3LVD16FqmrU3LKl457oMVY1lN8vKM69jPblJBu0+slRvqRFL4w6
	NWlwsKXqNDSnrn/nyR2bs+YqKxIFn+s/ItLAU1IUXxM0FBoeLCEM=
X-Received: by 2002:a17:903:234a:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2ae82366c40mr129418175ad.12.1773127353264;
        Tue, 10 Mar 2026 00:22:33 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2ae82366c40mr129417885ad.12.1773127352754;
        Tue, 10 Mar 2026 00:22:32 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:32 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:02 +0530
Subject: [PATCH v3 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-5-994ea4b0d5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=5038;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
 b=HnrMHtkX8FIsJClYbn+h4QhrfuuSrzMST560LuFe5QBkSaiJ1edFD/28P0xY66nkAjHpU98kf
 ojhe/Omotw7B23lcSMYYNgqORG9DgEW2TZwFCOw/x/hKHwO6FM1VR1m
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX0ErVH5+HBbUz
 MtwZt0wPhb9XzTGez6Vc6RRCv0eCxjlYEMmNd1k4STyKAN+b9FdmQlFuXlc/FJO0X/hqiTTJHOW
 r+6oEgaHjhorNRbPlCQmo6IyU31jYO/QYLOiZ1EnphZNvu+VTVnkLmhsxLTsh33DCbTAAPOsWll
 i/kK3bojV6fNI2vJH54ocLuh8XHMBszQrKF4XRMr0E9UfJ66AtEsA22gHGPd+F5bSWDF6t5On9m
 VTuxsqeT5PcmJsBGlgvOTH20mfX0a48DpnB4/rao2ZkIJGWWzPdBusUT5x5lRvMI0esUahmI0r1
 MKWiV2jUXib7BabCDSDXQPgmc0rSTHjQGPlT5oKoPn+aFyfKgHXQZe44GsROJvrAkZYRMRbsqxn
 mOKKhEn16DUDB1er6ehmRpwfjYkaTIoei8g8ymAxMOomR4AT/kjxTWgpEKQB4xZhNzTYBRjSEe0
 nv6HrTOJG5rF//lxysg==
X-Proofpoint-GUID: 7G0PkH481LXF-6X3YZnqFfJeQl3bNZXz
X-Proofpoint-ORIG-GUID: 7G0PkH481LXF-6X3YZnqFfJeQl3bNZXz
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69afc6ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=g53SEPjKJ_zQRiRrflAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe-time variant selection to match the SAHARA MHI channel
and associate it with the QDU100 firmware folder. Add an image_id based
firmware lookup fallback for cases where an image does not have an explicit
table entry. This allows required images to be provisioned by the platform
without requiring device specific client drivers or additional registration
mechanisms.

This change only affects devices matched on the SAHARA channel and does not
change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
 static const struct sahara_variant sahara_variants[] = {
 	{
 		.match = "AIC100",
@@ -250,6 +280,14 @@ static const struct sahara_variant sahara_variants[] = {
 		.table_size = ARRAY_SIZE(aic200_image_table),
 		.fw_folder = "aic200",
 		.non_streaming = false,
+	},
+	{
+		.match = "SAHARA",
+		.match_is_chan = true,
+		.image_table = qdu100_image_table,
+		.table_size = ARRAY_SIZE(qdu100_image_table),
+		.fw_folder = "qdu100",
+		.non_streaming = false,
 	}
 };
 
@@ -278,8 +316,21 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 	return NULL;
 }
 
+static int sahara_request_fw(struct sahara_context *context, const char *path)
+{
+	int ret;
+
+	ret = firmware_request_nowarn(&context->firmware, path,
+				      &context->mhi_dev->dev);
+	if (ret)
+		dev_dbg(&context->mhi_dev->dev,
+			"Request for file %s failed %d\n", path, ret);
+	return ret;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -292,8 +343,26 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/image_%u.elf",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = sahara_request_fw(context, fw_path);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -301,9 +370,7 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	 * Only the device knows. Suppress error messages that could suggest an
 	 * a problem when we were actually able to continue.
 	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
+	ret = sahara_request_fw(context, context->image_table[image_id]);
 	if (ret) {
 		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);

-- 
2.34.1

