Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D94358372
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883739; cv=none; b=Wmm/kDCVIHhH4EAvfU5BBtvRutVFl73bnGOK4ZgTPLtQL4dbwmXSvRdxAlDblqW9w3S995UOvqErmbl4g+1qTrYv6LfP4NPkJj3BLAsDRhqEY9fNzR3C4XsF1g7pd2Chx1xMLdMt7j21lP9RMp/2LZm5AWZsylgh2R5lHqnUcVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883739; c=relaxed/simple;
	bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+RcHOXlPp5iFh/71o0qnoc+L1EDlcMj+/U+8DJ9mTjG8yYP2OGO8gkrQ25BLiH1s1XTFUvL0oy1PXrOgETbh83+GJUPozAu+1Aw/TJmw8t37XSM1gOiCjN01ek0KZ5A+f3SvzQYbIS+zkdIidP/oJducY/pbLc8nm5Od0bi+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WekjT8zM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8sWamLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WekjT8zM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8sWamLc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276r5c83098536
	for <linux-doc@vger.kernel.org>; Sat, 7 Mar 2026 11:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=WekjT8zMSpAi5+2F
	NOC5OFX4Hs7Lvw67uEwHoXkTlsSG9brO0irqbmk5NV+pK6evVNNk31KGWrOem33d
	lwy8sOLdr6VKl7gUlygdv/+fsJXXiNHrea0cqIOeMe9ZzIiGtE14uJZP1sYtBDTk
	a9yK+cr+GE9TsHDNzE49XRpZMM0FUU1R8C182+F4yLpw243CUPdPb+cUYR+XykkS
	fKObjn1Fvl1V9jWgXOrBWiv7XAactbecX84059nCJ+6ebDoAcvltOSyolj7Ya3pG
	YL9wGJO33LUEyBQdHuEPqFIXJttvP+lG68vka83+W9yZA/YHMG0sfnFf7tdSQXJB
	foSrtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrgugn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 11:42:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae48a21d12so48036065ad.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883735; x=1773488535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=a8sWamLc4lNN9E3rG9JDnNZrVVGG6IWCMK5aUg3zTn1maRT9m/nlUBDjsminqEoS7E
         vKmtCf56Y6R0EW5qSoGTLDVKxe9yURIItaCxUwn12FOAM2NqyiyDUPNKjD+ZNYca5gZe
         VrJvqRBKRnYkuLcCUOJ+uva/TE3QJMXxNP3u/4u4JLSu9EZhno7QRMLQ0xFZVkJmyOXi
         7r5pZ/ui4PdexAVvhjFS9oh2TsyZA8EO2s904MratS2ueG1ZZq6vMhPX1qc/I1TMSnDS
         nR0xZHV/ggruJTgF02gk2FI2PsAkgcrSJ6vwfGU3y71ZufM255RgnSXh7v1Nh8myXhOi
         AcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883735; x=1773488535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=fQTR4dV2/bmRBa4NQdZcw35Wf30ve0Ba+FSWzHMWKJXz/AHw9MN7VyW5ErkuRs3Je9
         IggGT2sTtFOpR7ZetEVcZgnW8SNqF0Hz1VfTM8AicuM7qYqEUpIySMOClMOo6nEucxkv
         Xpp67zuIZGhwby0Lcd897b+Tx3h8Phldh/5zXiNZ+eOqOKULpuCVpBWioa1xp+UPsRZM
         WME2GJgAzoIhb7lr2jA9effn7rhD6oo31dwmHv1XclrxUwd6EqQdmGPpEyiIfhU+JHZw
         RVLjM/cUnvZFCK0lTkqnh7oy4QmY0twsehzhBSxmKE5FX/m0IBZlwM5Yp0PsJsHdvVW8
         PVLg==
X-Gm-Message-State: AOJu0Yy67FDTiTizkPnfEXORgItKWkDg6GZ6uU+62CUGY91YIDL9YxUu
	L0goGYHngdTJFvcbqT9timcgpB/unNEPp03RpF9jOAhKRwBhUm8KCoBfmxkXqKdmq64ILVnqy6V
	xPb9NOMPWFz2USfN400/djBSgo5egAUnlTHRO0r5uzgdwqotyAE06loyTbp5F3Y0=
