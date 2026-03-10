Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503C3A6B85
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157512; cv=none; b=TsOAb1WADGN+xpCe7nd8UiRhNGK+66/H12gAMbq3L8ho80ympNEMrrktsaxNigDTBCPxLctyTXpLD+WCVxq4mQsF1PQjwtCNJi5D844G2cCKpM0Etu6Mn2FRXKRsAcZh456NjQJAZr9Wcuo6ir3LQrKKLbT1tQjU3ZpoRrmSKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157512; c=relaxed/simple;
	bh=IpyCcQVX9q9Bh7P2C71ZivsP1o69+7Z885fDtTkZvoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuGW8k1ywPWsuSZizrevwwf53fZ3ui9dBROyO/xsvyDpiiaVhulsXYlfnuIKZ5WNCcUgBkjXzHXQgzIwWiDQP885IB8N57QDIVTag1PNPXCmuNuqUyRrhAkSoJC4U4yFEB2a2VGDvTDGck70VR+8VptheInNtmQdY2mNaScxDY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmfLKsfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfYC8HI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmfLKsfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfYC8HI6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaWp73759617
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=; b=jmfLKsfx5sQaKyfd
	wBVCBRLC1nJIJdNrNmT/QhVWxi7tar4Y7s+fLPJ9+jYPSRDKOL4zUehZ96q11o/3
	jp0EIZ8qp6YfzyvKkYmkDN7xBGicErFJsXQveCVxj94Xf2D6DFa9srBjmpTTKleX
	6uEWCaObpGOf+HOctRTmulnvre+KH0yWl6gmo/SWugO/pIFbsLXoh8nGeLWgIVZN
	x7Q76pF1pT6K8k+cCI7/q+u7oeUU2xOG7x7bmh0ws3cgnaUtAB8MZe3kM1mgyNkT
	4bU3C9JtIgcf/SRrj8OtwXjU7umNMb+YHkPV5amgxBUzojIrjdB3mBV1kE+Qj1kn
	Xb/ujg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ugshc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:45:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7774be64so1797303585a.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157508; x=1773762308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=;
        b=ZfYC8HI6IybIKy8LMLn7yRrVWldRGCcSLtfA4Hmso9sSSz03JgnAqdcYt0HEKProNZ
         rnnC8lR1nFjuelg+eD2XaMwy6j6VlfdLMDvHGX+GkAmIpCegvumE7y4YUxhghMjxAadN
         YGjauiW/dyIGOWroUUHpuuXjwa/aoleSbCRjDiXVNKo7rAjInKsgzkzVc5Vu0tgeibB1
         pLHRwpuWb+xnBgwiN147WBnHPHJGWVNG5HeoHxuEJfogsYWuKvosxR4lehMQhtXX/CpB
         IsleNGvVfiLp4Ea+1Q3vo5Bm5OsuSELM8jTyJdeZpDtywmG6O0Z5nXpRniJmRYEvTcLv
         Dnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157508; x=1773762308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/urxcQjHbvUQXWmg2wCVncg8OrfyW3z29xPxxSUMIY=;
        b=JOYltoEY9LnQeNgpsTNWlgJkVHB40icpk1NCJEy+fVKMfOjYLHTkDbJyHf5UPK0Ekr
         GtFwHtJ+4Qwc8uRPB6CFE35z8bYMbCDLKbX2V1lkZgCjN+LabPJSiROq12a45BInppZu
         T/pteDW/STNA+C+oxpWZ4ehb7gMef6vUEhJS5d3OcTpfNr2cMhtqBCkO1CMkJud5SIEm
         HD+zwRBw5ClHhRWtVuCsuGUc93leG94gnvOwyTo0fO60GrKtXXpuDXgyVfH7DvIrkSL8
         086RaVz8sH/DqxH4ceLAPvErZpwtW8uU1RRLc9tuAkyOQthSsr8S2Rk0rSJj1mDW8I/M
         2d7A==
X-Forwarded-Encrypted: i=1; AJvYcCUE0BFNOe7Wu+hf3XsjWFdw15Wd2Z8Tr2GHWeM5U5ogPyG5It19jGhhm5TT2k4mv92vk6EMEKNFRlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPhSDksMwkKv3/Dyp1msMSX7lgC4IQRnMGvkG1EaL8e1OVXsV
	YaxSpOM8/aCCVqN3LwB91N7qtWpq2+M8ev7wL6C+kVeeOHY5nupeR545UOH1INkNgeiR2FQ4ktu
	tJEDEQPHhMduLJSCXW8qhDuSkffknvhyokdyDLwo+I1td//w1IXPpSBahjJHdA2E=
X-Gm-Gg: ATEYQzyV8pPwAZgXwKPFsR4bMlge/9Kae0xn3EdVEx8ddYVcTyblivlFoIbku63XS2l
	l9aFMi4GVrrLKF2RXY/BMtf9mkeaJD2BmOl2D/DJW80SyI+uXkh4fqp0pyqjAPI9XEfNE8ZV5ka
	cBKtdf6p7rMnGaZszkzDw5Xa0a2DHrGnbEfX23EjFJaHcq7JZOIB5Xhm9uhefpMujVCy2pIt26g
	KWMPhOd6/WcyKPJ1UH32xPEK2qUfx6fOiPNwwYILWk94huaCwNw5nP7OZfhuTcR60KZAjBRjGHR
	zXa4MaOff5F2TC+4K+pUjJ/f52MfwtLt5DggZilk2ZTY1UluYEqdj+5LtfDDVfL3Dgiyf3Omjsa
	knZm/BXmpAVbyWnMxaYn8X2Nt4GBFrRNgmnkMaWfa90WvXz6HjDzD
