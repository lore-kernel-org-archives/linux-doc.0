Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74744425CEF
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902289; cv=none; b=Ogx180hVimu0BO6oE1uys0a8XpcQMJcaDH1DzvBbbYftd2Csjx5nqQpzQWhheOzNOFQ4eFupJzMfOktPuUBy8C3i8WxqMU6iJfQfmk4Sy+cksYktURqfzY9HdyjrVHbQ5aFI31VGBWo16GdkQSag/ejzTiFDd+xIAQXcHk0wgt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902289; c=relaxed/simple;
	bh=y9g67LoOAK1zIYhgVoqMtpnLtPZtPHG+SZ4nbuUAoiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glOzSaaKxpKU66O1x8tgAdhdnWfrWLBgwYpwgoGIK9lo8r68cpl583wk9gIsOyxgIr+vKoaFyD/WZ/o2ypZfqYtHTJlYxQoZfbIuiDBlSug8aG3HWqEWuhXGY/dklb9YHweUDrpm7GUXKOQcMBojX8dq415I6uwwuwZb86cvvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpbEpQKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBHROBo4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpbEpQKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBHROBo4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGaC4794159
	for <linux-doc@vger.kernel.org>; Wed, 1 Jul 2026 10:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=; b=cpbEpQKYeJAibeQw
	DF/pYebaDlq3kYo/OPlezrMmkbtB6HKnIvcZnKq7/Uh0zSHdvpfOyepU7UY0/qJL
	oEseZXD5mMrlJAK4uD/xXudLJbf9dKPglADPs2AVOJo5id7HDRP4SaAoCLVDFVE2
	QohC+zc7CKE2QUntNlQFdxP4Y1AxlMMEuatAX4mGAaxZJMzFvlg/8Z4fVGehZzFS
	ra1u84e/bpbRSFwME5y+dHge3mAyLIUyKohwqKRgFaVLkai8OJo0TdGlI7DbhzVa
	Q7l1eg/sLgcHyA3Dnu1COBxvzH0/75VQAGGxiLOyyE1r+2j9Y+9Ssm85CTGbra+s
	qcC/VQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag3mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 10:38:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so957339a91.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 03:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902286; x=1783507086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=;
        b=iBHROBo4iSm+61nMFQQYSg2Tf2tgMZZnY+gNstHthmaD6ZWvn2arO5lQekjsDuhlEa
         s1J7P8rO7kOKyqsuV9sc/YvMcp4DRmWgF8r14dJ0psOvVJe2SnsvBv26MEXYOSs0up3X
         qCRc8D99kZ/ClOLdfGcpVjwRWyvLLWPR5QhJ54g6vjNuS/lX4y7PX6UsJLYEHm5s6r9N
         HUKDVBbweRlddJXej0x+V4aCl3I1Rcsjmf1TZAGbwJitBbVsyK8DY1VBhS1H6B9IOuFM
         Li9Tkn8G9JGMCKp/lTFHkblBGG5+MVFpjXaDrtt9eps7yAIvN05VaYHJrLOJO6ssjIn9
         /slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902286; x=1783507086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWnkB32rC8c/c1FmukfGJLAkXTQ/yzUwW5QZTJ1tuHA=;
        b=lj0Yv/5/BOngXfsv6cxdbCJT8W4ehSqedjKKFuhKeb2fPrUbJF2Eo5rgMYETBJ17tC
         N7Z9smynwkt/QOHjQ/nv1ZX53DUU6fLcyjKYNSfDxrLWxpiWqVH8rgQFFt0soS3ijPN3
         xljTIfhFpBb+VwOnSU1XLw6D6DP1/A2cG1B9SpYW4BmZ5otoGfkwGOFMbmgbJ8lJOVPi
         OlVwfEglbgeajQJV4wTKq43Ua7OKguRzAkPklkZ7QoNp42WvN2y5sqHYgz4bv7+9x2Eb
         sMq3vOp3FYSXOLvRdrAeS2IuCKC+uKmiG+QADaxEJ5F1YfSonW5emHUw+9gynXxNlOSZ
         VyHQ==
X-Gm-Message-State: AOJu0YyF08voEQE8wM2AF6Z/MHtZZVeAhvy4zpMvEzaoyJ1xThohSWwB
	IxDs+dg2Ai01MiiqWCA7mZsr4E85Yd1hUjTMuPj/BmEqF/BINZ7gmIIFBFT1yJSregWS+ZosCJu
	J22fiP51TlxideG8OFzIxf4RYgFhWptoTHTlGUvPdu46sQqF3Y+fZEgwOMwt0xCQ=
