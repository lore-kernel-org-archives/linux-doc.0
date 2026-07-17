Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1C3EAC84
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277441; cv=none; b=OUb6OiEYfYH80UX9Xmyj9L/wxpef95U5mFakXmtlwbuYcl6gihHbpdCmnBrWc2qwZDRhZpgk0K0rTHUklGqK3F4izsu7LVg3SdcdD5WDulEfq/zht477ZfPR3Sq+Dy5WWLm0Ij5LL7GrgOPBiglt/kPZ+wQVNtAVbqeBdhBr1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277441; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZAzP2xIvoqqBPSFtsj2+iuq+B/WfxFvFyTaiDjrebhvqOafnnXvmOJe36MIOrehejMU9k2PzJfP4vcHz0Gh/0VbvjGGTbN4MfO7V6OrH+xRpOZuei414R09hHl9xZTEF+nPuPlgYG3+/x+ZGNGVqWUfRCIH+7WE/3If7igE03I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTy1S8iB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvJIVYj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTy1S8iB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvJIVYj1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cGpV1065339
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=OTy1S8iB6TaJqvH8
	WBdZGq4tVrWuweX3PSHP3SDE7XwhjqUU+ADY/tT58Y1caBW7pW01qJEjT8E2ll0t
	gNR9fGLBfU/OWw3NrNOmG8ye9fYpQjuIKAa/6ov4tQeqWcjcBCKwuEdS2OaPXsmP
	sKEOuBGd1cGAv7L9WhU/Bgyq7yXZR2hZuiRzO+68gCeWYCCgQlf88tBpzAWECR8B
	cTNMerE+iEkmrf6EgI1PFFTyktjEjwqd+QxWG2eiMS6L6dCD4ftvYLRsIK9XCNcA
	UmG69l6gN01dz8bF/WObCiuqUqnt/SDs88ahL4ComeloK+SOnRw9QmjtmwkFSDbL
	NNNNng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquh7ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso27430501cf.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277437; x=1784882237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=bvJIVYj1ad2G8Rl0Rkp9mA7L3xsoVYHdNvnmC9AobL39X71XOpOvpOMtHmdo8YDrD1
         IwlVmbFbQUY5KHlmJQCa2/TJovqdofR1HQjEfHgry+H0IEOk4nkd2NHE6qrnyaJj7rTQ
         ABxCwxjHi0s6Cly0OlxC3FjWfPe5DkaYRjEpwAv8np/cUqk0ZEpnhACM9g0a3At7Rye5
         bSn0hY4q7zK/5bBG8VNrzbzshoZm6RGHNIDBJ3Muzmd3L29/2dB0Rz/AufVD48pd6iwZ
         0DG8D/i7SdgRltoJr0WbasPLdCF7BKQHEafpLaqMlUcnaw3xFw8/3q04nCy+kZk6E1fr
         QTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277437; x=1784882237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=F5iwU6dUkskjwjXGW4OxeX2JlowpQasMGM6eeNmH7qEcGCPOq83u6uNC/eP52lUFqO
         vxSCMcy2bN0tE3fsOqjF0uiq9jdkelWUa47M8GGO0A7YtYgfeUyOc9RMD7y4MplLVlUw
         carMVe5t1c++k4bcGraRxDJX5XyDa2TmwgNmqDyygtaVI2o573ng5hX59y5veV198se/
         ZCertpK4ZC3xmMqt+iv7kOJ/1+6DtjWoERnvTfVXgMzreWwfhKvudtX8/tzvk8nNZLyj
         hoSrB+qUGNw9PlNQtdvlDVvG8ZTNdJFoG/Gmo8WnrQ5Lgvp7s9q1C+ilLVatHKImFsPn
         2a2w==
X-Forwarded-Encrypted: i=1; AHgh+Rom2gEiOIlwuyJs7d4MOWyAQqP69xTkNRVekzBNBIJRmiFE8N/0ZnrYyNlbdwF6lZvr6CkNVgtr2OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHVOlMCRYfz6M4zq2fdbVmHmiUNkmpkHEcdSFYxBPhxl54WPcm
	NTIy9nP1withh0dq2jUyErp5eCgVsZEQoZ8E8eAQyo73CVvH4+mKV4kUukZffVLKRfKmh8tCPs2
	/aQfluuM987IbIHS4HGi7WRHpzanja25hrQjUtPJ9IXrydr9DDfWG9qUi6SKEMNI=
