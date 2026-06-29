Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7033FBB69
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727296; cv=none; b=UX2+ZWrGF1JlQ9YaC7fOw+3+h4q0g2Rt6PqeXMg+jXdUFOVibi+o4Pirih5mGEaFdW56L+UAAdYe80YKMRHtLNjYTCi2jFXcj+gBrQJhWN+oitszmq9Q1Nkvw4rJuohbI0dW6Lg+s/f6OG+MxmpwRksBKgp31IFXDyRQbIN8wZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727296; c=relaxed/simple;
	bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQHCfykMEIV/LWs3atHKpanPAGEHA4HEIUjUw6RHZwmWHG/sEkzhN6L6K3TXkfrSkXdVMdvmVhK6T8MYx9s6omUDllPxN133rS1y+eKv4CSaS+dZoBUpnC3YiCLZBleImrGJKo/oxADbdFC+AJbvV7Q7oCvcMaNa67yS77uIwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzTrnZrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q1cYARWV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzTrnZrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q1cYARWV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dq5I2188726
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=gzTrnZrIWRjyuGAM
	OyqYjnhrfy0iiRcMz6IpRLtA4E4RQT4QnGZxauvQUtztx0+CSnejiKqcH2Cgfpxj
	JpK3wI7V/6Cg3/B6km6VMu5IFeoSEXwXZYriiU1DzNISGTVIOQxH91+xD/rgtsjZ
	b1d/c/c7dGSXSbw6Yue4Hsb4bEhwtSVM+xvy7R4DEJ+3jgoAIU5Zcm9OJUFuujAA
	ICiQ8IGIbqUV+cn3gtjLDY/F0qDwPxWQTDnce5GFdEAaWSO81keaCs+D3+SEaLa1
	ghAL8+sVy6IPRtPDrthhz3TUm+qBVr2ySb83MTr0Ve29ErT2kUqySWo8a2FjZcmO
	WJnhDw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trq5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-969289fca9dso682327241.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727293; x=1783332093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=Q1cYARWV1dv6F76oxQAWIvbAo91MNdHI7m0A9Yuwq7+cfSUmqrBvfDJqHy16ZxrQtC
         xs7WzwMxj5ep0LBb6v/YFJGYUIsOXQZqVrYZ4pHegwHHjXNVTZlLSP6CeTSgEQf0I2PY
         s/UL55tsjV6RaHadP49tR+8OJGiB91NRy73dhtJuXUWWUfxXeRg3YvswcUs0Qh7LQMoU
         /Csajdl5G98vnpUiqfuerUOXia+3wdxxwemWVnxLskjblpJouQfIXUDjjo9JbHBUdkvt
         wNiIh3Ho0msPTZ/V1lKLkePs7kIqRfHQaMSfqP5aouevUxPYYxwjz1Id8K6Qqx67gsUo
         8EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727293; x=1783332093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=aEPqruqT+1pbwibkjJ8F4RVhC5nJakTr09ZmGJG0/Qo/uE7awW8//42eCzZXSMShB4
         C2lfXjNGhpIIG5pp3hUSNCcA/zHY2M1TT+B/G01kCWnesjeGF/C+WR5dg5u6x6ryqFGo
         MQbSXVppo5XzZTEeeecKbnjWBxuvyM0iQ8OkAv5st6+hf41ArMvD0JRKWlUaCgs/57Q9
         jVhlk78CwwbfX5x1dW4/8Ve9j+soZsUYuu2i6ydn7LqEUkfyRqmdOMEdH/1Rlorwiuzo
         cv/E+KPZCXO3xnQSivpm/Y01YHW3hhLo2mEDDoHYCF6Wit5Km+7pzG68q4OXZASoMfgG
         0I+w==
X-Forwarded-Encrypted: i=1; AHgh+RoszbfPUOtvLzfuyy17d68sELOMnRZpn3lSyEf9wdr0VYeFbykIG8wNozcHztpui3kV0S6uZJOGNh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLurNEsYJH/ASXAv5jHg5rDAh2+VVKUMZKJN/OR0hFshx0OJl
	iWI5HYWu7B5YABqj3XVsxeMUYTX0ZqMkMZGInxxQhh87RwNwPUABGaE6oOOg+K71XnxdkpFLml1
	25tFGmSRxf6xvD3Mh0jRuJr6TkFa89yMXHT4bN1IUHJC7OjVU12px2P1XY1E2dSg=
