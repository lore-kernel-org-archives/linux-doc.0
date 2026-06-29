Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852323F8238
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727293; cv=none; b=aeD3eTNIP5uWtDQ5dOprJfjvPh9uBW6yaeSdQBC0+MO89ezI8sR+hC7Uvym+wMpL4DseNjkJdgXM2WeHlT/L7URolV3J9WEqrnrwHyy/riNAwlW4Gqr98OgQousU3QHRL3WdazU1/OWMBDDIFrtxOrysOBp9cEWeMQChbSypEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727293; c=relaxed/simple;
	bh=wwQQXRM0gaMVWX/Dzgfr4bRQXhzRu9ojnjIrabYrXjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnxG8HRbaOMcA2a+O+k04suSj2cN2qtpSdRiFH60W1UUBNIipE0IQZNXU/io/3NwFRwOB/byIv8j0TwbVntLIiAcMHUpNUVmnHpEs4rqMbnLvRuhLcGZhtBHY3xBFm3BY8/9HhGCjgnoB8JVwrjQif+1lDoE9XOFxWWf5sli8oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUmlEoEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqnEV8Gi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUmlEoEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqnEV8Gi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xgSU2431944
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=; b=ZUmlEoEG5NwU9itX
	YK1eHEQZHppVWzXbOKbDgG3nJIjOrHO/RGzGzW4n3sGtg14SKkR+Dawqkfgb5E9F
	d5mcERF0UZpL+7ODPMO4UWMpdboCQuJ2Sl0dMDy2DYh8d/Jc5l7TpskKV3O1DTbx
	VD5yRnjBJt2DR0+Q5hfKSVbmVavRRW/Tv86mn9MkPnWRAAccnL5QzBHoVLyq/sTu
	YwpvXeIfCtj2IWEiNLGbYNn0N/HBuNaD7j0+AhQGTvtDRn60HvlWuok9Qg2NqMoK
	Sm0maLwXWM2t5CKRukdGQ0CrpGuQ4icEB302l77b15AT2DAGQcZcMs7c/ngR8IyI
	lZ1apQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper8xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:31 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4856ecace68so2033891b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727291; x=1783332091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=;
        b=JqnEV8GiEc3sQuX4GE4BF1hdO8GHoZdjq8VrqSu/jdAt6qdDg5Pqj6JeAf38KAP5TW
         kXsx9oyUSftMXfd0C+ozmzTL2PSGKBaWPinweo1OnNCBjt6nOKKcXfqgx1UeabyoZUOB
         8sCyiDumwfZFOn95j5Krjl5TU4SpRq8CBUJbHHXVGGmarMEoRNZV8lOWs4ikTq/fLXtM
         KBAaT5T6NJPbXUPRTZImK5sLHxDMTvB/vBab7H6JW7itS2jg8BMdC27lugydyyga/YUP
         PEullvc2vguA8eXC0tNpRQkj3jHKLclzkC0CzIN0sYRL2bH6dVa2sgT+nhFUVf/6TEwO
         Dudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727291; x=1783332091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bgcnvEi7Ugd3Hv4P87KEsVYA0DlID2yHzdzIugzgP4s=;
        b=lC4WVmDe3VKoZFEu2994jj7PigWGMztIHzVCzaI1gO0yYZKY7ZPbqCTGV0A1FbPRoP
         q4k9QDAEOuAifwLTLV7tN5pZCTPoK0m920m3bO3D84JojKB5dEn1M5CktQzuHk1nzu1u
         ovJP4EV7kH3A3YGUEHudG5eFlri3yIPYjGBR3azDqI0g13bCOn6V6qnHzaWGRCJLZR58
         5L7BR2Wq7zbPOXyVDSuIGKCS0pKrj97jP5i7XSS8h51Wkcw6BEs6B1paKF2G+pkfav+4
         Ix91kVy9BFqH2aUzylRhx99MLvLYJwVXKAzZrxR3DEBON5tNgA8dXH8XdmA3quChiuvL
         UdbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TgYyvHRuWhSbxO6wWxoW+j7jC5n7cZsyY4KIyGqbqwG1b1rOqw1/fyv96n7+93huO556y6orEi5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzNYkZaZjG4eL2waywz02fPmaGgNAyBNSxnkxXSOgpZcJBcza1
	UjeCfVrVI0ttLEukEBtrcQYxxdbxtTcXp9ztqJsdXsQ36Z9vt7PUS+RVOUyvUDnzFFEmp/t17CJ
	Cj4LHShCuglcsrAgJgk3MosLMXH3wb+yYLHXlBryx9QkFWBNjtXP4/qTkqPp7mqQ=
