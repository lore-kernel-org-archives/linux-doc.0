Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34AC400E15
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727313; cv=none; b=VCO0BHCAw57pKbVJlxtwfMyV3xBjaoA1MZrqPEzqS+kcHpFa+8fplM+/lsb43XUmVVMf5+CnnFi0/qaAvwQs4y1q1EpsacZoPYe11wrhXNuuasill5tlTp/9edWjce8t/HZpNDuEe3BkdEhDCUCDViGByEX+I6kUa3FEqIkLXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727313; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpYwtnv6k5qVgqY9iKxoyoWOuyH6A4kgVv0mN+p8d9ln6ZDGmMdNkFqMvOodqFSf8XrTXpBc2TpWXBwvH6hHfnT2Az8aLVs33ITOOOTH23HVyYZ9vgen0f+ISprJSzKCN86f93xfN8hO0fhvyqmQmdt+41xF4AiZ9xbwO2x3uyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9OAkwAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCpWVBod; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9OAkwAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCpWVBod"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aSwm2368200
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=S9OAkwAIYEUAKT0X
	XLf4xVUVvaEN3iAINq/viZfv+lfc5YKX41m2dzKgUfDAgU0J5wkw2bEjlpUwTi/e
	/xtu5eI2Qb4QcOgI34TYD65OO41Yapkbtz7Tj4okHqx7ETJY8s471qm/h1UViPz/
	8SW/42sMOorSWWoNocJ2EI1kzb5z/MmAhWcrlu0HzlJrNMWquOGQd2R+WEH1oWf/
	1R2kzmleYqHygnByGYc5Fv0kCGVQnC362hgzGTnj1sAt87Ev4dWL0Go9QQmjMprd
	kWEUzkwZzxb6QOlKr7FjjrZrdQ+bwYjgrcsU4limihaFggreztoT7KUape3ctTF2
	pAmDZA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrbc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738d9935e23so144548137.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727310; x=1783332110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=jCpWVBodwZc0OzMSG6zgo8ouyIxE7ZNShuNnN+OULkVQ0gA8eCW3MgjLVvg1XXuKA3
         WJep4oaimGsth5s4Hl9j+CfHgF26afSpcbtd3KYDeVNGVg7Lsg+RXGf1Vv6SqwjnxV2u
         LIqL+PiXC6jp1EgP3wj9qwu9sSFt00dcglnh3Px690Whp+10N3UZCBrulSMcuiYt88oS
         cdhUhBw3+cYuUJFfQOPZF3v7gx4niPzOwEJOYd0h1bIl49YGLed1AOXvv9G0JQzERoBP
         2dGcCmk/FlfAGjfRZxP1rMVzVp+ZcZ3mWv2z0pI7ztOKmzou3kNCFHvBHbCzQyFxpsRz
         QJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727310; x=1783332110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=R9uMukgHG2ylSG3c8N9wrNOCO+0EAgQOIpUyLLdouz+Yh7QS+56wgKTeZCF9KSsHa4
         4AH6NL0NQb+zevSCqQpwFA/nF9LtSLStV0//UzBprcE6EIf9EWjbjksAhK++UA534ge1
         l8v3KO//PW9OhGiP9dM0ZBBDCk8TIjhaXPqhLM+8A+hpSk2pfqDB+BJh6YGH2fjoKweB
         HHv1QzT4sw33lGGwLbqb7z7tqtP4Uyxuj+97DFSCzNJprYr6VN/MhLv96rEU35DJnv32
         3b2pnvE0DlRg8JaOJTnoemwnsBeXmAQM8mJ1XN7hTlrxoalfY6f8D5Q/9IB46VPLqgDN
         +u+g==
X-Forwarded-Encrypted: i=1; AHgh+RqIWScDPj5is9joDHLUstOHNcZvXo13/iyRMNN3pvhHRepQX3IBVb7nawmWD0haGo0NlQiiXCgWtZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpph7g/A+rf5ZXUlnzbwj9TOVhDGyCxKNh+ZO/85c0fprl8Pg2
	+uOoWilPLslDSEkIjx0qSP8IN2KXqYXWz4PhKA65+OInxTu4ziVNCRF2yNkq5T//Hp/NOIqE2BI
	nUtlrzJbSp5eRM0JzovJalU9n/oGdFwW3sgyh15L9xj+p05KrxAgPQKO1W+ts8+M=
