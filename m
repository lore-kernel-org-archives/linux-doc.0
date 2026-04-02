Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9913EE1FE
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141772; cv=none; b=sj1RjNxaPBIZ9pjmlxss0f81GadqIf4/A0uZaCSm1plNWgnTboSmUXs2b2fp3K7gAlmznatW043USo/kaHW+8PMJ7nHM7igOXVjd41ePE5c/r39SeoAo7jaPhmb4fL1tlyj2x2Ct+xzZD1euoT4puDmd2mLh/f9/Jpd3LWKwDlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141772; c=relaxed/simple;
	bh=0l3gdVnkPeEhRWmaFMSjmRRcTqey535uYCWAXzuHtwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJwNfINwSAQuyyIkMIGuI4E1nWiKbniobLShjO5NQZm9U3Uqb+QSqDJSWWmGWIrJrpAUSb8sQUg52I9pX4Vww+jZiTV1uKhL18+5tPGVBD6cU1NVe/mZrRuGT+F4hJcM6FaCjYYUL7/2NXw27y1kzVmTbS9Avo+pQZ3QOP+FMvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2b5mPE6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOtIz+ew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2b5mPE6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOtIz+ew"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CxKW92798829
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 14:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=F2b5mPE6MOju8Oyg
	ucejf9qJ95Sn6iowkA9IjZroJMROxZyDVVUqfVJWVWCD/0MfDpxLxwYPU5lZ5r31
	tNdB97i7BHyPTo88WsQU+QCyG+HAM5iWgT/hwMOKFxS61o1C6LPn58ch5Da39EPd
	k3kK/q4V1kFDA3bAh/2UvuWTn4Ke0PiRdDj6oMziXDlMWnZrmiHFPD5XO7AgD1tj
	KKyPpflwehWHWwpYWid6cq1TMzRkLcLWXKnAK3fzdzc1yk9uFN1Tu260+pbrD9BP
	GHeyzv7k7VF37OtfYMmeIWXzVcJsDSM0yPvewsc5x8n9Ywmm3h8RAO4oA7VgFHWt
	hWC1hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk4ptq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 14:56:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b274f94f8so3967741cf.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141769; x=1775746569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=GOtIz+ewO2WDJ+NLAqIHfioIeC6jC1kvMMZ6DgvCxod5hLF+ocmsDtSb+TOrS6IwsN
         /fnjx3pF9huLRhG4jYFHcziJHhAMU7K5EHe4zoXia0LTmy1OpKKNvsnK5Ou7Dt4o8qXJ
         LSW55ckCC5Ng0QK2aAeJN31dxrXYY+J9YcPe8EbeKb3FhUDYFEdk87r1e0EQKRpCLgO2
         xl+t/WHuOeniokrV5tO0JA38jIPaiwxnG+CHmFD+uDwt6ixkXiaaaCeaGD82eWHmZb1d
         jSwLtaRBT2zJCXSeyyDY8+ds/nzPUCIZN2EsQiWJiBAy+b2wtHJIuHVKRet5gqP5rCIk
         b1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141769; x=1775746569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=qV9IMzvtwIyYDqyLhN3tK3YyVzW2h7w0vpcbIQ76Ke6TexVYcrCZ9TNvLmAuc7EHrF
         r5500nFPwi8NlBxm2p0AAF6UPUnlmzV131LLbT9C2ccRi1zRsPSxJRzfGJXU8C2rkJZW
         QE1U+rS7UKx2f44BpCKioN7CYGK29Qrbv/OdhAz6CNG7ky+PdfWpBOdxFSimpf78sIHT
         ig22w90P066bB1QjkW/HOnPGogEa1lh8paKIKVU6vRkZbGgrGQlKStHEvlqR6FVVE6ms
         inFLUgoD6zZE/AdCU5lIRy8/r3ls3bohw6COWTbrf4A70wWaWpTMvNFcuS83ZC5+4ccz
         XbZg==
X-Forwarded-Encrypted: i=1; AJvYcCXxXaEn1Zo8u/tmx94dtHKKt4TX5J0dwE+STQ4sxIefnmXvYjgfebqS9AqErA6T0HEsNm7tIrkt0/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+ziBl286qytJhPVCzZBqtprLhm9altGlOhNxaOjGFTvPfvxO
	5XFFqoqjBpgcQR9+6Fdk3hWSz2wVJACMmxeh9eyDLgGeVzuf1eFBNcD1RUwdeRogNV7UoepTWHX
	pqaG5E2lL/l170MydG3FdX+1Fvo10l/0OYlTgaaWh/2xsNqqqz8gLMuHJ8L0spPE=
