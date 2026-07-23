Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B484734F3
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826601; cv=none; b=ko6GSIZi7xFEfi7RcFM5oPEf4e3ovz6dpklY5Xl82LU/PWPC+DKuPQUhOyOJwsSYEYt3gMVVmnjNsMhiwnaImrrNToYLMeEZT68EnfyKH/e7DIHrBFWYybhqZUGnzQHwrMjYR6xrGJxh04SETkaD8a/i9JDMy2hxjlo2YOXWkgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826601; c=relaxed/simple;
	bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDPSjpWnbsr7ZyN+EFZ+wh72pHW0D5kr49Z47H4gk9UoQk6uujkSRmnjOyUp54FSalHs1mJxA/iiDwWtTc3DWWQ2LXxUB7LD6iYeZ2zoz9ac9zRZf+t4nacVWCIuOrJNg5TdcITn8G2c5szrtZ1pbDbLYU3QzAGezXs+Wszwht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orvzQi1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSGHGfuF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orvzQi1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSGHGfuF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvjSJ4173023
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=orvzQi1KLIGbJqyb
	Uet/ZTdsuMVFNnP4RsH0E0ZTynZzpxphJfPAG3ufb0QjeYMyRLXRhTJGbfwAyKhQ
	SHJ97xycouzpcMWkVyR9on52d4S7Rhga+bFoLYvwYtKRjyg5jk+pN+nVrEIgvpZb
	+AetOHg5QQlOxTxkZ6lRAfzU/TLxEkHJv2qxZ2hptOVWcUGMO+2gtrNjMU9ZligW
	FfcjWT3GI4f2hQe22LaG/Hf0TcRRiUPOxLP48n5wbKOitqkQSB639PTk4Kfj/SqZ
	/DSyEMBrlMAbke1rr/aciOAH6cSoWqEgk8qkFlytq5DoKV5rCupDe3rVFFrUDFuE
	A6Gr1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qjncy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso15153651cf.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826581; x=1785431381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=eSGHGfuFWIrqr3ypIku98UyEXZso+9/xPgA7g55IBiywtyEsX89nRdp6XVg7jo5Awe
         XQYMc04RiZALKaRsjHvfBghJ9Ii7jJtD+RAgqrW0l2yFe+8pQKx+j+37wctrgH6aR88T
         XeEVLHboE2NY7cVBp2z8FNvaaY2KkbfmPgOIeI6WZKeXhXdC/gIkfaXZAiKZ2rWWLr3I
         tLRUpGbaEC/uTrQLDe2jsUijrrRVjdmIyDRWRb/QnH2SB0y34/ETUyPO+IQDegcTBTXI
         hlADv1iRc7NH72vw0Gg2oWF5hge1C50maHcef+iXRIh1obYdZl8Q5+9D0M0qn7nTwG62
         5jEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826581; x=1785431381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=WAde3zIUDJz9H2Ta8hGlhE5p1b2ONgHL2hYcVabHvDV08L8aS90VO1rZTmwVAmZ1Om
         C1ilVFqwrQSOiG//ESeAyT7ccVKSgfGzD2wQOkXcYe4kFvxG2J/8RjwIIQUjsYMrJewk
         L3GUyMq0USpc8/HPLyVeKMvBUUZGRDgVwRYb884mFhienURxI+eOXz6BpsqG6VoVjOf5
         /xrxpOatTFjzstNBBn4tadK31T5qLJ2iUvBv002KFKulDXCA6/l+xSu8kOEt8l7ZxGqu
         3u2POXEl6sipp5pMSUx9aAwa1pyEGl5TloeumlgeJGLcyC9yOx0v0U2WXGJlMdyFnlcG
         cBvA==
X-Forwarded-Encrypted: i=1; AHgh+RoZmUU3skda2wGUTst/UaMr2r1rhapZr31fcHuhyYg/A3F5N8UJjw/uyg5Wl/w3dOtpFAjjtxH8idc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMQ8qWZd7gTqskNLDFvMrLy1lOi/czGyrwLOg8Rc+NfMHg0ks
	VVJ5iI4sHLvD18515uZLHQGi/W5LK6hHxifhP8fFs1wCO8TzkZCUoblcQYAJcmSGUoAscekkFYL
	8AePN1en8V5kr9WQePrREWgxVX6KzIyabhOpKTFBvkwUtDpZLL0zuXVuNM824W7A=
