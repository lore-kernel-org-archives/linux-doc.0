Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F77413221
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947703; cv=none; b=TIIetSeaWRSC6LBVKbvFBVu6dGtYvt9w+p9U9PlQX1ANsAiJcd+v04G4yqd+xFOptHf6H4pMY/fLYDVsWLLbhbs43eM8/NQuGhlUz/6youL8uL+fdr8z52N2Yi1RCOkL6f4QVXylOhJiJdhm9kVtoEV8WlzMQOmwGbixSr8pdeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947703; c=relaxed/simple;
	bh=1Q+aPsoEc8W4PfEahFbzsFEdkzT9tiwxUCi1Nvr+Dts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAoB+/bctgbUlqlWhp/mvmtS+wVECyulglwLj1Pcx2gDosHnzQ1QR/svRzHWlMahBb1yyAXAFMarPkEMEnFuq5TGqjsai4u6QTx74LqIrs11AA9ouCVZPOVPODla7KVHkVVQukMg18XdBNCBqvlLxVb7KWsDbCTVDU0hYoQwfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TR2Vbwha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9GUALVD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TR2Vbwha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9GUALVD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEBLw1304599
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=TR2VbwhaedtgsCjR
	Uc6c5F5h++logsbZPYpfV1Fh6PqmawOGcAHQ21iHQezcNdSzQJ/hH4I9NZYrOkqx
	lBLDY34/a6Mqh6J6TYfYnm5Nen5aVfGZURd12dK593ddK0mfSA0h7bDASCFnmosu
	wgZnL8grKitKP5SZYSqwqoJq8K1729eyWuqBzxz3jVAFEXnre0TkWWTyR7m0pTWY
	U5EtcCXUPZXtNmHR2JrUEIvV2wQBvJhkXrdhe5IGPrWD+zqHXj6+Q6M03pA53uqJ
	3PHoHBl9zJgx7ynl8BYeN2NrfjpBZ7+Ix7q+5uw/mgvMSLX2Pd0pIcgpdduXTkbB
	CBTx3Q==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9rq79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:40 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451d80641efso2933413fac.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947700; x=1784552500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=A9GUALVD5VLLOrf//+OFU/zWsZRjaC3X4F0U9k88YsUePzJ2E5A68IwDqWOgETAvQP
         p30qtfVKmm3CI5ZxgV56jflPYHhYfxNuwsqgh0faiRG/Z8xUs4BZj0XtKqSRTPX5YM3y
         T4QJfQreUk9nmfWbhheTgS1pwDD+TeNeWGskn2jMaBM2YbINR7SFpJ+KdwpPHqbXj6Vh
         8lAgOHyR+z0ssqTjBdQelJUbZEzB67vJ95VtogcQFsXxMNH03t4Le3UD/32b7vfO+dL6
         q+MNwkQ4P5VaTaOwFCW7wG8ZU3al2xU0P3DwmJHa2n4NrWwkag1Cp6DQR3Dyza/IpGkR
         hULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947700; x=1784552500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=AC/I5tlYSuCIQH1x8vmjj9wmmiqt7Ie0ip47T2e888jRSA9sHWTOrfgVazFMr9WVSW
         PQx3b//IPtMygrN78Xdde1CVJjkEDnY6N6wGIOoZuC92uERAFgX0/BQG9I2oVzIMD1Ft
         zaKVzMFivurIiaSLFnWdSFtKqXy2G2GmJk2H72EOAgCRho2ysnDT5CN4dklmExm0Tad1
         HAmHPT2jEV9FoF/kSiECVu6kyA1dp9I9puPDQa9JAVS+tPjghh3+lQneoUuyBJBM69XJ
         oCIXxf52/a5jBhj/h7KHjvppKcTYeYeTx2xmlnlYFHzpEdCib85zv7ce2hM+oqClvMaK
         a3Xw==
X-Forwarded-Encrypted: i=1; AFNElJ+Z6x/SOrnQLJZUFCVu3rdt2wi40Aq/myIAMlhIlZP6g12oy7A9Vt6RhGojCIvreWyOzXxDspF8v70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxJVr9V2Lfl9lIkPXxyvoZCA0GZAlBPijLzqUaKt4QfjZYQap
	pK3VHIMm5J+3NZ93syWnqPuDS2NohnnzCyu8NI66kMmt5RDJUu3RaoJdTOGYkT38T5e1eyqsjaq
	AmXYDfnVsOwyAnIgkY5rUDOeuvoZI7tvN6bvDrPb0vKpUNYwPpBF+4deOJPtU334=
