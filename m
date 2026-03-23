Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788AB265629
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279078; cv=none; b=surikB1HcAB3qeI2PZsZmVxXgwVaMYUIwm2teUp2jHlJwPbOCE/C4PNwn6p7CJ0w87A9X8+EWMQSPUUXezeV/xVuaPI+SZaBQn5HFHyBp+bqlyQAOIy5tHLvH2R3g+DKU+pS5HBlf2hehcd4GLm2/OmvNjWPunXu0ie1DPbBNw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279078; c=relaxed/simple;
	bh=0l3gdVnkPeEhRWmaFMSjmRRcTqey535uYCWAXzuHtwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/Z3G6PPKnb28fabA8FVCkkVObUNqAlIH7HbQmNv6pU0JZ0m2wBL/cAK6BD3XCflBN68NaAlP/9MWYlckil5cO1s9loBx+sPreT+gV6GYCHxCq9Fp1ByU+VOW/aR0jgRlCwFgDblGnvMAgzWgV8/W8PX8+c/gtH5TvSgA/luwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMqbd+8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aI0tOOsT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMqbd+8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aI0tOOsT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGXeZ3287882
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=iMqbd+8jDFG8wUga
	CcAfEqrkXBhSqKa2mXvbxhMVq27SxEF4NFxU0fYhH2zkE9AQ827iCpiT8W0krEvD
	FRKYlEzzZNsyx5yLBaobqqSp38YUrgh11j72wbi6Z99og4kBRRuX0DUGKW1YcgPb
	JEu/rO8tCeQGHkzdusiLa5gX9Feh7n7xE442r/Ocj0P9fnfOaNONqB9qp7GAEy75
	telyxJjfOPRgmo0iAHvDQ0SUZWsKqZMYKESaYdFI1uiiqnQL+/CDel8vXKInCJyA
	IF7+XVgJcr1ObmM4T+odC7PAVgykfDysiktvMlq1FqHahth6YzPFHQyZRWHGeCX4
	YhPyMw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4gv2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60132c655bfso41592974137.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279076; x=1774883876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=aI0tOOsThrWNUMOipkqCm8inB7pmKAfoQR7vYiiFI7SRWtFUrlKHOszFy/zCBGM1Rn
         eY2KzG53o2zIB56ZXiktHZo1FAoXEtahPnOUcW+X6qkpiawiB9E34+85+h5gXSlZB9Vb
         SOxVassT3z1Gc95g/PFDGBsQ3YWRMcyby4xajt6xtDOFsdLSEAcJ8paqwxpzdeS+7HAC
         QorjF5adLqdj9Gp1uV9SZQSWlqsZ5uJJs6zjehrF4GJkn+HMPsQOsDezzm4RpAlrkIey
         QmoyngPB/dOJFjch9VQ41VZJ3p317Ea21AijKv8NFKZ205bdOoTRGtV6aUbyinMVpQZ3
         IhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279076; x=1774883876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=LV+GwtIRRlb8IyKw6aAloxWcahoFPtyRZIY6pjpTize6FhIMNkHc6ELDoNjtqmDr2q
         DBNS7/Cr74/RCLuDtpUVBWiZHoxB1BkEDS3jlwtut6wDQEZP9PSRCP8RRQj1Dfv25gPG
         WU3hZwUCNE3jgI+tusSwE4Xf6yMgCvozkaZTYf55/jjz4MlqqHZmy3EUw0HNOid1EQ/J
         /lMDuELiyWqPj3Q6iGvQmogOFHTUvRo4CnuDGwxP6tTQOhHJQr7jFD4NqQs0OA9UFmbk
         fH8xPZjO8DkZYWQIaWzMVUvptaqsOUnXNcAzivL9K49AgCdsOxDb0rBiWp/48P3VcTEr
         wBtw==
X-Forwarded-Encrypted: i=1; AJvYcCUmGlwjxGuI7Zi7cWWn8hFl/q7AXv7rJ1QWJo6CmXEi3rdS2HKOSi7CJhuZRW7YLNQSrmLCuxT+KqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyttKbq5mDLQIT0i1XWVssiYFiUm1HtHxmusPD5b1oxi3xlfOEM
	r9kymp5bPP0Q3c7xYfiQDlmv+EFnIaUfpZXJZV5fQC+QPFtlVIwR0Laqrq/gpkHq8jyzPvujqdF
	qHCMuBNHck0TU/XG5sA/T1TGDMHuB5rC5sB3qcNTlHZu6QmAfiLnNS+eC/lb/4JE=