X-Gm-Gg: AfdE7cmFRHmRKYKtvlemQzEWWlg8W55LSOYmSt56Re4pEBB+VbQDMVkoa1hrSH4vbSS
	/qj/eNu+mcfUu0W6MVWbF+fiI4GdzRvEkeaXpG/n/nb+dxVrIFdO+GitIi8vEjwOKqP84VXSFD5
	i6isw4FISQjmiKLWek6/ufOftae6ov6BaDneJtuz+bNQ73JQvmmrM6XTvK5mm64UYmGIzvKoFL7
	g4IJi0mXoxW4oW2SxxB2hyYvFzCMeOsoSmQFDbnU7OwlmeDX1OatLMbtcNRmwNksW80bjCSOX2e
	RAFSPiL5q6qWrgwVx7A6uBzGOKembkxuzrXy3IlJtGyV2Qn94iUn+Zpmuh4IZqEqR0Cg8c86cPJ
	PO2y3nnC0CHh6IjWjC9vxf1ZQ242+05f7ZeGw2M0F
X-Received: by 2002:a05:6102:145b:10b0:737:491:5e49 with SMTP id ada2fe7eead31-73704917be2mr1657428137.18.1782727310009;
        Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
X-Received: by 2002:a05:6102:145b:10b0:737:491:5e49 with SMTP id ada2fe7eead31-73704917be2mr1657345137.18.1782727309443;
        Mon, 29 Jun 2026 03:01:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:13 +0200
Subject: [PATCH v20 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-11-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJyHpUyHCZ5FJJ/hRQlsQgITkeHIvkKWPNaV
 KbuBe5DCf6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcgAKCRAFnS7L/zaE
 w0yoD/938nKtrLvcmNtwPBvQtvk16CDWCuP+LKzIDoJ1pGVJuQZ/RvpKJoJ8IvGuihPKpm0npV6
 yRFy/B5DKLO9uzMWhMP3sujf9UP5DvaoF1AvufRc+loKUGDuCdSwYfajZk5ohDrCcHviFV13IFc
 d9kul3oI9n56O1vJ0vGK7j9i0qV+JCGgIVqVqnKUqMA2E3Wox5tNJD9z4uujuZ5l+i1Rw3j088r
 A9iz8vt2sxv2ruvHdGVttLBBAnOyM8kfK/iQEKG8wS5gy1P6COTsx0LMM/vYDasLvidz30/HnDI
 tsMjZXFPjERU0/jMVLUu7a10Y7Jxs0w0LNPdHbszxUgVCSMyIKpZ+9NLVuoWUYoAkMt8lphYCGc
 Pqbz7qnZnQK26j9PCS9GS4J3ZosO+Mh5lfRYDLsk2feOukRMj6CCNSb2nF3e0IMYUKWwhQh/P3w
 LxM/x32vxOsQJPd+NJcrSUq55HiEufJkcsFaz33fiC45FX87y4GrH1ge5HS2K25DldCNNz0BmZG
 ViLggdvXwRdxttzZpuuZXmGG11bRiEg1IxqsZXjvRAlp8AntAdHaDkzYxUf74Zc21W5LDOdUaC5
 PBWZErdoh0wAyRxPKZsv8TAj5UtvSgQYmBubpQaeOvytNOxgwND0igJaYpcMDkUjf/2jGDyELiL
 KhucIneY8ymMNEA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7CqNuoCsC0U_tKe5j1FGtTKxIemPifHU
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42428f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX+jwkpicOYwqn
 3V0Cfed004hWXwjFRKFDixVcRu68ezJ3+sDs4IIgto+38x5sHdL5UpE20yIUJm248aNKibkohK0
 rXzGHycBXotWJqjWju1HjlAqHbJsIrs=
X-Proofpoint-GUID: 7CqNuoCsC0U_tKe5j1FGtTKxIemPifHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX7o5M3flMhtsj
 0ST/pQd3Fczak7LmffgixGPD0Ac6PR+jNS+Lz8DZn3zy9BMQtj4VNU4cb2wJyu6QpBStChW5MoI
 l9WDsVv7V0sdGojxqCxLv2nnMzSLpWSH6nh8m52rRPHnaRCOHQzZPBL52Iwna5hD1dPKgYQpSze
 qBj/wiERzmbIbMu1SrEZBTVLL5ps4rrjzfKabzOKf7rgtubeavW5TAalt3/32lmOg3DCAkG+mqG
 Nl5yEOYcCQKlSL1J4PtyI8sUMqhnXL2ueET0dvXO8lJO/rk3CbIRvZ3xS8s/CmewZIuG+6WgK48
 WtAgcs/ShnknMiTrPfKIOK5q6/exT8NWTPw4nr6+s1J7j+w/KZtkUGFsyhYJ4sjhYhx1TTiNlB8
 0WE3TAYwAzeVU7xQCV/Fjn69OPng+UeWbinQ7w4NbnfkIumfTjeMr/zbw1fj/FjXIoLV6jwyihE
 71RXsCpXzRjmNcaq9eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
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
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3

