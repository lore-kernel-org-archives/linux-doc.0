Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650813EF0B3
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141761; cv=none; b=WsM8oIilS4kY49WVVbEHWly1BNxQYptd/Ohgtk/PB0n0aP7Uc9y9wlVmCLIThYtHERIFTRxv0FmJKAwDapf4M2PUrJNjZtGSQFIqtUpf+7XOnkVnlIW1q0cgUs4wTX4e8OFcCzti2aHOiZ4TkhGrajZoF8GlXOfKLuH2H0a08DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141761; c=relaxed/simple;
	bh=qoz55FlU0wzlioVR5y4kqwZWHtjnuJw0AgLGnvGjRME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IR9FLwVbLBdnMUhTPO56RCfSmyzgiZgzJeQvPr7mlDvi7vMGwzaAayvpvgE9m/+heMxWgvw1Q310gl5Nj6GGh8tVqNbDjEe6PWHr5vA60pLCgYV6H/Fn1ztzlyOmL8ts4Z+y/rZd5PQCngfnb55KSxxUmJIgywD2ZRPmELUFPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQMlf7vK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UggwEuTh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQMlf7vK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UggwEuTh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CMnYl1128979
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 14:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=DQMlf7vKYW/jASMa
	/hUao1IHVYv/LediAjhecicX7izICAcEHa6f8PGjKTzR8Unw4OgB/mci1PygCNps
	9NDhxzRe0+Vvv5Inke8cRxSG2jK2hDnMhLTDm+jGGqo/nOGFMbV5koReZU1Bahxp
	aDuAc16t/Yle3f4saVm1Vp44qHkRNp0/7/2jbCfWrg5lCG9E77Xweeh8cjYnfyDx
	8uzuc/ZwYShQ7a4Uhy8WCS1VxTIH81ffKVXtOseAeb2oqhsG8wC2g34eWSK9Tn2q
	5nFQEJHj/6Yl8/WvRL7QPLv+exTB32uZH2n+AKNUu7vEiAkPHaAiyago97oQnehZ
	NevROQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9cn5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 14:55:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso10345801cf.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141758; x=1775746558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=UggwEuThHlg+HPjuQO+nIqYbJpoasM5JDtcjJGSSsSF7nUCnF+uf01Dv4retW9xrel
         kB1mqNFX6fVyoTdgB/O3qZcqITlN59nRtLPbxOqyLSaCd7aDCt7H++oypcDYxFZEOw0y
         A5ETned3/6WLM6ltGYSaE9OexRVy2clJygG2TDhm+vnDVFy5m8Mmuz47p1tBsQbgoEMf
         V0Gv4F/skazcZ6NKmxTQxUYhnVNB5jbEniAVp3y1N++uOi08YyZTQE9pEG97mtr7ndyh
         zZA+9Fpl2Wl+8qZHRkTMmK3hO8Hgy6jRMjVs0F77uL6JhmO412WzLleHm2merIQ2QGRK
         O/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141758; x=1775746558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=EJGlLo6xwjwo0/2ubzydIwgPJ0RdetHnKJbMca0qNP7QKnS+NTKeX+rmnKu5a/pjPW
         KtoM8KbmUO4E+NRlmg5VaH4Le32url2Mt4podNXm1LoatR/NqvRuqNjZt5bjjJPzzJLh
         WowLLPm2G6a8TfCqC+KSP0eqKSz2ls9U0MJAOHROzWIWRS0hK9g0vxi5sfLC9gyRbnFn
         ymjbHW5Pm2Cx76JdLMvAbQGcDtWwL9k2ZZdORQ1JN9zrU6+sOwHHLgRU+Z9cU6/ZUEv2
         aXCGn6iS0DHuktbvCpbZQmg8MSw6aRG4u6Doqb99dOxonhkqxpe/gYXf2ePR/WYzEzbv
         fy9w==
X-Forwarded-Encrypted: i=1; AJvYcCWebrWhPvOMtddEmx1eaNbSL/qwhugStHRrhbCa7mAT/okCHm/MLa68Nzq2FFyXEfnWbMcMFRSd+fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCv9N6JioGZWxA9a/OmPW5CEiwyeAWSD8v1SjkGBxLU5fs0YYw
	+rhjEwG7YfbD5AemBCzT7Cr2pX+U6ivmf8zgWqHISPokn2FXEEY/Kn+zjwv/zGzHRovxWFhSDpi
	MnQ2wpYCRQcPcZb6F0LFQLwEDZJPdIzdcUSJVqWpPOe01pmGmrdvp9ys1eg+aHq0=
