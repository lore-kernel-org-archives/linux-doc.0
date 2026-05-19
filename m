Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E04E3774
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196701; cv=none; b=DNlp4I4WSP14iLYpN9pC0yRFOkfGkCMn0HBagjH+c/73cNbAcG1TnKMNxmWi0sDfyuIrXMkTLD2s9uDuqotuJzXzZ0MfB62JTu4bedN68QVT2ZTyV80pq7s8d/bzcCUuz7EI1KJS21MxKiGIB1pUKdVVm5Q/0+7D4ua03qCrdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196701; c=relaxed/simple;
	bh=5ySbveNo6oDwy2vXydzQEmUXr+FBRT4cQLXNAfqV6GM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWjyb2uEexfCFtX8R6YrG6KVQ9Qg0r9gxBfagzhVu42yHWZ13MaBsnnlo6RH5dIfO1wkUC+KGjbxJrHLx97DF4GknTK3Kh5zDEVK7KHnEFm85QY6HWhiird9/ILAY5XmMwyJOtZ91bMDvfeE6ppVvBfH8BsM+r4jS4JTBGWAnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEApzKG3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIsEZdk5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEApzKG3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIsEZdk5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA2xUq1392844
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTxY6bvuwok78BPFikR8TBxQkNppH5BYWsbiOq+w0t0=; b=LEApzKG3fHIHA4H2
	aGzFbA+OHXQXGDkdrkGvUwVe2233HHhJ29vndUFGXTOV5N7uxvxLnn/8n6v9Q/fu
	Zz+fVh/UfLRHGf6R5qiodZJ7cbpEfCjmTkkjP46ODYK+FM4uCn1P1if7TF9BDGnh
	E5pJOAfF9PUn3ALEJFPVP99ZFhqKiJ+7k0gho5YdboV3RhaYhKo3mJlN6hX0RVcm
	or0Kxurfo0fGrKzs6m40npLkebXHeSRDfmDbEAiccrGmkhYN6awYgwurqKU7LqV0
	LfE5iqHddZNCZH/SEGfE3GdfsV1HZDWmbXGKYfh6rzkWBM2FMAIR6+jxk/EFPzXD
	g6sPjA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ns48qce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fd51d5c22so6985960241.2
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196697; x=1779801497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTxY6bvuwok78BPFikR8TBxQkNppH5BYWsbiOq+w0t0=;
        b=YIsEZdk5fbjrKFACS5bYN4ooaqHKBgVdcOeR+8JsXJfFBZBkDHzZfgoFk9hVQPJUx3
         v582bLFUT/FvbQUjpvU5V9c64QG/22oCjA0MVqIpv/jozTrFt6sMy61aLoSm4eTGCYjA
         Wl6xxgfXcB2+sZBjVC8rdg0saHSsX+lh2mkWos9VDKaew0y02tWb1IGrnNje8zo8pLDn
         FU7397aBMbRHgzvBexQ6h8aeIabZ1l9/vaa6cUwDQ7aqK/RrTy7anNoi7xEJjzeRWsHX
         owXexHv0TgzzncSuc50V+DpMmNAEam1zdJFNJUiYODvUTxz72AFaLcGSerTlLkSAuY2n
         Lnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196697; x=1779801497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTxY6bvuwok78BPFikR8TBxQkNppH5BYWsbiOq+w0t0=;
        b=WGacycP8LCKzxU8T1vtzVh67czhH4/PN1F3uH+nnh38tr2VKAjxOjQ8kzoo+IWY0hX
         wl3MhzGb5F+GiesFJaUIB+t9bqdAkYb3WHm7W4tbacc2Ja1JOivpvPq3fhZa1uji+j5t
         CKKkSkswwuN270Jxn3mjr/EVdBjx6VuVSREPzsxALydSsTYwqEXTsJDYs0QceYfja+K+
         zX1Cuyu2fTTbPTNPttaWCj5fHfp+Y2/dlCzcmqoFfmqjabDKwJ3A/ctWp3GwXZOLR/aD
         IRQx1nKue3W82B5jS+pW0Y4cCU5WmVyXUci3oDxJ4212hgW/VDXul0QwDrNxTBhg71Iw
         mSCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H1woL7Kl+8ZOwg1+ZSaA/+F1T3oS+2PYYpl25vyUxCcjyB8GoGoJlrUBnCUA1ijqqR3LdcbmKNIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/rActBSstkahW8nr3JRiSAzMdX6vzuoMDOviYGsAPJKcXJfzg
	WoqHKB74fSO1stYN5PYnxI2pfQL+GAWKGQb1nQO8TCCcna/A8Pz+KoIt82DEbbMR2GoMXn77fhS
	FL1iO5LKiG6InEWK2UH+UwyhRFB8uZR2aw45UEbRNDsfiPPrBMruDTXjveTGEZNk+xwbCFN4=
