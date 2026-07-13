Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D01417342
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947724; cv=none; b=I01aMYOAPG5aXx7ERGzGHHD4i4NC6+prvF5ql0iWC5kMI0ATDM49oJSl17vRirOLNuzvV87bKzIufHbW2kzzw3DtFUPwUf1HLpm7+2ZuvaTSIdnsreCTDLIq86EkGwejxdoQvrkFGqw3wMbzWPAt76fQiz45w3bE2QNXvSJ57N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947724; c=relaxed/simple;
	bh=/3Q5BLE2qswUURgRMp8Md6+CmS+GMHS0PuiKEz36BBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u95TzNXLnwbEEBzQim/ZbsDBvz7FBIoM+FmetkDYlmbxROJSZvTXOGmAoqfUDlVY0Nbg/fQEWoJKzzpWQ+5YHJ/YbadfYhbs4ZRxeZQbmBM9O8SudYtd3ioNgDx7qRpUp/HJ67CNMspw8U+LhzVaQ6tcbdpYlIZRO7fepJqqCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqmcbfQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJHYsRUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqmcbfQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJHYsRUJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEBgJ1304624
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=; b=YqmcbfQWyFimoHqy
	hTBs1MZbNm3SnxRLjRNQ/3iGwHDx7cdV6hRdap6aJLHbCp0KnDZTWain2cD/yTH7
	6c+jmCNZ/lI+ReAH4xtBGzF19kJzM01ws3kYh1iQ9St5Cbj5GnQatB6pjhrZNxXc
	gzDCmV/Ph3lBZsLerwrUsTkdlGELQeu7nHQNIgeg5fo/XjCvz54VAfBPeOBcc7ps
	qvoAFnR07kKU+JNSI1eZw7ScSD3DxYtAcPw6U0URd2t7rlNulhBQOtYQ9dinfpOQ
	BKhzUUWld1vqgfVhlvup/eVKzFJnES/jgk6Sin5kmHS77bepwnnjbkYLNuhMG4KZ
	+ftuLg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9rq9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:00 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a3a3151b3fso1099783eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947720; x=1784552520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=XJHYsRUJ7jxmK2mWmFI2oPqJXxLmIWgBRiHlYVNsUzMXyfMvk9D4tTbknl0IlN1fRk
         AgJ6b5yexjtnwrpeLF3kivyyasX2kkQQPgyLRmIZqgLjrt6tB/gHTMf9bfOBxlsntigP
         +EDclRHaKKzdiUSeNWy0sC+XqDCVALKYkXSOUFWjsPBAx0uUfuWa3SKeY23Hy8DIc2+O
         Bxa7RYPFI1bnSGQ7PTS7nLa0sGMO4UMEaqiwwI6/Mv7EMmo6QaROR7UTvETyHXQ+MVUx
         4V5yMd6m3rMNyRtGxcpKUkrYuvdi3Ch+cMKcKwwnfUkpDB++GMnzIYHyeYBNE1ZuTHoK
         Yp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947720; x=1784552520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I65WEZ9oqgYF8KlnrmzqEJMBV2oN2r3NUJBwbhZLtgQ=;
        b=c05G66znT2F//cRVhATDKtnQ9bcj4N8eMk9rFJbeCjNaCPYsBm57dkFyINHP6NyGF7
         ghs8KQR42mGWA+OTwdQW4+LFj/sz3Wjp+tPtmv4f6a14BmM2UhjwGZ/VI8auDheeYsEb
         inoSaqfMiRlqcqWATW86el8jWSx5RojzIq0tNHazIGMZLK3QxrLSwDfT2kkvfnUPLwtw
         OkBstjV/6k/kDLjToru65l20Fh+lvJBVbYYIPfG0Vnqe5v4zjcxTxZwUI9Ym1fharGYk
         EgbTdLI9sY1WKV2x90nyBDT8CBG0oMo6Udi2G/p0ZpEDou4RLHRh1XtOKkfpieSFbGVs
         xMog==
X-Forwarded-Encrypted: i=1; AFNElJ9IxInPb8KdQR/Mw375FRgZNqavuz1hO6gRVEGxbH1H1bQ6bjSuRpeDeTA5HDKMhvN17zRJhadhAZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8L3TR1wTL53E6V04eHda5FWvKuf5Wm+LeFO8JTcJovN3JWUGj
	lytwj0EeR+dwdF/Wr4FTwZFk9Gu19HRURvPRKbsaDNcykEmJDOylCROBu3nptwBJhMTobeXBzXb
	4GTv5CkFVKLO6d1qEOAjsB8otuk3Pr20rMpLvy43U4SYJP5oSCmzO7PjsIGkHQcw=
