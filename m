Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A34229A9
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947732; cv=none; b=rZ2brNS/8PoHh37P9a2vKZ/R0IpfnfBW5Q6UfLl6Ye/A7BUdrU2hSFZLK2X2hsWCfAeCYkheKVytRUFXP/Op6vA9wL8mXEEYGC8CaKcmemxLax9pYTc98t0WoNmkxIc/Q06FCh17PQdFRsjHQhwp9im2GLO5iip0rbD640JR4GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947732; c=relaxed/simple;
	bh=I6qozPBGCCC+qW2tSIhDtPr1pqACnLdSRJYO6Q/jVhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/yrabu+lu2FJU8B2eFfgaKdBLEygvtT8Wim2uHgyyvB9irUKwsZGPQS5ml5pW+IUsfU4sGjPkMihVSit77YxWBjtoJwkU/1wXjBY0hXD2I2Ym7/+sUHXSDU/N1ev+bFDnRSyTM9P0tdAGrART1ycn65sxs+H6MLGvfxicghj8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Apz6KNtL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8DHo/ol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Apz6KNtL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8DHo/ol"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDrqk1453608
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=Apz6KNtLUUkpqBFy
	wbJooXmdHavqxiRK9SRzxQjoh8jddyAeXVAfsJpAzPeqX3uQsj9GYNrCY0Jgz2XL
	lkeLmgJ5TxKKIRVU+Y9MuMV0wpz5qK7WK52jor38TezZRpjWvWK7Ot3S8JUrGbNg
	bFUzJ4gSEwNEexhEqdPYcTz3Gj13GmvNFLz+It/VmXb1a5E/6u/yldFoH11GIdpl
	PMXmVU6TOcLz85SJrmdIGwxrD8mzI0nEnXU7v4vzRpPjOnbPjXxuXfmQkdFE3Jos
	R3tpBnCXyHgOL8rnbhx1WQ40Gozgg94BPS+fDJygUHKIprItcm4bSqJ7dTY4z3lw
	+MCO6Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj019xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:08 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a4147892b0so3012151b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947728; x=1784552528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=Z8DHo/ol0Iagd7pmZQw3RFwST3uMgoTC30QuHK00pT6O1490yQSwCWSXspAKc5NDGO
         ZjkxelpYSyhPNoxrTKnB6tUv4GQ4GcLugSuucJ9i/EskITXoMdX1/8DfbqzpMmzd969X
         f9jkX4ufQPsvR8tCEmsxMEbX7k4ubdl/YuIScy6f3vPLjCz28DVX0sad2vAIkLYURRE+
         BBl/z5+Mqjq4ujDHYM9PDA5NNoDtyR9alVMy21Vu0vooKVlEs0AB9Kx0lcT62wQ5bWFq
         x90TC78CYSDHiNc8vAsaIGsUdaNjmxMWKBY59n0novkcXNFHFCTv44d7Hg1GRTIq0XA3
         3XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947728; x=1784552528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=rsWaXAL1jBJb1i6L4CUSHKac2et5/3I2L/VleMAxgQMwfAOH/GDaqZOg6Vr2EKlsWZ
         TIXAp6Wvp8O5d96+39+C8SvEplqyvmuoS6LFBebxSpOm7HQF6z8I0BYzVH8ZO86EUkZK
         Lu3qSQcwuToD5/yTM9qBS0Tw3bNgzAh34kxjvKmXb673HPMvz0TzGA3pRCBmBB5oWtCb
         Esq3z0cbCjvDEx1SdAxXUbQHjJA6Z+ApostZ3VNVGp9f8ersaZonF9QdsGQ0sOfp6yIY
         bOm0TQBJ1GukYucpbTkfjVB9IACtA2mHRBb0pLMrGUkKeYhFdj6MGXk6ii1HsWHzc5st
         xcrQ==
X-Forwarded-Encrypted: i=1; AFNElJ90Xg9qSZ5aFyyT8hLc4K38k1hbmxMOsFQzG5WScyzU/4HvO5BPAohIcxV8zGs3rRwDqhFR+Ik3VQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLX1VoZ/ghs1NdVjBRVd5DWJTu8Sefj7ECgdtSLh49BPc8WflI
	1Tpvvm44BN5MXnrEuQc8XhSbfNJ3IiP+OSnjwUw/kGK8Fu/qfFEg/8M7yJIZF1NuFfOzsFkLZEA
	4nk3FmmiKonaaW5s7aOvT+jpp/vH7vMWXntqRM+GvZWFUFcl2EXgzBm8R2pLk+2M=
