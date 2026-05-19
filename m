Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379B40810A
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196720; cv=none; b=BYvJ46hsphHm5L/xsowYfCNGvB5FTAPBU/0fmfsRdCD5z9Q5pkdfOIJWD2+cbirfGBS6qzQoOKEEu73LH2PwF8lIVlA9admbGc3Lisk+XdWek08AdidhUddpPvYdfS4BGa2ixaH5PZRrVkR0FidKLDJNLyQppPbtVB8pDXAS/u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196720; c=relaxed/simple;
	bh=2QhMLRpY944u83yDkcKOu8e6NndElvZMHRFS04lvfjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YnOthJc/Z/5w5d8vi968xdhCwOXxmr4XY3j+LBsduN2OJjhzADyyApbrShoZ1NWS+7CvTfQvyBL/wHIy/yH3x5Z3IE7Ccb6Xgq1/iVFbxQ/W4iEwPKyewY50XLtW7SrfUjrG4lOE7OW0K5HN8e3y23t9iRV6ZrbyT5T83dlHiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haqH74so; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLL2QyXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haqH74so";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLL2QyXC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAeSg0867154
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GlyGg4/0Y33wv9l+VYbeg6zivTBYMQf7kD3PUmedfI=; b=haqH74soNn5kjpos
	gxQn2sbll0Uewjvo1v4gfwnWNDt6i0Ct9DTe4eQG0sfIbFXLjIuQfFPDa+mNTC4M
	Aq87yzsSJ+k/yahv4c1MdlgfWCxUyUZCGobC0CwqDJVPo4/Yqvun/cDoZnaThY5f
	YZmUl+FN3XMNtvh8Hls3DzVx0JIRreGHBWD70It+wR+mn1SqZUjYcSAKGsuCVO2h
	KCCHanrAIsNe7XYOE7d+/Yc8VTKjUUx0ioiaCJJtK2ZvURVCVz5asWsyVWLiaR+X
	/wkrFjP4ODvLwYqOKL3jm2rsLc+IQuqRhLYvH99oQgGDL9XmaXOMG7oIFgveHUMJ
	bMyaLg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hvkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f6ef62af1so9984674e0c.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196717; x=1779801517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GlyGg4/0Y33wv9l+VYbeg6zivTBYMQf7kD3PUmedfI=;
        b=TLL2QyXCdafkSbSyLLgyNJTcv+pTOo+g53igkPJEDJZsvDiiAzcQ8lAJCUZCXbtcyh
         YDw2fGd7EMTOzll83zGN1zp201aVIro8Pkb+Mbo6AHJbsDzZrkGPZNiAZgsmlLT8j8O4
         cGgYxBHunDr1iSFa+rQfD4wwSGhxKQkfeTYTIEDs2dFEcM6GBJ2DR6VfL69Zk3lSJ+sY
         OY+u+2bB4PKHx/GtinxVsRR+XebFgxgikd54rREJ7dipROyf1/Cb86B8HYBQlaQzWdT4
         CMwlqAlhURqJmLNRtmWN8uMzdNp2ZjHHmMAhlxa8W5Z29jqcQU7kxvEuz5GSWG16Dq98
         y1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196717; x=1779801517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5GlyGg4/0Y33wv9l+VYbeg6zivTBYMQf7kD3PUmedfI=;
        b=r0OMgpxD29AWudyJMQIsl0Of8WMX4lkU9QdYkuxaFJfbuv5mwxS5T8lOuVj42F0RzO
         u03lWfxFMMoaf7BAb1uz92GznKpKMVGk/kQQ+yNHuLd68Upmc1aOykhhpoCbHgdITiJF
         qp1lhWkL2tekOAF2z6MU7lJSCWXjWMBG69XSrXTTh0TBywioX/kDXADe8VfQWtucQMN1
         iw9S99/J44kCl6x9ydGMPhvFEj5HM7puv2VSXlJlyzTYWC6YZn3oIVKyblWA9nHSqzWd
         m+1kD8/G83iBEYKlIQcwzpUovrclb1ZocODmszCYKeViz2ZiyZtTCD+G4t4+QXdKHFTb
         5e7g==
