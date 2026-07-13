Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCB4229CA
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947728; cv=none; b=nMdtEVNzud7Zh/IOJHuk1u0yOKE2zG6F0hAZN/kz9ydUbGTyDW4baxtd8YNRCA9avKdpPnAjE2/u++jp1UQAGKBTyvidxIfSoqSkSdXAAVS0zQHGNVBGyWW5hsuEADq5oBBEVh7CTCVsx+XVTtqE5xiLvX5qKCcoYOpKmR99nDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947728; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eH4jKrVSHPrh4ERGnzcFit/Mw3A6lLgc2mAduxKaCMjTx/VPNVD0ok2J7yYeYthOy55OfCztJI1IsIN4zR4HcOZ61JlER1fJUkF8TF7Gce2UeyzFW8zxUvCxBArqWiKdX98CsNrvn/8UTpANnLq3zq1aAv4NPKFtx21mq1ZX4YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKwMSV98; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUujr7+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKwMSV98";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUujr7+u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCFMcV1506842
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=TKwMSV98S9Pnsx26
	KkuLfaI756DKEf7K1DTY7r6ZVk4EjqvMmE1y4JlOlD4eWyOR0e3avJ93fOj+eHNb
	4eSS0OQpeKKYUFCztUyDKx680FFfmOK1KtDpFUnMa2n1Itgu+WF5IVvrk19D+rvx
	k2ftv0WNM1S9fOy8odZoQ8no7SfZDgdfyCFkLVY58Dowjr0Clpb/R+cfIK5nAtD5
	BY/acZZKQ96GzYHEdk9FljFslVNeFGOdHkYlsihZ+ho0b0BtgJxeB3TzUvpLWgbT
	uq8l6kIxUFBiyXwOEwJOGiyD/BLmQ7A4OIDAJXtM6bbE3NJugJAjmMbPVT7AN1ow
	CYNBoA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0ruu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:02:04 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9dc0f5900so7412852a34.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947723; x=1784552523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=DUujr7+uvqgkN6RbtmY2tBKf6zJbzj3f5I1b+AamqWswLMWMZYuWdRXnGfGquvf4Oq
         o5h3EplRIt4f3x80WWSqfLYKwflTJQog88EaaE3L1naJ6DjPmln8VAsSh3L3RYmwpqj0
         tbArESBGjmiUXKR5yHqGUTRNtlSrblHAgDRiPN3VHAIlRfyCfsAkYAoiUGWVWrYZbf3l
         zYT251Cy99itiPRUQN1Ba+p1mWhjVpjPh/EmS9wPXKNo4qBIECe05PTSoz8ldR5bMnB8
         nPWk2+qW5OJH5ge/utkLOd1NscV0UuSBEAtjjsCGXwUR1TyBQCoT09FLvPFjKxflNuGd
         txvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947723; x=1784552523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=CZ8/sEaDOA0zDU0nwu3QOZ0KjX+HlQcRHnX9QAUjiIjzXBv1ggO6fmgbmV5LBhSjos
         +QJDNNUqKNSrlVZPD97q2/6Qc4nRYWleIp4GqhX0kwHZ6n95kM/kuvPLu0agl1Jb5qMN
         U2/OCpl+5Iy4CBpDWNnC6FxkwNhWIKGyNhxyGLMgXX6kNeVKIGzsCgI7er5UbWPX08BL
         7D/6UlnJkXEfXpoxiTQdjhXTcDofaVesQW4KupS9jgZKZIV9HgeRyPDJvPfTqgFwjA0U
         yKYL9fEoy0WmKxq3ExvF8tKOUNuEM0G+BD9fWovKQJ2NKeQLByKg4kFVMG4AGUisDVS9
         0lSw==
X-Forwarded-Encrypted: i=1; AFNElJ/QXcH9DIQf69jQKMzRToC9E/Qg7Bcwxow88Q7RHMImxQ9idEW7m2vsk6aX0UwNlsX8H7Qm3IJjXmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ZeYeP38x0lVcuylT83hNvZabytkjAtcm4OFJiIwVvpo2yvGU
	HWSFce7iAZjNZNXpgCTnHZ7YNQjBURnTeBx0YFusYIahElA8Vy0+sYtlIEQYc3ySrQQ0A2HiITF
	iwNRv5x1TDOJvyMK6CJ51iNlCQ7EX27yPMFeKt7quyNv3++f4s/51zXlcMdeJXZA=
