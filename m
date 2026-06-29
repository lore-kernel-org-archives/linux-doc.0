Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AFA3537DE
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727315; cv=none; b=pgVSHK5qN/9LOJZMZNjIdSck1LxAruLaAyAMpwOBUUQrW597yP4tudhNmgpn5aSeaiQgAxqA5V7SzleE5u8FYFe09N+bGEJ2JKeJnmVPi2BgdO7eKxcB1wdaTl1Zz/LFEAMIqWYvDhE4EQlw5YmDuBeVY8xP617fBvJeS3sWj18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727315; c=relaxed/simple;
	bh=haVTCoWg8OL+rLPtFm5RXGk1TNPHvQOhQxIunu3z1Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I96dH9LWkAg/lHZvwV3yxy4fatgwfv8aCvh+U00x1+NDk+J96trJDkrM7hyoHJxphChRJYyoYlgRokoVNQRSQdbA0mf2qBZv20pndcI41RqnG8pBjrdKE2pJnMU96dSiQ/WykW2hm6jp+naWucFf42vfqgRNyR3bjbQbpBs2i1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIXuvzLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+673DYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIXuvzLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+673DYS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sKrF2143073
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=YIXuvzLacZYnqiSb
	CzrRDe+dMXsdYCCdX3g7YG6MtxnfICNR5W4QevQ1v7tuONtJYn4NXjq5cW+RnOBr
	sdCwtzMnRWUYqU6xjgoxiSVTNjsW3bJ5XsGaBakYEPvhiNvMkoz4dK7ZlPpC6Rmc
	+jJvN2utmNijtow/ShfesUkbREbFG/XqqYoos0s9b7jOkq043R9JaL2Sl9iUhnmT
	OKWTxwPHMLIfi/1cmlakDFHDCgOrovPg0Bx9d3vHz1q/77G1HTFhmUekxdX7qlVJ
	VHprQQ0A2oQC1bo7TR9ho0meo/YV0bdG91kr+LefQMHlKUmznLYGMC8IlOV/DkVQ
	pE9eIQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nxh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d2f02d2fso977058137.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727312; x=1783332112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=O+673DYSAYL4A/DXDEKxd7PBsplhgBsrSOGqIrk9qLHaWnYF3KEaGlsY6FNPsq8998
         ECy+m7tQaIHfud/uRyG2oK5intpQRgACE5W+bFaXcTgVN4+RRUe+qSpu/p3a6xsAGGm2
         HTmF/n7e5KGT2rbb1hvqJrT8uvgoAwLpNvVXYbef5y+qERs8wocrt7bYnfjfdriEIGa/
         FfgoukfTm5MXAcrOjNnM74WKQfWEhenzTS2LnMQLJX0QTaCPY3APgIrgXyH73GyPqw9k
         MsIsOuwIsd3RQ+SC0XqBcpRoW+IttM3mJOUElhEazHnySgkLjaZ4eNmh24ntq/GeUt5/
         JdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727312; x=1783332112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=HGOHrKaJv4d65y+jD2HR1lO1SF7eS0jk/yV1ebYoMbGfUVmcQZBfZbM0Nk8CCnk+5u
         jwd99jm654jo5Ib5At3hCywllMI6tdY8JugmfHyq55FUxV91JELrrqbHZ+jhvm8jX5sk
         WsVsyMOHylzQdQzOsl8FxdfGYTVvOfQiwb+cbFqb8u9LLUzUfKchwRXmUC5qKK3dyiJA
         bLfU7nn/2d+s7ficYgF2ZMuNG4NPxJoaUNwybKEg1acnIx9R62TMSdF9tk1zk0qJ8r8L
         SlCsZz+A24Qg1P2VrmN52mj4+gVIxNCVk8+L/iLB8jpp46F5DNq/ETmnVrzMUnGeGSok
         FMOw==
X-Forwarded-Encrypted: i=1; AHgh+RodZ3OS3YYSlKSou7NiJqix7ZWuJQQyB3bOrQ33lFAOd79zRRDris8aDjFwQcOtHu0VcA4s85oDsrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXzc7HNn2ooB8V50jxrTuPsY5M6ak9lfPV01uaPYFI6z4g8cPR
	0dJsS1fe6RVjQRsYfOPb2aQIxdprhTcC3LRCfdtKOkQJDIJzxS88NeTlaigD2U6I7xgU45vyuF1
	QTC/yKEbeDadbu6uNI8Mj0QSD+3JcEmn/mlZGjNXom2gU3+fQ3i10ZbbAQg1g73E=
