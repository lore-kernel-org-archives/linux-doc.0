Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C103F7887
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801087; cv=none; b=ok1SjBHSewLxg7ECiqrraZNjOqYj4txh9ltnhFC8LgNqNFjH6nAjc+dOicCaaQYaF67VuxIVLBQ1j3lZuUQbr6+NxqeGkGiGEEmk6IlWFXSNrLcqvxUARYmKNofzQewW3EbuoyTj0m0JEPNxNVHrRLUjoKPNnPgYUTooNisclpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801087; c=relaxed/simple;
	bh=yKvgG0rTvuvJLcjw7C6atYAtuGT91Jlwk9eV3sVaoBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRXcWm+COTZYG19qEXEodvlORsaLQi/9c7w6ZctXHKCxfNUavR9Ni02UrCQuAvtJrxynQuRs+VFx5DU22CK0A2IzzPkiWrIxTBC9RkKA2Je8Urz1YfAhck87leVjOzUJaBl1q0JPGjvHkSpzCsVt2LhpN0rwKWysrIQzvnT5/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZbeo/l/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWVMaYae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZbeo/l/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWVMaYae"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsNBw2705396
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=; b=BZbeo/l/mOWar0i7
	D/Ytr1655XiqsovVdEbKuxFZuUFVUgerl7dwyjrEqVPD3sUIyJih+upM7R9lW/Ez
	zdLO0WN7Dpf5+QfcYH4tdzK1xh/P7KNdaop3eWyEZfFkEtJTtZI1SKusjN2dIiCp
	ZBzaLNA9pytgHizseArXVt8Qz7mgVQmPiLBJYcpKSe8tv5d2r3is2b2X6PvI/2Oe
	o+PuvwH8ki/Gh2cLRrnrIYAVEiuayPr1bO1St/v1Xo1YAfr3vAHTJTaRIOYZS3JR
	YGtqOdXqKyUJn7HQftjZ/4Z78xauLbyiJCWbCTYp2ae8iCpmUn1ylZzo3K6RXz6X
	0/3BHg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vghvjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-958a0e94ff9so3059536241.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801083; x=1780405883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=GWVMaYaeeTxS+2VDDSTacBaas0StFK6WfQgBxL3bdr+c0HshS+YUkN4Cu2oVAm+/rO
         8nE7m3ewaYmHeu54NbAYpxt8LsSxMmq+zaALsbJ0AHvIPAbX4ZajOP9DLVgnMotRMleU
         y4znUGR1VLsNLdvSAnkHRR1bCUJ9m2ZahKyYR3d7b9q90BJbww7X+HR8hVJeybMa6sN3
         BE6eLVp47kLQ7cCKDVsK4rerog7x76XEzuvvWxv9LmZAbEzD0evy0b/K2X0imPMJkbaV
         Y9wYpcyLqOAPV7tgsHLbswO/4Ljn8YF+u5ArFFFy/uGHKCK1zPNWS/plOa/1T32zztid
         q59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801083; x=1780405883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=HkPCVjluhWlRXSlOZzaHnsnavP05bEddw8r6MDlhrH5YksCv8T2sApIsZKtie7kVbl
         Qbegwpm4dw7MBEeISytOTFsJRgLUUfHBpRVzgRv1QbbQuv8snttNlYAi8hQ0TVVK6+vs
         i5QjunbjMTl+L52JtC/71C0+PDaRFNFvJA4JBtsRVOfG57TmTPF62U9/oWEEoIR2OLaB
         zCL5xHQx5EDvHdjlgYKBxrg53PMPaR7TCZP4Kq9iuiqkX2vB11gdoHVbvEewgDkrqjsO
         Or4pQn6lwRHxQvy3PTNhBwQ1nafISQA+viKrCoaF/0q3UnV2AD8cZuHhfyqStSq7uUpS
         5R0g==
X-Forwarded-Encrypted: i=1; AFNElJ/h58t/7P0CHwUyIjkYtLuR4rrtZxFA+jYbxer008COoyEkHfaN/oU0ZhRZKOHhcPZ3jYSWPxzBl2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YztXdW8TMGlTY0gZoyHHDK/e2sElPPHrgXBI2YdBMwDosfNumDu
	AKZh4pMG1y141WBiuzKMogkiI9fEX4QE+Jvgc9sDGwx1E7r9YAmlm0tI+a5EKa+AcwefY9hdNU4
	vmRfQDrn3rX5YNMut7Osdz47GZof0Nizt3dRfai4c+ER1OjhKJcEzadv9WIoAbREX7Fommb8=