X-Gm-Gg: Acq92OGRlYFRbxdstahiriXiYKsr3Xy7h4uY9B3Ll8BSh1IEPbaw/KROoiL+Q2yziAH
	V+3H9xFIvDItFC/3gFkFEFYtIpmKviEsvS5MW+mG59levIOzH+HNfA9vTNnid/1DtxpKSo7ha2U
	FCckR/3OYkZIHPEc0IMWTxszB83QP7TfwcDlVABmKmGC1+Pa/e1myLyKGOodjjGmQAc14hvPff1
	aJggIhdeVEO3dHLQd9vEOXI+W7noQE5qBMBlneEddiLE3TtfSZWqNFWWFvNa8kmrLiy9LEU0ksw
	l913h7Pv21nhiAj54JTJTIAmFZfeB7vIsbk01SheWYXkR/ei1rqBFf/YCjhu+P3CZbHjSuw7Une
	WgzKenHNI4rwS2qFPoHSSM/uWOJOq16iXCGVp/SuE6WOg6QJLpHs=
X-Received: by 2002:a05:6122:4887:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5760c027aa6mr11882855e0c.8.1779196697210;
        Tue, 19 May 2026 06:18:17 -0700 (PDT)
X-Received: by 2002:a05:6122:4887:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5760c027aa6mr11882786e0c.8.1779196696733;
        Tue, 19 May 2026 06:18:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:46 +0200
Subject: [PATCH v17 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-4-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iFPO6YP5TcnrvsmGE4fDny4roRlsPlprS1Gv/K6BVEo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMELDfOj6YPtbfLeG/J9s/3S2gj/RTPnt/RL
 AJCxj4rbS6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjBAAKCRAFnS7L/zaE
 w5vVD/46Q+Ag2EwcnNSLnHm3m9c9zNGisel3N3+wvHn3vTnCEfE+3Ckzx/VhbDi99XAI/fMk7hS
 VJLps6FOPZf+L08gm3sg355RbHLEtiMedlSezGPpMAjljRzLaVHoS2E0EgqhEwPyOK7d1XK0ynT
 NfwhGD2KJU7qs0BDZvn6MPk060n7kcbTCucW3HXOnkOzSoHoGWj6+JmMwwFzdeUbK2mJRzahsnA
 pZ3t0L0SlMMnao/Pt3X0jh2wpSppd6BHpwTf9vc8gr2ljVhyM10XmRwbEn6odBbW59niklJFVaf
 CTMf+JWlnfl4sFWv/oprkR+hSVsq+lK3BTZm7rxF0gWev2mQBpRbT1YQ4xFDHqq4FgXx/U2ZKk2
 YFlGJhGub1WfVCucxhon/HQErNKMFPgV6C4gkwo185UHBb6ijVvDXkRC4F00nlVo5wRotmodI5B
 w4NdFvolkovlmcGSPI4T9bUdVaSJfCnUrnzv16us/Hk4wQYCrRAUspDY91WxiLRnuHditFvb38j
 PLt/WD3mdLkzJgeTe0VBlmcvhjWIVMzrQPVuESWe2/RD9ZfzeVL02UIKq+fD9qzhrQ59NCzWekP
 IruTsL+oEaiEbWm5fhfKyydOmZTSe7TXn1MCb7WmdTQfgB0jpdzXz/Py7pSLHgORFryFoce7Va+
 Nwq5cNLnEzNroHw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX7YlLXJRQAkGt
 R9hZ+EiG+eHtY+/HU9OMQW4m94rYMURrB/qqwPFD8ichIx54nqrBJ255FPMuCzzcxzyoua1p4LT
 VrKmBOq5toBI9W0Ew0iocsvLd88Iw6OdufANhzTiFV5Pb2U8HL8YxMLbSSTIdMNpx9a2UpR6IP9
 0K0oh6bYcr0topSr12oA9XPZ3S8AQuTIerUIGwUh2iLFbBcGmbztZ4Xp/xeZZQOy1QDf4Jjg2ZE
 8DCNFABIUKR+9ENJ/VWhGEq846PhiIdqOueJ93WXJA3hDHHfYhKINNS5WZX5biwmeBJk0fmisCa
 GyEkHA34bjEhlqNa9ucK7wUaQF6+6kW1Mct9X98AwliD7ZyNaXKVeg3QkS0r25yrvYiYqr0MqLe
 Huzks5AuXH9glTFhofVyYfkwAJG45fFFOaA+EBagzALI0YfKkrxgy+1TNoiz8KIpdy4ZxHizUv9
 YMTRgw13xmOYYnOYA5w==
X-Authority-Analysis: v=2.4 cv=F6dnsKhN c=1 sm=1 tr=0 ts=6a0c631a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2QFsacXt1SFoFE4V5tBLR5gprh6xxCKW
X-Proofpoint-ORIG-GUID: 2QFsacXt1SFoFE4V5tBLR5gprh6xxCKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index e2f16efcdb55f7465950fb81e22acb451e63ba0c..7f3d1b6dd5d7660d2743dafcc43878e5f7952b8d 100644
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

