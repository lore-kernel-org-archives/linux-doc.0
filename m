Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE0835837F
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883742; cv=none; b=L6Y3acCv8VlIrt+3NDszIl38S1fq2ivjhxhAH7aagKaWsWKo5ppb14GKPmqrG9ABzCz50Ffnmlh7pCaAnKCsQQa0RXdlkR0TQrhXFLCuNtt/+0JOzFu16+3lGDpe0CixI2olUXlWI7PE+AXatTWElzGtWZLJD9DQ8ikX5jhWLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883742; c=relaxed/simple;
	bh=vJFCyjoa95JiLXs7Pz6h5TcdiwCOOqlAIPqInF7ZlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SR4BwWe7JKd/PfmAPBhkX8BS8pkty9rOVDTjAAcU2H3jyzoMTr5vNVBoWBRRM/UvgumKWl0/qqirBb934g4uOxN78z9Nh/5Cu1O2ghENrrPux1BEyI4WM3DjN8NmurZHo1h1BSIfRGOtViPQ9Ix3qnI59XnweCO+0UIM4gr2fJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7xJadM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPaD2VyV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7xJadM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPaD2VyV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6274doJ43361237
	for <linux-doc@vger.kernel.org>; Sat, 7 Mar 2026 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=; b=C7xJadM8gA7u/IHN
	bx4dtl1AbW/A6cZfQt6yenU7Y5LK7ekEYg6RvIcibbyRAJsImpkgbxOYbrCpYEtI
	oqevAFsv8iKFFLexOKYQXpM0l2QqJPVnGMxKl5drDuvkeEU8JmzsMOK05sNKEUq2
	o2gu92anooiqn/tSoEehm0xR8JCq8VorUHZuQc9L2t7poOhjQPaUlCv+V4V/uPv7
	jjXFo/6+6AKqyqAxjZ5hL6l3wYlpI+LTC9N37ZKyDtcL5P7shfnribCKtS/w3WtH
	mKlf2QS8mkf6Hy/qkMeCwZIXk59VMguXNHpVPmieMW48uFGtFyr/Cfrt33m/G1ph
	SY3TJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6f8jty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 11:42:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4b96c259so69826785ad.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883739; x=1773488539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
        b=hPaD2VyVsktmYsd7QAIzIclvG+xrVQ9UBBFzjLnm67hgBlEoeHhb+zx8TquLdHEYYg
         iK+qf3zbzmqGlNo1cXiDj+8BnHFjD82wJQT3U7ZBlSCPfI25hwnkHypDpnDB9gitvXyH
         sQdkYHt0izeIHs24jRec2HZgF9GsoSNZNOT5RTMbAnnXa3/r8uMNUnFp2oP/OUFoSN6c
         pvD8ko1osMadLmj6KzMe+JTMS9BLZzB3x/ImfNsbO/E1gnC8Nti1BGhdVb9QiMntogta
         iiiedIeZRpsUXyUDN/fxRGrQ5sqRAmpUkxsdmtm1NV6qccNcVigu3Xddxx3hOHP4B7t9
         86UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883739; x=1773488539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
        b=IUyj9Jc4omDfLVE6OEHR8pMq4SG6fOBh6BvGNKIKXZ2PWfzZ1YmtTZyj0omnvY0T8G
         BIQB7kHwk+G4D4sWAfKhlUtkTwo14ljhGMAmRVo1Xfc2wg1VLNRxxvvKYkAoLgpircef
         pHjgL/Tltg2S9irq9TI+sdPE6BfGSpO0qoYFWvPwOvAwU9YCptg34HYcrCsaMX1A251J
         4Ybek2aHzjjZ+ddkYj+7kK+MkIcTjnmqPUI1M0rX+fk4s4hf8CaiNMq88X+SLHOjpJ3G
         OeIb+gwP8q+MSSzeHGRXPIR4PhlOxeTvvP3iMtReScIekllZijTkZQAxFd7sxFPpIMDJ
         pe5w==
X-Gm-Message-State: AOJu0YzoVT9S2SNaLx2kj3QMw1l93/xuWtkzlDzvHb2O1fkSsMlEoqXt
	axYZVmKyp7Vhx7y3i5EDMhrJIq54N1GQMMvHcj46q6Pb+c+i5GgHvDgczijqdQGAoDgDvQkWM8F
	jTpxWeXZrCnKyCU86MXvUDnZnNc53ELE/VDKf//XpQxpLIJ6vayft+ysXBD+szVI=