X-Gm-Gg: Acq92OHdCDIwsDw1/NwVQrLEvbHhQ6wqMWb70oRemdhvbuFJusDHNpVQ4K5cD80zsNJ
	xU8+qUv1KRdmizYqWaFJI44+dgyYnNmLX29JnL7J0Ku8j3931eNrTm8C43cKj/b2Io1miJlxKY/
	ElfgAFJXQXtG9u7I3A29nlmI9j3ccJGKbxE+WC/TP1Z+Z3C7vE9LOth50MtiDmaggfiEA0Wguh1
	VS/AoNVAv79LVGvFcSEyV/YR3Z4r1Yk2Vn0RTPCCuvrW4TQnjXqN3aX2p84YfxEpqDh3po956Uh
	1ChRr2UE1+yU6eYzcIDa9TKKwYcLZCtm6F9XFrvpW5GWovQ2gflKZiKmbtmCUT7zDoaxFDZZgg+
	xn7U5gDbr0FEz2dDaWfvxuVbc0yBEfB7jAj6RP53wd3nKhA0u4Gw=
X-Received: by 2002:a05:6102:26c1:b0:631:7781:fe8f with SMTP id ada2fe7eead31-67c8a075be3mr8074428137.16.1779801083405;
        Tue, 26 May 2026 06:11:23 -0700 (PDT)
X-Received: by 2002:a05:6102:26c1:b0:631:7781:fe8f with SMTP id ada2fe7eead31-67c8a075be3mr8074354137.16.1779801082801;
        Tue, 26 May 2026 06:11:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:50 +0200
Subject: [PATCH v19 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-2-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yKvgG0rTvuvJLcjw7C6atYAtuGT91Jlwk9eV3sVaoBM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvp7UZaBHl1OIOMCNcm6ZGnEtt0oh2iZGyPw
 ENtMY6cdtGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb6QAKCRAFnS7L/zaE
 w5SJD/sEn+AzlgXKKc1pQ0NeSWVBb7BQcNXQaxKPk6q72SYnU8eCWrAuvmeH84F2l+i+cL0zAWb
 nmEHYZx3GSXz7cwvHKyBGoOKjrh5xhzTSTPvT6wn1bVPx0R4nN9HTVm3PcjSOWUWf61eRHZP1la
 +UNcU6Ul345VLALhUJh0NFWmdc4cCQZwLQ4p5ClI+tfHkBfVtrayM+N+r+RJZMONh4SbhNbTORy
 WCJFWf4KIjB8sZHqByTiesO+z9uFsxcCGiAVzL3lT895g79R7zaNFbvtfnpCQDniy3UzVYV2Vu/
 upq+wwHrIq94JxPbJQA10Dh9USJPv3OtgrrPx9CoFD3c8R7qEQOmjADC+/oK9IRf9Ah2iwmzmZn
 cxZ7yw+CAagm3e1Ra4c/wxKvk25sNeAr+utNF0ybsjITjR0DJxSnqkEqeY3zFGenYFDqg4MLXHf
 3AF1iUfndmbkSe09RX9ngzipL5RXKZ0n/4Tva9DF+U510x6hzGHe7gOzjHxNEXW7ly0j5FiXqJG
 D3lEDwlhlaM/XbyA5Msi5zXa4CH+sjLFF9gXie7/G5LvJYK28w960meiu9aGttA79tfjoXMyDJc
 l2CzzFbgE1evjGeiQhxHVRt0SdIdTdiGFr1nrnxiXjfrleDZjNftmUdEHXC8BaIvMUbGlN+Bnkw
 MQLtAaAgcEspIHQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a159bfc cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: RkBHI7Z2c45wDBcSpoKtLBOCx0JsXNL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX/lYOq4h0fIg5
 C0pjw4r3M0mupSoD2/hVOn5qA8arzpxMggMDCDkZzQV74KT2MsCbLMa40eceQSZUtt0qrM7TaDa
 R7MRzpHyJ39i7DWf6zF7KmbXgUTI9iAVWh9DHwJ0rVBI7bB2SitoDarkR+pulx3ltYlM3ZpdvYs
 6MmYuhLdYqvbcNBe5Sv0NiAwB3O+sJxiunhYNEQI+AwPU0qIMJRuK3IakWxKB3rRRoOYWV15LFa
 yljldP+SBzn2h2GtWT14SZyJuhMXvcR4UB1zxsVXB21ul9dDtMexLOe0OjI4vlzEybsdv1HoMLZ
 R6+/n9dQjM2HGY3Vsdatb00ZSqJfzLGdOEmOiJsH4Mw+MAi0RKNU4VIErmjsx0CaXvUwLwLC9/N
 wGwQHWIee0jsnqlAB47ExcFKKP89dsWWV6dF0LLlop28xYmHbfoRbkOnXYn5umvg+kErVaS6oUj
 XwowJD/wxStzgJ8m/eA==
X-Proofpoint-GUID: RkBHI7Z2c45wDBcSpoKtLBOCx0JsXNL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..b3d36ea79984385fe0d05ce56042d3e6e3030c5a 100644
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
@@ -1371,6 +1372,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1379,8 +1382,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3

