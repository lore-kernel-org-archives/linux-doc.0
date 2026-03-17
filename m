Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BAA3E1D15
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756172; cv=none; b=g/GNWJ0h0xoaXucpi+H57aUZhtGB+2V1z1T7fNAGAh/GpMG4IUHYSsdGyi8M7Nu2HHckv1jcd4X05Uu2SG/K0h7il5AxuvDI8KQzlkYzAwFQLeVG0RjevI1r6fuPXEubi9qRsyY/9foPlq2Ax5ygtSJ7MrM4L+9CUhRUpgMpbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756172; c=relaxed/simple;
	bh=qoz55FlU0wzlioVR5y4kqwZWHtjnuJw0AgLGnvGjRME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uT41rR1qzHhl9undP4ILXRTYzUlaI8rOtu0PJVI47x10qfe2rBtq6BHeOGUeJwJYdokkPl9GY7yaXQpT6niKmTqVdujbdR4ODD3hkRMudBeHslOuBMRD+MWnvYQMjjw6YCpF7D34DwW5gkgWek3Of+de8147cCdT2lLpOJ0UmEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8aURp3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6qM/29v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8aURp3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6qM/29v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H93n5w2315159
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=U8aURp3L83W9hIQU
	YeimIZTZKiTV7Ab+ZFEGRnCz0QTgNKbhmJ3fG8Aj/EBBPWbGomEj8KTLMKo8/wd7
	B1L/2qEmbDBLbxkaDgI4oPof151d7poQGXRPeSW9NWvZAedd3OXhl6FGoOWxAiB4
	XOYVhUacYPMWJSabS5x0LFeH5TvLF81zaUqKymqZlAzM/H5impkgtq7pz792K7Ix
	cuBwDQFo6rpfWtRG/J0NXyEz5BbUtmVtJLNZ9qVN92tNLYPp6VEgx8KusvqVPw9D
	53VkNfZ+blDdGM+ojiOLSO8P+7Xrmcgph/1rsSB1Y+vLh7HsZMaQGAgwtshAAico
	WUlKZw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2c56j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:02:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94ea6fdbd28so64774802241.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756166; x=1774360966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=Y6qM/29vDP3zvXbUxjmDX683M1hBXPLo96SXxA0vSFuIsFxc7zk6XPVO4wvBTM9x8D
         OYa4NOnF+euIsv6Pghxhr/MRFpn/Gcj2tHr8VGT53CR9VpGjN8yhjRADnNfb7z5VmF2t
         dsnTD4LoCb5ZO0P0ufGkHxH/0c4KELnSY/LwomR/LmrsV1VDeObq8S4BP0bs3rFtIX0I
         Rl+sF8rGHjhnhnE4ko+QPN82NUMGbhC7iKpsIzW3OYxdAU/sQFTlP2vvCK+ydkh7FfiU
         +u6QURchci93ko0NBgs/AS+3z12VBVOeS2MFoudZ8De09SvtaIeXMIPBwpb4QVm0plZ3
         TbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756166; x=1774360966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=MksYRxVnz0IylsoOMDz1uG0uB3UDluGxX8TJCOdgi7XwgYE5L9f+jjb+3t716gMS42
         J0VdVfc8Vg/xnl7chs8QjMkP87Bb4uFnJpBIQNPMNqvqJuHoE+CZBp0rnG82MrU9Xs38
         5KuOd5auH800stCm5FPZ9GQa1lE32uS42H3ChbYTjdJJKlHG/ShtlmdtV2ML3H4vv1X0
         wle3By13qVhCRwCP6HFQ9IW4ulHpqLrJIp35J8t1L/aBF373s9EA8k4dVLhRQ8J0Ip8D
         oYpkbMFqMrox9aKbgweeBJwjIpDepSCtbm91imt/ArZWjpDXhbR6rl/lpoyRrZtPyvnu
         4V8A==
X-Forwarded-Encrypted: i=1; AJvYcCWhlrhBxRMNrFsKJXtbGIhzF4zO65bcv6xS1WUWDQdSBeN8EoG7Mh4im4B4GFdkPDM4kAHhvASchrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzcb8q7RXYxuUBjTTAk0R3XGVrZ9paODCIPMn9yeskYDSj+wK3
	OtHPo9156OaGqFKUig2WxfZPzucBoYyVI6/jBH4dOCbJSKZ51JaeXxewYkegWGxF9FDVBpWBAET
	2OHMdO1oCx6CbLjb038MTXImIS3dvt0cSxh9IjXHZt948/KgRDSV87NiIU6qXTa8=
