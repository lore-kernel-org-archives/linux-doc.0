Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A84657D7
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457254; cv=none; b=GupzbDhgK+mfZW9L77XKcRTK5ya0XnSvx3u8D7NR3LAZb1TVP28zUH2JECwDsF18P3iWaGMeEyL6N1fCCnba4pX1CybnmQSR1JocSpxnuVq3hSn+8Z5lcr3T368sqTvzoj2XaCkzRHcmlgRx0EER0yX5JFnyVVpX6Ie6Iq4MrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457254; c=relaxed/simple;
	bh=haVTCoWg8OL+rLPtFm5RXGk1TNPHvQOhQxIunu3z1Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gi5XAtnHCLz+VPDecya0DMPXsuPi7RiouZctFh3nfAvkdsU+I33kzzEBdJSA6T98xMzck3D+FTRoTENIbbSl+qeAL7Kuedut8jfMIuPSRHNE03BeBmICaaWUZ9YtPvl4ass46//01l4tOzmpFCZcXmdNwqBHV7hfqCEZeV7J6sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0bLFzQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQV2Mxng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0bLFzQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQV2Mxng"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8ZN423532657
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=L0bLFzQ8eB8qbZY7
	r0FH9KylIh7vCVAzy2P+aRxMGDMF71H2/mgtOVU5GuDJW9ZhHIJci89kGsxQNIGg
	+mCmqghMEoSbOJOK4KwlfqTR54KOdf68H5DayiImhl6nXq/PiywcFTs8ZF4WsElr
	9FLzJWMqMeS1YYY0Kz5myN72PaUQWnhCZLSnLa8lSuFmnVDDTaHo8O3fOTSqd1mF
	IbK7KJSIt/oDIdkcPZ0HAtBdY0z68cZ51AWK4QHQttZ4kBzbA9k4IGw6gAhW/DTY
	b6nOQD5xYE7s5/1vFskf3/uNjKJczu72MRW1vCRmr/Jp7GZOdTWyVi++InfMnIsp
	+B52SQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gw8x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516ceea1984so35120941cf.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457244; x=1780062044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=KQV2MxngREueqNIxlnyXvaL25f6FNMyA/T8fljxs6ZXPRxlpLMCNnw3pTS9ZksXWKM
         +qPgVoUw5kF4sz0pmMFeot2+lhViJgsHtlgVePAP7d1DPoz0rZ3SMx8a6c8k0eFyy4t+
         MSD+lYzVPCg+s2DLpt66+x04dgxHYZ1dNa0UUVf8oP9HRJV+OJ7MVMcsdMz9s4rnRXzq
         NREQ85IjzwWgsw8W05v5W8MrOO9snNa4L/v92YuQR17gYedZ0Fhvcyll+6Ry53bxIVCT
         K53vtQSXQD7y/DiOkyGO3MLxLLqxu27JtnSATkrEI2ZycjA2gTz85gY+XEemn4GDYbkD
         72yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457244; x=1780062044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=rkeZUlOxfmblQwtnp0nlZRYEvPO1iKL+mMi8QcDJX8KegUhQxQyS1mWaGYKskiJ5DC
         m8AUWO7atYRjDeyQUlv2oa7hwPikhIHCHhUMBIHsH6xOGLRw3Fad5si5rsoPA/amteGF
         X27h9itfohJIdWcjBI1J563ABSFclXQfhGeJrwbTwvbzSizlOtswRklZRc0neX1hgjTj
         b9ZiyusRiFNTzKjuxgH/f9D49HxSXREHwt4Z85skfScrCdQ2dw95ZdAq7+jWfUtg6sxq
         9niKFnqFlgOnp8gkOu1K4Pad/uI+iv94b5cM4pjlsXEzVAwYn2GD4KfAkSMHhEbHEbNt
         mEug==
X-Forwarded-Encrypted: i=1; AFNElJ9Rz59cx2YiyVz0M/DXw3BZXNpw8Mcl8qf6tDL7xS5RD3K9oSzdBi+/DEtSo8YRjbAGOzEPdgTdoY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrROPSxYDRTB17HkX1Htjq8Dl2qaCQrzh8gyM2t6nJfA/QJEUP
	uMqgC1dxw/Z3rteF3ssXiKqpaLXl7ItNuwfgvzhbyE/Nua8jPHFC/k+tzZYbe5cCAzEdKzcSdqr
	COoxQRmDOEDu6wiYGfTkiruDILSCTBbqugg8VOzB/KvC1+I7zbz6i6lYCySuIuRM=