X-Forwarded-Encrypted: i=1; AFNElJ/qYjny3dSjQJjNS4u3vxYyOKEL8gyBFvytvBDpxR+p1rXN97yojpUYthA6qBenV7fU+hSfN47G0qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8sTyO5U1+SalP4T/Do+7m2qfULyhVxNpcHunoouNYjOWakAHe
	c5HuOpujijEmSevoXLtDcFRgr+8uIbEiiIdXmpCPsePQERZD3eK1b8fBshwqD8AZJm7lK7aQAIH
	RS9gMfv5h2mkZfpflSpIiZLWTX4LRP42kdkGa3msgNyLtbG8W9iMGAV+mosFtpBcNm88fh0c=
X-Gm-Gg: Acq92OE6TKJDMQtSBETJodW00Jld+FXVaHGms6hlGAygVgKQlJiSlGXo7YWvXXeMNW7
	0RtmvE58FzE9DBsrkbTOM31K0nkWOWoBJIVj0Dt+Auu3oVXmlnKjNdcVN90poC/3qrCo+n3KRWV
	3jCG7OHwkcBT1KdM4QD8u6dFw+EXFJuUkUIgL4dzdDBs6xNXZF90NbrItk3ZalZVehy1SG97eb/
	bM/JkobErHJcQdZJVNdRNk4qoV2TgyjNxMUkjhji30+FD1pbyOkbKc8InLFTzVlbhv6zjf4LMBL
	ZxY1bB2/Tev+sRvQfYRb49Fo+dNN/mQfpVX8PKOApybVKCzKF3gr4/Qtyrb0m+ygC9BSrVdxMej
	uXcI5cTkpZ0b8gh3LQ/GTO436nnEmo2e19qTBXSLU8CvAhbBf0OzONMTzKcSGBQ==
X-Received: by 2002:a05:6122:181f:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5760be92579mr10733480e0c.4.1779196716735;
        Tue, 19 May 2026 06:18:36 -0700 (PDT)
X-Received: by 2002:a05:6122:181f:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5760be92579mr10733380e0c.4.1779196715646;
        Tue, 19 May 2026 06:18:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:55 +0200
Subject: [PATCH v17 13/14] crypto: qce - Add BAM DMA support for crypto
 register I/O
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-13-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12913;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jreRFOfgn/VYnkaM6wuV0J8POfaxN42uyHappvHAP1o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMMrpsH2A30FeN3kN7IUQk7eqOJyVIRMC6yg
 vQb9ZAzQyqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjDAAKCRAFnS7L/zaE
 wxMGD/9hDxb/tIcCc41EnarspIOdCW9A5r6UQJNRKbhqJc9Wr5/zewJCzBWTFnLzluAnpYMCms/
 2HqwSIGbnU0Y3DsAxnfEk7Sz92F70vxEPcgtiuxmaPH1ONSAQ1lrvW+w5wvkUS/HunIeI2ovI7Y
 sBOO48F9ml4OFz23Q82fe3wj+rpSPTEuYmKxBzpwiD/ysTmWfnwo7D7IffztTKPqCD0t3lPt+PS
 dzV00FXeUH0j8SlUoaJtR8fxXqIEIk3Nx5juEjU/HJ3nbYdfjlWxGqMn15oEeXpASABRWwjsitY
 PGA14N/fXfo207lQB91TpH0kZ3OklLlCEsmbtWEu1EMq21zbpehZ69K4sJzjrfYUsMs86bC6ohI
 3JJXzbN8usiWtLPH7jUNb6+AvFUK8KfPdJ8T2W0Fpc3Yn82UmI+uRGn5wb+LbmIwQkc5Guu89D5
 AbrlqMqL9o88lHcoUnncIu4eaJgKHeCx6LGKDpjRX5rn5gTIlM1OrnPpgMru9wwFFCIkTl8uqET
 z++C6fjMNgb1AD14N4lMNHBWKjUpx8/QFA8hmYhWMOYNzTcrKvJ1R1v2tWGctk4ou3Zn3QE8FhG
 J6/L/3+woPTAiTUOTog6jFWybJnElmfQwviAALZXhKxYyfN08voNXyV7H+xOpFOLvv7ZSpWH+17
 LJQH3Byhs5Gn+NA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXwUjcAUFpLoku
 ih0ICBCxlAOtD1mDFP8uLpe5RwJ+czYnj36M70pKKEYyBX8UedK+JM1Bb4FNMSpAQ58MwrH2XUy
 7DqM56ffC14nhhpxJMQOjzUKLV9hhOTWldVmn+AF9aOABvYCO1QaNpcKCicUIoH+IygYB/YSTUW
 paLftTfeVOyr5X6a9/Fs+bZjdZcCUKtx/lCwZ4+B3z6JN6cUoJrmpmm9UPAmKDewLbQFbpi6gg6
 jxfyCQM26SBNasCVio6JNNsbkEqtTn8t+z9894DLuCE69JcR1A/055ok6eBw/JHieYAkavdJpqH
 Qc0QqoBDh6kzsI1PF9sephgqg6kbAqcKiFsNT9BE2uFMxt1hAm/zeq4t6XZoRJNT76HT73VBKl5
 w1akuKliEjbdo+lVrHClVB6EEub/NrIS0d8DE9yM0nonOzmk30Sl+d8cgWc7fZ3r8kUT1aW4Fw7
 eaWmo6WcKxTY48E8b8g==