X-Received: by 2002:a05:620a:1a1d:b0:8cd:8e07:4693 with SMTP id af79cd13be357-8cd8e074c51mr735596085a.17.1773157507488;
        Tue, 10 Mar 2026 08:45:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1d:b0:8cd:8e07:4693 with SMTP id af79cd13be357-8cd8e074c51mr735589185a.17.1773157506912;
        Tue, 10 Mar 2026 08:45:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:45:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:25 +0100
Subject: [PATCH v12 11/12] crypto: qce - Add BAM DMA support for crypto
 register I/O
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-11-398f37f26ef0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10084;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xVyXRxFp3hoaIPdmV5W3HruIHEbBK3c+oEfKaj3P3iI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxp55b1rTnydR9NrVKbsWs64O9QIfEqQ6YYg
 K2ZSxeZOYOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8aQAKCRAFnS7L/zaE
 w/LqD/42AUGaP3V2zYf7ZZo68Z4+1yAkTqhErdCYCTVQ+6swYY6+2KSLHQtnqXYm/hrcIoQI4m0
 JDYKCTRfx3XDo62v5D9RQg9APwQRCsulA/XwI9MHejOzgjfs9+mN5aJIs+RqS1pOS4duNmPI4cW
 09aljLIQzF0aLwLdYKd02CP/A26QkF4KbCbhSIEdhPAjhLJRhbJ9NIz+eKjcKcFTdxuo0OE+M5F
 M2zZ6dnRKmTmwIlGL+TezFz4mllzVM7j7V1EhZCezzeuro1hgt/0UnR9N+DLNu5N/3+uKMiOCo2
 +cXLcP0fgj1RsSQTNHoGIbB8IHYvh5NLU/eP89F8HgqX9pIf8i1jbAsMXzyhiXjO49UY79U5ETq
 qYV82/q0rAtFZLc8HGX/LZGxdXjb7bDH0Li0ojp+hrHRLlyCrs66uSC9k/QGdLVeKqYjNnm6Iox
 Qyhemrg0a4DIm221ztLd1MH+BdmkCv2yukFC26i0oR7xlg0XgjM7TqnJMpZoKEN8shjfAfwDPVv
 jxiIUdaukIC9QmZwM3xR0CdIbY2xz1/ktJbcogb1EiiUgWyg5xAryr+3K54HFPGvWqoLrM7UaSn
 dHld2oIsLE58Ln5WKgBgwXJIFl8sSw7s0FeG0SAq9D/cNYb0C3ZNVGv607QaruNfxRsxfjHv+8c
 RPMtkcYggfarjMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: QlJNhToMsCrP-TJAq94VJaiwb1ll8XpP
X-Proofpoint-GUID: QlJNhToMsCrP-TJAq94VJaiwb1ll8XpP
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b03c85 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=koLDk85rXkRIAoTU0vQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfXzF2l1WkhIlby
 fXYECp0yAt9MwTbY9STzEtBBEHwfu/Q52+3MP8imv3x0enoZclio5NPSdzdbla1JG1ndWnzIA2i
 hvgjGXnx5F6o/E2uLFy2HYgSrEM2bLVCqLc6kNSuopqpCkMChJ0L+6mS5g2zuL/BOfCYGlkUJBK
 5x+hTr4Wq3d25QdhiF0N7IUnRlX1KJ0R5I201Rzy5MR9NYhGOhS1EKesGnmIpi4YP03c4PkPQS7
 BPBgKa8Pt8yhFfZDgkNkiXNhXrvIW1Zuaq7yShWncgoPqz5aXoysiZyG8maqxsH1n7njtiQ4rle
 tBm5v5UB+ZvKaO/jg7ODNSqGLIUv3oSl+xHX5Fzr8+MsmT5fZS+ohCHbalkKKh8f8DXZfWnsjB8
 P1n6pm4zLjeOgI7tqMpVCdkVOZXaddYXvPr7BDS3iWt43y9Z0TvJ7hLBsdaLvlGLeek5HSNRY78
 +AYqJO498T0taVwVKSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100137

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement the infrastructure for performing register I/O over BAM DMA,
not CPU.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     |   2 -
 drivers/crypto/qce/common.c   |  20 ++++----
 drivers/crypto/qce/core.h     |   4 ++
 drivers/crypto/qce/dma.c      | 109 ++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/qce/dma.h      |   5 ++
 drivers/crypto/qce/sha.c      |   2 -
 drivers/crypto/qce/skcipher.c |   2 -
 7 files changed, 127 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index abb438d2f8888d313d134161fda97dcc9d82d6d9..a4e8158803eb59cd0d40076674d0059bb94759ce 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -473,8 +473,6 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d33409a2a51db527435d09ae85a7880af..b2b0e751a06517ac06e7a468599bd18666210e0c 100644
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
index a46264735bb895b6199969e83391383ccbbacc5f..ba7a52fd4c6349d59c075c346f75741defeb6034 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
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
+	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+				  DMA_TO_DEVICE, attrs);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	qce_dma_issue_pending(&qce->dma);
+
+	return 0;
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
@@ -31,6 +125,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 	if (!dma->result_buf)
 		return -ENOMEM;
 
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
index d7b6d042fb44f4856a6b4f9c901376dd7531454d..9552a74bf191def412fc32f3859356e569e5d400 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -113,8 +113,6 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_dst;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 872b65318233ed21e3559853f6bbdad030a1b81f..e80452c19b03496faaee38d4ac792289f560d082 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -147,8 +147,6 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	if (ret)
 		goto error_unmap_src;
 
-	qce_dma_issue_pending(&qce->dma);
-
 	ret = qce_start(async_req, tmpl->crypto_alg_type);
 	if (ret)
 		goto error_terminate;

-- 
2.47.3