X-Gm-Gg: AfdE7cmkA6d7j0DiNC0vhqKz+AAcqYItx9Xnkm26QDztQe8V4hzpjhmI+VJWewAQHGF
	VOTcJbC75EtZw3fBrDsR6yII2MgtO7ovmY21SI2iCejZcaEpT7hg5kBdojkWkIWeKAuHIWVpCjH
	MB3IpdSvGaMSWcJO3SY2a4mIrwmiBVhgyG3DKDcXJ5ePJ6dPFglHTPXW90jVsfHUWrkpL/6xweu
	vvs+0Rn7TclNysVNp+7q586NXrYNkLuTpelw9wfSMK+ATB6QwtlRBDDufOqAuU4ZwKVw5zK6E3/
	Bm391RFMM6/qlFkRfWxPCkeDZa/VAQDi2Mv6PGcUm5RuifhCrspXCoEe55Fk2wT7wENXz/ZIoZ/
	kBG7r4K/ehZgo0vX7nttXCSCuLzXozZalLR93fyKf
X-Received: by 2002:a05:6820:2220:b0:6a3:2de8:797a with SMTP id 006d021491bc7-6a39a55bfa3mr5264877eaf.11.1783947719759;
        Mon, 13 Jul 2026 06:01:59 -0700 (PDT)
X-Received: by 2002:a05:6820:2220:b0:6a3:2de8:797a with SMTP id 006d021491bc7-6a39a55bfa3mr5264804eaf.11.1783947718791;
        Mon, 13 Jul 2026 06:01:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:11 +0200
Subject: [PATCH v21 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-10-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=34ButmP/zHfg7ujor83QeeFN6rzFB4sOTC9ae7ymGro=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGfuyASyenMkoXWOhJgZ00qytHI++2nO2fsz
 8TkfCIEhOqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnwAKCRAFnS7L/zaE
 w33VD/4rDhltcSAEuGqwmCDJE+p6NI3I7To90AxBT9EjTdXDOmQAXXyyoRUCS7QE2RaoZhWaYLa
 nrvWzWyLMm6SuZi36hJjvs4a1X5cxgUzc39f/m16shf7v9PmFTtg4WWrtEyg7u9sxtw7r14WKdo
 Q+M5H3YlRG0TvrVH3IDdBaue7HxeJ4lgGNhH3bRdSZnlvlU0KhZyq49gZjVQOsiiCt9jvbh6ZRq
 2L4Y2+FQ/xMWhiOZA8kifB4l18XmoacEaVOis1e1CMF9OBPzp4mRicU+3OWhJkxZO+UuRLDOf5V
 tsuw1VuyXBYRuWqAwFD/B1G/jsDNi9pMQ98vJ2fFEpIHJN6sX2/DfczE09bNz6+3Y8oHXCjl9Gc
 pUwuC8LezSx3PGEswV/DFsmWs0USYxG0WTXDCLctElR45wnT7/hCSpN1cSOXEzrigDgNSmgraTT
 bVJUaydalw0ScF7XTLQXrO7JS+18IkOSEw3mpk3Q1apkddV1Mlr01gKdJknJBaN/3AIULDVfFX1
 4SN0oxTWYqHaL8k7iE1SD04j+x32Up/D13O0SC9ZWXOxGP09OIsVALrHAPw55l/Y0kGJwPcfR7I
 L+v3ZUxQsYa8GAct/qpNhql4ZEbX1Y4mut0n+N1UCfAGyOdTM/fVofa94puMrkopl2CPPPEKFdu
 QUVPNik9+ylXWIQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX3nZzLTAPWuaW
 J6i9438kE1oXbL6t2uU8acRmsOa9seJwBOwGjj/ZY1KMcRERBSfDF2KRUKIJlnaMszN0cGQFrzy
 XYR6orPhc9c97qRZcKtkghtokH6knoawbbXKMexPFv+5qZQWO88pSQ7IIu1LN2a+5B+gGVcN8er
 WIMkDKgdeJLYiu7aJunred8EIAlIJrxyIw9+gi2fQj3Ivr30U/0KMKQAIoHyEXQ2+wCtRii+HRb
 qGOkCdpIk2fk6bzXBv7KbCyxBW3rxw2bO7Ld4Dzu4p0bKgEluKa5ck2O/r78zCtSowqG6uNk0Ek
 kdXpvcrHviC27phgbehFKHVwqoPjkWNgfdunweBfdk2ynStRCfg5CNE+fA2wEqkSZwvYY16MMvQ
 yGyhZgAEAZ511ydgfAnFmezhCr5YvrGqNNS+fODazY1H0R0IEO4XNnkkUJJNsBI7wzlAJjhsMq1
 UGxnGVLhHTzY63SSOkw==
X-Proofpoint-ORIG-GUID: iaiG5qw8HKGpZPmp-0rqs0PdQz76sskx
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54e1c8 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iaiG5qw8HKGpZPmp-0rqs0PdQz76sskx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX1X2ytCjyAack
 qlbeXdtGUhUM+5prAXx/hO28ns4/Z6pAa31BoDgKbE6DLQJE55Am3/OsLP07GyP23LUSkolkPyp
 0lTI8nLi0yY4wTZzyPgh2huq+svAWHA=
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

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index dd860435d2c47a608c82cc2686583a44ff96c889..aa4a0b17749081f1ad653424bc265ee81e348e15 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -237,7 +237,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3