X-Proofpoint-GUID: WicFVTUiT0lc7rylXRd-hBMBsMercxC8
X-Proofpoint-ORIG-GUID: WicFVTUiT0lc7rylXRd-hBMBsMercxC8
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c632d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DWmi4q4BpbBovChKCuEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190131

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to using BAM DMA for register I/O in addition to passing data. To
that end: provide the necessary infrastructure in the driver, modify the
ordering of operations as required and replace all direct register writes
with wrappers queueing DMA command descriptors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     |  10 ++--
 drivers/crypto/qce/common.c   |  20 ++++---
 drivers/crypto/qce/core.h     |   4 ++
 drivers/crypto/qce/dma.c      | 123 ++++++++++++++++++++++++++++++++++++++++--
 drivers/crypto/qce/dma.h      |   5 ++
 drivers/crypto/qce/sha.c      |  10 ++--
 drivers/crypto/qce/skcipher.c |  10 ++--
 7 files changed, 152 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 03b8042da9a1b4aebdc775ad8ab912abc7b2383d..e271ecbcbb4a33c405fbec85c458cf1daa7e2c55 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -463,17 +463,17 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 			src_nents = dst_nents - 1;
 	}
 
-	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_sg, dst_nents,
-			       qce_aead_done, async_req);
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents, rctx->dst_sg, dst_nents,
+			       qce_aead_done, async_req);
 	if (ret)
 		goto error_terminate;
 
+	qce_dma_issue_pending(&qce->dma);
+
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 54a78a57f63028f01870a3edeb8e390f523bb190..37bb6f03244d317a887aeb0aa10cefe327b4ce05 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -25,7 +25,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
 
 static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
 {
-	writel(val, qce->base + offset);
+	qce_write_dma(qce, offset, val);
 }
 
 static inline void qce_write_array(struct qce_device *qce, u32 offset,
@@ -82,6 +82,8 @@ static void qce_setup_config(struct qce_device *qce)
 {
 	u32 config;
 
+	qce_clear_bam_transaction(qce);
+
 	/* get big endianness */
 	config = qce_config_reg(qce, 0);
 
@@ -90,12 +92,14 @@ static void qce_setup_config(struct qce_device *qce)
 	qce_write(qce, REG_CONFIG, config);
 }
 
-static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
+static inline int qce_crypto_go(struct qce_device *qce, bool result_dump)
 {
 	if (result_dump)
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT) | BIT(RESULTS_DUMP_SHIFT));
 	else
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
+
+	return qce_submit_cmd_desc(qce);
 }
 
 #if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
@@ -223,9 +227,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -386,9 +388,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 	config = qce_config_reg(qce, 1);
 	qce_write(qce, REG_CONFIG, config);
 
-	qce_crypto_go(qce, true);
-
-	return 0;
+	return qce_crypto_go(qce, true);
 }
 #endif
 
@@ -535,9 +535,7 @@ static int qce_setup_regs_aead(struct crypto_async_request *async_req)
 	qce_write(qce, REG_CONFIG, config);
 
 	/* Start the process */
-	qce_crypto_go(qce, !IS_CCM(flags));
-
-	return 0;
+	return qce_crypto_go(qce, !IS_CCM(flags));
 }
 #endif
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index a80e12eac6c87e5321cce16c56a4bf5003474ef0..d238097f834e4605f3825f23d0316d4196439116 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -30,6 +30,8 @@
  * @base_dma: base DMA address
  * @base_phys: base physical address
  * @dma_size: size of memory mapped for DMA
