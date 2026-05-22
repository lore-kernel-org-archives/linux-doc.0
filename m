Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0925A46AF31
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457259; cv=none; b=iKufhPrwjJiNbYvzb7XQWz1EX3MLLjPw927RcwWYw6arjjn2k5pZTAmcAiiATngSlkLzcr3qREmSucD8iSnPmMJI6b7Jq2Pb1q5uH16kY/Ud6a1uVDcKjQsIKxmSdBq0mJ+zrwypu64FAw95L22nbfpFFeYAzOoDxtBdYDObJ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457259; c=relaxed/simple;
	bh=itwan/+JcxMJcmRkoZRAIh//GowjNEJ5Pa8ZGTWCN4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTJTJ6cucEA1rzdb2dPewpDb7ZLUt8xGrY+ZGnGC8FHXr5HO3iJp/fuTrNjqnUxDgMNHXWKHC6MEOTVIYzaEVVEtyHVYIBgOPKZtEyKNwzX9JO22tY5UsVST/IPtuxbyWNw6DzJUDRqAqFlKVAw9mdu/RcFgDJ6l48X401iFgxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7a7As0i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9L45SaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7a7As0i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9L45SaY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8t3Sg2765337
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	okZRx7JveDxwd/GUmOqQGeY1v3DjRixvo9jJJu0R/N8=; b=Q7a7As0iUCihXzSA
	8DGEcg1wkTEXjLgkvMc/oQTcpocWg2Y6iCWPvnVPcQmYL+Vzmd3Lka7M067AfUNY
	3klcagQsEd46KlTw5tGan/RrtdMgZbtOayMXBw5oEJOJbZ+Lb4odNzBf6yRq5TVS
	Xw2x7BmMgVqOlh/xcp4ICszPH0OabjiLTIjaEoq3DAWnkKRgd4yDFW8nJIIjG2Ol
	SJKYoxcuw2MbSHO74FKtkCUDT7cI51p1eiKmxWtE1mNAlGxFRKQKA9xYLFSz7e+j
	Qh1GWrqqkbiUp7VhMo1LwakZfur/gJhHvzOKxOuwBj8PyNstpM8UfiRxyvvsgf0T
	5/F8rg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7w677-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516458449d4so115365761cf.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457247; x=1780062047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okZRx7JveDxwd/GUmOqQGeY1v3DjRixvo9jJJu0R/N8=;
        b=j9L45SaYoC9yCJHEahtiUwYkWRBiNDH42eJW3kV8vEXYR8Rk8HwNyH5HuXehGrqq1c
         Ghvp14HQ/iODzQwuIlWgAYkQPtS6sYRC0u/EFgPGZ8tjmbempwyxLRVVskHxaHPBOFD5
         cdP+esRo1/3bzJmAciiGTamxXoBX7Jf5ZUkS0XPavRGPI8YtgK9LoGMbvfoTb7o1upr6
         E06VuemJiD5b1gOZ4kLI+Sfnq8fuseiZueaJFSwLwDHXF8lMJARac0SmNfbtS54OQYww
         VxgpFBZwolVcEAmKLmGvIc876+suPyQSLDyC1G/n8gQIPJvi4xOe/sbgsljRKB4opLKX
         88Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457247; x=1780062047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=okZRx7JveDxwd/GUmOqQGeY1v3DjRixvo9jJJu0R/N8=;
        b=I4VlOcvlVlu4BO6gBquX+y0VeX0lESJJvDGx0G4my+RVf74Q04FceUACbnyZ93KzLk
         zelMaPkfiIbARdnpxcBBdETvGEoqlkD8ScngwrcQ8GIzrP1kAOFuITyaqOE5it9boJWR
         Lbvqgrf89XfRqZWIOkov23a2n5qxVGNz4kiH8/fpqjC+ZO6pj35FZItBTMbNek70VIFb
         76uMJBsD5GoxEAOr0mK5BFoVe5anC2fqM2MGqR3anilN2OEKeufb/8CGa3RKB99a9XL5
         VDhbNgawAbXbQC2hEV3kEMJxgpOKdKMTv9KpjQdIAFiadDm0464Rb8cMEYRHQhiVCoLe
         hwCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3fC4t+7DCwHKbkGMMv1xdP51ShjdZ2qlktXgPsmIeaN75P5K9Gx7C7LLCys1Hq/TjsptshUvGLHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpG6S8sF7wT6XeE0+zWSKRjayZM+u5S522ZK4hS7DArw7gY/Wn
	uBq5FhqbXum/zTdtQcR3wzo2v7QgsbE/d+Dsn1hP/ewL8S89bxJ69WeT7zO5MoHBFVAgjzh3i3u
	nUGmmU+qY2oJn59ZZxu2OLwUMIfU6lPWsh9GP64svhCKps8w6GJ4hUtekMyJpMbU=