X-Gm-Gg: AfdE7clB5OFLYIrxJK7H5KdgbTOEjWP3uU2uQZ+CrDJo/YyEA4fE/e23pID1VAbsvHF
	V/nIt63Y7kx82FgdS04fgmp5Jg1hUh6eQU6vOKH1gfYXfzpCL0MBS2xHJF/VBC00gjF/y3UX/qn
	Z49N1ngReMVCzZUKcGUcuqDO2jP6AKaXkO/IFELVtSwSMKgvSzi+bBBe4pkbL01XcFXixy4H2M/
	KVt4+wQ9AmL7UTUdtoM+KsxEpDU490ALUNkgDF/sWCV9nYjQXyvSiEbUVD/hsRDsj/bhZwjpwsv
	yLyCu0Zb+g8yz10Axm2631e59ILWMNV3FYVgfw57vnQgwH5pdg51tvt5MApd1meW/3TuqRU8pMI
	Eg67TmNL9jeSILm2cGjOvnv2bAsbkplHiU9AmweUx
X-Received: by 2002:a05:6808:c189:b0:490:a1df:b17e with SMTP id 5614622812f47-49218112e37mr15351324b6e.31.1782727291118;
        Mon, 29 Jun 2026 03:01:31 -0700 (PDT)
X-Received: by 2002:a05:6808:c189:b0:490:a1df:b17e with SMTP id 5614622812f47-49218112e37mr15351293b6e.31.1782727290728;
        Mon, 29 Jun 2026 03:01:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:03 +0200
Subject: [PATCH v20 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-1-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wwQQXRM0gaMVWX/Dzgfr4bRQXhzRu9ojnjIrabYrXjE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJnL7OegSYxwesjK+cEVKpb3XLBwJVycyYXi
 aaBmx5iG3WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCZwAKCRAFnS7L/zaE
 wzb8D/9vPQevfch3WxayUq7v0SUu5cwPXdZY019Aq7isOzzbiGYG5zcvmLNnQwXq+j9yGzqn3VG
 lTKhy70aktK6FeTk1a9GM3HDYDJ9DaFobSLCGrxBuP1ZHCz5je7yQFcz0L7H7WDFNoOYYX67cjg
 hqx+f9ZIBiTaFeDQU6Mqhc/cft47IwZxBpAhNvLSWatgmr3nzqH4SQM1x1pYLChA5Y0e/6zPo+4
 p7luhmuiuKxD9ogwGt9Bja7D8S+yesMRbF9aBivwp4Z0hTSHI0g1lKM04ROdHLyrKGAhl7i8HEN
 ZVqLq1RAOOwtm4rmjb9njODYRK+bWaIJhO+PR2rrGlV41tIo7FbjWaww9J2QOKYVK1XrLFUAT2K
 5Uzc9NBaNq7tA2LbDS9e/ViHPAGv96R2LGHgZ4DV2U6E5tPXSTknzPxHLpPdVZnWdjKK+YxDxAs
 s4KLJvKKmXzzO9mGv2ziFc7Z1SA8pObdfvIpiTS3IrglxBNF/wQrnMgn828W9l7niu1rgvZJf/Y
 PQwhKDDv+DPYCcX8CAwfNGnXdcDTWmYgrxwYxJ4W8fEL+CeQWaToNfoCH2Rp2zViVcUW0Zo4Ja5
 EhFCbcuPIhV06E6J78FR4OcHsm9XcvLdo3F83DrgaP3r4C0w8XiuZxzBhjlnofarvc5FWw6bI78
 qemDa0OHWgvYE1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1r/L6dcezZ2Y
 aa1Kr7UI0wI6/T74b2RhMfKspRkzpncwWJaWtQnvp7GsoUq4SOkwQEdT/cNkAr3hNclJL9oCiEY
 Vr2fqKwEs9zz63RCNw2pwIc4Ru3HgFavMb96gARp+yMPVN5wLdaFwaW5IBrzjAztoj3Cc8RdGLs
 JIqRJVzY6fawDGW7u36CeXPnyw4JdRsh6C1Xx1CbzBy7mFVCvv6BhVkKOq2m3mdARoGTjzWliSx
 mk4ItRAxpAP16RF2sVlTjWfXPyIG06iWctIxvfXurS7QT5V3tetUJJE0b7YVHX6fr01rOij056x
 uU5rXwjHV4qRnuO6MJjZDVwMRVd0caSJ/r5qmMx02OyjkR+mHDWjTwrvUT4JUvgFH52Alu8IJPr
 9B0JwWea3RqNUbak+UvW9LwxrRRw8bnIzoq0Bi9HeWJ1GH/Gmbr0ogSIf497Bu5zv2SBINT5HKt
 4GUUAhHb4hl82/5EnmQ==
X-Proofpoint-ORIG-GUID: ENcx0v8xngQHlZDeRHZLR1yEUDlq_8OQ
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42427b cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX5EIopRoj9DUH
 o96Y59b4gN/iQ87aYizF9PTctKfjxWqlYWciOA4tGZN77b7ItcieaLm4EhHC/EWsH9ZBmDswYuc
 0hRVTE4p/qDmaGnptfGiFTs5BUfR0rg=
X-Proofpoint-GUID: ENcx0v8xngQHlZDeRHZLR1yEUDlq_8OQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3

