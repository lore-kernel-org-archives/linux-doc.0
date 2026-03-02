Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B842882C
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467079; cv=none; b=o2ZFHalT68QpgmhY0UdaYe5fZNoIBTF0J5tItx9IrNR/3LxeL1IdIqXMWX1tLHhexNufUUqfwafGZagNW0titYO2zycLWeD5UCivOoxMX+weOEBS56U4yiB77bq/LzlWLfIEybVjWhM2qhJkQO/BUNTJU0fkP3iwpnDoC/qAhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467079; c=relaxed/simple;
	bh=Nz1LGAzCKnFnAcOBVZfb8slxeQc/H+JbDOJrfn5zCw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WK2P/Ryg5HjI/ZwO5iqKGWQf48Vv8/LeUixH3VwmD5mXG70qqDUIR5Xwuhp9kcEJlhk0g8LRZJLDAj6buotTo8NLd48WBJTVW49IhbqLid8bMxqxheDn5fqK9GSG8eZHq0M4hYJrLn6+OnFcOtzYNOSeL0WZLYRCHHtdUtj8zH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6Hk2lLC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5sww5G7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6Hk2lLC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5sww5G7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JZnm3741985
	for <linux-doc@vger.kernel.org>; Mon, 2 Mar 2026 15:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=; b=G6Hk2lLCwbfiIWMG
	+YLPOw/kLl9CMV6Wz0zt0sOJ2YhyyElyu5KOetBqgsHaevDsM+PlWJqxNW82VZuq
	KBxy3TyEoN1mvYSWy4K+4BGVcXbHskc4syGpAKUNZlch8MxonuX9x8niL9//gB5C
	xVByOBICpHlvpdkjR7a3Xj+vYh5VdpSho4320wKzaTETAEioT5KM6P5hW6eTtbOq
	Sqx58h7gp7099/V+UMEDLvlotd1qjTsnXtoUE9jPCzsSPVntiCVW7p3mgWNQmX4k
	10zWtVO5JtlcIZZN5xRh6zfFttMq7hEpJf3X1B/U52eo9nIpJSveIQ0SmYgdJn2r
	L3EryQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trhbc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 15:57:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so4061123385a.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467076; x=1773071876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=a5sww5G7JtJmrQp0gQt6KP8ixWZcxo7IUZmtQvrRdiA0hOVfOqyMgbYC8Hwlsafs5g
         Xpg6qXS2A99NVcLtFRTpQsUE2r6pOg2p7Z7wF2QToYWF2pecgBBKvwH+G9VaTVEJbO4w
         ukWtfZDsZMt4USP2F6J5WOoZkQoU9vJjdcvJh/hfI8eF0ohgxF+HIH95Pprq2EXtyKPn
         psjV30BYEpjs2fkh9Ymt9CHV7xUxeaSXw3TevmlXeq5iF2AA1Z+X9KcRrK5XOW9q49Za
         6bJhIRQYzQST+eRxaydNxujS7e2tA9pjj66UQURX+NtIIiQouVof3SP3uvLGhMvy+4JV
         8SnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467076; x=1773071876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=H9SfMyNIwBupajwnJkMiPayMIFaTcMgFoQh7GXBqFjkxqzn+OX6jbhcieEV/UV+Opm
         cd8qYuqnCJ48EKZBThwgJZPrRyQHm+F8+2sCLWTqnec/6b7y/Su7BkF2Zy7Oa1mB2lci
         wNwtjLzXPW1qBezhiuNJ4TWKc9ZgwvxrVRbDsP63vHKLVQyTPlatTrTb0l5Q8iMsLfqd
         25z9/f51g1NqtJhhWavfXtc+WFzj+b4nTC7mJZd0oSdk3OnXj4UVxm4rui9IaKPc2Zzh
         MoBXmr4TAcnpo6T6+pZVoKmus+QZ0cNRT/4Yu/nwaJpNPpqQRDfWOs1ZyMaU8q8ptPAx
         xBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVloABRQqpm0JzU1+gDlDaM7gptmW0iQdVjKS+NFINnbJuVUakwHum5TEh0kYgiilbs+PY5oqgzIX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNkn2xBG5m/1Kk6rqzqIrAJ3bHX1T9fasqkuTkrdrhKbcjuEL7
	cuFdjp5Vsw/9QhRmhBZqpc8j4IlxAlIf1GcAh7eU63EOUakKvlWkEYdB2A5MnEdSMnN1JXqz29Z
	GOswdFvIthBKP11q9WyuRgTZc+iZnB/wzKvAUWjqjNh9/DN46o9ozCabMM3Xk3Cc=