+ * @read_buf: Buffer for DMA to write back to
+ * @read_buf_dma: Mapped address of the read buffer
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -49,6 +51,8 @@ struct qce_device {
 	dma_addr_t base_dma;
 	phys_addr_t base_phys;
 	size_t dma_size;
+	__le32 *read_buf;
+	dma_addr_t read_buf_dma;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 3db46fc0c419a0a387abce93649084fbf4b1f128..b66e6386fccda20d9462e70e51b8b485be85dec8 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,99 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+#define QCE_MAX_REG_READ		8
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		ret = -ENOMEM;
+		goto err_unmap_sg;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		goto err_unmap_sg;
+
+	return 0;
+
+err_unmap_sg:
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	return ret;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
@@ -31,6 +126,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
+	qce->read_buf = dmam_alloc_coherent(qce->dev, QCE_MAX_REG_READ * sizeof(*qce->read_buf),
+					    &qce->read_buf_dma, GFP_KERNEL);
+	if (!qce->read_buf)
+		return -ENOMEM;
+
 	return 0;
 }
 
@@ -90,28 +200,33 @@ int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *rx_sg,
 {
 	struct dma_chan *rxchan = dma->rxchan;
 	struct dma_chan *txchan = dma->txchan;
-	unsigned long flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	unsigned long txflags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	unsigned long rxflags = txflags | DMA_PREP_FENCE;
 	int ret;
 
-	ret = qce_dma_prep_sg(rxchan, rx_sg, rx_nents, flags, DMA_MEM_TO_DEV,
+	ret = qce_dma_prep_sg(rxchan, rx_sg, rx_nents, rxflags, DMA_MEM_TO_DEV,
 			     NULL, NULL);
 	if (ret)
 		return ret;
 
-	return qce_dma_prep_sg(txchan, tx_sg, tx_nents, flags, DMA_DEV_TO_MEM,
+	return qce_dma_prep_sg(txchan, tx_sg, tx_nents, txflags, DMA_DEV_TO_MEM,
 			       cb, cb_param);
 }
 
 void qce_dma_issue_pending(struct qce_dma_data *dma)
 {
-	dma_async_issue_pending(dma->rxchan);
 	dma_async_issue_pending(dma->txchan);
+	dma_async_issue_pending(dma->rxchan);
 }
 
 int qce_dma_terminate_all(struct qce_dma_data *dma)
 {
+	struct qce_device *qce = container_of(dma, struct qce_device, dma);
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
 	int ret;
 
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+
 	ret = dmaengine_terminate_all(dma->rxchan);
 	return ret ?: dmaengine_terminate_all(dma->txchan);
 }
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index a3a1a205aaf8559a04809936e2a3b7d564c16c53..5be82b345753f49202797852cec09dbc7f0a1e03 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -109,17 +109,17 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		goto error_unmap_src;
 	}
 
-	ret = qce_dma_prep_sgs(&qce->dma, req->src, rctx->src_nents,
-			       &rctx->result_sg, 1, qce_ahash_done, async_req);
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_unmap_dst;
 
-	qce_dma_issue_pending(&qce->dma);
-
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	ret = qce_dma_prep_sgs(&qce->dma, req->src, rctx->src_nents,
+			       &rctx->result_sg, 1, qce_ahash_done, async_req);
 	if (ret)
 		goto error_terminate;
 
+	qce_dma_issue_pending(&qce->dma);
+
 	return 0;
 
 error_terminate:
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 1fef315a7105c869e7fc6a60719087b721e78bb3..6535336a2c57c39db94999011890b8bdad5c58c2 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -142,18 +142,18 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 		src_nents = dst_nents - 1;
 	}
 
+	ret = qce_start(async_req, tmpl->crypto_alg_type);
+	if (ret)
+		goto error_unmap_src;
+
 	ret = qce_dma_prep_sgs(&qce->dma, rctx->src_sg, src_nents,
 			       rctx->dst_sg, dst_nents,
 			       qce_skcipher_done, async_req);
 	if (ret)
-		goto error_unmap_src;
+		goto error_terminate;
 
 	qce_dma_issue_pending(&qce->dma);
 
-	ret = qce_start(async_req, tmpl->crypto_alg_type);
-	if (ret)
-		goto error_terminate;
-
 	return 0;
 
 error_terminate:

-- 
2.47.3