X-Gm-Gg: AfdE7cme07bAnUQSjTLOJhl0kIOsMqo1E56hS+NU4dkQTmaNAfNYuct/1HQzsgu/EyA
	ZlPDTqxURFU9KJ861XrRiYGQnmzwfJMP5gFjxjaS4f8MV6gvDWCN4orurm5JXnMIUZwN708KIhN
	GLVZkv7uhpFq4miTL6DXy8vodb/UpoYRAZlPup+eGDLGTudkXP/YXOUE2eI0INCCH+S3ib79Syx
	5BKVV48ZkwC1DEdZ1DW2Jr73ltqQZJvuiWBFP424GhkZ1iZFmNwpWg9kPLeZarfSH0W3CSidalF
	xKZXtM6SW7/vvXteWZmOYvKv8VwDSo438pUkdfSNJFlvygR2Vwnm8dJSxGi/40EZW8c838drIHr
	1Xz7f30vvQQ46LuNshIyT78L4G/g4sRFSWDzgxZF7
X-Received: by 2002:a4a:e90a:0:b0:69e:3c9e:5e82 with SMTP id 006d021491bc7-6a39a6e0605mr5301037eaf.42.1783947727379;
        Mon, 13 Jul 2026 06:02:07 -0700 (PDT)
X-Received: by 2002:a4a:e90a:0:b0:69e:3c9e:5e82 with SMTP id 006d021491bc7-6a39a6e0605mr5300958eaf.42.1783947726554;
        Mon, 13 Jul 2026 06:02:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:02:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:13 +0200
Subject: [PATCH v21 12/14] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-12-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGg2k4Aqdj6ExXfrGYi33qNB2cF3TtdSmBxG
 ZEWkJ3G2I6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThoAAKCRAFnS7L/zaE
 w83CD/9adnWfXDogBIuVxqsFAK0DlbB+A8nFLQfV7/YceIQyAioQNgoRNTzD9KdUS6Belq9lDMB
 JiHASqWZlwv1Vq8vH1IIPhN4y9XkIHPJlQ2bm3wpIQYURD8QnlWRS4DWPWy8+J/nMJzHrd8xjW3
 rdoT9t8ATGSYLtYUCS2rJb9S5NTihi/e3AFGH2uCWgI/2VvHspDZEP6MwNeqrAt1It1AvNP4hyR
 e1lhSUNlAviaKAzRFOgtXZfd/TTsuDkAS5CZIuSTF1RKMP80YA6Z6Z9TMVJ+eti37tJg9p1YGyt
 4cXWOfxgVQz3wVaTaQQAd2mbR35B5jlt9wYR+g8hdH7CkOCj9+dSFYYftu6bmoH+kAhoGx3d9fV
 1BjqKYPJyp+ysTK3HlmGWhLddnAw1rpipDBfD6+rcs1tjSTKU7U43Hn9Gw3uBpISSd9lvwbIAp8
 bHrmffTHYd51PVA+50Amcmd4VbFhfSsf0jKvACSdewmtmg1r/Aub3HZ7fWkDniExLIh1u4I2uqO
 8iT4g0LSaZMgPBw87KUt/kymxHHjembekUq8KVN/FJgniWx+qUvEyQNLlm4XW97RSlRkxC+jhBK
 4SE7efnWclviV9PmijiUX3dkn/mXjyX0MJfAhr5V+oGpJ3FcjXlv0AJFWBvshQzPxIlZIcYiWsm
 /Y6B4Il3X+fkQ3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX+XF8CicM58yG
 Rkd9ib3xalvZ+/faGmQjYBSuAkNQAmuCBPR7jyweDRXfsq6kQN2ytHbqlTl06PKCM7i9/UqP+fA
 YxWhOyfTGZ5EgYSCNjUTQXWSQX4wOfE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX3+DTAa7qs/FO
 ZHFpJyxeIJ6r+bNJqLXkGIkJ8FSrlLNPnge1oOtQlyToRpJcE3aAS8gfiCeKmnQjJPgAErEJpZ0
 Mco8oawxvU4/YHcu34KW1S1eE/5OU428wouGtAGLNzUqSKb6UtYYOqlcr9AomEbOCf6Cd2pkXKa
 OVf65oPNxGAvDhRrrFChZp/dih5N8VDxI3F3F/Du7k5ZNyd+nBva4C5kjo+KE+nV0zNmTDD3PSv
 ADGaS4phwPTlLNQzbYGRJAoUL2k6M1JWZMmG4KSBQmyVQBL2tcvu6uGMdrUo5ueU0+4n4TUy5rh
 EN9pbnRMgepOiJmvjNxmNcf6xtXwoGPLg9Hh0AMG6gcaAuKg+XBd6db4yCCOShV8D+M+L0MzqCh
 Ut3pH065XJHi7y7w8pje4stbAJImkPQUUgvDBm/10cp16gSczGOvG9Y+fqeuUUfKRttBsWyneDp
 yapbWOyasb8/v29HvGw==
X-Proofpoint-ORIG-GUID: Kc_THXBX5U2-ancxzGWdYJ0xyaZMk9UA
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54e1d0 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Kc_THXBX5U2-ancxzGWdYJ0xyaZMk9UA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130135

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

