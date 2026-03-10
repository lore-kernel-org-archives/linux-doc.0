Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E93A3832
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157494; cv=none; b=VYleTkXkq5IZ28RJ+ptI4XTeecIqSzRzDW+j2fsAZxLX6nUT2b1OM4KC1Hh9hYjKyAPK21bMoLOmyB6rxO+KD1pIrUuypyMTF11k/vNP5h89Q005sV8n1VKoxTBdxyarD5xhGmYWteVQh4Sr594LKSEVj6KjN6Rigea10TcyI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157494; c=relaxed/simple;
	bh=Nz1LGAzCKnFnAcOBVZfb8slxeQc/H+JbDOJrfn5zCw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGumobygNrtvpmlmUzsjxJITLQlgG6HdbSuEDHEvHGmwWcb1rzyFRk3sWjd4fxMQqh3pKUBEQubhkS4VPKOux4avE2kWs814BMst0B9C3Hu9JUMiKYazWUVLdu8VUbmk/Rb4XAJyFMStdJvC0ScGYLXwjRD1TqsMyrvmIoRKfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYYy3y17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLLi7ZP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYYy3y17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLLi7ZP2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaU292861880
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=; b=oYYy3y17oSxaar98
	oGDG8PFTvxUWuVDN3Qb2C61Fw16gcQGPq+hy/9TQ8SqWe1tmvv5INlkcyQbrRG74
	0QkOEaxDRLd1AzYgKTw4jKbcI59uy6Nbvnn27f6IsKZJ/5H7MeOxIDczLIPuLuWb
	otDHwnvQeo56SLdkglIR1+84GrtDjBdov6Q+ashzk55P1pbBR/d14imzxBIxIQSt
	EagiQnxMlL0IBBaSFRftI2XQY3/wbKOflqb8n05wBjha+VvOsElfVJ+fxdZHZG8a
	PfSy5WNI+F0YlEjtlsA4fecLiVrMbu7g519RaYR8LPnzjFhCZRNl1jOVkmp8glHa
	1ewelw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3wa2g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:44:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd85e08fddso2193797485a.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157491; x=1773762291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=LLLi7ZP2B1PVaJ87dP/Rk+h3H2aZ3+Flt34qeE1rodjvL1u0eLICPy+GXQXob9Acby
         rEd0CXaPiW7O/2bqNvVkPPtnttQzLFIeozYlEfgi6Je5FIC8y86OPfWh+QFp6BXwFkJ9
         TpuDrRZV4SwFNu5hniDW9bhT2fYsgMIbSSYlzmqCDTZiO4aA8vh1FddtR9pJOIXS3+ms
         8hiLl7hB7ewWKxUS4MniLJUbffHgzN5sPL6/EhyIV8fNt+d4RSrQKdOsD4Wqh9FZf+/8
         gWXoXr9oejRsCYutPDfklLi44PtVHjIn1q4c7FJMQyfjuM7E8+yIBypROs1A9FcKLjts
         t45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157491; x=1773762291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=exN5oY6rcCpXk2INS/aAJHreudVTDlZTPn8vPpQW5MlRQTRvKltJnBCsIlmX9xbMZg
         i56mB0SsdXZ39C96d+RLhpMet51NVovw18Be+gkWCDDmmdjEQ3zmSq23tYHFQvvZ5xMr
         ZLG5cfp55gb9qypACHxTWC1rGW49RJ25y4XYNMKEo3GpxH1ePP+3sgSZB64Xv6h61J4w
         nORtsgesumYarkRVQcMNogyB9uww+oPsn0URO0nDuEVSjFWsdShUMn0f+vJP7t3BXoeI
         7b2xlVyFkXEsfiSv+6oaTVyJUgJuYJwahg6Gs7Zez41CCwl0QhEXW8if5EqsEklKBvnA
         n9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUiSRk69VT5MJJniyaFVMThvBgkSC+LU39v6uvfG5msAM8OGEwVPYn6zV6mIyf1NV5s/OMDraD42Oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6S7ATMUYdiLBOGMLjBSKNIC9nbrlSrZzartMmUoYyW8tvbW9m
	j8FxNfCyUMx4TLCvUq3r09kFUH0UCTAZIQNNsdqpr4hRQTHdpevMOUf+EMc/8s6lbyMmc3obolT
	HnSLTEaGuniFu50ndJPKH9leRC+LjmVDvZ0SSv6qwstCEJb5om+CdpRfL24rUy6M=