X-Gm-Gg: AR+sD12SJIkV1MfvuN5vOeUEVVO73d9iabzpSjhqtYMS5P+kH0jqRqw5j0BZ1QzNccJ
	rMFcelU/20Xbsd/dIBkKt9e2K3Zkv6QbU8tS6WF7PAvXfg51UKOhq/vMmbnpyZa6Muk1LxztnMZ
	6Ly2XfNOf5Q/VMc71kIXeqjIl+UqnIxpwVAy0kx1nLXlnZyvpR+SdVdSmr87k3ToEz/QBipc9RJ
	/O58FetQCqMNxKrBz7mO8Ovx7IqUxM40n7M+SHuvaqDeC3zLjdfLCzCuZPZbhH45KYnhPWX3dFn
	Khbbn4eLgCDvlXZLXVXsJM8poJ9qyWtazoCvj49+tcB8MYwvzJaiBN6sh4LG1qJR+nOvDWlEX3U
	ya1GD8oRHlXySRowCkEw1jOYdXzON
X-Received: by 2002:ac8:5fd5:0:b0:51c:c29:d4c7 with SMTP id d75a77b69052e-5283dfc878fmr34791621cf.62.1784826581178;
        Thu, 23 Jul 2026 10:09:41 -0700 (PDT)
X-Received: by 2002:ac8:5fd5:0:b0:51c:c29:d4c7 with SMTP id d75a77b69052e-5283dfc878fmr34790841cf.62.1784826580251;
        Thu, 23 Jul 2026 10:09:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:08 +0200
Subject: [PATCH v24 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-2-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkq/WBUoWLjOzExA79z7UMdsm0HF5JKxlXZxt
 tTjR80KQnOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKvwAKCRAFnS7L/zaE
 w31CEAC5obaMMhHtPfFZmXXLzrCNZlzYHp/1Y7abX0djXAm3vL4YOq7s6EXKNbKEGjg9uW7MYbk
 btwotFetGoy6sfEuM5e4PMxHWHiZgWqE1vuWcnnE68ugoHN1nE4L1cOurCeFcjNNpdz+48v7qcA
 ykOLqNuTJNIduqr8zgFTv6oTWswf9y8Z1So7gfh6+IMCsLZCYNipYtJqNKpMNFT/Ai3a/6jgh1N
 B8VwOSgLmfSSvfscDAJhx38ZpZERlZMF4vYFvLmOjA8ann1WjGimov1TbDwbiswXTIiypqRuRsb
 0zXSUTWQ2FN24NVH3vnekWVQVZEC8AwRsq10h0dtkPwFR0ivFZEypRbP3p/TAZJIdpkIeDLWd/S
 gBvVCBGSZkpJzHGGQ0edBPO0P/NO7qYnW/ETpiaeO3URS/Ag1Kv8JWcwboZyGGKO1KKX08OGPU0
 a0uSXrqveSC9S1PVv5WXvSJjGfYf5xNq5W6rTgGc1vwJEJquNWjBTzHSxACzPKu2ushNcna5X31
 Di27HDYFOe2GUpzSpSfyNwgxehROjGBPOFsdozayswtBqfRfOl3g9rrD4vmmJgNmOCp9blU4iZM
 JlSgH1heKvX7U3peoeh1GLQOfef5MY3a2/xlYNvDt6RqeNbczORhD7Q/25BkIkl6TiYUhAXGt2b
 R5JExTs/jzzLuoA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX9hSDV2XQiHV4
 kCbfL5Z8PGxWJ7jwz1B2284sK5N7CfCOK598BkRcD6WEfR4ZvDutTjweg+Aix5fGpSSt5IIlNRP
 5OnrXGMYiJ8pEvCQmqWVVdTVc4xWNSM=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a624ad5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: _0y9mAISjblBXGY2jPRqgSF7n5yYa5tn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX4+TS2F6wmWd8
 76D4hhWsttJVPkK0GB3X/L9d+TgaJj/GYreoO5OhylakuswwQh76x6RAPKbzvG7CzNKimw3/Z5P
 DxWCdZR+qOth1nC+bG9ehEDdhR6+wkrKEassGjDY+vUzX7vDEy2lkx7fAeZXyr+2w5L+2m/x2tZ
 iwyc+IdhWC+UPCj0MMzYDnBLaucMtGjB/0ZvELFqeHh6HEldnP6kUxGvdt2iepI4cYuhyZwbE3n
 GxCaC679bzMtAqF1lu6jZB/oxwqM6JpdUQ+1lXcQKxHygmKm8ykEV9GEP4tm3FOgDpE79CqHZ2g
 9xKW97YmLbXNQ3OHiem971RcfXWSMY3wkvE4Byxw8/FA+PeO+d/xi+D/URJSIaKgEa4PluJMeiN
 3BxqoPY2/esT5TpUMWCbHHeriVaMbj0Be/FakJ0+je+5/WX3GNlOAoDp8QqUjwcRFBcJkGqRb+v
 6nReFBQz06TqHbpeJXA==
X-Proofpoint-ORIG-GUID: _0y9mAISjblBXGY2jPRqgSF7n5yYa5tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1365,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1384,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3

