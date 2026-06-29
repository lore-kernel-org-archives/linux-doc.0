Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE483FBEB2
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727321; cv=none; b=gAq/7sS9eCcE8pH9D7F7F7YKLQFV9A6G4P74ymXzL7zUVapVfPTk+HJUZzKRY4Hx41m5K7oqxtLK4aV49BjFE6BmaNpXsFQJcVrgjJtN1TAot7DSJIAaD1nj74SUtZPXeTWj8Ye0/XFjiXvPHFCR1Licy1Y6ikcH92aJetFTmnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727321; c=relaxed/simple;
	bh=xewtmBe7Tjse/Oov1uLM7I+VZpNX0SB8ljw+4HhCUeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzHRhkBQlf4v91454jzKzdQfTFKazhTIcySAKMiDxlkMRtHI1prN5N8o4MIyBBGNLtzIhOZ+sBM7YgAhy1Wkqy3ILOuoGpHDS07XR9HaAea6ool9zREXEZxiUkEJnzm3z1tHA0DxHjmhIHaNhrw2dp+5k41u+2bXrNvRfTpZZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1LnJ0Ml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EC1608EW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1LnJ0Ml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EC1608EW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91Of92400921
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=; b=f1LnJ0MluvQzqb/A
	8FGWGtZDObgYrOjIacLNIcJMDS0cd8gYOUSBrqtDae6dAJXxTAZfyDoQhE83wygQ
	4hHRphUM3dLyM+PcEMscjg0TJolFwvtYLq/6ll5RvIRkLG2HxZpPYtemCazgDl9b
	5wK38mef8N1C78X6AEa4qSBhqHl2vauAOxVW5HnmhZWaeZSfO3YEEYAY4cPIQ+SO
	miy7XOu+URqXcLu4jLutc8zmZ+aXLty67WqOPgHW6M8mqeREhuMwqwWQvYo3NNBa
	3XkWEJ+Wu1d4uD5RNaY2lwHBGpdxf3hWS/EHLkpnBPJFIFu+rQzq6AGnUJMe7611
	fOpxLw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq888dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73850dfc198so477175137.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727319; x=1783332119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=EC1608EW5ogBtFfmA+JaX5zvxyOiTgVy44vqyKUBe9UQbdXWdZ5YOzr/R34/EAiWtt
         jVkhDRqHt699luxMiFrdLSkMrP+1zhHpv/N4Pka4eD04ke2bJem25yQLEfr0ghxqSjPh
         hjL3swMkX3M6rqy5imtICkwoK9/0PaAvnUMgJKT4o5XNLEBSI64tL1NUyFgqu0RQ30bP
         +QHOxxUrqQqr0kse6bjgeYa/L2KMNZffk8tR/8Klt5cDaOUg3NjFYEwbaIrCS3pRF1ME
         jfEsEVwJw1SOlIoBD6PdHb6R500KsYxSHZm3rn3S9GFUXDg2Gcz8D6rjbh1/Ogy9GdIa
         q3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727319; x=1783332119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=I/n+/SUEXktUwcbRkh0B6lb5u9T9YMwseXDRlk0oF1M9TfenNvCkspKKCHpiD5i/3z
         c2SUwulOpEVHwSthF/Xzn7OGHnibQwowga3wIFAI/jpVz2SG8BokjLHJ+ZFrJ8fxywrZ
         8ncD80wcy7lucS4PTynwwd7L3YuwTzeWa9spI3EsJn1fBCQvVPqgFJaEpwqANF79+5zZ
         Vy6YVOLbeDJW5VnESG1mG+zyHNyPNMCje9eGjLLyHIsAl4xazeqkYwUlciVElpdicRNw
         DCaXfEg4TN6xgUMt6Zj1npCYAgNG8qzU9Lm/JpUtg7UunO0xYTfANeQH833I7/8V5E4S
         usNw==
X-Forwarded-Encrypted: i=1; AHgh+RodrP/GWBw9t8i2mHasrbXw3IYuA3YFewycny6iCX8y77t9630JyCdGzUcONTo36OnoYW0oRi7iFpU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ob+Bcpi71KNg9uMJvssEGjF9tptReEevLQC9mpzT3jNJXg8J
	EDbj8SRZjoDDI7yMPQoBs/gA3OGT2q0VOOSssrZ3TgVi4qx7ORyF6Cv8WJIZIeTzGOsqSEkDMj1
	tytKHHdb6TcJ1JR29jMckoy46pI9djuubsUV9GlKauHYgWTmiubmD+46E7xvrxOQ=
X-Gm-Gg: AfdE7ckGYtOw9F++3BFoZZQgXLAlOtT5dJaTfzdMmrJk2GOt2luRF2n0X1PidgcR3uC
	u7eXb6Wz1bnQnTfc0VNJ86SYY19yohN/oyr4qhQtIEWsIFnFgMinzB05rw8Wddzd3qeYLefPyMG
	itCppLmmXEm4gXUaXAAkIYgYyP8TDPVCHJJZ75+JMU7zjy9SWTX/Had2hxtxTQKM5la2evSdCTv
	QuAyZX30wqaviE7lFTTUB1vhRLXA7XGUCjr7S43pS7Lxn/DXXq26R7z9EiooG3QbViiQuDNitP8
	0QNfuM/oBq+ZFPi3V5peppK9BEdnZ8m8iwAvQB7LovATMbgYa/h0bSHalL0eZS/IWH2DG1OZkJ6
	8fmoDZ0eVfwoK8qnD38DvKtkMmQzAONL/HkYE4sPk