X-Gm-Gg: AfdE7cmrUZVgukrg0TY/pInISveZJTNLo+niw7MzuPaMTfYtC/tdfq8gwESpVXbMavy
	Y/6FI+lRCon3RG7kKapLVF3TNxoxsZ1pj0sVlA4MfG6OQ1yD6+XoP6jXe+n3X720XGp6y1h+k1K
	L3geuKwbRN8ItFmgOgAZaLbEgirFVL2s7pHhaQNfawBxwnXxnUgsVZMnk7hJmGc57QkPzEzojXY
	6dyEa4L6wxLO33UMkQO6rueIv4yHWWM3Br3GheHFj4uYAfPeOR5N2QTNSmBxQhju1rpYDIK+6O+
	2bKb1SRywNatmRHSWt1bSqAxdMVJLmkJbT+Ta+1IPSMxNBkadMAU6aqk4sA11/XDfOiK08p1ZWR
	H9V0gUXyVPlnd5eGAQCOyIq0YKe5teIZkETZ1cer7
X-Received: by 2002:a05:6820:150f:b0:6a3:74c8:c055 with SMTP id 006d021491bc7-6a39a561d8dmr5636191eaf.11.1783947699748;
        Mon, 13 Jul 2026 06:01:39 -0700 (PDT)
X-Received: by 2002:a05:6820:150f:b0:6a3:74c8:c055 with SMTP id 006d021491bc7-6a39a561d8dmr5636138eaf.11.1783947699138;
        Mon, 13 Jul 2026 06:01:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:05 +0200
Subject: [PATCH v21 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-4-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGZvuGUYeChHOLC77HMfiNMIfVnN8AjQan6W
 BeS6asnms6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThmQAKCRAFnS7L/zaE
 wy1iEACsz3YnAAnaz1k8qigqPCxgYXXpAPo28WK2BGkIxJnWSpkVg114GyWtZa9CVovWwDf2FNY
 5mPXTCu7d/cHhSoqNb2s+vD7NcQBdho/HyhKnh1tIToo54h1FbJ4ViWRQ+R8mflfyoCsz4yobXI
 XgbZFKJdPqtW+e0hYpbBF8nPlzP53vpRNpTu6kM4o3fdPUOtwL+sf4NpDz4J6gHcfxIPdStSGDP
 LF7rY6vs/mxVwPHuxytui86zaLzSz5BxthuE0QUgb9vqkibyJRvqUZpfONM1ZI4FQlN7gZcoaSb
 6RMHbvWs1VNxS27/r/4LwU3hHF3RjudDc55Bj2skAEillw4YHRxBHIXhhTy5KsS/wjO1MoBmhx5
 ttgqK7vp48MohSGVdH4GESxroODaknQWBMuIfeGmqxY9ymjvlPqdnCSxW/K3I2HmefMPPS8hSMe
 1CZIgnVz60PtsyVz55b5kqyE3RIpcDqN6Rn+Rg7jDAiH745nA2r9f8ESiwNJR82qMwwvqiLnjIu
 /dPR4SMJKOqA2wafaxWf4kJLmYWCoawsh8EXqmQ30Rnkv9NVk/6Bk6snCJ4jVo+YpJPEFCotVH/
 Ba80v9XTVKr3TKqVnlD3N/vpR3tp6SRRbPLqjndYlcmwY+P1qCQvBdLJBTR5TiIxFCvS0n6nT3E
 Y1DpNNcWZr2QC2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXyqQelEo5Ysyl
 pnsMzTg4vBycPX6I4vQ+CB9eLcl9C/CgZrJlpMlwl2YAombJnHzCE0fX7tv2t+rOBDDfEk6P/vF
 8IaFYc2NlOr9/4CI1lvNEmjhCkl9JgJSxfR9IyhbcAn3V+gbzXhorIsjwpvAVDwrCOW/0ZhU4xU
 VNcVZeny+j3UP2jbmWion4OeBYaMXBGmXiA5oDR/V7AWl9LXNgYbze/bFhS+/aKzCbSWV0igh2N
 UjTRBbCLRgcGUSCTmuWaq4aUad0EddjlISi922+2Rge6tUtsBUPmWPToq/dGrZG6iZ2m8F/7UIz
 9GymnOL9f3SloyfRJCcjtOpBJO+dvV+A9x0gOvv71EDIrj0pfDh+0RoU/gdG+iGCEYW7a3JVlF/
 TByTPHNAfjprIozHtUTA2ASfVzJ8R9UY73ZDUGojU0sxRSH04GbMvUv1gOo40cKKQLjvigmkJJi
 4wOwOwzsHZBgjp9u1xQ==
X-Proofpoint-ORIG-GUID: MZEkJnowiipW-hETWg4PufP4jQGYbbva
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54e1b4 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MZEkJnowiipW-hETWg4PufP4jQGYbbva
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX5bLMYD0avCU9
 Fwncyf92hfOwgtKXGHMCG9hbtaryElmv4zrO9AsrJlhC++3ZFMp51Jq2GMW353Rliqa/Sj98SFj
 8v/Xw4BAUChUnmdfMrJeqj+ZPK7kP5A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130135

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
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
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
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3

