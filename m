Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2713EB101
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277443; cv=none; b=ZdSezSM6rdUs0HhnoDNwRafViiRqudnMdpTeJscK/m7A+pi7rXaItEcK+CXzSW72ntbXZfCmKt52ZJOYyxaTbdnIjhGtHkjLWFWecHv89wUqozseOEN+El27pLuRaBZIj+tMXDY6fg044J1wVBpyVjCxyhKox7oW06VI6IbwHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277443; c=relaxed/simple;
	bh=I6qozPBGCCC+qW2tSIhDtPr1pqACnLdSRJYO6Q/jVhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFNkxNh4OWfObfJOKJlbKtuDtr05//zFrV4JaJD2232DI4poMDzxUHurdAd5II68vE80M9ZLwPsG2v2ko6t7poF6+wrejEkGFQyqCnOm0j05S8J37Y/3wyVHB/gqrH1hD/yD/I2VilFv+4750yVhiQPFJeSaVNE/5Muilup94jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ds64FloE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoB7gWrt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ds64FloE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoB7gWrt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cTrN794370
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=ds64FloEI7O1r+6J
	/BBIau1q/5y/P21Htokkrya5+WFQzTV2cRuC25aZERy4kU3dLKfilY39uE+pooYC
	5dYXaYI8woc3KYd7EyMkN7D4zjs/1Q21Ji8YcYiSoOBZtErl5qiW6J+T8c0O8Cb0
	cemfOw6pwtu89xo83btlPyv25O9PbxkTM84KyvZVZIl03SoRnHxMwIt75yq7hQok
	hoDi1EWLi+Da9rYxh2wWFhMyadojmjT3sSNfqmfvFtn1T5qnh+jRI85n2DsV6Bud
	jRXJfcKuw/O60HUehV8VqOwfpq2xp4O9u9Wgi/c6u7JxEp5sUvQLHQOx5I4Jcl6d
	95/Yrg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jvex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so113557656d6.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277440; x=1784882240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=EoB7gWrt1CnKoymeoKyiAje2tC24ntGPg+3wVzvdvYDXt1zscxUvCcBC1w5Ajv9jHV
         ZuhVa99PWTubPTY6C/pzpAl9b6JhAXkMnF+8C08tW/CFVkm1npaumv0fEJPWHoUsRk1c
         fLGMyC76OlbGDcQ5kzYCaWYE2x+cjocbYObiH5gmvt5S+tNuQR2xi3RYFHKsPiNRA/8f
         LHJItTIz0lkb26UXkuNqTWAWbSiRoYoxFwNmDqvMEnCD3/2izgk3d9+mWJKQdYVrAEie
         NGjDyXlatfnRAize2Same1QawF+hAJ3KVptN57FdBKNkWHy0/Ex0FKJCFqc+HQycOlcn
         sgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277440; x=1784882240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=mwNbpJ0yinhicmwA/AmxsIYDpirpoS+ph1+oQPwlKSjKWXWlVLomWiCVQB50GLsFXC
         gYI3a778IxPmQERB9MCM97ViE/0u1jmZ4jEGiP1NiQInJ4mOVI/WOjYTXJu196tNsf0D
         XsQ61RDSGlHzHIUlF+bwTpAG3PJU7CsGfDRzX4UpSGa+1mzuyKKPQWU/YKPahoKVbRlY
         nJR8n2Rs1YEHhe4XQ0p/0JIRwqTTyyLcF1sp3YIt2iAL+dQcOX6Ia4hchNcCwTANrScV
         XDxurG4yOGnMmmLrABiBijIaoVSqUslx+7w48W8F8J7vHGF1ihNflH4+9Bo0gUQOVn8R
         Ddhw==
X-Forwarded-Encrypted: i=1; AHgh+RqbsYJwfb2B3rBaeGN+4bVNFOBKy0uaug+avbZCX457392A9qY/LHvOsgvlSuD54e6LDnVZP7rspek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEG7YsLbGxk1ctB8jOtInam1f/csqi4eObrP3RwQddTKvrufUA
	MbhR55Upg0ByN26A8ABG0mltzYEZV7pNQiNwxIrXw2+njomqrFwKsRMV9sXO0R3keRov8lIjRVP
	AGR7mPFBUdMFL7MPjngxwT3ScoLCqzK7kjEyE65vY33Qh62o/EuuyLRmhJPOR37Y=
