Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54AD367F3A
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640861; cv=none; b=QzPcVc3OpJJjZTP6T0DgFuLEyoQKHTcqNBOAf19Y+luZ2Ei+PPs4AZf+hoekhk5UFA79nMvu3S+qM1hhTlB196albXalXmzDafkLeOinG7AdKYDE6szMiGWS+xcaVYRk9qmDZvcpt4ukoJNca3ASuZT8WMDDgjk0JOFIyFGPtj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640861; c=relaxed/simple;
	bh=WlK84IWR1sPF4ZFiH+iixYr26deiDX+dEbJfb5cV55M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sY5edOx1Fd0oEcyJt+7m/5acTExTZJ/MtS2tKPF+OkFoWrs9zEYVy19qjvea22MmIZBmZSTi5YYQwZJR/E26ThfHSkXfyza0OEUWR5GZXEoxlHb5WCfGKSVW1AOaCwYsYoVgrw6iwJ9Rho/EXZnLRSzDX8goRrPg2ekfBtXTXrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myINtgqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XciVqaJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myINtgqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XciVqaJg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMBoI1922884
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSdFTIIbSmhfYVeibu2fDprTqJaPR+utAFgaP5iL6kc=; b=myINtgqes+Fwwg3m
	hjCbdR/QMUqv6iUXhmDcpn0Iux+LCIyr0qPl0fJEGlxK734DBOk5WBwghdRjt62W
	S2xbHz+r38BKF8kUpTw914yMB31EvIkxFvzwS/2Cd9MB1THNaTUHNFm6cSofQFvm
	LPrqoACYfu8+wtvt/X4fQG/1UQJ6H8Bcy3rVArdhNjYsZV8oBu7DEN9OzhSycKyx
	5W7TTDo8tboTbvWFaWiz748s81Z90gfx1Z+5LX4U/1IEwXa5T29nN6byrhdQh2BW
	yqQmoYnAhZqzPQQ0fwLOoECJiD9ND8eOReoDr0cGtKHmhPq+VFluzaw/+4XuNPWK
	NAYpjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68611rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso84498441cf.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640858; x=1785245658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSdFTIIbSmhfYVeibu2fDprTqJaPR+utAFgaP5iL6kc=;
        b=XciVqaJgQIl8zoPlKGBaEyCg7jUnN00FDvlVCxLPh2hCJD1K5yUtly21KlH8qYNl6P
         woJnKPjFZf/qTOW3vwEpHqV1WY8CfdLqhPLRYvcjAp6g5uXBX98gx4U+wwo/ZZIXrtiE
         EWATaGln/BruNYefqGCQKXGPCTZ0wnDC/4Xh+drXS4zczUTmUA9ngqNcBNJ+SlGNBv8B
         O/rrhn235bn/sWytG5oaOD1uAxW9aaYr07X2DsIYgI+iQcnVlxr6MYUziKVNmqg1DMkq
         VFocUlttU6GFDDxcg35VGxVy8qRaLXWj6EkJJ6hgzEiSuu17Zg9oHsVcMLdsbsAbK2Lx
         oT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640858; x=1785245658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSdFTIIbSmhfYVeibu2fDprTqJaPR+utAFgaP5iL6kc=;
        b=ac0s+oegljHI+hAJBTnMKlcBHjotsqRuG/K1TKWQ+Baytf5bf5AKgMV5jimdhH7Fmi
         asDnHlYaECNCsTVSQgy5UOH5TE215Wx3QC2hz8KGqGJJ90GoPf3k2D0l6dxNpC1tggfq
         6Ro4gH/Yr7mmS0KKNhnFGqRuXnMJDmle4/8C8ana8+URG4SCYBPH2cGJBlhp62HbwRV3
         9HgnLv02MPmokj5FN8mChkyjuW2eMDjMy2Qzz2WTAkIRw14GnIoFzr8Z44pQG+bjNP+K
         x9RmmzFcu49kZF1+BuZtCjmNTdSoTszbQbZLFayXQaN1Ek6hjgEPRnOGEFNKHzHEo9gO
         NWSA==
X-Forwarded-Encrypted: i=1; AHgh+RoXlfeQxF5zfoPcmjxwmB83hCEawqQ+aMIfB13/XQg5WwU+ZevNT63pmyDhoAi5tXJ1sxo9X00wIIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLlM0Eam/rsKmdjfaGm9uCHN8qwkXKD9v3YoLRq8vxsg0kf/Ro
	CQg97MZOSGfMRIK82QMOsPIA/cmfW53aSO+gFhvTBb7LfsNY2N5CQHP/a1spduCoYG5pVNpVwfa
	mnnTU40DHaEB5mmJWW88A6eE1soRbvrXFsL/MJlq5HHNJC1mmMVScMzcjFsOcTPE=
X-Gm-Gg: AfdE7cm9HwMA370Tdcrah6Byof2gQ/iUGKGx2Xz2tgmziT8HYEgOjejN2Q4pbvNt8nA
	r7yIVudA+X7p/+sG7CHxmAmtkqFHq6xhWOedflnrLw/FwbCfIMGDMEIt/b1gh1roz8af8cx1d3X
	oEI5Ld7TaWor+XCJtXmbnJkedof3VMWjz8cRqeDQO62lYzsiV7HVmbNcDs5HpNskDX11uxz+yJy
	WvO+7QesDErwkMX0j9TxhvYbKCCQ9ONo7uwbC5bC800Vu/lgFQOyOKKNpm7rGpI5iFZ/eDy9YRP
	Roaw/fok696mHl+8ZLWYyvpURC/PC2G/CEHVQ3XArIjizYb+fJkRE7I76/07plTqfgAHCv68T41
	i2G8U8nKjPvNk0GffzmxxPmplRcOlDA==
