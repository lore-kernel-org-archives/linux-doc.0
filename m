Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613CD3C73EE
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279086; cv=none; b=k8A9Nl1N68qdRzo0enCwBIZTX5LjYcZlU4IzujdpxEKyRfz2wogbSbQ2gJMUn2rthbQU0eWmVW2YnarqiyTR1oqKCijgg/YGIeF/9yHI6m09Mv1uBiIKqu4gqpc2ju3Bl216n2idap563DD8FGesZJoA7DW68ySBTC8WmikgQ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279086; c=relaxed/simple;
	bh=zaDjliGI9P8SDSmb8oK5ZUowNY4iBaNue5t3+i0OgLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPlZDOIQxDBDlKatETmX2yVhAy23RiH8QS/JKUmIW8rLNqGSBXAC5VRtE6Z1pdDGi/O6qZF6zDP2Avb94bSNaNpz3fz2Cpfa4EAfDYoT8+RaBX2rw4x/2TPRj47/GUTTDR9ZjVEFDCjXR36PlJ/I5uhrK/8GOanbSP2w+Y4b7F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8rk/zpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kS7nsUgk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8rk/zpX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kS7nsUgk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGbPi2627238
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=; b=O8rk/zpXpgJ6xfFB
	gKetOgIHP2LnO3VSBUuiW+IwSQK2TF3wiJ38ea9sLr4KyDr6AiLzDfmdMDASS4fN
	rcbef5GSJ9EJpTQhTltG0GgV92y9nHXxhS/NIvzrlcDze15JiLEa2+QnP8acKidg
	wH2uMuDrdCbjmhThpp2SYzI6mrT/tQVZ8SXQYOdUKRrBwiKxPbakwMWKXnFiG2zU
	EJ49vFFUcnF0dI/NoJf7EtI4Wsd9sdjn/pNSGreHQp6GyYx7gZ1ojoR5I4gXQqf+
	Y5qtiseXTgjAM8x01WSGCz8joxgejGsi8LUUgNXaRIQwbsueC70EO8BJh3Sb2/QB
	GF/aGg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc1kc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:18:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-602878b0398so1738922137.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279084; x=1774883884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=kS7nsUgkky4iV43ANBPqGawYOGNeQi5hivIcTrAD/SnduHmY3LtEu4hUA3opkC+KIQ
         I23eqOnFCJBZJRIM45x4Sn1lW8ON+MY3geHbnS17oKAW9z4wqXGGE24NcIfcnUGUFdFY
         G5/UZdu8Md7ZdLe8Obmy7rQazfhO5pB4/MpfKoxK+Sr+cQPqqdIM9i5zGS6MI5jJGlHp
         +OCt0P2h73+QEy4xCf07W5dXhofHMFZCI4S/I/5YfmJH1zvMAbvikHaTxuoDdhkQYNco
         X3ouTcoLXQj6GICWu5sT/WLln/8a4HF1BDo/I40wrs87682v1L9IZCr+B6VQw8kVAqRA
         2D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279084; x=1774883884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=neYSRqPPKle4Fm8sS52F2WXIHkaX4R5a6ZFa38TUij1wK8YAMyFCNde7Focd0QptCy
         G/SLCL6gwQqz9/fSc5r5xo6oOD2L5hFqzIqyUJJFIugBjvaKKjzGfE9o67b8WTKIKXs4
         nqwWHRsGtrzvcgFFODoeVSzELjdmwRBZ0hBW0S9lz9/Qf4BcqQ2DUE2XfGqsUUdHPlgx
         u9deQTrCy91KcC2GNRmDZyjjjABBwVcBN/y6UlnPBxzRzmn5GezAHR/okZWLUntzXAXQ
         Fqf5Ni+/SdgK55vP7LqUH0Z3PNAhWMz26fdfllEOw1pfbGtLvQ7hhUATo9zEWSwBdqvA
         wW+w==
X-Forwarded-Encrypted: i=1; AJvYcCWWw/PHAwTC6JZPdZkP3u6O/rgJjL+eg8qtOM62SMTNgglzAU7jDb9uWmTAf5NTGVLtCPbZix8dXbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQ7Djk1+9PO0+VjbTTYSYemFp+1XEPrMDuK0vptBvjzhn1jgv
	seCSLbtUDXajv88SSPMEC/bjBV58NyhiwlWQor+3GybptLAq4nv73PJW15p8W9093wGq8qnWDUJ
	q+/20H9tVS2mNcPNKgimFHXdetOuqYRRXc2ghmnK8WND4AurV6A4MjOmWpJB4hho=
X-Gm-Gg: ATEYQzxKLe6bA2gjjX5MZr34FO04cMiACnH60B9Tq0BQhwrupJOMwcT0h+1t5ef014E
	GeDLdr/2TY4pJPGWipf0uvrY4a23Df/Sf3y3XDqzuPedVyFjmCpDMaacuju1XEzoyvMmXdV0hlM
	FVAgyr4eI0QHsaygsCyPHwoLAv9QkCCNYurC6ZLUkXxotraGDHVk2VKYwSsF1oOdOnbrHAFuvhO
	KZg3Si7J98iFy5ygUJtGQUTcbQyXeEstVe3x0Zedfxfil6MFacSJBCCG7vZZlJwBOQN6sNkvt3n
	WCNR5kmKgXILiQXAixZ7zaHUGX9jkMNqjjCgnC0NHN/JoaysEPj7LN38xeJ4l2x1DSp9c0zql1j
	Uh3An3exlbE4eX+OkE/f32ST2t32SZeJaAh1sZ4JF6f7OMUgTMXkk