X-Gm-Gg: AfdE7cnbsDRMFG49cozAY2p9ZfspKi4uzm0fDD9Mj2F33l9fW6dCa7W/Ovq+hGarIHy
	J+zwxM9OzoSBpfXDFfcjIVxiTT8xMI7OuFOBLAVj9t6MH0+2zVEYTwj65V5MyLowzGw8MLo+aMQ
	+vzQGl+zOjyvoCnwY5Whsb+DWmbbdSrV0AbajXyizOpPTMYVJFPM7AixsxYyaMJR4+cci8DsP14
	URee2EsYJRP0er3zAIOTqwE2xkf158IskW7eCj1AnnWNspsHXAI/o/fS43uzgP8Lya0ry2ALAYC
	MUeFtLmzdmMvNd2rH7vV1IVkKfFqaG2mOjTCGoVMdoSWqREm/ngaaPlabv896nCqajtDbGEW04t
	DsA77Xo2pv/q3X3XUvdxsXa6T4Wqmqb9iS/zuM7jC
X-Received: by 2002:a05:6102:149d:b0:726:9f22:cfe2 with SMTP id ada2fe7eead31-73436de9f31mr7721839137.26.1782727311593;
        Mon, 29 Jun 2026 03:01:51 -0700 (PDT)
X-Received: by 2002:a05:6102:149d:b0:726:9f22:cfe2 with SMTP id ada2fe7eead31-73436de9f31mr7721790137.26.1782727311120;
        Mon, 29 Jun 2026 03:01:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:14 +0200
Subject: [PATCH v20 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-12-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJyRptLKWkFSoJIGPvznI9GKRfKmyppf3tWA
 BSZbodxp2uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcgAKCRAFnS7L/zaE
 wxxzD/wMiHsQpOHVGOx0kVDaIxPCpm0/tDwTlpHNL+qKEBHi6quRR5TG8NOiukTYRVK+6FxEkZX
 DcGqpmG3mYwYU5kZaL85C6Ty1mgRsCfbByAkcR9FzBmA22ycBqju6f35Ado1puSW46bT7BKdi/f
 ljcImwjZTd4jwu/gaH1Iu6wtqVhKNlsytTVoI4jAvjsyoZVvoR8WNWSRQwLdcUZFgIzlZszWE3U
 2gldJzjpvBZ6O4guYqAlUfqjU9NtY4Rom/2gxUdedEm2coz9fPdKfRiszhsy/hD1rVasJUaYmMg
 Pko04lqrxjZJgIq2qfAVFuX3OqoGMVgkLgyi4i0QONDvSjjf7dS1z30s3DSBGRQkvBVEgBdwadi
 HpugOWzftaqAKvqpv2J6Z0iMD+H8TVGhZ7NqQ2AWxAINt0ky0RVAekbD3ALQFTbeB2YzvhHTQD7
 lMzWlCBwg12LNx5M9/zt+eaxlm8RZiQsBXabYdF+AhE6JK95vHEbs99G1mB0iD+7gr+g6LdVM1n
 AAm9S6Bie98pYVwvYFtXpnRdSqEgZvge5DQwzy8Ngj2r/wL9xSp/W7e2bQsOyHLZTnYXcZG5FSP
 GyAYJTqhA/T+OjYFaRwic/nvMS0zcRRNiv/JHA8mxkxBbCZlttHFAu5rguhmHY81JnTCXpmZiR6
 qDBCxA8HIdFiRhA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX7192DdUcyN+9
 eKwgAaf3KkGwPIvwrOHTbYgu8d1fx3vAJl1bXBXK4hREP9p11bTSqDeM5EajxaN8ehtMxrz96Vd
 uluytigdvrY7iTWGjKpjXnMpPI5KTRc=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a424290 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pTMgECg2mtfrIZteoxZJQKSobRgEfKFU
X-Proofpoint-ORIG-GUID: pTMgECg2mtfrIZteoxZJQKSobRgEfKFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1UQ9xFRrcyhP
 RtcAMAkT8/ojTdFPfHii/kyNhk87R7+EHKWlxZhe3UuBuZhkYVQwq7OpuAfmzlJhOc682CTdfZi
 in9B8pGfNp1N0fXm93Qmd3JsuzDjTjv9DYOQsv+4rYw5GjtTDxv3hmTVoN1N3ayrq3qxzeDvxkJ
 YO9EeoVDjVOzli24xxuOHJRTxrOQe/uELnD1oMLD6vv1XSeOooFz1jTmbKQu+eHaNaV7vht++pX
 MEKRCDHErtkWlI9Kr9v9xL9sCAa2SHKHZlm9DbkEiIkbIp+Mb3OCPuAOi8f94arM4qfbvJHbAfd
 mWtoLgS+Rp1QZdN+rY1BkAJP/Tep1a/1Mkm+/LBn6i0Ls6jwTOskX15DQdIOEBzY9DugbOZDWHs
 fC1/7+AwY/dH/wUfutXCOBgEns7iFNuR/JV/PgqdJ/VYag5crxqr7TP02K2ImbTBea0BkPoAcKd
 TCdkMeKBoLdFLXYax2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080

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