X-Gm-Gg: AfdE7cm5hiacQ8Jaum/5SomZDo35LUcx8DuZaRO+OpdupHwpuEGFpKAHuM4XLJvd4WT
	f19KRi6AEtrYmz59mS0Yzjwe9ySmTkAJro11EvzF5cZ+mCk99kXkKGtBQHae4pwaTNc05XCdyZ+
	BaUv2dbRRL6lsJ8pIWRlAPQzmoLHF1VSB5ymmbB1SK9jtHdXDMyP7bePQb/vn6Fz55tJhBvoDBp
	W25WJPzxt44fyk1ahXKeG/evd6Fkbh03D0kFkY4OqcFhAVabpe0sHUl3zHtZX8rdihLdDMH1JPv
	zD6tftCiGm4/rF3CctWyIotViI41RIbIG36xRVBQE0DjUBUZpDgnN0eQyb1Ty6n4WVXZQYYIuDH
	auix8rYavLR7gV3okVz344AlO772lATfApQ3RHzl0
X-Received: by 2002:a17:90b:562c:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-380aa20e0cemr953620a91.32.1782902286105;
        Wed, 01 Jul 2026 03:38:06 -0700 (PDT)
X-Received: by 2002:a17:90b:562c:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-380aa20e0cemr953589a91.32.1782902285554;
        Wed, 01 Jul 2026 03:38:05 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:05 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:38 +0530
Subject: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=5296;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=y9g67LoOAK1zIYhgVoqMtpnLtPZtPHG+SZ4nbuUAoiw=;
 b=jnKA84aJ1sECKLlROc87nix/+fJvHhxdehrww1VkOlAbyhF3aSuQQrLie42XItz0ub6ZmN/ZB
 r689bN1jkB9CaoIdFwF+Sin8UMVYjo36Y1sA5IsNj8RHzmnCNZTo7W3
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: sTEPbPnly0MCVmGvxt34R8khSWs53v_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfXzIv7SqFcLsjH
 0xkTt2trlyo7jSluF/ljXBzWm1P/aufhD6pcZoOmoWf4leNd7RzNrcDCt4QsNrVSNJl6UUnzQuO
 9/a1VNzpwah8C2ITSqSrZm+emB3SWZPLiCtE8aNowrTEUa7goxRo5SLvi8qGv0wQiF+18bf98hs
 3GPPRn0Dwj+enqe5EKf5BrWbaXrvqvW8DheGWZP8Zhw+wYIr+1zEuYJYZwtyYCpPs1mzJD+wRBo
 rzbSke1QhpXRdRSXNyBE1nX1nHrQ9o5qaimYsnQKJhwfXfHKqN9aMw3BhzkZ9UMCNFzDa3bpKM5
 2d+G6WjroAUxTb1IBldhyUue9a6TbbheRehZ8Ydk8TrztRyoZ4XhB3j018xSUfrP1D67tSPlEkX
 2OiukXjILFtF0gHarr6jKXIepubKIffr+yeEvkdua5U/v67Xm0LZAeni2GNS1M1Obw6t7+AODJ7
 3mtvMZ+z2Wd6+J0y3hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX4Uhz5K8lUOUy
 vU4Cx1fRf03fwD3LtlsFpkG5AgoOea1kNMcyVrsCAith6cz5iAD2EvR38g+HUGfTZPgsHzx3Vix
 aGOn15tApFbgNfo3FhibMSp1wru4qj4=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44ee0e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: sTEPbPnly0MCVmGvxt34R8khSWs53v_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010111

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe time variant selection to match the SAHARA MHI channel and
associate it with the QDU100 firmware folder. Add a firmware lookup
fallback for cases where an image does not have an explicit entry in the
device's firmware table. This allows required images to be provisioned by
the platform.

This change only affects devices matched on the SAHARA MHI channel and
does not change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
 drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
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
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
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
@@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.reset_on_remove = true,
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
+static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
+	.image_table = qdu100_image_table,
+	.table_size = ARRAY_SIZE(qdu100_image_table),
+	.fw_folder = "qdu100",
+	.non_streaming = false,
+};
+
 static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
 	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
@@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, mhi_pdev);
 
+	/*
+	 * Provide Sahara firmware mapping. Sahara consumes it via
+	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
+	 */
+	if (info == &mhi_qcom_qdu100_info ||
+	    (info->name && !strcmp(info->name, "qcom-qdu100")))
+		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
+
 	/* Have stored pci confspace at hand for restore in sudden PCI error.
 	 * cache the state locally and discard the PCI core one.
 	 */

-- 
2.34.1

