Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A7835F609
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747201; cv=none; b=kJh6RZBLhk4oOrwHbfA1to3/nOKUpzyMbPzNSfLFAuxHJzwHTpm+naAv8XE07mUXQxDDt613uq9YA8k+xgueq796VRDvdWLv3F4Cn8oZk31GezRESaKAmzIxoJ4xmRarWT0uc+zMZxdGLwb18+6qi0WrRV8BIiUkLGNWoR2zNvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747201; c=relaxed/simple;
	bh=8HCvYehjmNIH+BlrLf3/jZA0T/6LceXynB2MmBf1YZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=euE4TXquPkl0n86/gtrAxngotG96qBdfx24LGxqRkwcCrtpkl8emtQ5wOm+QRBI3PobWn1yx8i9TsTWPR+nIGX9O5LFr+kn1JyxiTtE5yiMfQBYfGezexZLBT72npoioICRAtunQv8HONBhECyqprOVJcA9jO2uKpKIgr/NRTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTDsn66d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iw+MAwFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTDsn66d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iw+MAwFt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmpxr1809830
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 21:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=; b=kTDsn66dim843s3x
	bzoXPIj8EMMuopwYjRQyxsAK0/F0JrLLNjwqqwjHiYKYbhwfPNhqEV4WSOKJTCUw
	8oRKJBIWpwqKxNHZ57CpnugwbQWqPa5aSY2ouGRwOTL8lVMY7JpN/Y+1wNYXwsZk
	q/ZtWA4mj04NpXSgvJwO18yHZexy5y1y+Tj+Fzp0aTNXH93IRWMLAetDFFsYR4U2
	Hpbx66OeSEqYiZt20rz+ClqHIZThDHpoZ3Ovg9QCfci4I6W4FyKD5qPoLWMoyLGk
	x0hL5k9uvxjBs8nNVHiSI8VkubHB0rMzXHqth4SYLMXk9Lp7OmDgRmKB3vX5TH+e
	YzxRLQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp407qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 21:46:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a15bb70easo152127446d6.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747197; x=1773351997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=Iw+MAwFtwtn01o89VfGifuNKDWIg5menGKrWeOY93H8vswHh55pMb/rSkLRH6wiR9s
         hmiZ5jB70OWay0J6sOEzLHNj+qZhgr0NOxwAPC+bYftZ0V7SmIOKTili0gHxJBW/EfIY
         57odzEu0dpMhwTU7Sgxdh8drEZSgrOtSsrXEALSrYe+ZOSnXJFZAWZhuzJHbOeimzIw5
         4ksZMbXwjOf6RaLqPexMeTMYXwqzz50Q1ONMYxOaPoOBJeQmlMjV16nn/eC1QjLj+sIP
         EdLOOqaIMrpjSU1SaAPfJrq6X3bO9cwKgjV6zt4oP5/mzN0tn8GU73Gj+TjUjwrFYX1w
         NpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747197; x=1773351997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=JFh6Yj7PyxX2ecJIAdqML/3GHEr3HiJQUxhNuUvSvWPWC7TTTEuHDsyo2+9NBMnAKB
         NA3lc5GxIHCHUzxTNsG1eHoH2RgPypWqe3NwiIn0z49LFfR8Xb/m+soGcp5IeLZJaHN7
         td7sBV2pmx2s3y3PNQpI0ffBLHpSfzG3v9EcaAlU1jsPOZ1orslFwpAMQKNntcYGtp2O
         QxSkHulLTbPIInDwIlbwk8kEbYda8oEohA/lGgAAE1hpSC23v8P6L2nFqmsjm9rZWx8T
         OYgFuB74rEu0udoOTAuAQD1W+8C9Hf8UfXBag8WT2UIUOT6jppt/cm/tS5G/WMonGZFF
         3ZpA==
X-Forwarded-Encrypted: i=1; AJvYcCVwt4XOKkKaKpSDS6fZ0bWBgG99MVaMwiXtuGqiNndppxGeKB7v0/xX9F8C/42YwFq+p5BLR/vNeQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLKvSwBGNXcnA9L5rMgsNSoTGjMEURSb40ljp288ahFU+IsOH
	np8O0h9fZGr7FX9vG0b2swpwhaC7abQcgsHhsaiyisWI8XU6btaDYKP9yAQGkh8Y8oM9hSgQPSF
	RcKgZzU+bfyS4npVvJlA4fI0e2wVE13oZJkgxR+lvj4HV2vcXlv0RIzLW3MUNi+i9ZWz76q4=
