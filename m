Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D532FA30
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901928; cv=none; b=sJFr2QT0vWl3MH9MspAh833UpsIoOGkJ2+CY5iyEVTD9/n2/+5NRDVXc5mvZS4vd/kjQ/g7KzS8T2BOJItaPKwGj/1pO6mxpCuqmbH5xo9dGSw9Tjb/513+hWHGe5jWWj1xioMP2AgGxGiGRrxpxZvVud4IcT0KkAbfej5o/Q48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901928; c=relaxed/simple;
	bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4hYyFnVkdnToqaYc93F4IKLCG71eJLOUS1Fbswl9qMvCvjTe1ZZn5TmdXMIzj5Bm03+VNp6BfpF8uc4PWGeBte/L9PuJoAcrFwf6NqNdvRj/oHMXlLdfyK8lm7h380XDa3PwmCHdihQiFBfrbFtK0y516uR6WUphVVy1RiHfis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Whn166aW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cq2Hg05M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Whn166aW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cq2Hg05M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XcQ4573780
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=Whn166aWF+XL6yG7
	FGBOscb6eQy7j9Si80EhSoVjfzaM0FEkgX2cWAxkFlVNumEzhyPzOM9CmzWdG1qA
	MZQQI3LX3k7bg9IChdDCQsLasLxF2SAcluNgscqujtiG4IxilP9rK0D11/49d8DL
	ty21gWcNCSyy+9ULXhqcCZKLtXUj22qbjv+ag9nO1PJOjF/notp8RB1I6Jr9FqO6
	cvRjn7Ex3O4eiegBLvHEkL4HhMZ6bxxYMIuZi6XeL7dvhczmWEwLGX5SWZHZw/Px
	uthjzhpknujr7XrPFNiCdVRPrBSlIMs7ySDYLOtD2q3kpdEYSwPE2dzw+XFhxCGR
	DvBxRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00ega2h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b05a3c2421so6889925ad.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901925; x=1774506725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=cq2Hg05MKPH9MpCEJLuNPezx+7qHAsqd1LVTSgwTuUFYz9YPDoHze5GBC5GTomOjei
         uW56tuD7iGxmISqz1Mb6bYHoUoOSUVAGfaQIAGwRrwTmCG0oPy2f7DQJ5Y8URvwb4KYU
         kpXDVvpWxc7aLGjgD6CZIQgL+dsWnWvyTZ0u3HZFE6OgpKHQHKf5ddo8aUYKSnVPM5IS
         Z/ubzcChZh3mubPerruWWbgXR/y1gF+7tnRImdi0T2OwsoGrk4sWjOOk0p4oEh2xupZC
         c2BTt5RIl9aBS8vpdFhanLd6mjX/FhKViIWkNcAPh8IfSb3z4iicgarXkPPh9sQOeAJK
         r06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901925; x=1774506725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=eZHL7cck5UfXzOmj074mgYCHTEIud4dVOon4w/b34BbSWf4KHtlS1X7Jad2nRBC0pv
         1AxLfZSvOC4/I3dcHWw4qPfL73zg198pxLr5o9qe6G+v0cUIpGpNWQgloSqPHFgwTwuR
         XU1H5+pdydM5yL5C55rnYqr/4r2I+UbqKItDlpQGD6hvWY5FQN2UHz9u41ZEUW9w2EFq
         qWbGQa5+VwveeQ/oOEX/bHJ7ZJ9zlfkczPlu1ije7Wfl4+ZlFvfNlv5U/5oOuKkl3epk
         /X/jVqieF0Wf5mHEZIDb2nVrlN+oEtY/Yw4kZggiqxwg4jpR+Ycj1kLLlU4hskAiMDRG
         zNbg==
X-Gm-Message-State: AOJu0Yzzd5LAo4JzOJ/z2KVpNZ4phvtt2z6441s8ZM/BEUi4w8dHO5TW
	SZtoKWhKp6B0hNCrcbotp1v5Yww676324PeWazHD4NxNHSTVTKL2enmKRp5vIEqguF4SffNiNDP
	KFOvZ2+LG2xSRLUpg8MvzbE8ccOVSFHVW336M5uwapOKWlMLi0czDRWT9aIcmVyQ=
X-Gm-Gg: ATEYQzwySnO/Nbt2OCRq35/IIyvAlOxXN3cDHxgvBQ684Jm/mNTeHPqK2a9FEw3YtqA
	myEmj26RO7tBH6jIljgREzpjZ6ZKRGBYKlE7U1YgUy0d9Nh2hHbEzJAKV2FLZiHIEzoAe6CJZmo
	U4WLvAIa2fboFrdHNwotEllyKnPpoSqO1RN2iZKBHQfg8ReBr9Oi+FJrdXOBPJTo0/y3ZicScP5
	6RYxB4z6B7B0e2ii2pkriS1DvTVKj13DQU+OHyTqkgQJOKr6aQCOCUFrY+FNc9Msb2Jm0pDSV+H
	yDtb/UYBH+ufr3fu5DDcgaNHBD9QpLGiHvbnsSUwX3RP2CGQMKRKafCAk88fgY6WuV7su74v7ac
	t4jBbruXZl9hgNCWssWMhYz8O8H0NDI1x0T3iQSuBF9DXPbQXCaA=
X-Received: by 2002:a17:902:f547:b0:2b0:7177:d5e5 with SMTP id d9443c01a7336-2b07177dc04mr45425585ad.43.1773901925497;
        Wed, 18 Mar 2026 23:32:05 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:7177:d5e5 with SMTP id d9443c01a7336-2b07177dc04mr45425075ad.43.1773901924217;
        Wed, 18 Mar 2026 23:32:04 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:03 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:44 +0530
Subject: [PATCH v4 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=vr6s4lpUaWr2T9TkXlD+KdE+YQxiqHW3dkYcMsoUITH9JLmrkM1V1VinIAHZ1bzHa8OPBMlFX
 aLXDFnx7Qz7DIK4WvzLkJn0afD+UwqZPiaiR3bpdRalFoHWK91wWibP
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bb9866 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Ujg8Oaqo3-3TwZNE1JdqDciuFZ90B13G
X-Proofpoint-GUID: Ujg8Oaqo3-3TwZNE1JdqDciuFZ90B13G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX4tHHZ8TC6iuc
 IyxL9ioEEVifHOURf5yFJLwEm5VFN+NfofFLsnZxuq5TcPjdBSMAKjzcKkiuKL55FzzI0DaRxgh
 df2seR3k3klhRD4Ok19zWHnsfckMPq9bk/VFY+IH5qdz9OL4RCmSlkzfWuV/t6MnOoWkNMZ1NM+
 kRawCNe6uEhVKPR5coyKz09uIa9bo7P+ZSOvYkPd76nN7ZuMvml1dj1VKREorWe7q15qc9Iyv9N
 b5E6DBsLXTcEgNBmuS2TFaR3Cl/FJeoE1by4pn8oswNDsHdIWq7sNURUAy2/04dnjw2kTF8W2Rk
 OCRUC4Q+SaHbvEKmZiJ9TDpkIEioqkl5lkbIU/weyRLHMic3SHXEu0c1NHh6s3uw1G2PQhHvLIA
 eZLt9FIe4mZcCdgaF15AX9ylYIAqI0BTUvxmLRIuO5hfMyxsIYFdWzpeBzIanPkqcX8o8ORCNlS
 5OqvsfMCNhDU1DHqwCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

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