X-Received: by 2002:a05:622a:84:b0:51c:ee7:c355 with SMTP id d75a77b69052e-5213cdccc26mr184101811cf.68.1784640858058;
        Tue, 21 Jul 2026 06:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:84:b0:51c:ee7:c355 with SMTP id d75a77b69052e-5213cdccc26mr184101581cf.68.1784640857691;
        Tue, 21 Jul 2026 06:34:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:19 +0200
Subject: [PATCH v23 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-14-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WlK84IWR1sPF4ZFiH+iixYr26deiDX+dEbJfb5cV55M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Up79G8MDEelvWCLtFiSER4FT8yUtCjwO8lJ
 xeqSIl8HYaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91KQAKCRAFnS7L/zaE
 w+WaEAClCA7f1RuaI7rKILCMwnM5e/xquNNW0njzM5gEzul5OwmHUbuH82Hlr++klvAT0D5v8tR
 e8FQ4Ad5wFaTGTYpiGKg0ZQ2PVQaEkL1y1hT9KuZMtzpwa42MYWCLPkednv3qxWDDC14unXHnPL
 V1xc+Q19w/QkhCJIhru9TlnL7+s8wwtsfcB4j/Fjjc/pQEruukUdyHEH+SvH5knDvfmKgERAFqy
 SsRr/03yk/xz6myXLqhD8DmBs8einY8gxWK7flbeaInPd48b8xHvK7obg7eH5l7pJJM5+IipkTt
 brr8Mfp1T0CpxkAQvmcWK4dIjIV7Vo6jnSGjmAI0UZnyHKLf31u+eANoA5g72xL/nqzaXMrjKHM
 6u6NP8n+biEIAuUHKSflzXV5lOoVnFSlcb82lPr/MujTiLrRAS/IRvOAvcq1+XPR5gpgGgsJkJV
 UNHXxWb3QDmL9ntCbOu1tBd1eoOIyi4RMmCj3xzGfTxsy/ISdiPjMO3KwVfYzyC5sWqEM7kaICZ
 D8yfCU6XUIDM/Ad1O0LooYCF0bzqWY0fXyp5WdRTBApAprH6MjHvPjm/OE+4xQrVeqaSEQrXkb9
 hP2jO4GZmST/qZATA/rU53L9CVe/OZh3ZblJT/zjrM8sqGuxF+QvLbiej+L4oJN4fjKykW+QOpu
 25oy2/iPLcKSyGw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX+8WrIBIRHB35
 Er9nJ7rWEnYWjAVsx6xD8Qfjw4Ij0ohxpsWdEJ6vxMuX2pMwC6pOzgev/NyszvFko+Qn92pJSMf
 8OYzmhLJ3DmTTz1Fydsy42JdUhcZ9NM=
X-Proofpoint-ORIG-GUID: iJnFUOzPNADKlmoeVIwTh49BrbYTy6iT
X-Proofpoint-GUID: iJnFUOzPNADKlmoeVIwTh49BrbYTy6iT
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f755a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXwGizmZTY6+FU
 7pgGr5LZduZTo/3d0fl+m0oUGjCzi5m+XOhdzKF54K+xRScNi13V/fted+RRoGm4NNOgJp/zBH8
 0UJhGjhNZd50uz3iC8XtAVtbdKzgDpfdSUI55JAP12dFZnzOuqLqHr8pxYuEPHgSlKzWPC6UyZE
 PEPzCPKVDPsA3oCf5KXP8q60qteXr0Wty2z/CMwOl0rtTWnAS3UIH+ae9/gfMjM+ywfuldrpV8h
 29+e30wgserWwXDXLhFGSIiB3wxBsdwZfHxxa/iPeAtahN0Bh1QaxEAL3fjWZyDoUlN62O43VWs
 NmQf14GuCP1/vfKF8iKjI8AIUO1iX66AaJa/WfVBKP11jRZJ/MYXs0WFsEQRxXfG+dJqKQeiiP4
 58M2RRqN0u+CQNM93Cl58NRDdKZiV8axiEhbcbgF3osxLn3V6qSwT8eDnMPCRNzpJxPRfDw+Qgm
 C4mCxhEUobGefsT5J9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out the dedicated BAM peripheral config structure and pass it to
the DMA driver using dmaengine_slave_config().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c |  6 ++++--
 drivers/crypto/qce/dma.c  | 13 +++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 4031b4516d6519fc5024bbbcc439500a7b3314b2..50fdc8d808d0fe1d9d430ec601ab2ccf2ddf6e91 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -246,6 +246,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	qce->base_phys = res->start;
+	qce->dma_size = resource_size(res);
+
 	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
@@ -263,10 +266,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	qce->dma_size = resource_size(res);
 	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
 					 DMA_BIDIRECTIONAL, 0);
-	qce->base_phys = res->start;
+
 	ret = dma_mapping_error(dev, qce->base_dma);
 	if (ret)
 		return ret;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 88d253d9147cfc9ed275653f7fd248538378194a..09699d96575b105e2feaee08fad2731792f77ea2 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -116,8 +117,16 @@ static void qce_dma_terminate(void *data)
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct bam_config peripheral_cfg = {
+		.lock_scratchpad_addr = (u32)qce->base_phys + REG_VERSION,
+	};
+	struct dma_slave_config cfg = {
+		.direction = DMA_MEM_TO_DEV,
+		.peripheral_config = &peripheral_cfg,
+	};
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
@@ -133,6 +142,10 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	ret = dmaengine_slave_config(dma->rxchan, &cfg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure the RX DMA channel\n");
+
 	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
 	if (!dma->bam_txn)
 		return -ENOMEM;

-- 
2.47.3