X-Gm-Gg: ATEYQzzu2UeiC4pLsvPE4/wfHY6iQnW9lI2NKFfPHrmTc7QNKpJBrWCD348ZDgSJn3M
	0If32IoPZ8ewyw5ndYLkLXbRYbh5psoCKgTL4T+fdSUJ56HBY+z+9+mRXaVSOQIpaM7CNH2WNzH
	64TDXUh7dnsAMpzyIERm+ptaWGzqBP4PcuCGOvV8NZNUlmRmZ1pdVChOaOwX98B+riEg5oi/jwT
	ggdMW/0+PLg973uWutJNFT7a2NVVGTIwXwdq/FCrfICxx5sa5RrCDLelTxClMnV7n5BOu1rd3x9
	mmH/q5nsuC+VUPyCJoAGv/uBA1lpp8bPavpwYLI9Rx3euIlEbenm8OPq+fbgUvz3NXSxMX3l0py
	S68PMq1dx4SHdLquX30E50v44ZJ3tkfF/BKzJcNJip+RXekBZjQiu
X-Received: by 2002:ac8:584b:0:b0:50b:4051:2cab with SMTP id d75a77b69052e-50d3bd93571mr91421501cf.58.1775141757732;
        Thu, 02 Apr 2026 07:55:57 -0700 (PDT)
X-Received: by 2002:ac8:584b:0:b0:50b:4051:2cab with SMTP id d75a77b69052e-50d3bd93571mr91420911cf.58.1775141757095;
        Thu, 02 Apr 2026 07:55:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:14 +0200
Subject: [PATCH v15 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-3-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNttrOMD5O1TrTM3zWVJLqAviQNXIGYfDsLU
 CrGd8qok0qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DbQAKCRAFnS7L/zaE
 w8roEACMMRfh3TRLFF/S5nKqbwtmE2/WOd/n+9qk8CukMnOw/tPJsJotraNuFZNfuWFTZlvOalH
 Q5Pcgr4AfZuQj6TTlajUMp8KQjFNI+y5eQDREiQoF685WY7ADulpMMb2I6T98ayVoM5shSiBlb/
 FraalmH20R6UXKRchT3RABrIY7s6Ew57Z88q+D3wjtcNQEaxzZjbC2VzrKttL5j635eRTUpKjcH
 NPnKw6Uk1FeZYQMrPq9t00O98ACv3vVWMcxHIaO0tdwLpumyUkE5+fMmwFgYFR6M6a0FbreUDVc
 uf8nFY70XswRTiTjlr62LiSXthcPO1YOTAt5sgPAcMJM9ReAlpPsm4vc8CjkTTWc6T0N3ArmGTJ
 hNtjZT6IIwS5uAPd8V3m8373rxuMiG7FEKFPK4aJwg7IzWUdL6VDJSpprcJtN6NKSpquI0AAmXq
 T1GTVdP3fcK2SDDAkja4DnOTOU/YysvlDwX72VuKYqXABXNAL2abiPcPEnCg7zbd97/Za3oIt7I
 dfRaOyrZ0fLSXpuGWd3sT9yHg/GkjcsWf9xcLPTpNGzYFpZBbnGdOBXsBOSxVzZInTMXoKCOQgC
 pXqDP5n5kg2UVwjJQpwH92gyf1TKA8RKa0w3IV9kpqRLqcLVQEWt3fqQTX+BiFTG7YeWgnOm9mB
 JLINzYGU8FGdnnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce837e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7U8t-VBuWbrE5J0p2Nk4YUpmbmz2cum3
X-Proofpoint-GUID: 7U8t-VBuWbrE5J0p2Nk4YUpmbmz2cum3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX6Enzz5w8Ynfu
 R1lYXZUYtAPJ3BBpxAlWr+01tM7aCOu4hjmigrwRHvQVrW/6leipNVHFwoO/ZWTp2CYTCrHJ5MF
 lX3kqf3rS1MgMVUnjVeoLZQ8PcuYoWUmh2g5iITg05A+ehO+1e3timuqBvhmLItEDG2LjTCfdte
 JhbFZKuPtPeAAPE8S0D6Vd52FwwADOKIfbBs67Aw3OS8VhV06AEqE3L1WVp6wyw5dvUSa+vHpTN
 LG619UY1SNGobT9M+Pgw1NCsxNvZdC61HhvH+QGwvtD3rDNmkPDo439Ts/wH7ATAD84/37DnhIN
 pC72DwMW61LdN4si1w7OAoX9WaB/Wahubwe3A8bdCjM9ip7z45p+Z7Eo7Xd1TVztRaiDQOJ4w//
 bVqYU8vAYdJLPDsGWb91eNNJU6CAfPhb3Naja/cjZ7UfUC6D0gi888X+0G+NObU1EPv/EVF2ovE
 lQwQls4vP9Yd3g0iS4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134

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