X-Gm-Gg: ATEYQzwR0By5Rhtbyt7PBZ/T6UGIEklGFVUJ64ebMmGtJyr1j92isN+ShCXpHQ/mQCv
	29EZ9z2rPyRm0BzLYTjDKydMAXCTizi5HIw3trCn7hUMyihK9G3wo4T2BRbaT0uJCm04b2M/LgU
	IhKUWQ15YlRVm2Qek9GQ1xQk1D95tdNEOI0owar5XSeJvS8XhKZuPrXoCevOBiKtq5xjHdQrbul
	l3BRKkHoKSC9qzLE4mhMxzywBDw8qDRWq2CkDxGNBT0CafNTaSkZKOPM99O3QA8r0t+Y6yDFoOB
	PfMQ5VR91Fty2FjlMcFYaz2b7sgiH8zbMsF40Pm1TZGM5jzKa1LWexhYl5vTAaGlWD3BCQ9Svms
	IHMuxGCXYJeQZD4yA7Vd50j6tXddSaQKuNRXz7B+2Nq4vDQx7tBwo
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr953921585a.26.1773157491451;
        Tue, 10 Mar 2026 08:44:51 -0700 (PDT)
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr953919085a.26.1773157490964;
        Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:17 +0100
Subject: [PATCH v12 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-3-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/m906drTofLPxOtAkNVHVDE5jDZx6cmoeu2XGgbJbDs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxh7N1Y6/LUAB6rgMLQBy2fmGegjB73+f+XS
 H6XeSRAqhyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8YQAKCRAFnS7L/zaE
 w39cD/9RqGzG4curV6R3EtnkB/vfAOAeR08inkMvL+GQu7VsjMxlqeMX9YSZ34C9Upm9RsD1AUe
 k2aEYMRTciSiVvt69uB+Cl+UQGdTuilEJYYGC1R8BF82fUZ3zC0Gl9RPqP7fb3W+yEWX/T79V8g
 7PNuTgJArE3aeX0BJAwP+n+ieUFaWxrFHQsS0K5W60blO7wLoi6dxR30oXs/HauH/hk5lYTcK9/
 07NgugUXc/+NCtEBTQqj9/GJlfha/ChE841UGpEderEXy8kImPzUpY0+OgEKcfYajJ/Fb7yJRqJ
 vbAqohB4e+3bzw+Zd4ASagZ32iHInCV3qQBWUWfgKn+Djxhzcnhb4wlw57uJFz4cK9UhynQ80xE
 vGlPXjqKn1aJ0+4imN6USi5O6IEmxW4yaB/aR/+o5TQAUQ4InecZ1MQXlJyGfnutxxxsTV9jKVj
 XhCeOmkVwk7bMojrim+tiBCtgF5rn86bJ6R+6dAjt7KVaaRzqQkwRTEtsFNSgZlbc0cs4M5iHka
 89rk4jkCkz7xtCLDVOYsD9bE317ofSsMSej0LBvRxWygChlJZVGtpMpg/JGMpt1PLKq5oaricR7
 yiu1UcJGSmBZNOYwGTZ2ZMfBsJzyoUQmqfIziE4m2LDTMeqVbpqRiSFXFrdJ3Q+J57Z92Ld+JpZ
 oJUgYOZmN1GG1GQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfXyGigmoeLo4uG
 A2lcec4EL9IHF4VcbOj0Byl6jKOc3i5Rg0xYs6v22PgjVDA3aekSahRKu4L67/bmKV/U3yhGmWm
 tIXnUqTbiys4YLHOGUNBYApVD0+7xM695uU6LT9olURfVc1nZhbqGc7KCv3snsNb/vat7uYQJGh
 u9c7MyC4hARgDwZWwGOeGOEBTcqFYqCsF9mUAfHgE+9O0LstEG8/wmV6pC2p29GEjGXq97JCvFG
 FkHqAxJJcFfl1iPrCxUE8jM/Q387JlLrFUx3PNmdLOrau7cQPFo4iYmLTkxn2JslAw7M7yZJel3
 u52zP101NavLN4Kmt6ylWTZ+HaPYezkhqyfmmh3gk1AXa2t3KLbKtEeo+A9dMOHgq3e0YBN+XyV
 3A9RbYIzkJR2pL0Z+mURlknfvo9HYBJZTyp/y16Qk4kBZ/xFTQr3mS12djygrXhVB9w9B1rq0D8
 dJsHqwv7qGhoVf0122w==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b03c74 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YMcjIJIbJUFEkfXDWrgVA_ebFu1qWRMc
X-Proofpoint-GUID: YMcjIJIbJUFEkfXDWrgVA_ebFu1qWRMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8601bac555edf1bb4384fd39cb3449ec6e86334..8f6d03f6c673b57ed13aeca6c8331c71596d077b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -393,7 +409,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -411,7 +427,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1205,9 +1221,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1231,7 +1247,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3