X-Gm-Gg: ATEYQzzEZS6lREeGTKdq2AfCzW1VB6BvasMC4gHfxVg5BtXd2BtF4UnftWtuPjsjIC0
	YdeLScsz6sqZWEKtq0Z31BoMuD4it41KEd6D9BEcJLzHFZf+DsMWgBSMa7KZW82O6L2G0kuLlhM
	oSQonFnMngeW+c7sNabQ8iW5zkR73wVXuC8ohvoYgA+G34UyzvhHrNvcDGvVy2yj19Mw/AlNrkJ
	lfAmoYDNXxtFJRoP0AfBYrgBB2eumfeIve6gmbeV403CjbH+Dm/4bghMTsIW5SOsYYoRMlb11QS
	b/4tNIEKY2auKH/BbMs6hVTdndTdzxtTVVe9Eg1D5argazIoCJj5e2edsdSZJXsNH5pRgCkNgLH
	xcreaCUNZ2ZTIicLwjtu2MBR11N4T8yG5tNc/jiuGqixpjrGr4Sxd
X-Received: by 2002:a05:6102:b13:b0:5fd:ef38:920e with SMTP id ada2fe7eead31-6020e8ff56amr7643393137.29.1773756166107;
        Tue, 17 Mar 2026 07:02:46 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:5fd:ef38:920e with SMTP id ada2fe7eead31-6020e8ff56amr7643322137.29.1773756165543;
        Tue, 17 Mar 2026 07:02:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:10 +0100
Subject: [PATCH v13 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-3-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RN7fpsHiCZHYCJzNDBLJB3M5MgjeycllWN+nZFNR5GU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7y9ZYaNC+PjAwISHvYpwr3lKaHdvpbstczB
 Tdo0FYPbvSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable8gAKCRAFnS7L/zaE
 w1q8D/0VjMXWHsWGlmxP/k+KCCyjLkVQe9MseoDppXf/VlBtxYqbYrf1DyZOibBBL7Z0kJmvHpS
 iKQ0SoXGoNoXTs+mbAjgpVR0aphVL8nlINjN4sE8H6AyROUWE8PgpuJz63Yd3g9TLgApLg870Fu
 1qWSdlfGh1EoAFL/UWakZBtG8v+8/kS2tC4ToxlXkCQ0VVxYAZVHRPFAoeZM/M/1ZYHlkB0aHeD
 Oyf7bC/rNfHAZD3gmVFHKKOlghBeB0mqjgnX7rfyC4w1Pa0Zjf8b38J5Sz7mIGQkWv++bkcvKpP
 5PwASinwl7+D+9BGwTEA9vKMf1hziTVgqsAkZibB41PpZHnfN4RoRRS/n/A+AukGa3aq9CnJXcq
 K799w9uy9o9NzcjAnXpXa9uOre5XC9koxZK/+KfGjSn+zGR812mVjCn7oKXv5yD1RGoLEMoWMQy
 8gCEIBI1ZwIE0Xa3nWyCGM/EINHD75ppZ04hlKgnqQxIgv8zsysZ4rJTR2fNVhahzPVWd0oykjZ
 UMVP9Jf6VFm4hNzsXmIEffVgYVCkni+1oJ0w7yBaCoK8nkc0x2jbAEniVfzk7CXyyiW20Lw8is0
 UP8urIwUX/nXJ5qA2CZrFhvya0M+cgJgDXKWFP6U7hdTDiilLU3i60wU4pR9ThkuPyI3Miwk9IQ
 BE9VQTT3amshYFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: fnU0UykbuVjekd_hv2-v7rQqqP838ymL
X-Proofpoint-GUID: fnU0UykbuVjekd_hv2-v7rQqqP838ymL
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b95f07 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX7KIdEbb8z6nw
 pCSNBzastGPqbOOFx8blhwW1MC+MjsThkEF9nTpF2/BJeqHb/XHkz61LRYO4e5eBSH2IlOawdld
 X/aratyvQ6cov43Gl0FB6+Xjw7Mj9IhJ+UAGlHmVw83unEk4v/65645HPTg+opjClD7MZl++6I/
 JwzuZZ7McmU0IROvZ/0Js+2rZ8A4+KHCrvRVRO3KvUXLq+uXKzJhvFnFUfkOQfSApjviWxlIxDG
 a7/6/T59inRNTl47/pI6Xd8EnM89XXgqT3CKedjWK5rNvg0yHQFJc9H2UOfBtGMNeJlHSInQ4nJ
 JXgWnl74c4N+aeoqtL1Ku5jObPdkASpxRrhGSJwyNvOG4OqfPWQyi9KBydSJ1JMWT92lqMKvY4Z
 bSWFo6nFymeSBjaJ39sZxB4yJ/qUOtzsNs5SvoLZOAifAXL9f+Gg13Q13coDK9OHtOuGDOlldmj
 ZSNVFkgiruH4jPaproA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124

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

