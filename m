Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071F2242D89
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826630; cv=none; b=HYkEX7ebs+4gQxCNQCYAIeFiYy+/8dBnMT8Ooe1/S9Ld1HTV9/PFPy8vG2AQouBZvPfKFOYHmqlxdGsLrMgKYtGV7MHM+/QrqzqywfqzGoPq9FRInx0yVbL6yWiiJqZUoINptutDgGBveCT4EJU1iBbhht/PN1+I23L5VUbZn1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826630; c=relaxed/simple;
	bh=KeA2nSTNl2mDaJCzIxdtrLUkRk83eDvjYrA1TIhvlbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oxe4ti2hMmtU6yFS9h6smrRkOFBN8qZjzJwkGExFuYSXmJoN+qgsQymC9C268s55vvwH+o0Dn43k1AX06aaw4tvRLklSwrtxlmMuiBkuxGzcFBvH+IfElmd5DfkBaOalfDV/xUdRWPKgd/+IVbpHxnonORRMnTTXGt7NmCgKxAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WInOlkdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UA8BPZ3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WInOlkdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UA8BPZ3f"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvX9b3954477
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=; b=WInOlkdyW0bqceuJ
	XP5J+K4waTI2PIMPHCKf6xQGma6zeMfIoQA5N6dRnlpGJcjd6cO1e821jPzmKhrd
	acDTzvEg6dbppefZiCOEl3MGEBS/9TWYEUnnneb/RtSHnoyHKOHZT2Ui2YbQL1qH
	Uj6YP8j7BEutk5SNBJmg2YN2leGIEuJ164IA1nau/BEu+kfeq/kxJVmJYbTAuK37
	F7O+ECK2HxFIfLeJP7qZSd4MyDsoqjDwZw9/8MdT1wxgV26CGW6IzJfwvJHrCs2N
	htKmrc3dCg1MGt7R68FqyuCwwQv/f3cNbh+Sst4Yo7cpQwySmzmp4YwZNzVnol/e
	kcK8Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0ktnue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:10:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283fa0656dso13116711cf.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826612; x=1785431412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=;
        b=UA8BPZ3feKbD6+xuAc/quk9hjJ/ZTOFSIOpJ8jidJnXqWYH5WZcKzNSP9DneBYwJiz
         NvRMBVG+RRwKN8azaYIgfIbX7IauazD+2hhzYX/oxz9ffaF01Lii5wsz7bRycRHi6WoG
         HAoofi++YT9U0f0VNDe0nfJ6QROgdo+Ndn5uQWdhxvjL6DiBUrhFY+8eXIXw+jeXm5LB
         c374laUSyBV2v5UwBfsPfNyEJ2++S0JDtGY/V1NUwlKb6HutSwmKTdmrswAa+s8J4FTj
         aAKrfIVCXHavkxGikZUF5uGnn4f3UonMlL4sfcwOqPaqx5+ttvE4Jv55zd2uih0YMOSS
         3vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826612; x=1785431412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWAPezfKekMTeUaXy15klHPr2QCAL4plvMCAq141yTg=;
        b=A2+XBNlupKevPXPccuo7lNDylMoiONn1zLVChAyKH2NkpSGkEbdrYuYEZy5dKHG3u7
         e8yixCn/WsAAxpi8mrN1J/YsxucQOA5w0LFvehJr24WWK94dWvHJUmqdvpsOlbuvubKY
         8xSmPmmenPmZ66FScSB0jBTbI9FoWuzcUOYPKDNYoyF3SnYcgP1lZ8uSrUTaU5tJpoJ6
         1i+Ro9GzuXmbaYVhBQCN70hQt5ACGSkYVzS33f+KyZ0JPEzak2RBnq82VbQyAgV5uLZv
         Zc11cy7EqEMnHPsaa9UPW0YLtNdWdI8Sf+o6jm3js9z8zCWB/nyolnCkjiR+a/s3v8AF
         81dA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2ImZVVk9gmvSBMDY6xjQBHQ/JXpYQLHmGSVbXCxQ6sg1AinH2TO0Wq5hzSXfVvIyuMeElfEOAvbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmzzn/aJ4Hvf2G23xJD0rfYrPfmaJY2v8EasrR19C9/TF7Rlv
	jlgckcS5INc7WntYIIpAGxDF2HHamwWJgoagsH7bidD8JaOfYEaCcHvDuJkSKQ/eq18GNnmcd6l
	JvJPnhY5/QDpkg9ERjaUkDdD+3rtuvt8tpsf4EjafTCvin7ONhPhmWcip717TAnQ=
X-Gm-Gg: AR+sD11MG2MsaqFXgqKzkHoBKwnseUcnIgEDQEtLX4NGbsv8+eAjsKng3r5cd3tdfKg
	R99urDZtiBEr0zQaOYN0EJfgl8/FsxwJHDaK18Z8Nu6PGsy2Nk+GeaDRi11Y7gU7klqCmWKwYG1
	abODE0Z5FmXg0F5d0Ode2rVpvLKMJgTy8B+5kRM30d/v+QKDsWItWJ35FGyc0Rwstru0qn4X+07
	ADd98NY6QejQRoPZd7XXfBzAHt1KGEcKFnuoAL17E/TM7WQqVXUEnmvuLf2/c0LyAP+Y6wodjGm
	96cLY/y4uA6twLPS9hJfDzZUanT85Mfm5Xn87ln3o0GGqIbeqlqn+VflXQG277ZuH6+MP3HOQee
	XLKaOn6+8pI8lBDakcgj5VS1i1I9J
