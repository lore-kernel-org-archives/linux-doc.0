Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816E4E379B
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196696; cv=none; b=Y0MqQZ86MGgBYp+CHyt3wyCBSvtTHTqnEYyBcNen68Xm/O9Lhotkp2KuEqA+sYJWbUWEFMyLAatAe32E0gHqiyjXLwlRFE/2ZNv8zCWVCS6zhErLNRYrhhnLdxvCG8wO9Ppz0LfUCxrEdSA5EeEb0xCJs3r0iQuW7wXX8g/H4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196696; c=relaxed/simple;
	bh=dAO3Z255k2yGXbKKHljWmfMX0+7AVaeyaum6kFL1QWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxI63J0QYEdykhpN6sC/fKywe3en19pv+VBGGxYkjauQi92VGDfHio7joNheELX5si78I9ykYMrKc7MvspNfNcfWnNwKLKfPtlQ8f/nlHrLbVuf47woKLwRsGqWA7MYCEj0h5phzUhqh5bcpDFPqPJmlTvXux2fUhL6IRZ0eg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDAipbQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cv8jwuZg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDAipbQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cv8jwuZg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J86LQe1146056
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=; b=lDAipbQpmkAng+Eu
	KkGXJ/8nrstxmlovaUnE02drCwjr11UJW4zWjPbS/ZeLkhh5YN1HqmxtU+MeeJ6Q
	NiU/SAOXBkc74TOzwmmQQXrN+jVJ9tnOvx8SXT9JxwNQeIYESJlISWfuYRlaR4TP
	Cl6j7gAuZW7IMVS3bT6lc7GujXKg8eaorbRXJ8JJU4zW1N4IIw6BXHrhfrP6bITh
	/KUfAdzh3gb0GNrhv89X4Bsfhm7OLLcLgSph4hCo0pzjrDpbMZUVxAvOCKSP9mh3
	3IyPODgPDkWX1eZzn2GXJC6FA4lBAjOJflVTPDdiCBk8exg6Lx8J4dzmq+4NHfHa
	Ay+2Ww==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ejmxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6961bda4505so4197353eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196693; x=1779801493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=;
        b=cv8jwuZg2p5AoL6HIlsyTcEsW1zbIzEgIqZUZU+uQl6TseXOY5b1jO71AJO+kTCvTv
         1miqpMEqTCSf1YSb0quVyeQuoEs3o43w+FF5OmB1tSmNevwxqPzJ4En6EkASniDqOAT2
         bKlVXZktFH401syj9mMfdYpW4L0UDauLvI7wqDAsnGoKXgJ9DU9B4Ap3MbqRsNcNFe+i
         EfL6RSvatcpUqh2as8sWpWqjSP0xaUFTE4e91W68/f/WUUc1RImK3DJCe2gj1ZbvM4iN
         PfhVbo14gSxQZLvWPEQS5h0ThnUXbDLimdXGMix6dQ89P90PZJZsNCVt+6xhDdVpdnmu
         T2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196693; x=1779801493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=;
        b=VWFi+6WMY8qTCqVSqdtBX//HUbxvdXdlhlUZ5e9EFuWJBUVPQuh9OXA3Kdx1cttJTK
         1g4Evnvg1fSETBicNADO+G2QKlbHTX6j8w0hSzM8CwIqP+XN8lNvUGnfiBYqV/rGfYgx
         2FsRdCaIB7Cb+t4zIjPKVWczqKAbDzhDgiZvToZu+xDXskVdm+v0mELXrKT/Ha51amCM
         MvB4aXjdAf0BeJn7847NddMt4XXCVaeNt8mL0cYFebTLbP6uI+/T8sSgRTMmWXaMaqHF
         LKD6LzYRxnHyPyT1lNyabnNKyhnSIg5m7eVDenxn1Pae9CM9aAnpK3a6bQWwyI2HDEMK
         CW2w==
X-Forwarded-Encrypted: i=1; AFNElJ/qF30uxsP4KzNBwitsl5/xuMNPYG0OuouHL2fDiCsCpn0eEhzDaYmhoVoFaAAs29rAN/gRcteka/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YytL23PmHk52EbpEXiVPe1t03G+io0SXeP9Je3NhZmwZDemDRwU
	QWM8GgYOrEw1b5cOZc0zaFuSvgacDFRkQhAQkR5PmQbN+86Bx1vQUa10KL3vYjShYcoCHHTxxoF
	bRpQQ+evbo24ovfnzN06oOMBhzKZUzroAu5XR5Pj8X5VzPAUbJ6lnEbxc2U8k+DyakMnO13w=
