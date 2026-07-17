Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C0B3EB11A
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277448; cv=none; b=jEDI48ix7emVzvWPdM2HhZ+5xlGAHz0uFoOhSoFdZJTYCro+5x84T90kgJ8bGp2gpLYTDmUwTrsA/VcwUMA1m1/uByo/ZDNk2D2Q2yQeSPxXK/5AvSGX43d9Lud15fWNmoRanMEaDK0IAkrSe1G2aJ87nkMHuKqDSNV7WAVmHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277448; c=relaxed/simple;
	bh=LEka6faO6W4VTb8Xdserzp0AuLRCYfyiVPmoWRGCpPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cz4kORnq//IZRLqU5pCVlmuYSuWb+MrrDrRYYWqeSbHTABBCAvyNjk6XtmcjtLu+62NJCVX6QhehweBn9+fF4jLCSUSnu1nH1PTyPcwG9qq9MJ8HTPj1mSOG5hXUYHAUZIvcLbhv8d6gmIB6fc8zMc9eFEIdigblGOPOB5NRP6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUynQwd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4Ygcm/c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUynQwd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4Ygcm/c"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cf2G1078349
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txS4V655HOx5Bqwp6CpSnkLXrrW8fxTYJ5X84corlvU=; b=mUynQwd3HXcwrGb9
	z6VvNcBycaFwZEHv+MwglFtCljvILKcixRKXYugxt6OHJlzj1R4VqUEudNiZ39Le
	VAOPpnYeJDv+NvikHKgI9XJLO1Q6iGbza0YLcKcBnyha47gytdcwkKmbiV9CBy52
	5NVNmNwqTXMoEBiKfD65T9Zr26LO0/nHo3AvZd+UK41qnVK8onlhxZRD3AirWIzJ
	97ZBcZ1i//D/z/GZNGj1OtfIrR/OwnTZe9m7svF5pMm9kk4oFAyys6A2UjrFQwSp
	Zcy5DMAKDo48OjCinjttSLJfwW42N9IDC+xW41eITtin5mkJaeuSPYrVwD595Utr
	x6WNOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1c7hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2af04aeeso36720801cf.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277444; x=1784882244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txS4V655HOx5Bqwp6CpSnkLXrrW8fxTYJ5X84corlvU=;
        b=B4Ygcm/cbJXAPSbQSBRDxHgrRhb/4MWZAYa+HqB0M/YYaDXjGOQJE23kfYcsy0fKI0
         K7AB57uM+kV4e0OQocqF1+k3gLmcvsc2pKPF+547gIV/P3kZnHkjNIKHyGCRjyNUzTU5
         8hkLjbsNMVESM/g6rwlYPNFQkdVEzHQP2KwTZtCV/jrI7Qyftcpxmkep/0pBrKUGjcRU
         KtkiQLwSQkxD0CQgiJG11OEkwQWMtzS/vw9xrCVvNiun1bMwRZY8AfPXibtS4vSii4Z/
         Z3LIa7ZcDJQPTtAJiKc7uB0m03pH3vHP1i+AqYW6wwyrpBstmnAumnbTN0xmxmQY+0EP
         qQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277444; x=1784882244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txS4V655HOx5Bqwp6CpSnkLXrrW8fxTYJ5X84corlvU=;
        b=kWul1Y5TuD413adLQSaGYzisQcMpKa98vGU8JVEhTSbk5vKag2DqiEUSNpkoIhLn0y
         9CqZRZXmo6mlCCFaxE50RiUo51AwQJuvWr9rWU6k9VR+NUEkNny7tBH+bEQ6LuoIBBN3
         l8HC1s5XQD6hc0XTsY/JZDh9VF3bOYIXtfLf9Ir0rD/LJN6/LE0fribb8okwKHTkYZKK
         v2I/ThXzvqTCtEii+9gt/MBJrmfioFlU5/3J6D4nUbzWQl3AUgGpG7Xw0Yc7J+PVt8p4
         dP+WUFUjXzlsXGrGIIOJwJTaySBZH+AW1XWY2ui6tgv8B6cH3FLX0jn8fnF31gn+bGl3
         TDKA==
X-Forwarded-Encrypted: i=1; AHgh+Rqd0KyJKlalwNl+bn0JaVGCCNxT/aRd4uFgyhLIwCZtaMLuI38f6Q8JR/7cnu7ATU7wfYUwnqZW080=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lzWFjtI6y+Nk09eP53ko5FdTw7IkJvN9sW63H7JWL3JhCdIO
	Ov9xuWvdsVgzw/QbRJFvKyQDlumg1gfB0o2BRbWlFMGmpgMOBFNpqvveQOaArcUxLHqo2+RqVCZ
	w/fDj2h/J1IJ2N4wufCrsJgPUJlbaHLrRhpShJI2apQkEVZqjKRyLopfYmEPjHf8=