X-Gm-Gg: AfdE7ck6bSOj1dhOyfeBKgZtT3DOwNIO1utryrGrjH1erRk117rYD9E0zEUhmbi5c9a
	/BoTaB4vmGI+Lc4e1fiBgch8lvFiHNmuhFPFhvTVQkZxBi6/uqDrjWRFVhk6psb1jeKpPYOYd+d
	jkBYQYKuHUAOw1RqswS2QXHF+bssFK7Xv87KR6dq/Wc8v1QGQOl1Rw3xIB7wSJaYB4kFJihE3FH
	C7gwNAJyN0Ij6KdVRBQ3sGM3qXP/Tlea5fUt3QT3rSn6Kx+5R5KKtW1Wsu9MWHhs7uBGsd2xjj8
	SNbr3Fgpjm2reCQVl4sAIf/ZedebE0n31x7nYpNBf5/4CE+SgitS7uHObklzBri5UH46G0aaJbC
	SuMj/EPjO4DwrBvgmEr82vpyOq8cmYA==
X-Received: by 2002:a05:622a:1e0e:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-51fbf3c1556mr60857931cf.12.1784277437094;
        Fri, 17 Jul 2026 01:37:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0e:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-51fbf3c1556mr60857551cf.12.1784277436672;
        Fri, 17 Jul 2026 01:37:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:37 +0200
Subject: [PATCH v22 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-11-ff0d18b27246@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemfZMJ4DaVPL4HimdLsqe2sPp//CG8OY3J/W
 DvqS5nNBwiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnwAKCRAFnS7L/zaE
 w7L3D/4uCyH22h8Ds4sXw/INGLeQEZEBStbObfc0rUoi2dXWKuR+ZrjX91ZPHO925XylAZNgY/j
 mbgxPXgul8wZQryCtCMGSTzoA5qGvezACOfNRpb3KCCi4JK+RT4ZkK0qGU6PL3xRkNwJbBJT4It
 roQEwBJ6ttQBCK5m7hI2pfL6NgQOiJ9/ctBpOemzrrs/VRi823XL2Xs6iKU/HmcrtW4mKg96x+3
 PWkXNZMmTxWXAqKudsnCPFE5W6+F4W1cWdZEqZrozVMBa+Bxha6jCsZ/Q0w8LpbgK/JOxvaO/h2
 7kDQkQMV/aY5oCXroRebLOgvLFj/smA3wZuT4efSLR7ycE2CaLE+KoniMlCSYIGRSRQrPe0FGj6
 5uDlSnket/7ZL+ymyCFFmZUZuRjbAeAhHV0mL+mVUrZ8CO/ULp1yOqgM2+/jKhrowq5X3oavq8l
 8y2VJPUTFqstKYM7KSL9XzAP1z/jWNcLeF4hBq1SElHiOKqpFU18FowLUC1xmni7W+7AoyUycz0
 +KiLtzzhcF4FzgVefhYFDAbfJs0DMiszM1o7Zk/WMpLWdh57s/YgdsJezp86Eatz+54ZCHUQfHT
 Wlz+jtYWE+8u9aEmVvXTs2A5Vamu+mmDLszJNZfbpPmXGzgiP7Gx41cfyIOnrt6jBbrq5sXHkw/
 3NztCJHWPTWhhPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: yPBrNDEswiED80FgY8yjQxi2KfRut2dC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX7/BE9I4cDlyR
 beoz9aJAjGQy4+3ve0NfJ0a1GBIAauhbzv470PWYmOINf4rLU1ouUbBocskHBniMbiRMXPEZTLt
 GMjkq0KrfScTpbf6gnIsXOx6r/TR/BGrRCgQY2WI1qa8aAx11FvBWakd/kaZtCpZT0uhtnh/Bhe
 Jy9dF0e9CwZBOHLDMPZsU9r0hdteKCDkfhkPJnPl9uGNkDJC/JZHzm/OenJarutJnwj81YAocRY
 L/EG4C43glQ9SrOiv349/ruK03nwAogjdTbOt6BgqQ1GrzulUGcc2NF0TXG8UhV9nfWMDNgiAaj
 dZ2pZi3CNTT8kyY7dFvOG92cZs0ZgmUezF5ZCruMy8SRqOgV0S8uczOTBz7+oCqv9X01Fa9C2Wk
 Za5V7dRjVAcuJtxe7akAwF5lw8EjNbmFib7/2Mowp9fJX47z5oQRWyfmMwupWBuMZN2Gz5t00tp
 9fIKin/gacnUEEkkY0Q==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59e9be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yPBrNDEswiED80FgY8yjQxi2KfRut2dC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX0FRfEcvEGdW7
 j4wu7D5wYgVMn95ZqSCvFmqhD06nQGO6LNiQ2QyMT6F0doF5l75oad2KYCuq2UtBi6XSlWV2ZAG
 fOteimPQe3M72GnbUc/bthzKSXYlTvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

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