X-Received: by 2002:a05:6102:2927:b0:738:9c30:2bab with SMTP id ada2fe7eead31-7389c30333emr1034615137.24.1782727318648;
        Mon, 29 Jun 2026 03:01:58 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:738:9c30:2bab with SMTP id ada2fe7eead31-7389c30333emr1034174137.24.1782727314682;
        Mon, 29 Jun 2026 03:01:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:16 +0200
Subject: [PATCH v20 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-14-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xewtmBe7Tjse/Oov1uLM7I+VZpNX0SB8ljw+4HhCUeA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJztJW4956nVEX9MjvwMkNGVeY7bWyWSsjEL
 JlDk0vhZGaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcwAKCRAFnS7L/zaE
 w8LID/92VK6MtF4PX0Ay8O+iWvgPKwVfNgK9jA1tCP8Qd+Gh9YKfJjpq6CAhVvDnvbe18q/azgf
 hJHbJlhuPzXqYSETS56gA2/l/9+abNM9jLQKvK61ZTwUm9TXdVrWtuByl9244yf1NyP74p4C31t
 k0wv8ve08/Y1PgmWrFamnfYLHCZUgWjsB49qpNOqaM2c7kKZlpSW+K7jItm9dcdbEcGWrmF3+UA
 PABxkswczFoV5tXRN3uxgW28AEuplE8AMc8qKubRbTdYE+4SSoMdmKDkhiwOmYVTWplzJPErnuv
 9Kfl0khAZDvs+R6M4mh2Cm+PxxrbwJGxxbbvV4zqBqNo+tqE00kH4nvuMi5DUZCs3oqkXCqsDUt
 35FFBaQzYVCD9ArHQP3hIF18Pqg//htVnMFk44+/uPWoi7zLmtjzdP8qZ6F4LcuKoaVqs+iXbVS
 VsI4jCP9BSJ2yLG6O7Qwg1k6BbXv0DdrzdwCDkKmJw4Qp/8uA0QhSndqnbTl3P370E0QtvC9j1V
 MMmqD5LAZqlXgfDYnHgRmtr6Ipcq0eBPmmNPOMoJ6bgZxLCO/O0bT/TqYucw57zhs5UPUSoSiUa
 cGNQAkja49h+5Bziwx+6nJHCetoNg+WLfJospblWNsZlnZWkwPmPEzwJAVV+e5YFpI/ZyQVvqh8
 39N0QNMbtzQFong==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: AhfysFweQim2C67uLfUHzzE5MKO53QTw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX/UDxIy9uMdIv
 qX9cTKnPOiEbWM79LPPGjEN8Gd94a9cdF8/485clNqJPdphEhGtXwBqvynZiwk1KxUKseE28Klg
 3tUtrt6N4QhmjlONDthmThSQaGoIef8=
X-Proofpoint-ORIG-GUID: AhfysFweQim2C67uLfUHzzE5MKO53QTw
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a424297 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX8yUrqZZzNeUq
 k2hLiQ94EYfnRluCKv5Oit55ypjafVtq9ABT+cu6ramlDZ+YyCcdruFFA9LLgiX5c8G06KKA4dZ
 mmLZktxWzCuPOkw+Rfd4IrQsRqGiFkjJPoX95pDOyGWgkvoxNNhKkIMwmzOKnBN2deqSiHCa9gT
 TEwZRJYzXDNjd1JiNTQi/qfojFUf47jWxl2SBO7/WWZtnFqshZ1seA4io/vP4P27iZEyNJbXBrv
 uicdfIWJfn0p5i2aas3LPGbXpSLJgEZRBn8Exdaw1nzcoFmcGqsCPnSVEWBljmqjoHUBEsDlwkK
 CWUfNEtdGUH4tza3HD59p/kG+au3URv6nGvXn+qIb6FCXnpp6ix+Tpc/PcUXmmoAcQTYLLXR7Un
 /q/p8IPNMc8Y6RsCB/GZH0rnbipQD/ALjsN/bcOGM4tHWPc46BAQknX7oDtqvZJwqK2W3QyyEvS
 SV6TepIR0hk3rx+XMAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 1b43c56503334154be4b8000e5a9330b2005cb64..6410f8dc5bcf517223c768a3e8f87af245076c84 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -41,6 +42,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -60,15 +65,21 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_free_desc;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 
 	ret = dma_submit_error(cookie);
 	if (ret)
-		goto err_unmap_sg;
+		goto err_free_desc;
 
 	return 0;
 
+err_free_desc:
+	dmaengine_desc_free(dma_desc);
 err_unmap_sg:
 	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
 	return ret;

-- 
2.47.3