X-Gm-Gg: ATEYQzxMNPc0wuoN317gi7vMLm01d+yBbLQhFvpTMqkMZHwdeqjfNJEBSXF1jmqvTHI
	BNflpZsex5BBNnknEOMlfBFxIf4qBTbg6ysIeisAK7zKgk/JK2Rrwq1rCbxn+g4L8A9TqpCT2bW
	ytoSc1QPtNreh8bdMTobigeadOFgpGYlTs/p3VA5rks7STQpywt+ynQaHYUFKPMt0+pOdrAknWF
	ZgFwO1s7wwBjx4ZCErnVRZKTLjt2lwXYMtlcURsONGHuHmeuax1j0axfj0r1T4UnSsq/HD6cEhU
	8FlHmhiDI4sDFGNpFhDSSqxZxBHQmgqUelGHWahTRUPXnYb4Ch9s13EDGC8DBqmiOFvgi946VoL
	2zkP4xZwWS/iTZAtxw7u5pFwjTnv2WDihfHea30801nubOjX5lMxG
X-Received: by 2002:a05:622a:9010:b0:50b:88ee:2a9b with SMTP id d75a77b69052e-50d4fa3611cmr29714901cf.8.1775141768712;
        Thu, 02 Apr 2026 07:56:08 -0700 (PDT)
X-Received: by 2002:a05:622a:9010:b0:50b:88ee:2a9b with SMTP id d75a77b69052e-50d4fa3611cmr29714591cf.8.1775141768162;
        Thu, 02 Apr 2026 07:56:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:20 +0200
Subject: [PATCH v15 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-9-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNzeuggNn5BCNecoJCLrUyCjkRPdUQVVkp+w
 mFiIH4xYmWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DcwAKCRAFnS7L/zaE
 w0XhD/9ZCEKhdsA5TR+k++pP7kqMzhvGODEdwO1q5oZmaA1dMdmuEdfcYRhRjuRPXldSrajs8yw
 D5+EgI6MEdmLjLUT+Tji/dBPYrWLmNXFLQ9odMFTUEU8OGO4UxdX/WbKzwQXJFEV4K8Zw+6S+bu
 TgWOMtd6DVjNr4r+ELCqXIUr07rYI0sehCueUohwgkqUo+qNIf6N7v8beK/2xRtdhqfaudcXQ8S
 FbBnHZhyWpCNg6ED2xtAeZNHPwZbEj0Uu+BBTCQZqLmGy/keNmrJv8g4QaS452Is+hOcdFGwhWR
 BLZzae8ApdncQPoRSOVfoGtZQpodazl5E1WYplRe881BebahXfFO8vuD6Wcqyr3jf9HwnwRll9a
 XipnTViJZBLur2Ii2gw770lrAIis33gYUww4HAc5oOmnNrP/lLBcPF505vA1YrbjRnK/oRf3YCG
 BWCa6OorgOGpRdRPa9vyi9wEIx8z7ngbF9JBVPLtpINnSXEaatZFk2qng17Cx4cYlU0TpLOTAh+
 3QaneSn05WqQWzq/bnuGUbnG5klFLjR3DP3lGvzboalllN7rEnwvZ2RjPQzyEp4Ncu/qYIDtcxn
 SRP+vLHbnGpB7jOruI70NfQ8Fi4N5bYDm+tnpRZ/21fXa1UsrPD5333rNp68E7iWtsXpQ8jrqOg
 H+qXuRJM+RwCTUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX5MmALtxzkw8L
 +RVY5A3x6iScghIEdFmShbz3SgQ0B34enRY75Ow+fcLGx36Qj2aQapPFaSeDizoGETop4r5LLdA
 ZQnIw8Hn3RTGSShZ4eqPCot43SrQBh8GKCmcHXSHVMFDiaX2WUYgDw6FiIZP1irCXwhCXyE2w4Q
 JieBrSbZqgoOkEaxrBoLxQFCldi/d54wFosgwp8IAQjro7Lk7S3bhI1OZEK+vW3YLwT9ttkSMH/
 Hd3t+VGzAYRRUYgveCnun4howzldrUnB7L0EA08EcUdq1owk5SrQKOJJi6u6h2K4ujEe4B//uQK
 AUvSCIc/PsYyOqAWneQd1QXnJaYzsJ7pzK/JztVI6Z7ZkfyPLkEnCn4xu8A3SaQjgrExG0R0lDv
 lGJCmIWxT4eC2wWdFp1HWFEKCZaODlcQqRbVXL3J6PaTU13EGxTBTClfuel+alDfqWEyIsiVe+4
 bslanr9zvqU6VxXM9Hw==
X-Proofpoint-GUID: lHblb-Pl9GoZmH61F7P3KGcfvjPlt4c1
X-Proofpoint-ORIG-GUID: lHblb-Pl9GoZmH61F7P3KGcfvjPlt4c1
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69ce8389 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020134

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3