X-Gm-Gg: ATEYQzwxAK4oDUzh5soJmoKChdJNUUhqSw4GcLElJZ+bhcuSTxs1BtNgxvIa6f/XWcd
	lxXodFv5jJH0tTrkWstP14xDKm7NiToT+ie90NDKJ3O1pZzprb5MiFfrQLlJXwDfUug0OwJaNlF
	1CQ8xj8Byi0Lytzf1/v4Fjfx1WFIUCzvJliGv3XxcFjMN7njSus3iT3OfkIf991zRzk5ukrQP2u
	2DNaeMNGG6u+i9KPX1buh1cAgZ5PqNpJwN6dSZu3cmpHkEy5WpuhZ9lfYQl73TtoWs0k45T7bPx
	f+JVyrUwPexNUIwJIbpzqn+bk+EJb2higsKR/SzRLRh6LrI2mCqiJbAg6bdBmqezq3VYaU14BIy
	/8+uxTDX1JbLXITNHV6Uz5w7oJ7a4789HwvBf4LZeCPfJ
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1697085a.42.1772747197574;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1693585a.42.1772747197119;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:48 +0100
Subject: [PATCH v2 09/10] mfd: ezx-pcap: Avoid rescheduling after
 destroying workqueue
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-9-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8HCvYehjmNIH+BlrLf3/jZA0T/6LceXynB2MmBf1YZo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmgTLUiHh6rin6gIR8tn/yHPbJ7keLcVF5yZ
 GGBAe1ny7CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5oAAKCRDBN2bmhouD
 1+A1D/46IEOXU4c7rCB302yiUbZqrN3J0Box+FRnliJ/p6E8EXiDnmOg4obwzDlEUpFEf7ibEyq
 GYEw9cFAKDrszgDdGRbIFVYHr8RFOirL2Hdrl9Km81dPKqBQLXZQWnvAIKZe4uFGm8rDEiTS3FV
 gXubYix78Obr5LtZTm+Tn3H4VlOmRf/a1n/SAYakf/wp8btHWAgUY7J9nNAMK2Lbwsc4nzYJoHi
 vZbjtyC/9Gclm/CRe1O8vCpyJktvnNgAqHtQ/jojtr4XybHQF965vKIWwvLvoJBrhi2yylmf/EG
 S8CxeogMKobJs6UveopZ0d5TANJ1DRYacznxvzG9KA6g6X2xQKhxgYl480SHuTQMwdI5ygPt58U
 YlxL6+Ij5kO4Fz14qrhXHTZ40edvx0sQflZMFPcB4RVEyHUSnt2upCd3xRWA+BtmXbJ3NVnN7YE
 7JHqzNSdItYNG4lO1wHyEOQRHGJ6KLMq+xqetuC7XXGt+e2iAroOx4ODQ1itWBm9mnLq0brsQkX
 aZkgptRJCcNG6nj6JfVtXI5u3cZGNevrxo+gGHIhTsR2iQROE0tCQbAzduBnKIEtq3Pm4AyCrGB
 GzbjoRK4ad8uW8GvCPBi00G3EXVvoOWPBuOLeQPVp8BuTwkTHYs7DVw1wsrnE0aEKQYge+pTQo1
 a1ws7+4oKjEY6DQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: D_LIj2FDnpRNeCbwKr4hFxn8wWV-vuqx
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69a9f9be cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3MYFky5D01qQmCoSdzEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX+LL0fBWtCuIT
 xRa9snNjHjxsKbuCyilpAfoNUDDjpyslIoN/UPuEcDhCGNWl5ivIyFv8h+uoAk5gXhK1i6rzba5
 nsZPI6YtBBm9CQETF8wka4lu/XoADF+RIcoqGH6cSQvCNKS4p411jLy6DTSrm/SBwzENd/R4e5G
 1a5sW/t7YkNIThmc+U25WmrPUp8mqhdkfGwZAgbBC1zlTqwtQ6KSeLUiLT7I/wlncErkFz1VoeR
 z0nt0sC8YKGvDiidpaO879TF+NLpe8ucBnKAG9vDF7l84XouxBChv972afStlnXrNOOAA95yW0v
 fxpIynlMe6MvnzVX1AWeoufvMNUXjCWBF1aDpGe+0fndbWMm3fDpXtgaJFcOEFvNf2tinFkpcps
 nk2HRZZJyHI4T6mHEjL1mdpUuzlEiniFbAHXxR+bLDrvh2opknfXDfTkwbC6OBxGAtyOgtoxW/F
 WBv9NPOI79ymCVyOz3Q==
X-Proofpoint-GUID: D_LIj2FDnpRNeCbwKr4hFxn8wWV-vuqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Driver allocates workqueue and then registers additional interrupt
handler with devm interface.  This means that device removal will not
use a reversed order, but first destroy workqueue and then, via devm
release handlers, free the interrupt.

The interrupt handler registered with devm does not directly
use/schedule work items on the workqueue and the remove() function
correctly removes other IRQs handlers, however the code mixing devm and
non-devm interfaces is difficult to analyze and read.

Make the code flow much more obvious by using devm interface for
allocating the workqueue, so it will be freed with the rest of devm
resources.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update device registers, thus there is no point to run it for
memory reclaim.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_xxx() from earlier patches.

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/mfd/ezx-pcap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 8e51c113a320..9a685ff8cd15 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -375,8 +375,6 @@ static void ezx_pcap_remove(struct spi_device *spi)
 	/* cleanup irqchip */
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-
-	destroy_workqueue(pcap->workqueue);
 }
 
 static int ezx_pcap_probe(struct spi_device *spi)
@@ -411,7 +409,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
-	pcap->workqueue = create_singlethread_workqueue("pcapd");
+	pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
 	if (!pcap->workqueue)
 		return -ENOMEM;
 
@@ -463,9 +461,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 free_irqchip:
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-/* destroy_workqueue: */
-	destroy_workqueue(pcap->workqueue);
-ret:
+
 	return ret;
 }
 

-- 
2.51.0