X-Gm-Gg: AfdE7cnXce1TbwVSZa8AO7KkdLiVa8Q+O11g3KNKCZG6vs1ziULhvelxZFGikmKAlPW
	O6wnyEd2NW0mvvL60zADBqN613GriRX62whihx0s5k3xmviN89AgVIsyh99RRNuSEc6A4IQ62qY
	TTkbdAh8FfmWyIplWhAIJwWlzihHhj3TOZv2bv3wyzrXAi8W/sBlajt2c3g/zzMW300gLTAOdkY
	fjI7YN94xXbCBFXeXuBueV2VaZLP/tIwcvpiMJRwhImLpqkTASim17XXIqX8KI8Ycz+FlhF57gI
	Z0Jx9B3t+cbFCoxu6C4r/APOv5G2EL4gz5i7tWmTXkuRzR30B6RxpMy48z3ciMBIX6mhIMsQcUm
	97VsunBLY4Sbo1F+Q0jfoZHVRWQSqXw==
X-Received: by 2002:a05:622a:4cc5:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51fc1a7372dmr61283161cf.34.1784277444352;
        Fri, 17 Jul 2026 01:37:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51fc1a7372dmr61282891cf.34.1784277443918;
        Fri, 17 Jul 2026 01:37:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:40 +0200
Subject: [PATCH v22 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-14-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LEka6faO6W4VTb8Xdserzp0AuLRCYfyiVPmoWRGCpPU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemhuTLm2ItJ7M6GPxkTm0KXQMX3wEyBuCdEi
 M7vF61/w9iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpoQAKCRAFnS7L/zaE
 w2rsD/9unfiQY4i5uQvjrqa97YqLd15rP7LzD39UN2BEDOjUBgC8OWkJzkWEG7A/p3+o4F+z8+U
 6p+wbuCOCi8t//YEcykX+ft6gkV7nnWvlVs3Ay7fRBVaTk7xNYUGfvLsSP/iDg8Y5OQW8hCJGL0
 ZNQJUN8C5nM5TIlYI+GCFwJu3In4t7HtZxOoRdqSgNpsRW1nfCVlOsyA7DMPJalOvgzEUytyAwT
 yLELuf4kYu17hjkjRc2J9ZOxTzjOBmeg7NgxR4ULAE3EjMKQDUs0tIUpomnH05Nzz+KNMjkyKAR
 VTjTIWQXycxK87bGfXwwX6c1e2Fv+gm1sIgcyylnZjKpnaF2V5QQdpAmf/09FNsD+y4YzKcRKCw
 XIGZkM1c24mro2HHZEzaYRaRTI5b8Ou0iZuxL+0H+rmAZBKP8hQgu27oqwYUCMfNHRGADHz7JOf
 edLyk4pVgBhjWAp9348Y/9jD98gNto39IKRS7i4IwfW4fedFYtjgELqQmmRs4lgN79pm7oFd5mI
 II/Cm3eknGx2slEjw5I98fx6RrIpDjofaTWfdAcTDUacf7fW+fDGoPQazu3IfY9zLZ6mWBttXzn
 Db9IhwIYtlywfsmw2sboJJvVrJlRZokgsR07QRyRqDKfSoKPX2wrfXj8yIsDNpKxBBFMPuNDouZ
 qBJrngl4ns2qcdA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59e9c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXwCAkesGUZBNL
 ezzwsq42dqgjxZlVgmXfpE2DXRStmXWqB7MrBLD86VG2hRMawoT4lPERvV9VK5ij35xqlf62T0j
 bhD9lNMP558RRDR7LyVOf7mrQJIUnsqPFzvgh46DYh8jMmlygGa2gbPKAN+6JJHmbpoz8Q7mRsf
 g9N3HdYDfNsKpg3g42ToyFxtDlPSaxspFivN5A/2Cf/O0PgcATapeo+PjMdIB/AfGNcSHkz9IQm
 wvdC6+gfW0bP64JIX1e37N1tPf9V4PQHkKqE6rcw2D3kON3C2HODAPH0R/zyFhpLQEtLSqJiWYN
 q3egtnJsjN7esomaME0hCamyRy42ppJ38ABuomgSofI3Un0USlLeqfeAHgWq2ki1YPTM9KnyYry
 mak4eu6tNUtX3EpF6a2owLIyMYvkwIhr8ljonTbO9wMuhxkPNJeZvFnnt1S01/QLL2GO8wycmML
 XaiSz0NCaZAcd9MqE6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX7EtXtcG+eIiM
 kmoKiorkgXa6J/WLO16aOuO8ihxpYtFnBSQ3uRm/dxBME44xxawE942+FswIQvtlHBjTa2O8XgW
 PcstAUFzIItW4rcxV3tIcl3WIaOTxUY=
X-Proofpoint-GUID: wlFbcAVsm6aoP6wdwcwtsJsDw4x4ITE8
X-Proofpoint-ORIG-GUID: wlFbcAVsm6aoP6wdwcwtsJsDw4x4ITE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084

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
index 88d253d9147cfc9ed275653f7fd248538378194a..b45a65a2ebb511d6619a49f35a89730a551421c6 100644
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
+		.lock_scratchpad_addr = qce->base_phys + REG_VERSION,
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