X-Gm-Gg: Acq92OGpS/omw6Pdy2dRuME0uvrdR9/arlaWhriy03Pgu/grMFtfkgNvP72b540uFpg
	nL57e2uTBnXto3QUj2RE/3fkTRIUPkBo3MmXhA7HDLDnLhb1cVlNwKM/tCrqGqH4UgCfTunRyt8
	q6gkPiCH0HJEvEO1LmA8kp9QD3DjhzxBNpqf6ugv7Q1elLoFGwynqtpyXz9t8Q6c1SY8jzBoPNq
	i8tGHF9hiK5PvzepI1DQWA7KPdcdzbIID2ohD5NKzxuQXN3Df0p6f0Wail05jQyS30eiEBtNhD5
	YoSil0HkGQgD5HdhaZ4g89MW6WB49UWrdsjXXEQ5ioCfxJhuJnKRqDNo554lCQQNsfOVarEp/zM
	ipLh9u5byHsRpZ64brQg3d5F0jVtGGiZr9y3b2rThZuZdEXPPb52fhVfXvT9A
X-Received: by 2002:ac8:5a42:0:b0:516:d812:c35e with SMTP id d75a77b69052e-516d812c62dmr29096291cf.21.1779457244073;
        Fri, 22 May 2026 06:40:44 -0700 (PDT)
X-Received: by 2002:ac8:5a42:0:b0:516:d812:c35e with SMTP id d75a77b69052e-516d812c62dmr29095691cf.21.1779457243645;
        Fri, 22 May 2026 06:40:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:05 +0200
Subject: [PATCH v18 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-12-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlCDdZs7gUpD6zwuSqo1JfGszglD6fOxI/qdoCA4A3w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy9GCej0i1Cd1aztfnZZqtnXG3WAa7q9+ntF
 QHPDWveOlWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcvQAKCRAFnS7L/zaE
 w+TZD/9vRYP2DEf7Qu75DhCLbQDS2mmmkVJ4+R9oiI3lc6AVdk6u3LDUGd9bYd6FWE1rKOHYVMc
 ax67m1Fw6hUcKQoO3SjAcPfR8emrmbcp9KmC6tuB2d4PGFa56saczmhwcm+WIIGCXM54g0mCT0W
 LQcJEChKGrkdWsR/LL2YGRjKkLBZBP7YK/i/p2hVnyr9aFVBUQ0ERj87TB5Boh7IrjmXmYQ7MOU
 OD6V6n3pk5hletbVoErK/FrvbEJhbU5h5Ib4T2PU0J83jfFNqFUmAY85bof5EqMSTOC9OC6USr1
 Q77NhHZvFQblQkJZH7+qGFQALv9Xp4+c1CgBJ3gKChzY0ME7O5GbW/4p55XCJbOc8Box9+W2q94
 uG1XZvJ5/2gYj/qoO7KjWq0vdO5Fb+md13YyaIrQtmaFWMZlaUB1IIEZ/R2A/YNg3zhmyqYChk3
 eceXwNyVKjTDaVbvNWHH7Ie0P6jG9mebIWguUTA7qNEeg0Hf9NuLkxTqnWkDrzz6gRRVqnPXy7J
 rvDPW4QzOSUkhTiBBKRiFAS6HN/4fZn9+MQTyZbRGl/Fl2qwEGfbXthepOXqviVS3wOJKslnf6t
 6cm8E/jw/pnYRuxt17zrXLvsYnoHzdG57xMDlQ+IEtFs+jjtRIc2e578qqvdkewcL4pmVYTUXo9
 R1+t9Owjk2x8BxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a105cdd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9KFvKdasmMwn8R-Nbk4HnmONmsbN6HXl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfXy8B6pJ/Beb9U
 XVFNQWojGpIB20VHmize6GKGOgf0IFl/FrVQuyr2KV5GZJK4pltDy7y6SDsLY3u4WhQspTtfcxu
 ZF1PiuaPBveaqNfRgWJAeLaMc6z5PYarfeBThUWnwFOupCH/ZJres9uRL9halZrsT5SQulwksjI
 K7CiN971skd+hZfVqOoaF9mK8B1fczL2gvYY+nRDD8icNnZceXJcBLy0jI/aVZN0bOHO38s/V5i
 2eHXiWZTmPRS/KfJh1bMif0X+MPKSLgrPGh3HzQVui/49ARy4hewepS9kz6uaYsDXKy/0VhUqng
 GG8myfLeZYqucfcpVSgHFfcwTDaUCX4qwtAw5EUfWem/j4TSCjxM0juLU623DFgDrYiODzd1luN
 13UCx0ROci9rE1T0cfOoJGa+Z4JOkIFwSiA44Bv8BHVcCLBxagjfI2v9f+4tSQrlm4HJh0DxWBo
 ILJ8cTYWPt25PZ5WtMg==
X-Proofpoint-GUID: 9KFvKdasmMwn8R-Nbk4HnmONmsbN6HXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index a0e2eadc3afd5f83e46724c8bc3e3690146b86ba..d7b7a3dda464964afe6a6893bb329d5bd5759dcd 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -192,10 +192,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,7 +214,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -255,6 +264,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3