X-Gm-Gg: AfdE7cmfyLOx9Z8PD/84fFNh/ABrYZScPVnWjZAZe8dAbdVYH1csmAuTaQmiUmLnZOs
	PzSDpzXQkHnwEHZGZu4lGWPLRLhvuPuaMcIvS4aZSx27tsOdLylQ6N+6U/13vDJAfyvwoMKDG3T
	zQva9vnjkkFoErsRybSJLMZLrtDjOR3g6IRCJOwHX85FF84RLUewSFR4iFf0O6lxsYFUA3G/uAq
	Mn+xazil3QztvDrnyqZWESBEcEKNS2YFPYg/RikBiJbj9rTtxHGdgBivnUzmq9ch25lKQejbHbl
	WmkxDi4XmYufTjBCO12n1LO2zcBep9oiSS10cd6gPNhjRyFeYa4nKcylzeak0gcp9NTcyOszS8j
	tflL024F/u0FtturyhNxwcV2FxjXYCw==
X-Received: by 2002:a05:622a:4e8d:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5213c006b72mr10846221cf.11.1784277440032;
        Fri, 17 Jul 2026 01:37:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4e8d:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5213c006b72mr10845831cf.11.1784277439521;
        Fri, 17 Jul 2026 01:37:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:38 +0200
Subject: [PATCH v22 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-12-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemfnlDWNKhyFhnG3WGGBPIlfDB2J3nQAiAGz
 irhSXRHqdGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnwAKCRAFnS7L/zaE
 w4/1D/9iXxL0YvvfHiRFEJMhlPOGpWG8EAwuJyh4NbAHwkZAQW71y1g9x+mIyhvlZIzwXh8evkv
 HDKSOX2v0tw2JrtorVHYNVEvoKBgMg1SUz4zBaXigcuCR8/dkE71JD7eVOeg9QbdGk4KCdF2xF4
 xaZcVExvA3G8VcYLISbzU/HZXqN/QhlWTiL1opBQw+XjSO09vlOJy7slGw6qxWt0+h8xT2cY4lr
 vq9e2dST/vX3VBnk4t5MU9/LteNmYHUQ2pNP1oFA0b0pE4cfL1SHoCwpDsIxU4uUWZ4my+4guNv
 r2IONgGTzRUKMD4DYPCGTGb+hCDdbLTdZvFo0P8sr8ZzWq+NoYlxgkTdgcJvY5hxp9mlC4PPqxW
 xhp201+l+j5zDZHY+D8bcP79g3tTNToym+6Y9FFSuPOWebuPZRrifGO8hJK6k1tHIPqQApSOCct
 v72zioDhu1URB/cDeQ2lG8KYVTNy3N1GDpwCYeFAB6uGLeATVk4vo7+R39lBDFKWM14P1cjobpq
 +rkydxlZefCkSHa1njjxA9jYxd7oWmEDyLYwXT3ojPqJCNzxe8+s1Boas517IA7OnKQ5i4WDEeu
 g+hl5R3O1hhkj1CsX7QqoEFPH0wTpTAqnUvvIcZoevNplU/9f6WRglFSK8tUzEuq9u9NWDDtEgD
 N0ktyPmuYTsJUKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OOfMtZKy7gBqo5vIu5yPIuW-jpgdt3aL
X-Proofpoint-ORIG-GUID: OOfMtZKy7gBqo5vIu5yPIuW-jpgdt3aL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX0Hf8y1RMCaaV
 +pwGRAXa2fmt9eY+HVg2xM8oa0gU6Xc2/HsLUpWxCL/48KcRPI7bP+RRSjfyD9rZPrnJiO0vA93
 IFZshtSx3Qm2auxp+t/XiepPn6sbtpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX3jqgo+nGM5nh
 ehvCyWb49QUhf5fY/lheII6wmDOafzUL6JdtTTKA1yJvEsKpYxv+LWKk8qOH/yDrIPC+1G0qjJH
 Abqa6JQLoofNu3g40vmgEIgMZiKW5qrQXAZOUaHU791JraAHHtjOVqtuX1OfwDAr4Wfvmeggu4I
 EQDQXmetZ3xnTkqC1LdipgCjKK6a8eH0fos+g4QF3qxxJyM9+uk4vH8XlYEg9EiLzVqgwHOFF9m
 XrezvY74BI0k8Y/1139U4RRUITSAac4W/FiNGME0WVYkJR4FLOW6YjqIyBYTvXes7oX/Nch/QlU
 egSE+3IdIpRLz8eJKe/p5pFLSy9qaZTszrcCpTnJ/Eww4Zjy0digad7TuXgMT4DK7HlcH8K3vNs
 nBUJedvILN2DuS6vsMKOwTeUuryP+lfBsWjnOcPCz6wf+RSXY/wI5s7RJVx2q9B2tYDhnbMuu2b
 UeH8EIAMmiDzGAeKy4Q==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59e9c1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084

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
index aa4a0b17749081f1ad653424bc265ee81e348e15..4031b4516d6519fc5024bbbcc439500a7b3314b2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
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
@@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
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

