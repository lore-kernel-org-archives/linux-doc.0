Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381BA47668A
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826606; cv=none; b=rr4u56KiMQf4tIluu39Ivv6OgDRa1vZGj243KX5ulonAyqUQIhZZyLam1a9JtTDUqaoGS39wCOvkO8kNycGPkDS0+j40JSUgb/nXbFB6T0pwE3yRPApWq/IAWm76VB2qbmpgn+HJypkSMeFI4MYK0duTaSw5iHj8Cs8BO/WJJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826606; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JeESMOcdrRoVmm0z4a1Laq+rRrMnq9gWUNPYPJClULgKLU2pxPlcajthct9ATUsoTYDo0lv+8FtqCqSdRnXnzhWI7c4KwGHuzyZWcohSWlKf79mnkvI6iHcjGdh5BgxHeUY6rQUAwC4r1FHxR5BspnOKrIXtSg+xngZvIR7J1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbWY6Ab0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWiZ3XeR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbWY6Ab0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWiZ3XeR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvUJe3819792
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=jbWY6Ab0LtE02a9k
	nzQjefrQYoPi8EB+5t07GosHgPVpg+XeBafY6+2+mZznmiqxx77/3VpDk/4N0Gw3
	KqzBDj8cflM9Yt9uDgGmcUUhjLvlpxYLNK/iDRKtLt4nFoRSFVnDtnxqKn5LVDgu
	6ua/VJNZtouLLm/2zeWe+TzSIKiYFVBRtijqrUrmaCimoC8cZnyKfrUYyTxhovwJ
	wZxp5RuR17twKADvSgyL4qacYziebU7z4tiUPyvHlUMFOL1+W9ocBgwYz+hHh8zN
	LM69bKCDC8R6cDAQy0PiGhnNar7I2bwydhxkit225EcxIwIMGUOC/4I4bUQ81efS
	i8KunQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw3hcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so15431671cf.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826588; x=1785431388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=BWiZ3XeRRCyeKk5LBxYCMXInuOv7cPouL0zERorKnrvekxRyNAM/Suq6ou9ctXRYJ9
         /OLgOmOaoNKmt2Bb7v3kC2dhrhTdmAgtq5pI4cj2g0zxOhXp2wjIR1G6Yhwi3r4vdGIB
         iXfC9tfz7VE/0FzWVNEJs5aF817buiC0lUAe2hc5eY5kf6nFCFbxp+9OtJvCiF3KEtBg
         HTnlgiUr+gJiHVtudrdvCQLhC+EQDbjs6UK46xQNCwaqTbGHKXlcS4rm/GLnXntwt0rS
         E9pg8QA23hDV5HWYkl+qukaxlrd6AxWovby/MtAjWNZQn9v+yidLZiqb/bL1HyopWZdY
         CUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826588; x=1785431388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=NFn20sAGDQjKUSW1nEsHyN/UuuvTpzNiTutm98wMWa81ZTSDqY1qF9nNWASUMnjj4k
         D2rKGMfxpEOEcpds22Dm7GdjEz4604fiKh2cwjpY1qQp4jOISSsqiRWQLYk+yBjAVNSK
         v9gtTI3/yPte4LzlWXizi1HI2ITeb1RX4+IRGtAdIgrzsUxf22b1PmB+Dz6ddWObGEgo
         tHL9rxv/BePQ/firu9UAfZlRZUKZQCiHmjMln5Fbqj2tImuWez1q7lE8QJJWYa6jC7ml
         2zc62Yipfw+7H9XUQIS9PQJ6nQ4m69FmfRKGxMswMcDmxz94p6s+4yeUI9lzJsFjxa1N
         eMmw==
X-Forwarded-Encrypted: i=1; AHgh+Rqgl9hqOaGRSykqxTVdMfHDuCxCCWFH1ValeeJ7VBxwNdu5llI92Jd2midaRGdye8Sp985AtZf02SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWsHzNjWOPEbXYchAPGhYqJlG30pUtSSLLDLzVMpWiL6LYYBKj
	Pko4mmWZyceUqdx0Nirv3FJ+3xSM4rOSEVwpUm08LKaoKCItugkoFK3OCzl8QNLRThMHO7Xztps
	sDa8KZSUYWZUWga/n9YhQBlCb3Xytvm7LXwOPG8xXJFzvlU7Uqn0zkRmyOSLpFdk=
