Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F2F413D9F
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947707; cv=none; b=m0DGViJH3tWItB4CwLGqjFlJZnoy/OzIpPGFgW5IGzTS2igyLz1aaTbQRFoh9Q52fP+GqT+QTLSNwXFZYYV/bDFSs7Rhrr2Qhfz8DhDNbdxxD/AM83ysz8NiEsrLsAnOuCBSnQXKawg/K/Hq0rt12QLF5KMdbF1uJlElSsVzQbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947707; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PB3qfc0XP9KJfdjgpMjHa27ykW/WQst87jrI/mfnmIKsf4hvL2IBg1P7s26/ZOX1evVrTvQO0bpvhzuffrs6nqYhheaNilSeFS3lQBawJ+EVMPC4vhPQy949hYda9jwGS+xAH/5dTi2GHQNlRaRdjs+ePbbZ73oBxCpbtj9pq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dr8id1fb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b056k211; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dr8id1fb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b056k211"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDeEi1480748
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=Dr8id1fbqQe0mNys
	bDRxf66KIWEKPjeeJ8XwNjYo/t3irvtChuVaq0aNn/TsugRGyygYjTsdye7NCGZI
	bMaFovRNSLO9jG8rzE6+I0oYU0IbsKamMwKBWXfeb/hYK9OeXhaxJv6+EHCLi8u6
	kxSZZ314+LXRlHtAng+nbCRofqcehn78SgHJoI7FJ9qpuAReKcnJ/jUyhAi2vz+g
	qWjE1qysPOhmjWDwtO+MGkR/F2tCGQbwVabZTcTnV72qOfYcOK5EQi3xOEa1dnL/
	fuV70a/DSTdkpv91VrS2joaMOzdxdh4+QF1QIbAwobQ0nn+Uvdv0Lm+QGdpgjULq
	Lb9uLA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrspn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:43 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9fa2cd5c9so4547374a34.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947703; x=1784552503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=b056k211bJDh/sprTk4KzyX1vt01GTYx+lXH0Hkx0uqOeTAfcTeznYE4ajbPliA9SZ
         Dd6AOprMvVHbwZLlye4w2Jhmt74E4Qi5jnX0u482dP2dzHYxcxWj0oD7BKrMk3kJ2hMP
         UVGjQzlnMAok4SGoQHsSE5UxYD6aXW+8+rriwABNSgB6izACLUNQzjs48C+mvWqjsGlo
         Dl0ip8/TGu3ki4w0kJAPAx/m8kNytD3z+IW91g/PKv/ywm4qa7/aiqrBFOfM+UJkt9G8
         vQGVhXB6c5T2dawE4/rtpgbLdvS05qjpPaWKg0OyWeeOfn2RXxChangFgp03s0u2lLJd
         mq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947703; x=1784552503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=KjqPGeVvmvDwlt8GgQEe2xXTqS+UpM5DsX6j2sMC9O7793RpBjb3ZeEYfEQ0VOcjYl
         9BNxrIOM7VEOXPDZ9IWl/gicBgs82hlk++oUZ/XZghhWjsut54JtVj1qKElSQqTNRvNj
         KooFhTRFLUaao75hlVZ+v4AfAvXGfyG6cZ4NZL89f8DZOQtIGwcnbou9O2TTAzc8Iqc2
         mZn+rmbysl5PScz+jClNqsay3s9crieOD1r4nAE0FhmftaOVLZZJanFmw/b+agm16LuI
         4ruuTR9/w1STruJwuYQVCL4axfNJlk0QPauBYBdo1ZhQ4J4RPxffR23BpFPmYGKsC9N8
         Awyg==
X-Forwarded-Encrypted: i=1; AFNElJ+0+DsSXiWdslqZc6FR3jdrDvnQdmJI/F8U7qc8uCICLHfJWs174Bg8AMaYvRhZc3ImqfZNYpf8X5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YysKhNfsXU4iWRtkSCjH22noeQ6K1uCUyq47E14qWv8pPlDfnP7
	+3duetkds7aZRBNkAqPxGQ1MUtSh9rNrjwwUCeyzRc4K2xgmAc7oR7AsfjEsQ8Pg86EfjMuYDOM
	8Ek+0kXfxsJ2umBMxdZI0e35IoYXilUJ9zi0lh3TKFaXgYXFhJyGcn/+FFsfxSe8=
X-Gm-Gg: AfdE7clxaVVDe4SznHXFM8eZdNLqBVDwQfPjTsi6BfMOe5e9cQHcqJtdk2WGN62ENgV
	Y1CxBk23mY8Y3Vx4kiSEfuSI6o++pL+OXMhPhfOpHblEyqdlmq51asbb22jp8ec1BSBChhY+IIA
	l1KHB3jYKzZ6jyp2XXNbuw5i+GZj2M4fiJ6bAX0p3lT/R8xAa227Iv1qGGK4SytyqpyTOrzIXjS
	Gw9ePwaAaJkSSeud+CRHDSXJZFjPduUZmIRZGqHFGgXQgKQdsgWmfwUBVjmTBYNl7y6PZ8zae7a
	RQxWh2tP3Y7NmjswSALpUaA7Cm3wvVGFWgA3oT3nDwQ6l5lSlBzba7ujBTql5HuM8AatSgtPFWc
	49NrnmL8DKtjhMBr2EekOfKvRxONbrc0EweweTWL5