X-Received: by 2002:a05:622a:4d44:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-5283ed28baemr34689841cf.15.1784826611481;
        Thu, 23 Jul 2026 10:10:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-5283ed28baemr34689351cf.15.1784826610957;
        Thu, 23 Jul 2026 10:10:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:20 +0200
Subject: [PATCH v24 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-14-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KeA2nSTNl2mDaJCzIxdtrLUkRk83eDvjYrA1TIhvlbk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrKe6UqD+TDnHwjbOTrmC7yHfh6DFtjTuZM2
 qORlKVkrc6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKygAKCRAFnS7L/zaE
 w3soD/9tkyrjFGKxSib9ygzwLxNvhuL6MH/F4spX6VXKXz/JZ1DgRRetA1dhStrhWjwcWHyQbPs
 tG8dPKx+MV8/Wyrz+ELdMYHkGiTLa7zVFbJx4F9uRDQ+o2s6G0JBCYfEMUHfgjiZQ9wuwfRPK4B
 SYj4r2oSVTilPS8LT723DNYTJUi7mN6wQTq6aFt3TwubwU8hb2+jmvhVgZrpQ6Arc14ahAEKHyg
 6CgjZ+Vj1yHCJcJsKEWZyLck0fW+kg76xuz4GmAKHBOQIfNffjjvWITGqXb2amPXayfWrCnQwE9
 wt1/H9sp9Nge/zdE6JgRe8m+cuxxFYDcSw9N+5Q8272vcTo9bP2SbuilMsVrYNwCvtP8AUt4F/1
 TMjlEPkDLCw8clfqx8SH9ZhfdKmZGHzT1r4WRpEoQrdoDV45W3qPLpJIhCUWCtqZo1tqF9Tnrnj
 YRIzwMCK/qUh4xJf1Z44Yc7zcsUppmBlUaVWM9O484FMXD9xeojk+JoTAlTHAJY0DcooY2O/CjE
 6CWKFoDV6R0kK78xhygNqKVYlggk7c/YSlQLQbFZkhIu3ylWETzXMLdZ6APFaP4nqHzsx296H4l
 2VT8T+Whq13rgpAZi5E+7w1zrkQbk8Sx1DoPxHtL4ctvR9a6gY+8inx4kiHahJPtO4IO5Xocdt3
 c8Vaimv34oc6Y3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: eNnREAoHngYeCrgKvg4kK3cHxkVm1mft
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXzrv5wihYRVyN
 3GqxwbJYButQlfvEPCN+MkoEz3KXEDlBaUx6hN7wpT8LwERLgqzrWyfZtn5dFN428/RfEc+SLTm
 iBlwqeak84AzthxrZ8zG13NIkVPVdJw=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a624af4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: eNnREAoHngYeCrgKvg4kK3cHxkVm1mft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX5YYA9DtoZZgW
 BZG/XI80tp0hlLX7/1uOxgaXe70cgVtZQLM/lX+W1wbbCxSamuHA/PSzBXDWHUAFADAVktl7pTA
 4577Cu5jlAyv5it4wFxJcmjchoRxBmLLBEwDBYKU58kpWKq85P+UMquXs9WCQPrfh6gf/8SyJy0
 QEKTYgeSZzH6zzofMo6h30RyViSdsvfAb5JhGf30nsaM0ymqLl5QS7rTPc2pTgsvsaKnSy1SSq8
 8ZtzMv5/hHBbUMrSg+CT0Gww6/B7fbzsDud4XzdcnO7Io6paxyP2GxfWzQ3JzhzWyjoH9vSGgRG
 4pKO7NSRGnEXb9pfMgk5/rEtxL370ctPl9DLAEGZs9lYjWzkVrSA0mHWa/ShVHU228RDg9etIaB
 SaJLBBCRYIsD4wAOZaJPDEhDCUImQFpfht4kgZXrEPYta63OlR4LyPVE5Dh5JHKmXfK0lsovwcf
 74XvgmKNcBEiA6NUWbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out the dedicated BAM peripheral config structure and pass it to
the DMA driver using dmaengine_slave_config().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c |  6 ++++--
 drivers/crypto/qce/dma.c  | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

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
index 88d253d9147cfc9ed275653f7fd248538378194a..ad951a8821a480ebfe4e025eb6a7417f97d7331e 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -116,8 +117,17 @@ static void qce_dma_terminate(void *data)
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct bam_config peripheral_cfg = {
+		.lock_scratchpad_addr = (u32)qce->base_phys + REG_VERSION,
+	};
+	struct dma_slave_config cfg = {
+		.direction = DMA_MEM_TO_DEV,
+		.peripheral_config = &peripheral_cfg,
+		.peripheral_size = sizeof(peripheral_cfg),
+	};
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
@@ -133,6 +143,10 @@ int devm_qce_dma_request(struct qce_device *qce)
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