X-Gm-Gg: Acq92OH1oaOUuU2cdNcn1RhUULoar2s5ocbEYnrJzOG2MSPwER4Ax2Ayzp6J5y2zQSg
	EQh5O8GwGza07oi47+kBINUJqUY814COO6k6f5+oofEPLuPJCInLg0afQnDEEorWndIgOyCQLgj
	SnaVOccVhJ5ZaydBY8F50x4Z803PNIrs0ZiumFdTUCzRaxKoRLyg9CIdRe213f1VPIW5QSmP2CM
	ShwnVquKoysa5DL5Qv3cgK8rlow8whtJYKW0zEA5gFjbAe4/ea//EF7tTaBv4v80MWGbOdYC6y4
	7xoUZK1Vi1nVr2pEMrC7wGLuji6Zw4JdEkkjg6zwR455dNqa0waTLzMPUf5GwyyxoonJuRX0T09
	qbDoHJ0DyKrXw9bACAnGNfpHmP8lm+iMxzCKf99OllorsAitCpg==
X-Received: by 2002:a05:622a:244e:b0:516:d66e:7b1c with SMTP id d75a77b69052e-516d66ec02fmr41104421cf.34.1779457247600;
        Fri, 22 May 2026 06:40:47 -0700 (PDT)
X-Received: by 2002:a05:622a:244e:b0:516:d66e:7b1c with SMTP id d75a77b69052e-516d66ec02fmr41103961cf.34.1779457247161;
        Fri, 22 May 2026 06:40:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:07 +0200
Subject: [PATCH v18 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-14-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=itwan/+JcxMJcmRkoZRAIh//GowjNEJ5Pa8ZGTWCN4E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy+1JVvwHaZ9qMXejO19SIcCtwjcWfi4iqrs
 Snxz+YI1+SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcvgAKCRAFnS7L/zaE
 w55lD/9VdqXY5+AwSFtZGtFpvgU3LLl/oCf44IozAmHB4mPzRC4szaMIC2z5hyHEGRz8pCNIr2M
 Mbg2KnLvgf4gOx0zV09lH0jpN/l3xD6O3KPrk0KKG1bSHejWM7BbQpU/2itE7chaZCpq/q8CqTK
 nZV5GzNfZJogVF8S8LiBXONsIvsilt37tvmtaljNrc6YLvkYDmY2h4pzeAzte1PpOV4uV693uHo
 yGYsy65NYMgUvk2/adSg80xBGO4YGkAjpk1QF40eiGNlIs3rgCkpe8TA6ymm7j/AVmmjk79s4SR
 8aI+N0zDj4+SLkPE3xdCqca7eu7pP6Jp5PA9lF+/CpHSo+2QdGxJdNEh/N93w4zwY7La09+9xLK
 o5PL4egztSZFRjx3kPlda9M4PoQRTRlunJNgPFOW1ffQi2kHm18aERxpWHVPCSOOlgHX+XIAHL9
 gHgQGB/HpShlJHLvKbTjI5o1fm42K2KHeqDf88Son/Y8GCnpm2geSa39HiB5m6MsGiTd7txCqyz
 OnoFKiWEd/Ojmrf/dJjXGpRhcaSWRsCOyQzaNGxgnetfP4ORDpp9Vbp+HB3flEhm7LdBd3YMv9/
 pwZc/5MWcs5cnysXSUZ1vc6vf7mD1ZrevQPcs5ayprFaJ3vHg/b+1zUQQlAziNSsky/vBK10bUu
 EE7+gbmtqVy/41A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a105ce0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TaTEkgESQyf85-MjQI_VyprkIhy3rYtd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX993DKjwP2pWo
 EvvEuk4dNDDSxSUnuYO56fNarPU6cjxi870Mj6SorOkXOgb/Oiv2Nn9nSLJ3AfjQHpUyWsGlSNo
 lBZbTTLt2admPn7Twe9gavxWxRKjYCKU7FMk6ZmKrET6Me77KO+dJDcmg2JghZdFDwJbLKXTtC6
 Qc70D5Jk8gvTFInFshCtrb5g53frZByfFNe9byFL65DroBXiPpK6UJT9nhoDEaJ95GMlQ/ykUx7
 dDewhLJOlJHy57DlNcRBAnZD9iu7SXIjGlTb65S98Ep8b43BLPgir0Dlso1cnmjS7UFeyIWxUgr
 D/Fa5O9Gqd8dF8MrVtGVYDbIEig7/wpOtP/2IgdVIUHc+ox15FDV12xKK9VTrtiPsZf3FHmCgCo
 4BDUHCesq2Z2K5d2Q2KRXG+lXgfPJfxatgGaAPsl3quj7I2Xf5EuUWdce8FUwODzYVYytWuGZ/G
 FokRQSsjPiO9REhtdrA==
X-Proofpoint-ORIG-GUID: TaTEkgESQyf85-MjQI_VyprkIhy3rYtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 437314f2aa94feee765f750304a28ed7beca90b0..f7a7b98d843f03b7a2722df0376a7be6b4a09114 100644
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
@@ -60,6 +65,10 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_unmap_sg;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3