X-Gm-Gg: Acq92OHPhyDj7FmMPUXf+ioadG/NhTsqqoVKjFIEaYY9Yp03TDv5pRSvqxQn6F1HtNd
	dUz6v3EThtt2w5WX8kH7bg+xqCBQ9Yab8ezJAhnyIHmUmkdPS9BOBt88Ff8hokL1Wcayd9NkCR3
	4fhHJLq7Adqkyozkab2q2gh1mvpHZEWicLvUSKRFB04DlEDRR6KRupr2y71O7MdjsEf48Br93q1
	SkDzHFo7MgZtqXUKrH54sCsA1rb+HB6cTs6N2WSFCIGEmfccRAdXKWSCxxNAowZwVYSJkz4r1yS
	lm3wTj6kQys2sR3xkCu5aKPEXqxPR2R50YrCpyCHawSl3kkh6a/nmazMbBfAEO/43fFnqD0nVws
	FazApDx7oGcLe6gPBIoITXuLQ45D1KMRNt82gwCEuS4dModPkw/g=
X-Received: by 2002:a4a:ec43:0:b0:69c:5d2b:4079 with SMTP id 006d021491bc7-69c942a5fcdmr10530450eaf.6.1779196693240;
        Tue, 19 May 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a4a:ec43:0:b0:69c:5d2b:4079 with SMTP id 006d021491bc7-69c942a5fcdmr10530424eaf.6.1779196692725;
        Tue, 19 May 2026 06:18:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:44 +0200
Subject: [PATCH v17 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-2-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dAO3Z255k2yGXbKKHljWmfMX0+7AVaeyaum6kFL1QWE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMCgf4Vg3jkO6YzGQwECnhi4cg2IDvJ0MkJA
 qlIVBYqVvyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAgAKCRAFnS7L/zaE
 wxwyEACRCzcpf1dcbSVhnrdOK6MTf2WN4sYADdEAPSBg7UExvO/UAPlKbl4qWSCdbqI7Sp30dam
 1lBBbBw7SujcVDWQOamidvxiW+AGaNdHUcEO95FhuU78gpd7ByKTUz9+xTJJBisemx1svtYeCiM
 /UamzNbkqavi9AYibWEmWiqLV6NBsyF4Wcj8QSFctG6xl4TXXIl3tU/YElUXqNDEAedNpITQxaq
 BLXyS2cNPubCFvc8IVp50+o1k1MQB49qODiHF7laucTjgmGc2h2PrGBJWY/Sac+ZdEIipgh3DpO
 Te/YSMpogxRkvH0RnfWBJTC21Zt0/8OytQh/sOit4gptvQPsk9dEw6sMp63zV5ugFRHO1HE1kBc
 spfWrUXezLFOhFYBDAQe/N/nva0FOAPCQSpSjXjd8iIogCHEvZTa2VeWsYd4ZTrMDjF71ubzULb
 QpZ21NnUvQdw8tuB1P/TMzsnSYAOmLlQakLkdfbZwgPtLzn390zJOHP1c0JQp1zrkLZCCpa1utL
 zm96A7yhlH/3WgAxb6tAPw0nnTnT63U3tCAuh3Oq6BCq1orm5VsxFbJq+wiI7Tt9ypKCngVCJyQ
 pS12KthdJkXwzGsHqLd5FaTC6o2PhErY/dqeq7lFpreydBX8FFGYQ32CWybUlG9PFI1hqOSwvxg
 K59ziLTDl0U8l5A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c6316 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 2aZN2fo9a7npd0CclkW3K53hO3lt7Aor
X-Proofpoint-GUID: 2aZN2fo9a7npd0CclkW3K53hO3lt7Aor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX4VR7NOW+GZ/s
 ISzSkjnJ7wLezkj0p9XAs7O1FwROwemVXyohC+XOGPQ21w5whft+/7ticvEgkAc+eCwc72IfV0R
 iTm7dE12pFyfUDnWfNSldnR1T0ZRylObbylf4pAaeIErYWeIBZuM0AXFhMoOxMLs0iaEw0JnvZz
 hT8qErNq0NB7XkFoKqpGxS8rUnquud0WCbfS09saY0vcMP4Hp8hqXSiAcWVp57tEA6TSn0UETqG
 rIqRhX3gRV2p65Dv9LTqv5YI8gQmItkOSA0wgSWrNk/YdeVeQDYpZgAJGKdPR0u7k3FYnx0Ttrh
 s7oQSr2aD2aKpEULw9YGB2tMop9iLskBfGWynB3XzpdxOf1Ij0Uj3Jg85NJQgR+CcukmvmzOyCd
 3EmQ/LyWg1VswUi8rbfet4BXbe1HI4sqWtKrPOXoI74ZcLrTmCVl6jO7xFb0oQiBR6mHjc/Ld0u
 ejEQahjTMdcX1PtokyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path.

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..cea44833201d641ce6a657840d354abb443501b5 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1302,8 +1302,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1336,7 +1335,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1355,6 +1354,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1379,7 +1380,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
+	free_irq(bdev->irq, bdev);
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);

-- 
2.47.3