X-Gm-Gg: ATEYQzxZmFhaMEPD+8f8+IKWidnON5vhN8lnpN2MUBSXFrIINS6646fg6UfxHRG64J7
	pAP0COd334x8Grz6BuAwsNyQUFpSy/X88HPHybp7M5udM5HgC1EuDDocD+IzUF3ndj7pTyYAXvs
	JNoibQywpMHlQhGKjZ16vPUdN8JxJannhjjPyUPq3FqrIbGt3JHDLShlr+KdYswnWivUK3aM//k
	UdTQiUw4aJL9foUxJ7YaxfjRAOZdqd6v3ftsetNf3NwmyE3ltzx5RQQGT0BqkE+mTDPVwcDsNeX
	cUI6vibQHkpVRiBRjAyHQU6O8SfGqFx7Q8qNSfR9onk84tvaxOrjyNoz0acJfa7YcjjbV9bASq7
	00j5Ere8zHUnejigzpaGvZRxZlfuyLJkP+3k7i4e5U07e00fwcNJt
X-Received: by 2002:a05:620a:4692:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cbc8f66fb7mr1378647185a.80.1772467076386;
        Mon, 02 Mar 2026 07:57:56 -0800 (PST)
X-Received: by 2002:a05:620a:4692:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cbc8f66fb7mr1378642785a.80.1772467075908;
        Mon, 02 Mar 2026 07:57:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:23 +0100
Subject: [PATCH RFC v11 10/12] dmaengine: qcom: bam_dma: Extend the
 driver's device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-10-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNtbOoFuqUEGNue0WR3gJpP8wb1S3UgLzT/l
 qttk43KdpKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzbQAKCRAFnS7L/zaE
 w60XD/wJfk/WDsX90N8SlNoKm/OHcoyRv3ABx4tr9gD6Kmj/R38oUJhVi0r4fdM778ubuxbbH+i
 H80XZAmEJNW6gL13WQZbnlBwATu0u7COqYqmxiDZkfRY7TgcSC63HpDpK3l0G+ji1s9Y61bxlrs
 WC+4AINyndhc5XEvghrZ3Uji4MbqBIKH8XSn9VQdB6IE35R8Af4DH8e/yyOSYdeSBZClpbj9K2Q
 aIcITg+8DmDfdYRI8eicKEw19GZAamC/ZVERCpqJ1cHOOuUIrvG8mWNNu4igEo8xXHRXi6KPM8l
 QcddMM3V0dP3CLHj7qpMUtLJC3bXFfiO2INEeljThG/GKvAdSZyEOItI8aDue02vo1KaJOJpwli
 QbuiNb8LXMuhQOLqxuGXc89Ww31ZvWZe2AVkKiAiRjvqEYJ2jAu3/Y/rQFzo3ys8XQeOjvSVCXT
 a8FOZ57XZD+ZBtQQp34uNOImP2X8yQrkOfCkJ2CoEs6r6cyQPoGljhgloYmssB/yRDqvvXBGIgE
 IQI4+umN+KvMru6URMpISKeWnv1NV+lOiLsJmt+eHx3l4J0wkv4U1pSkifKXxOR2ABNixrVrM+F
 OgsL94XbNrOfOEQCOiyTDir068m3kNG5/BcxeuJxWVff8850YyvXt/MMOs53oYya6JQ1fO8yyMy
 3mUgXRez1anKFcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX2Q+OH1QRhd/u
 3Nb3M7/+UN+nfxqx0sbgHW+vIwNPm1PRoRz/41ARZLCYuOUwI3E8puai7hmhfd9TUSkWR/trYjH
 fqQaz4mIQk2gL+RaAlyp7TACU0aW6FIylwlY/nCX3/n5KrQ12HrxOZU0kvRfpTGOHdx7HEtGKzX
 GRoa6Vj5vZqJTzrWcKCbxuheBY0YQEudibDp5UK1AbZCzSY/AV1OAIti1oVY+vkvoiETc0nd5qC
 IQpkzq9TyHkzzz7N7qk9BmCNUF8FkXRMs03G35VLzWvb+6hNVVDmBelc4DQSFjvoac0LKLS2NUY
 x+bJNSwQMJqA7DzMhBjyPKa0bWpJg6DW22EKOqCNj3XcpdurJkMDyBCEMS+P4R1/ZsarX5AWo8u
 aO/zHuqjf/3fFVSpWF1KV5ibRWEFGh4deFtMxDy8+qL621MHyHM7j8Xg1+86ZYXlAWnXukZZuLQ
 ZmmgG5PG1LLdUX1EmHw==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5b385 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l2_DEgHisB95sE2SvwgkVRbagcQHXfjG
X-Proofpoint-GUID: l2_DEgHisB95sE2SvwgkVRbagcQHXfjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133

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

