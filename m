Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6656937DE87
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281385; cv=none; b=JqOaH37MJSpFqAZmfyZSxZ/8bpV7b53oC9ZjucusxI01dLxhO6nux7eP8p6/MoKs1G6sflNCc/6JWysfDHL+DZKFuuOCR3Suv1kPokDWlgw1P4HwEYpT26EaiJ7vE/Kx3rSFtumLd0f/Otq/sI42xMcvMuPRCd1q7ka2qBQAbic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281385; c=relaxed/simple;
	bh=FnVBtOe0OnnBy34d5WsqwWSUvkeiYQ93/vJc1qwp/2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RD/ZlyAghiH5t3Ety4d3aaFfkN9MpnxJFceQJrdhl2i0wpW+Ft77VClq+3pSV8umMIBjmLHDyM46/Ab19EsLX6XbxfaCuAygDjmqkYmQ3B56iTLmwskytTpNJ3N2NOGsWRdPnPhX34F6KyzxA0NtRzy4w1IIl7U1iIgkXU1jHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6KyCAOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfsFthoD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6KyCAOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfsFthoD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBSn665666
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 09:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=J6KyCAOigrI6JMUi
	2FW4hWpKgMMtLx9sgxLJcU5fVxhKef1+SUGmBMu9Tmi0+bQm4xuScshXl00PzhWd
	G4ESrI5uCxyqk0kPsk/Zpqa+LaOexx8aEyQsxkkQCPSZHOHEfrXuiJ/KUN4DflHr
	L9yFLAgjb1OcS2LDWWI4A/91DZaW0sgjTmsjj/XDOb43r+KvpduM40lOvr7teci+
	o5m3UH5i0gGj9tw5cBR0Nk3qnflfKFix35Fr/hVxEc4I9EIB5IhdnaeX9xVCh2r+
	2RjfSPFzwiOlnOsHDOihnL+eVYot6KnJX/gHb7NyYBE+2MpcYzypDjap2bohXyN6
	xJ7JQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0kx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 09:16:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fcdd579e1so73117401cf.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281381; x=1777886181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=TfsFthoDLop8x+YtDatkE+UuEQ1uuVuT9KaCM3WDoMaD7ZaQkMF404aw9HXmM0djEu
         7nrJuK1VVwsuNzQYXYAphspRJPb63o9WL7Kx3/IUlfRalKnIh1Ys4HLSKZcdOUNptJbx
         OFzJMS7qmMl8bxsxtSb1o5RGPmRJ4EVZiGJ5mW5x+wc10uQ22hWC6S/+pQ1ncLS9YgQC
         ZlO16quM7gZZwTYXg+KzjgHKGl3M7Si7IK96gyJm7081/xULtHtuVZCcxcWCEYgEgwjW
         14OM5/S4aMdgqHgGxyFQA0z1Pi1zNKcrMvPY96FLn0+yxWyYhDbKYYNom7eUoeqPLUL0
         B6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281381; x=1777886181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=iZyQJ6J8tsL5z0VK+lF+Gi2Ob2NolwIni2kVKju7DZuW01/w8vVNl1rZKhIwHBizC0
         t1YWvRZ8fZQ9UHkpwqfMQyMu+kVBs5P4hAGAiP9OLAT7VZuNXnn4tQJ5JlbNRI3kYqIo
         NNQoGrLzMKYX2W/4ZeQuSa0vZARJUlcMNh7mskABzrxOsBCuLpP9WIcwXp4BcpMkGJTU
         PNURfYM6s0CzntNki709vG2+lxyVA4vkX2iN2tq3VEK9XeoWxAIYkmYOY3RP5b5YHIaN
         5jpCjwuCLIb0WC4da+/1OZnI8JoYHsOhYCKADBycM4SySlZvXYUOgGzlZbvaMfs42/R6
         tDgg==
X-Forwarded-Encrypted: i=1; AFNElJ8blsotS1KheDzpJcUn9FIjnOOhV8xxQCfcLjBjEVeaBP19eHKXjmig7RnuFywIxzV0WUZH2V5iNQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YySvu5jHRwoB6HxINMXzJbWKEtgXTrgTjaeXvIRkVFach8tNdym
	r9dN3tiMyzKQOrA39VSUMEGVnUgoH0nS/RmhE9GKgQv0lEq4zgnAN1J82dqsqXebeSHlIYolUd8
	pT9JnWsqMlDHFEYkYMlIwGX0mNhqPuVj3Al/WUvLwCcHRId44qrND57Xa3lsK/1M=