X-Gm-Gg: AR+sD13u/d9gPWZNnJ2iqfnzRG9PgKeq2jOS3O3NvQD4NOt4zsqVRFkwQ/H6LQOAHVK
	Cx9hkq8bI2ZLLrXO6t6EQTxQxNk3OUVGE42dx/vpMaB8//sBwsd2SqZN6xen/1hhRMaRIuWKkUr
	AT6XgohDG8SqhMZXkCIromao2TV9E9vtlmLsOmHsTQN4dwPCZU9UTnNeSlekoNUFfl5WlfF3mxc
	KRDq9J/5+e/vU6psoMgeEKa9u/R9ra/jgbXpPuH06sxhwBz5mx37znt3nzaJGm3AmPE41L3RUDH
	biVLUsn6XVGCIbu2X0r8PHSOkjpzmHFVjgDiVYZ8swIYXfiDmD6J2+VuXc14yXZWdpJgF06TBCg
	qJaARrFGsfs1hg1+S//aXFLhfOTBU
X-Received: by 2002:ac8:59c5:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5283def047fmr38941631cf.54.1784826588192;
        Thu, 23 Jul 2026 10:09:48 -0700 (PDT)
X-Received: by 2002:ac8:59c5:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5283def047fmr38941091cf.54.1784826587612;
        Thu, 23 Jul 2026 10:09:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:11 +0200
Subject: [PATCH v24 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-5-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrDbgCD7phY3Uv4PgeKzNuMgjyq16Ha9+jE1
 ekzU9LOXVGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwwAKCRAFnS7L/zaE
 w+rHD/9yY8Gd9PEPIebmnnDAMTNO7Rfr0HVIH1hqo3NFdpV50y9bf0qKCMa2PDllweAqWysUlsY
 OM1NNzPNAWSGRNk1un67WeGOdEujiXoEF0mHT5EEvurrs27xlPeK8gO/ycdhD1ITNgYTjcn5wFE
 m28QKupJzTy0gooQsgasLhB08H7e3qiNxMI3TIKAMHSjKe1HoVUUaGDASaeMI+8+KO4zYWwCEk8
 7AalLfGQQG6V5RFZwCRBz9Czy73VQUFYOBljAzaxbEQSESjWcbOS6nMRTWOjAivZ92TBD945u72
 OeRV3Iajr1NzY/pfxj2THL2OSgDY/vLWmHjCNhobH7BB1c4/L6JInUkkPYqrrtYUuH0LMp4dh9A
 rJZyzrldxi7rb0gMcl1JPDwV8u4UXL8m7HPWtmxhL0k7XdFvWAwnu78a/3Iv5Zgy2/wM9MYqXJA
 T/v6H2qhj27EiUL0+t/f8mY4/XoGRbhHK7jxHl0lcpwRguq05Mz4d7QM8KsJL3aL0lO8YFW/kmV
 wapRqisIrziTVCTXzGNgP4LZbJS/fF4ak5vMsydCSF8pSYZJU10KhsvzjmIvyiQ49duNj2dyOh/
 gplxjZCjqgVJI4OUoG2ZXWShjuh6hU1bF5fMds1QxiQyKf69k3ggq/APrjwnAZlZ8VOfw28zdWt
 wYwCJoiKU6E2AAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a624add cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Yq4PF9kkRVLRtvH8L3_4IIrWvim4jhXw
X-Proofpoint-GUID: Yq4PF9kkRVLRtvH8L3_4IIrWvim4jhXw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwItUjD044OFR
 c+kTNOYuONWCIonNMwSH3muIQZR9FQpyoB9lhuOcpD2Ds/NUIL+k4F8Vr9WZmXtKW929fopD5oR
 APzP9ww8p+4JkJMvxbZ/3U6s1xfA+lo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX8UAH9GZod76Y
 URCDIYT7zr0DeRsajWaXvtHComDz0+U7QX/91Y+6aRfZY5GScfJSMoULzpVn0zOTOulTyrag373
 i3r1rdqM5pegtJpAG1/cXotAqVqqyfPKiQsI8S0SMZSqJgbbVIUOi2zAmppya9P91ypdWXiDRB6
 aGSDoD+8TP/j6im9lx1dpjUOpw9n/k/RDnX/o5uMVhJEfaXZmTA3lvfJdaqwmdwtF9yDElgTb2L
 jUK1CC+A+m1TODB/5saxRk9bKHYu7Duwh6JpYjIHIkIG5l8Pn6m3NH9AQLRiYffbc90HmcUXdFv
 VQGslwAc5bjinxrsGBdkRhYT5KfZ/JzaRgbnGHDNZ4TWiJlHAVWbG7MbIR3XvfwxKPEx4Pb7ka1
 91uB2fMMNijWi7bK+thofsYV3Q2H4bnfSkvVuHUipgLu9nAn+MIs7mcwRUJvPa8hc/2Q20xIqSu
 8EQLEPzOE2qIepf6RbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

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