X-Gm-Gg: AfdE7cm75cMdj/xs7rcywzRVlS4LDAcBty4qiOFRhI25xRB7ChMIfvBsgYz0t4fwaJ7
	1Qir5wPxKmseaQaGmZNAgYlZPjXeiZ1zLgH/802M7SdRWgAtzmjTwYIwe27Ee91ImpzVh7O2JFB
	h1hmRIzhx8udYlLbwzCb7hseUUYWiRnbEzFHS8q4g1vEtglJOdRi08ASUp9F17NQQxScFmEVwkM
	ibRmN6rr8qymx4uNr81FAg1Gr0YwhsahB+rERPUO0Mm4//voKqECNhcFCLYy+N4qUzGVo6SS5fX
	IEIylZFkKrKy7qsIyS+luCZcUzGBLFuv6LoAPVIIl/q8Ho1Dqj5pVLy6bIYuZyDIx7ezRgzpfyA
	t5CTLmtcyF07tP4PbVjRo3VWfoi2xuZmK2r+7NcSQ
X-Received: by 2002:a05:6122:d1e:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5bdba9c61c9mr18236e0c.7.1782727292838;
        Mon, 29 Jun 2026 03:01:32 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5bdba9c61c9mr18114e0c.7.1782727292310;
        Mon, 29 Jun 2026 03:01:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:04 +0200
Subject: [PATCH v20 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-2-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJprRUolPJe/4YhzQT31Z4wc6r48G51XF/tZ
 KO2XV27o42JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCaQAKCRAFnS7L/zaE
 w7lMEACqSAAoFegCmmR20sFZI3Mespj76ohU3JQKkxAV9V5VZxXj5XItwyNXet4kzFNbH23afZ3
 yr4yHbPwqVpoXvNtfSgygW8aMeDD/vMcaYVNe/3CGcFW1bvIrWcCqpurlHhXnq++HywTbG7vMQp
 bDnYIaJNOP/GS9IeJXaJC8jQFhT7nNU7vGfnzH4BtRztLopZHPVMY8NbvtRkoJY9T2JNJQnMikm
 2OznF7ujrCXqOaCHHY35pVRRn5ggbcYyNaoKXwAP7d+qVXZuJoK8X0UnzXVJjaym+75FzB8qA8E
 VYtoq5wg2cDbPiUeHGmE+AZE5ydHJYba4RlIIP4Effx/DIPOCcymDrN3K4+CoUkm7WsymNej8Ac
 jTpTuxFqirZ873P1LK3kvuAc73WeVm0T2GogHvqS95nWuN3usU6kqZv/iEnJHXqAt41ihzWvalU
 T5Lna6D2rH24MjRzs1iBGrWhvOZq+h9YwmMRdULsPwA18h8f4d5l75QkxOZRYyihnN8Dlbny9oq
 lppF78b+HZbc0xSDSU0yHX4yyqL7kURJrOUDJrlVIZi2GONLlWg+ZAYX4cGy2++i18CQmxjRuI0
 bPwsq+Ou+WNm7IhVZxWwPeMl4vreTn4Xp3M465IqabQkFBA56XkQ6XYbck9gnUyGzGrrcR6Hqpf
 3sLn8EyqyWe0FDA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX+QF8r2+ha+Dp
 VX4lCwDzPGBeDJk7tTVw7R+7Qcmx5RjPkl/1MFWZvYDipVNlWndokTQ7JSO9kGUSKKwfVr3i99Q
 /xzEMDKyevYlDGSgoM4vDgfF3TIMbS4ZWpk4Rdc1huSlsuSrRmR3kTUIPLDECUz7m+FYctlSc/H
 +++dijlc6Zwg+7OXmAPp986/jj4kYeleTu2RxKUhuzxJpjGszAsIQbq9HIHjjTO3fxPR+yZJ1YK
 TwgHEbWhK5yLDSETkheEtzsua4hBNnWkQviFoSzr9j4mop6iXiSV7iJKwRNWO9FvHkUlOOBDRWO
 APf9Ow63YBxinW057D0YQXf2Pjg95yYGrFCcVpI5tvxXpNfjHPD/VmZbEs2bDCUH3XdecINZ6PM
 G+iW6evx6MpJpUA0AYlOZfTeHF+rpSZX+ag65WiWlY7jP7vFzum5JyT8d8JV6xx/FdsrSPmrfbG
 /MsOY1dJ2Pci7QTjT8g==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42427e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX7wQdiHB68cof
 YbpkTCFqkUeHDNtwZ2g5puOiYtDVxVL+BGmxyHS+6dP/5hxk3coj0pqmsJG9jsN957j/4+yfddf
 xq18rEAx/QEcTihSFDL5bLpih3qI8ZQ=
X-Proofpoint-ORIG-GUID: qifI4eHQCgvmQwQFwkeSIOqykC3HdZi_
X-Proofpoint-GUID: qifI4eHQCgvmQwQFwkeSIOqykC3HdZi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080

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