X-Gm-Gg: ATEYQzyEmriLL/Od1u/9NsLXCfOlPOnjvi+sxRcoSXut6Adw6fqmawSHQM8/pkI2JM/
	WQ0TtGBFMlJTRJJfI9muy7+UqdOmJx9yYxGQHNcbZbYBxNiY358ugzQZQci75Ssv2pjvKW7Xl8f
	Z28uz18HhgfCuTFg7D01lWGwFtqK5xrhUDa5alV2Nia2mSh/g+DRanNMN8t3KIalJ1mAfAOvmOA
	WBiYKcFBfzwT5gGeRZ9ujAy+xvt6dy5HXJeCimzKncdhh/ux4O2yIYJYFKLStuCyS7jzawiNAAb
	pm7BSfv61gaELIKjLgGLLAMQrcloEqV3xfdJoqqa1/GOYrH2suU7QTkTyS7aqlauTuPqSkQW7lT
	tcIGC0ZE+OHde0YuwPP9THAl5oSkxQLOudnEhaNTa50tOsTpwouk=
X-Received: by 2002:a17:902:ef46:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae82398d80mr52195405ad.16.1772883735200;
        Sat, 07 Mar 2026 03:42:15 -0800 (PST)
X-Received: by 2002:a17:902:ef46:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae82398d80mr52195255ad.16.1772883734674;
        Sat, 07 Mar 2026 03:42:14 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:14 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:25 +0530
Subject: [PATCH v2 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=AaVGqgpWF7eVrREnt5Y5EO03kCIUBYl4kZdPLgZDVTiiCm1Kho2b7UaZcoD4cMrp/CaoDgmiD
 nVWAvjGkYNWD1NS4wgwp5xWhVrRF461rQtmOaVvcy6WrppQya1xF2rq
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ac0f17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: w13U8FeGRxpsBpG5KcHDte84iW6XFuc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOSBTYWx0ZWRfX9JJks3A6gQ7L
 aa1OIPSli9XHkb6mHhaInPRvVRhks80+1EOUycDWrW2ronLO698RL37PQMnGyU33j2lAgvhNy0d
 W+DckbSRjk1wq7UAFX1oLk4deG5Eo9Hcfo/dMmB0euRT4QTQYskfbQYKQktiSz59Eu4Sz/6TtvF
 CqPCzMKCKzWsyhE6p0BrlbmcXtph/xq/c1b+GcuVnk6vWMrYDu5LoNF2SOkMGUqTUHuwRCNoeK0
 z6gKPqyK+ye22vI6eXTpoMUK/aZhQlV/+qkCVYqoCEGn3hB09jFujokrBPPppNXKPPCwLGb06rp
 /PNmuNdglQ94L5QxiGUc1kPC3sqIEQ/lGNeopESw09G7AX42aueSl8MjN1x/LsP/j0C/JRc1KgK
 rhZh/rnILLxVUXqY2emlrzQTsTj5s2LRVs6xHXQNnTx9SPhMI7cUhZCEuJIwG6KhNnRqIRPkj4K
 DvUteSz3hSuziDCr5eQ==
X-Proofpoint-GUID: w13U8FeGRxpsBpG5KcHDte84iW6XFuc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070109

The Sahara driver currently selects firmware image tables using
scattered, device specific conditionals in the probe path, making the
logic harder to  follow and extend.

Refactor firmware image table selection into a single, explicit probe-time
mechanism by introducing a variant table that captures device matching,
firmware image tables, firmware folder names, and streaming behavior in
one place.

This centralizes device specific decisions, simplifies the probe logic,
and avoids ad-hoc conditionals while preserving the existing behavior for
all supported AIC devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -180,6 +180,16 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
+	const char			*fw_folder;
+};
+
+struct sahara_variant {
+	const char *match;
+	bool match_is_chan;
+	const char * const *image_table;
+	size_t table_size;
+	const char *fw_folder;
+	bool non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const struct sahara_variant sahara_variants[] = {
+	{
+		.match = "AIC100",
+		.match_is_chan = false,
+		.image_table = aic100_image_table,
+		.table_size = ARRAY_SIZE(aic100_image_table),
+		.fw_folder = "aic100",
+		.non_streaming = true,
+	},
+	{
+		.match = "AIC200",
+		.match_is_chan = false,
+		.image_table = aic200_image_table,
+		.table_size = ARRAY_SIZE(aic200_image_table),
+		.fw_folder = "aic200",
+		.non_streaming = false,
+	}
+};
+
 static bool is_streaming(struct sahara_context *context)
 {
 	return !context->non_streaming;
 }
 
+static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
+							  const struct mhi_device_id *id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
+		const struct sahara_variant *v = &sahara_variants[i];
+
+		if (v->match_is_chan) {
+			if (id && id->chan && !strcmp(id->chan, v->match))
+				return v;
+		} else {
+			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
+			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
+				return v;
+		}
+	}
+	return NULL;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct sahara_variant *variant;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	variant = sahara_select_variant(mhi_dev, id);
+	if (!variant)
+		return -ENODEV;
+
+	context->image_table = variant->image_table;
+	context->table_size = variant->table_size;
+	context->non_streaming = variant->non_streaming;
+	context->fw_folder = variant->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.

-- 
2.34.1