X-Gm-Gg: ATEYQzydXlnEgMDL/GO45FB4xMoKb0HLPtg4rSrdymqYnumgD05+DDZDDI9V6803j0x
	qS9j6UBXBBx0a8300c/7DUXVpKdA1MT6jKN5pDaRhHTrA/jFsuV4XOQ58SihExMt/Ml7YpJcO4Q
	62ThUl6kvwRXkoGYQrmRO2eb4rrxd1lBa+qaR5fpMPabKYXjd7Q8k0AiodstZWBJ87ZXgE4VWWd
	hyFt5asBUP9Xz8jchdWEU+pz5HLmJ7/hcuET5IL1i+sff/Lv4oDOOHcuxQPrF6y+CLEPMFfyEiu
	LwAmRvLlB1TsRTyCNcBUcAT2Ir475qx4ZGoNBJCRbAs1vo/utzSORvTfDIizgwpZCa0vSG4se8Z
	Uy6gnh43t6kcfajbx1vuvnuZUP+m8HmIP+ibJTJcGKDf6gBl8yh4=
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id d9443c01a7336-2ae75c44e3amr81895205ad.24.1772883739474;
        Sat, 07 Mar 2026 03:42:19 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id d9443c01a7336-2ae75c44e3amr81894975ad.24.1772883738917;
        Sat, 07 Mar 2026 03:42:18 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:18 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:26 +0530
Subject: [PATCH v2 5/9] bus: mhi: Add QDU100 firmware image table
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-5-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=2740;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJFCyjoa95JiLXs7Pz6h5TcdiwCOOqlAIPqInF7ZlGw=;
 b=E0DvBMVt1yhlU2+bl19BSbFkyOv8lNtMG/XoDDP3el3kAeZ8yYxst3r6uOujsj9J/WiJJhau5
 3vsjMZdzA9YC4KOv2yPbPKP9Km3C9tjYx8vksXNq6mmqaYpJDw2zjVs
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: MBLkbLIjgoJOgNhlHA9nHdUOIO5ouq5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfXzww1tC2aRwIr
 opedng4sAimdy4todqePn7qBvZNd6/JXhfQgnLmMnFmr7VgRrvbHmEvq43Z3MgIqscvVjvE/fKD
 qzzvYkBQVweMHUYkfrVUZ7hWyDdN6us8rZXmWM3X8ASeqOIaF+TPGAtI0RYGDzXO6UU3IkT2RmI
 c078nIz0Z4ZdIncGETbh5SMD8q2MqJND95YmqS9RNe/fLTpjBfkUXRA0gkZqS5EjxRs6yfTy7fM
 /Ys9pHRqHSsiQ0T3XwtkRFg2Y/ihcjiS300ViqFNzDB8kog0WAPfMcojNm/lNusACy8Hqzc9EKD
 XH5torL8CtsRbkxCks0TrULjHE1VTLkHzH62L/ki0VbRONd3kYbFF7sF9TAZGl2XvmndtshbDOr
 kquVQc+/bcNHUOiheAE6yCYz+az/TEm2wVBINIxNWFNlV/eX1VJVY2u9YifuJeaDI+YTz1l8Oy0
 lm/U8lWrh++0lDUdeTw==
X-Proofpoint-GUID: MBLkbLIjgoJOgNhlHA9nHdUOIO5ouq5C
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69ac0f1c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HyzSnua-yo5JtJyIgQUA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108

Add firmware image table support for the Qualcomm QDU100 device to the
sahara protocol driver.

The QDU100 device expose the Sahara protocol directly on the SAHARA MHI
channel. Select the appropriate firmware image table based on the matched
MHI channel, allowing the driver to load QDU100 firmware images without
requiring device specific client drivers or additional registration
mechanisms.

This change integrates QDU100 support into the existing probe time
variant selection logic and does not affect the behavior of existing AIC
devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..73ae722122a35b77760a4816bc60e6607aa53455 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,37 @@ static const char * const aic200_image_table[] = {
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
+	[43] = "qcom/qdu100/kernel_boot.elf",
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
@@ -250,6 +281,14 @@ static const struct sahara_variant sahara_variants[] = {
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
 

-- 
2.34.1

