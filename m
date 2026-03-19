Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC634E743
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901933; cv=none; b=G8LQoUdhde/ElQftkc2ejeP2gG46xGpslMp4EdhtDadqcl79wipZXmPj7iaFH469Gboa4kIxPFx32nrqR0ToDhC5iTgDnmMLB+vEg4leTaD42tb4OmaRZeMQ5BZYuhlXTxqVuQNyN18M58mohMBPShXzCgga9Pe40wt79dECEzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901933; c=relaxed/simple;
	bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZrSZolMi9TGNOt7OOqby+e9SZkQCbkgYB3yb+aWYRti3FZ9d8i/lz3u2BE6oo0zZCq+ViG6HsvnzMBcWCjf1k3dbsDkggbVmj9zZYRvjcv6oqz4RmhWBf/xye6JiAwKcPxsd3p5eh7gjaosrluqDdsnhA9K86Ku6WzYGrkpsTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiVy1Vmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPHl5Woc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiVy1Vmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPHl5Woc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XqGA3732517
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=; b=GiVy1VmxXUBWGMVw
	rhBiReMM+VZlAF5Etd/nwMhrISpyo4tFZD26N2zTt4WQltNJOYewDgkfCQyjYiF7
	Dj6yC/Z6vNnG7c19WCxdYeb0ydErGZgWfT7gFZ49NrGIi/+BhF8RB9yljIzMmgl5
	8Hg0N/mUpIY85mlUM1/bjndxLwsHDEflDIELwmqB9eKSpzazjuyQ2GN+f9nflL2l
	XCxP+xzxwZfwPd5SBI6SwlEQCS+w1atfye01pJpCe1xwmkTh2DCaU7QxmjIR/Shk
	DA/VwLsZiEWBOk9gyN1UySyCxS+JK3zEzFCn5P+TZSPpCc3qPAtKuVr/lpik7Bqp
	QYM9Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1bapa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso6694385ad.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901929; x=1774506729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=kPHl5Woc89wBPJkmFT8SFtWZhiF3pRMTFGypEfSjqyJQ6Mmqay3gX9FBpwM9rsqN4v
         Yop+vPbhc/jf9ELo4gaa0Jj8yz45gGfSfy7NLjGNbCPpR64YZHR7lQeXamxJrXiO7O+C
         pUdHezF61bDGzudkYaml30eu4+ugEOLlBBe4NKTb0rkje9r0uXcNm8bu9C5nmzSY1HyC
         5um47qFJZzCowOe2vrgc0h6eLlua/Z87JF4IzKXBZKe9y2N1bSou6SbOKGOmHYM/Sgen
         Z8YyTMO29S5DjwJpJjdDWNogQUpxtv2F/TC+R7HiC1hWH6ZWpaOAy3VbE2zt6GmWYOeS
         WtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901929; x=1774506729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=Wj2xPDmqDT2QVtMTazAJNEWLiWZiJrqkDzaNrJys2ys1R6Ujg2OOh5rgMDSDPhbrpl
         TmZgSx3gWxmI8NAQtYd+nr0R9MPLhlzT6uv8QMnIgognZqJ3vfR8ACnEbRotc7kOBD50
         oc+wJZgFkUOQSeU7qTxYePsOD7czTaIYJ183/O0I2NvEd74XXqSLJSbV4UGYIyNOu+C8
         egUrx8uEqfvcjo3sKM7j/zf7OPc3TmTCcK2VlMKo8CskyN3cXwm9m9Gx9DcbAbXT4ATH
         ub9KAiM5me141K8f7r2n18xwh4unxLOPr9TN5MdrHn1Dl9udxXTjbqAOmouYT6Ld2eDD
         jGyQ==
X-Gm-Message-State: AOJu0YxmKbPCyYdpo3EfpUBuMRS8NURgfkOOqpDGlddJFnAwiHsR1KiL
	ejjFELfwoM/TWzk0kB0vKwYhXcIiLEcV4UOxGhfTSHZjdCi68GrkTzTqIh6j653W2a1u8MPHF9V
	68EIx6K969BTqO0jMvRMdVG9pLm2tIIqTSz+qMOdIaSUoP0PUvSxveeeNXVxkO80=
X-Gm-Gg: ATEYQzz4+CCDI5MYKvS8S0J4G2Lh697wMa2XRSTdDCdyL8GHXErhWzSDBy+Ans4qi47
	EtO8sSGk5eqIKoxrYKmVcHHW9UzWqZnaFd7xjxaLvZjZ4qZN8W6Mq77+0/bFfo1EaNbUkD+Rl/k
	wbC+PCDyYDDDgQtZASSpirApeiXo2VrjYO45/0eweaJ1nZGu5/LdC2Ojy5t3vN4Di9ETQrROQDM
	I/IzhvxqeEvydYvmgS6WVC7ZQJrzkjthumvclYy1fMsTWddXaDPhIdNSR4GaDrqPZYY4Kn0pWPC
	Py+c2NjG3/0Tjkr+jIkFCq4TVzD/1czhn/zz8i4u4UKZ01ASCgYqsGxCKRjHkDdirGxgXpiJ7A8
	0cvX1ixE3LVCKt8+S1BpFuMft6b84I4CTjXDfNg7HEsKIMMcwvrY=
X-Received: by 2002:a17:902:f705:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b06e35b4demr63812575ad.16.1773901929106;
        Wed, 18 Mar 2026 23:32:09 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b06e35b4demr63812295ad.16.1773901928598;
        Wed, 18 Mar 2026 23:32:08 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:08 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:45 +0530
Subject: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=5038;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
 b=/wsjS4Mb50XnI6cIGT6SBvW/dCirIKCjrFdPrSRkNy9DwEoc48RM2a7D6ERQqxMoFRMNyY6GT
 nS7kxdbRRAfB1mI2EAuRyKzKX0ZxgWz0uvulhmpiwIc51noTnTYm9+I
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: WbZpgVuVJ7ocuO21m34ZWfJXAKE6exPf
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bb986a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g53SEPjKJ_zQRiRrflAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WbZpgVuVJ7ocuO21m34ZWfJXAKE6exPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX3TN7kYPT0IRW
 mBrgoFdjSfGFzSue/GOuxEzhZd+HapgtjsiBkKYtbZINfpwkgHCz3ARbT4Xtr4FhE9ig9NR1Wks
 UmBGYXtu3yvYn3FH+8wJX7hd1uoYC18L+NkO7weGL9qNJSKrjoIpKK+cMd76SJ7BWN5SoVb/Scg
 WqQJF/eCsSszgKbMxfeBCXDftZsSBcCy+8C2yYQXCp475ALl5B1SqSr9r5Fjo8uIdho0ffHH6Bh
 nJTWPFq9InkiuH78J0Gow0AcBoYOBZzQgNJV86BlHvh0lLuYnh91+joMKTpCcsw9AMzHjZKYPMl
 Fr7mLlvtmGePSv+Hkk5SGEjuGQwWvmR5VNCsFe+wNnkqvv906koJ9v3MsBBJnuaJ2e5gUVpszut
 qnHc46le3UW64zoMJSeQvLEesDwIy+hAQ23A0iJMdLSpaEqRzE3XPPcc1eV6+MulyUH4kcCKSGm
 382v4+JZtMm8lDj35CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190049

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