X-Gm-Gg: ATEYQzxUkGbvFHvYyEJQhGQ5o8b1JhhDsVpZ6ZJmNKtpaN7BNccVXU7QWpJbHuAgmE3
	D6Wd6ARWlJby2D5iLYt96I6Vbs23JkjQpYbWGm1DbtglHTdOae7lrZbfrU1NvxCuC779GRym3CZ
	nl27xRMSldFxOXs33OHCS03dDvUcZxF4fLjsoK5nESmA85hLtREuBzi+yXuJ0azaK6QgtwfJkL2
	AGJ46xenUb+dt/BFPKj9cs0MMhxXRBi2b1kDGfveqRYvl2lUJbY1QqcoWxiEyuIgQTAHmsa+vKg
	GEUcgptRErHSyhoWjy9Y6c0Tp+ZNHhvn9Wcg8OOb8MZRMm5Q8hsIHOQpBx7bmDiUbG9Uzb+ZYTj
	6uM8DnOOghe4suBPsPfJ3LhuwpulaNeQTmQjh4rwO2jkWxFtQQb6P
X-Received: by 2002:a05:6102:c06:b0:600:d0f:bacf with SMTP id ada2fe7eead31-60295c26f91mr7717449137.11.1774279076028;
        Mon, 23 Mar 2026 08:17:56 -0700 (PDT)
X-Received: by 2002:a05:6102:c06:b0:600:d0f:bacf with SMTP id ada2fe7eead31-60295c26f91mr7717424137.11.1774279075565;
        Mon, 23 Mar 2026 08:17:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:15 +0100
Subject: [PATCH v14 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-9-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmC3BbPHKUcjTHe5TMiO9yZ10QstnZzV0KUR
 6F5bvI+cXWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZggAKCRAFnS7L/zaE
 w+PoD/4jky+pkIFkSZLdWX+ThdxlM9RmeODxR2zkQT6LI57HgVk3z9BMCHOQ1Pz+OT/TA9CQ9Pa
 hXgiG0yEC9HzAPG/BRj2TrT9xW2Pd3uWJC/YrJ8K6e7+8StGnr4i4blBASj2JACX+3grCEa87ti
 l8QZyxaI1lf9Y/Bdp+Ir5qD6Lb1h36J5hTJpT/ejECOzGNWczCoEC4WR+gtKErgAcAN9uLw1dF6
 kEi8NeSIepc/u0MZzAg8gnbtpE1xbg6DTk4BaoKY1e3u03BP3+k39hy5byPZsYjR+kYrTIc9BHs
 EJIARINSvQXi5b0xbRSRU2aptScYC6NCtpSWErfUnjQKay6CX0/nL1/9QIoLD2VKNKt67Fud60n
 +9ud9d11eAourrQz8CfxHjzcHdjQiyM6QdY9pUhN7vCZmQUrgoK6n2JuNSgkgeiuH+EtIKdY+Hq
 yLZlRPPr7bAIyoy6jvD8Gm4a960+4mhH9mBmGJLXIGhF0fKxgesM+1MR3rCce6C4nVl5ou37pxu
 y/kX3I0mvNVxEPsUOaBNciWbXxzlo/uUK2EWoBcv8ua1U2pQwiNJpWKSNpeG04FEuim21W60srn
 8XgoXRsMXbYEDQX0KHMLCjwltIhidgKB3zY2dSjwTxl5StlU9tp7jJX4m/MOGFQqqobVMylscmi
 yWsF24FWKBVEPnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: EWjzTjVVh7Oee3RVuGYmUM4UnK5e1iwZ
X-Proofpoint-ORIG-GUID: EWjzTjVVh7Oee3RVuGYmUM4UnK5e1iwZ
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c159a4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfXySjPGOnUIrnM
 AVxd6BCwK7NNr67cs/Zwvcn/bjqu6P3wrbdCFMHkzLRdAEw0EdtfdDZzdWR+THPrE3QkNdoodnO
 DiAiCYaNSUvUGWCA4jIjRk3WDsvTrU1MpGqODTjyYBxSwM6OxLGTxr7HGg3YISzLq0mBQmk+xNz
 mb2h+1Jeh1XbvbNow8UAm052yZve7a112B6OPleZU6+LQDi97OvSuWy09VB0YEZRaYhvI/ugYCY
 b0E4kE/FdLg8bdvmjs9iNg22aRZAqVIeWbAuKfdr2+8G31qkVIIzML0ainLhc4OKfLGFJR/qj45
 IfA8kWHuO8LteIYpV2fJye1Y4RFJoOOSds3T+gCGAng7fJKWvsf6wbr6WkYsbbMj/sQV7uQGVHh
 AulaJff0x2rYyF9WEn/HQMTLnYzzt/u4cvu4+ftl17V73bIih2omiurnSi5K4b24LFh/Ryb31kD
 qfRhYduCP4awohcyAUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118

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