X-Received: by 2002:a4a:ee84:0:b0:6a3:80b9:d7aa with SMTP id 006d021491bc7-6a39a6cd4d3mr5189801eaf.34.1783947703025;
        Mon, 13 Jul 2026 06:01:43 -0700 (PDT)
X-Received: by 2002:a4a:ee84:0:b0:6a3:80b9:d7aa with SMTP id 006d021491bc7-6a39a6cd4d3mr5189750eaf.34.1783947702509;
        Mon, 13 Jul 2026 06:01:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:06 +0200
Subject: [PATCH v21 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-5-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGaPsc0Fa7oCOUveANJ60kMxtnneAWu+40XI
 sHiKYzzr1CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThmgAKCRAFnS7L/zaE
 wzQ+D/4y8gxcLmowoTwpYu6/hbyBFcOrtC7x5BDbiLFBPjw8I/IW0TFnJ+GNhGJQX0rglPvFUGk
 E7Dt1oHIW+5lFWTJc5kgUdyCRZHTLY4Li23JVCxFj/cf1a1VF6fJC9rWpod3vmr3j0+pF+OFNMn
 boxzJHPB/pcJF+YiFEb2ZKmOG8LSPKhXnjWUTSyJI+D90cfyqLC8T8hTzIaNs7GUmeivuZaEIp8
 ykxseEOkwZ5iV3LDhkInSNXDwoegrdxf8bBiJLMw2aasSx/8DZeVmulN+6EP2bQxmvwKMzIlaVV
 tbFGw8MmR6KCFFROM9Ew7a+aBNcDVklXTs4bwKjMtZuBO4fl96oTLWi685Kdpf4CTuRZMECeU9I
 RQxMk4Tn1+j7gtHSq2QkLcNUPHnSblikm/wl4n2QNgmREo/nTzIFDuiS/7qObgC8SdGmjNIpol4
 DZ6m+yx/THlh/c0RMsfBev3a6ipc0zOXf0MDkqig/XW7SwFIickz0gL2foQAgrrv6bwIZLuI7iu
 p/cwEC0JBQN5OwY6R9R5KlY+Zv2esWxK0LI6V4Q8dm5APmI0vSAaidEczpSkeNQWzhWGDAYOtUp
 CO/n+FNteqnrNMOz+WTd0A3Hvvlkffb6siLl/Zl/hbBDnMRnNBDjRDTQMjUHsXXpwbZX+eHrORQ
 hP8dkSZdbgPBmBw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OzNuz8ZQutT4VxXLItIiL0iFdsAqDS4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX7tbuCQZSyywQ
 Lk6Ttg4D2HdmhpDb39mczttTFwMg7o5C7WZlHdKhYzma5YhcQSqxgkLmzgU12r26lsqBSCVr8Kd
 CnH+VPuSCV6oODQiRkalYZkr9e12IY9wtHggZVzKJaEq+wYt5qJagszCOtJcvlDLIGUpD/o/WNZ
 5d7Y0NY8HrQpjskVeMGU0beYe2d10RoBsk1YJ918nsxO3NPelQMD/lazbXNPh/cYvlVmyY4xqpu
 fzlddFTtCgmyaZQK1z8yKxfo+JHgm+EZyVpXJHjBUn0SQlS3tFB9dIpVtcDQLS6IK//HJ3XZFd3
 DJh0YNAzThRdqR0arttixfwY0s+mc9mNBXP8NrPEFhx1ozbjBGWdTz4IL9L/dqs/3Z6wxqVZ9uL
 Snw0/ZAR3MtUYSj7DQce7K78CEl3cilpTm+Ssm36bQAbjT3fBBF8hcblHIZu0JMufcoAUkuWUUy
 ZmGFCcKttRrcl41g3pQ==
X-Proofpoint-ORIG-GUID: OzNuz8ZQutT4VxXLItIiL0iFdsAqDS4Q
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54e1b7 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX6j8L/OlcT0aW
 tGDuJBMF+e6F9zX+BJA57tUSuyP3HpsMvDorQ/eb/xU4AQdrgyvk7QfKc5kkvpP7CPG0jnkbpGl
 Hxxk7j9h+pylEwiDEETwAHO9HBESDx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8ce0fe085c5fea6cc614edd692b5cfd264b94d5a..f3e713a5259c2c7c24cfdcec094814eb1202971a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
@@ -247,6 +250,7 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 
 static const struct bam_device_data bam_v2_0_data = {
 	.reg_info = bam_v2_0_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3