X-Gm-Gg: AeBDievBIS5gLwb1ano/ewtqbiZgt2iRydR3GcusVnIYl+F2w3njtwxZt1wJTZY/hid
	31tr3QNQtk2DiqLH+TlMyw0oIJfItbnxqrmBACOwmb3oEuE3yUsWbuN5+cTOrkWIAtjYX6HPhBp
	l/005EC5B8lqL2MkRIHdeV2M0M2wzGcb+J/cE1wy7fYGxQdmfWcUBX/3/ibSGTjutTG10HTyhXH
	nOue92ysYPaiWwgEElk+/sxgQk1lmgEi3uAczzlgxGf8yY2bPHm8PMzG7CghdBd/VWPD2S4w3N9
	R1FkUsvSRuY0B0j23njKLYGBK76D/w1eqaU5iqqkIrvsyr2niuplnSA/4P650A9KdIfM7n2GFwz
	tc5zln1cKirhCvVnXygl/HpQFdo0UwBR38TFhIzEkUM+/5CENGBkLA/532Cn7ww==
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr438255641cf.37.1777281380993;
        Mon, 27 Apr 2026 02:16:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr438255401cf.37.1777281380602;
        Mon, 27 Apr 2026 02:16:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:43 +0200
Subject: [PATCH v16 10/12] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-10-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylGmClCRw3//AfCjDOHernDiXEiNO3iuUlCp
 gZtKgrriaqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRgAKCRAFnS7L/zaE
 wwtREACcEpKAs4f12xlr9d432+UiRM2mqQ0WBb2tqTkHrB92fG3R6QIfX/0r0TAp4o2j3KzY4LH
 i7C9hOGNmxiatWeBsAqptPxi7GQzaDrSfwSJMkQvcnBF9LhCSKIv+8NGfVlwKhat+QzjZkANPK7
 rPv8TeukHNlUuFYifbu7zryjeH1ksha4ZQ9k+BtMHbGgZm3GsWdCaoaXQked3UoY3qewm8nzWfw
 4tBicyc/b9QrNvOSyIhYWl7taI5r8JiWfnrxH28tcs0uCT+8paNvfNcjaHflLqlnKMeTdy2DNqq
 OkniN/g7MRsVxtajBfV+xsgrE3kfd4kxLLZMT2v/ec1XQd8WToXxLgNYQrmSr+fxzgclxL8gCSw
 zlPpakDKsBf0+VbSgDrMdHJs8uR/etgu2gN2WstJ7SnukbBElTYmqZ3s17ARRLL2cfoJy1z8nmY
 bJPPm1GwkeMoNd2AoLA6Le7OoK8FTq9zcwpoBBrZrYvn+TRTpKGd9JoYliEMEjKiOV9UItpEQfq
 YpZCupTT0ymSqFzi4KCE+93mXXWMQn+/5ArMejrPT30QJ60pxe9h5Xc666ZiyJ25zDt3rGQDY5s
 EWFvFFDQPiGyT5VrQr8j55uFwShKCq2GHoRqPbipjOeaGxenIkhID7vjO1YwkrzuHDRflyEsQrD
 oAp75Xv2eG7HPcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX1rXKZsFugySQ
 Ueh9L7Ohev+rJG1naGghGeiIRq/JhxASl4PBqalGG5F8Np7q68cC00T/unWktiBQv4vxWW95gyb
 b8CT+8+bNgZH0FZYSb2YnXI2XkXbJ7RPoNswYcokrDNbkw1LsYPZpLA+TAoRJvEGtgLlqohTZFi
 8JTBg9zoplTBcUGvqg47rBt4Mvbq+z+pcZpGUR7ovUZzdbGdsucvrqchItq5+krw5vxTTqYDpad
 1BBxTULjUvgr40G6pBn4306tBTLiFAyL+h5ZDHvUdut2A7E4q8WofxzOTvkKTFY78UD+TGoWWeh
 XPRODGJl7EXKJlyJnLFduzc6PcNJep9Z2RxcWYJ6WmDTSUTW9d4G34mzplgwOILVy1mzgR7JSr1
 QUHDdtPmE/EC95xhoCzksZFHxkj2OQlSdYC8MD95Kcf+NmjDW3r+m7dXymY6bD0th/dDJNIgI30
 ByAHjMUoZ10RYwYLg0g==
X-Proofpoint-GUID: 3bQq3fl4R4D2XYDhEPf2O4mNFIiH41-e
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef2966 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3bQq3fl4R4D2XYDhEPf2O4mNFIiH41-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
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
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
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