X-Gm-Gg: AfdE7clEeBn+ZctTVcWXbn/tcgkYIPikfh2PkFawrqJWslqnlMU/kWMOWzuGxxUnskh
	c0LQahiuh0zQ4p4FvbCJMOzS31D8lBaEo7TbWZm9MOvCVJnGeZ8F0cDsLXw1pvtvzBgxi4G+lJW
	j7GEqls6mz4eVcjYhSMC14IXZ5TLkiGnIvj3tW/kQtuIXXw5K6FZ7oh/93nlXBXthJJGPCWMWZI
	yordidYiNgt7PZqp92XGA8MXqrhNXv8MmhkWqiw+mnbKPka9ItWBZwLEl3TVD2jVz27M5tEDsvZ
	UHFMSpUsbZs+rAx9tmsYCkO/FjxYyvDGO114nH2KzYQySptX19di7Gbjv9fnEUkB3qXw58wvWhN
	LEE5HwpRmYlzgzFZe+kM1ONm/sZOU523T7xRfDq2w
X-Received: by 2002:a05:6820:f00e:b0:69e:5e9b:a47d with SMTP id 006d021491bc7-6a38b887ca9mr6712875eaf.5.1783947723222;
        Mon, 13 Jul 2026 06:02:03 -0700 (PDT)
X-Received: by 2002:a05:6820:f00e:b0:69e:5e9b:a47d with SMTP id 006d021491bc7-6a38b887ca9mr6712811eaf.5.1783947722306;
        Mon, 13 Jul 2026 06:02:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:02:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:12 +0200
Subject: [PATCH v21 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-11-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGfa3qCCvUSTBUNBBBq4Lg8R9jvA1p2051gH
 Jtq7nsynmiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnwAKCRAFnS7L/zaE
 w4/WD/4hgXQX2CSj/PnOZODDHnT6Q80RgU+fJzQ+FnT+fJXkgjxpy6MXvm21TuAboGFwGrZupza
 9Vk7rAIcG4P1wb96wFHFQkbF+hYoYaMldGMV3zRdObffQgZK7Z3ZUkZoAkLU8q8U8LjGnGSaR1g
 KP4n1EWkH6CMar358JbT3NP781GXxlUxl4lgqlulMJZp6b9Kt+0W4pRtZvCzlDUP06p63W3pL5C
 2XejF+uAhdaGj2IcGhvB/tPsUfmxWQZX3I2qNLdIehPMkt4tBwTaWcvQSTOPD/3IIOixtzuO4A+
 oHZAmSP0RHRWw14tqZQkjxjkbC8Vi1StCibKANBELkTRxu+xyDELWC5wDENgq+u/TAkXjEwUNxb
 pQ1TLhJM+5FRqqDB2jJXdbZz6b2/qyxUDPZgzIuKDmN9+YDX0jRdn71ai9nT2q6K4cyw0j69Iwq
 2Mt4ydFuvKnpW7l3RW5+GPTkiQNQ5Vv4l+iAuO/Z1+yJx+YGQWWFRG5q+Y5mJUPslYyn6T9n5s9
 Y29vSuDdbRCeKwOvXopztBB2TMXk3ddWjVz2nvYg7LwNw2YZSpAffYEtmo40DIutQX7o5SMNUX6
 2KRuEJuMdGW/TkJA6Hs1aOckqLpgY1UdsFZ3E9Rsx5+BIpKbr6RtQlOespje+u2xmNsRyQQR54M
 AHNiypLa8FuVBRg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX4wV/CO7a9jOL
 bZ9bGOJbDliJaNmaWD/LUkMXSpY2G8e9eBYbJd9H434bfiaf+XXzvXMOJulxhuVw22Ggg8yqwbj
 2yFM49wyEvO4hfGorF07KQDPHAEkkV0=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54e1cc cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7tLo4pFhyfe1ids6FLDmkR0LyLhqQpir
X-Proofpoint-ORIG-GUID: 7tLo4pFhyfe1ids6FLDmkR0LyLhqQpir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXxF788I1/Q5sM
 RVAFyVs/5XVhHKWQd8jUztXqLQ0f2oSvUA2wlsZWemVRxr9kRxudklkMdUXEFBKnkeTohx47aPf
 FDjmX12sE+2ufTxuQXywiNWCQM6TGtleZxaXGQzKcssRmFpZja8tt4eiXWUjz+ZSnqWmYHRO27c
 v8pD/R2yGU7AcZqan0nDMdkmOIIax+PNBhvIFZYHkRpmy/jkcS3NL+FvMVgeS0RCK9crxKUjYee
 DoKGxAgcakY4LE9EVvauFbvp6djwpeC8mMe9sFoxMebya8FOJ5VzzvUbfQ8btO0l+z5p8SJwbG/
 v7bVxR4uckTNO8yrPkdMRoYXAlEpUYGIFfc6nfuqLuc+Cp9WdapjTItMNVxcXPgRqY72JH6uf5/
 3Q7HkusgADwHXnakumgUeV4iFXqgzfmJgpQUwh9psj6ioMj7s6wnJkgZsptwcgKGrF6PKYTrrWX
 9SG1/7a/+Klp4bbJ8Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135

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