X-Received: by 2002:a05:6102:6b01:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-602aed07a8amr5468752137.25.1774279083663;
        Mon, 23 Mar 2026 08:18:03 -0700 (PDT)
X-Received: by 2002:a05:6102:6b01:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-602aed07a8amr5468725137.25.1774279083158;
        Mon, 23 Mar 2026 08:18:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:18:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:18 +0100
Subject: [PATCH v14 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-12-f323af411274@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zaDjliGI9P8SDSmb8oK5ZUowNY4iBaNue5t3+i0OgLI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmEIhNA+qGksy0E2v+Dt0LShbj1QNg2y86R/
 vOoNZth0qmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZhAAKCRAFnS7L/zaE
 w7xkD/4xdbKrTGB7J4C8rkvde0/WRQFmeaByk8e35IH820cDb1zFim4oxGxug62Gt2ElgCJN5kS
 xZsQ7ey3+VFbU4w0uFyovx3bxhax55cV+yr03pDTh/fDokqAO6KyXyi3Vf/L7Oe5fQdAWFgJPrj
 FD+IJyvZzax/03Jj7CirAcBwAOfYwGQ7ra8b3A850SWX48wah2ncH3S/Gz7e5F9bpWqZjmRY6ww
 Zp7PfY2+oQwGMnq8rv+0m+E6vi5iTj9817XI1T4IQpQYE/iUkzITIhmVljlZyHPphm1pEWwZNmQ
 lMf4In+3V93D+/vu0TR4JKX+KMF4/5wjzMYybAGOY3I5klpEUhCBpIJHXIe2RIrpqpGAZJY4vul
 8uloju7us6uY225sKDTpnQQ1DpapFkm/Ir5clmslKrvnt/b20h6oYP8c9uh8yBVmLFTIlgEahoj
 73yRozw3wSjjF9frUEmQ+DFMviySFyLX60GLmhOPkQ9CximM3mRm3sK9+9kmFdL9pBhFXyFxT3d
 roMQoIzCZSKLSfuC9UkgNOK/ryTAOB647Lx0+DxpobTUmKNcp2YoiuE7mSwNxFQbxU9m5IBBC/c
 SWYx5SAwoU/9cD3mTbVbeI/fK5RF0oCDwVq1tVTgDI9yQqMSmDoLC3Kg5HCAHVCgQhhK6C0z2Fd
 wEAVl10ejvTe/+A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c159ac cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: d59ktXZmSOzCRCoLbMN02agk1IFTATTZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX6LNQPYI2D7Zf
 3wL94z+5S38nfRnsoGfVinYwxmGQOPTsjTYpnznWk48vtbb8RF0wa7TvQVb9KdiFmXNqYWV/dDE
 8zVebFJrzfSUxc8AXKP14bdNahHARz9Fee+yDiVd8dFXrCZw5oZ/QcIsq9oYFUp1YEo6zMhVAWK
 ObNX6xWzBmrXKFynhYLwNwoqZsxCqI9Rr7DgdvXxm1iUxX4M7zfSe3NhpmIF9AkDkeFBDOIKR5B
 H1V3UcoCXb9vwZRR4LwRAb73AzWUJq2Pm1iq92ttQpIQM8oMjzyxvsmxTm2mH4JAxwewFeepFBQ
 DWolTTlVuD87iLVJ79qtmYVBjxonO0mFX6wkecjfa3u/INfl8pRv1eXZidQCHpoBs3OrKBoam1f
 E9vGJzDULMOAiwhBZenYo5fH/xPU8gF+s2Yb3KUuL2PuKYeN2D98vq9HuCd9W9yjWE05E90ABcj
 kqP96Ce6IeZNNmEzKmw==
X-Proofpoint-ORIG-GUID: d59ktXZmSOzCRCoLbMN02agk1IFTATTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230118

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor as
well as mark the RX channel as such using the slave config struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 5c42fc7ddf01e11a6562d272ba7c90c906e0e312..635208947668667765e6accf9ef02100746c0f9a 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -43,6 +44,7 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = { .scratchpad_addr = qce->base_phys + REG_VERSION };
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -64,6 +66,12 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		return -ENOMEM;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, 0);
+	if (ret) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return ret;
+	}
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 
@@ -107,7 +115,9 @@ void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
+	struct dma_slave_config cfg = { };
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
@@ -119,6 +129,11 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	cfg.direction = DMA_MEM_TO_DEV;
+	ret = dmaengine_slave_config(dma->rxchan, &cfg);
+	if (ret)
+		return ret;
+
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
 		return -ENOMEM;

-- 
2.47.3

