Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E31A3E51F9
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756192; cv=none; b=njcmCZPeM8G52CGGiqUrnVYi+wF3nMoSeuF+vVd5yJ0tdW5YueS1Ke9m3Ni/F4aZRXRM1oOAoBch9TExUCdRePZmm5AHnDZMs4wfGdKcFN7wHuUYgqNoaXaUJQXoMkqBt50O0TZFe34diihf5tTXQ3D+Vv3jUfgAddcAILVniNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756192; c=relaxed/simple;
	bh=zaDjliGI9P8SDSmb8oK5ZUowNY4iBaNue5t3+i0OgLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEm9qeUGJhJNgje+gtWoUA88GtlA9iO7NIUP9sRsHPA3hm5CSvZt8pmzHL50+7LmKXJa6SRrwgehMcJ1y7rRs37R8CVY9VYXtbdFV6RvBG7mqO3IocNhwsGs3Zawdo5d/rakonq821LlnHEVE+DKIuL1Q2CYwuq5DxkY94lzDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeSQpoHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URMI0mwF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeSQpoHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URMI0mwF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H81LCt3295184
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=; b=PeSQpoHgCjkDtOpF
	8xeOshEXMg4ZlauTggV9b9YBkoEKe37XcZ7EeVFd/6tJwGqKWol2ScLNk2xdEIIH
	pyNAokq1UBmH9GFMeu6/KCBbWHi6rNnL7LCpkQ00mfwYZ1CExBcuZQPmMjBfMRvs
	icqFAgUoODE6b54sozyN/12caC4wKLjRwY/4GTbHSfd3fV4X3AzYPnyCdsW9UhDp
	Ex6li41eEdPpTmbuMZ4WoqjKp5PpS65MMZn8n8TKwf10CwonYHW18kt0ruC+MXNi
	ulqV0wv09KEQjXCUTsSooU/lDfRAwrdfg11TO7ppTTVxRmtm3qT0SjFbG9IhOlNG
	z+hHMw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy4a2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:03:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94e9c0edfcfso8102439241.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756189; x=1774360989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=URMI0mwFwDEpxpopfCcwIsWavMqIoeAsgNrcW4hDkpcaiQSPND7pkhqzBNuym8qhW3
         WovjvrJozhovlweAoe190Llow/qqIrJwLPuuJcGRbcfDlX+CWzPFZljwo1hP94dWWsrK
         rdwicwVtsYenh9EZgEjBtnoYSd/R34YICwsZiS1zclSsviAJYkVZ+kcuHC+f4u6A89jz
         YgF4ihFLWooGXm2yvsZXeyhV8NRnvm6XvqiBzSj5ZRMXZcjtJtyIY+6tJFEJ9tfjjSuU
         etKrp+4Ew2iYZ7BOCTLrUBqfaeN+5RIbuDVC3KPUIx03A7ShkXAqb3EZZxCuvoUf15uN
         ltxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756189; x=1774360989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=QZ9GkvNUeSH3H3dnPycF0ZI35eACjGULnv+YLkEsmHg70SW3rUkz8VQW47pnglRcKm
         +6dBLU/inso20FaETQF3+L5lSO3xsRFQU24cIkW2WLr35RAfLu5q4MqKdFJYp+mKSgcu
         ENIt95sXsoMii6zEyDOzHJstp7UGdj4FsIzyGklDA7rdpkm0ih5Rdx2hY3+nMEUBBUZD
         XJw3UHxAt/bKbPxuorLPvq0WViy5QcRwcVcCkae0EgOOvdcGi5Y+W0/HTXEnZ0H0tcK3
         FF/2/P11qacbyx47gZeO0F0T/IKj8wN9JFy4wJ+DkJk6O5Xz8jrrMUZiubnVvfVzNUmE
         fYmA==
X-Forwarded-Encrypted: i=1; AJvYcCWZZz2ehQTpWKFnhpNcnor54Jh6kAw/1OHFnd3ZZ3h2E2iuBKK7Zg7O1XBhfUK+aDTwl9xZMWQTAMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGtxIrBrEyzFKB5xqtVOk3kjldd0vLstq1vtro4bnSD9aAU32
	Cl4A2UpqibFZGbfP0d28LMirTx0PmCkDXQP1Mw0mkuKHYucu5uRC6aoFQV1cGFPfsUvdyUQ3NYL
	h0OQ25O0pvlScILMUe4IT6+lnBgtnvZsi8qvp7v6WXu6in5aka5/LG0eMRM+Fxew=
X-Gm-Gg: ATEYQzyZmsbzn23oyHoHEz0CtnB3YiRvXlGH7/2UGaNMN72RagCZeo7R5JTsY9l2yLU
	Xf0AjEWwvJRqRPncYlykk1tK99eLNdUTKhB9dIDbfnNh039j1TGhipwz7lw1jcHSKXCy+MnlhUj
	dggFAPpqKYv6T2fArqU81w7IyDZy8P19Lwwcx6bK0KRqE5x6j+XE5uR20OOXMYO20yt/diXXWl6
	X2yAE2O6PaLDml1Boga2mimFMRD8+0UIpkJGc729mv4fhpGrAiepGSdGHuUGPqyFW+4I65JOHaN
	y5ULt7SiX0BQ6V/Pk3nkwmgW3QwOjIkV6J8fkPQSi3CJFWdZVUg2fbd/1BDoF6+jDHg6ZMyjs5M
	18QgplbZ57pv+QDQmju+xfDgeo8swl9HcKgNkyHfOrcMFCco9kr0n
X-Received: by 2002:a05:6102:3e94:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-6020e501571mr7432169137.19.1773756188472;
        Tue, 17 Mar 2026 07:03:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3e94:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-6020e501571mr7432059137.19.1773756187757;
        Tue, 17 Mar 2026 07:03:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:03:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:19 +0100
Subject: [PATCH v13 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-12-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV77vDCIAYQfI0C3VRl7ukLCKUCkcp4kTAmRc
 iM8NiplJyGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable+wAKCRAFnS7L/zaE
 wxoDD/0WSHRC6PfNqAmPMsnjMbE0sIR5179rvqrjPAs4tHYZjlfgSKp93rEdS4eNLqf3JrBuB3C
 tDP+ethl4+iQ1U/zNVHVLX0UoL6dd+kelGmj16HABRYfZE8OAww7gsCqgt+i/VuPJC1FvAtmXmC
 GdJBFhKm6ln6wNIiyYHEaGXbLCbrJAtSBQQ4s1ehX4guY2rrDaqrIzmdR7FYxzLRZKcHc4GrJ6F
 epJsJcM9LsAAp7UI5gUjq/OwYPZKCtmKp0A7sS6AUZAj/0vsOY3ery5R1rG69LOCBQMvyYjWefu
 jkn5BT6zjy6cyV3O98r2EqReK63cX0ybe5VlsUqhLynoFZUfeJD8aRIdnamKhjBxW/BpzcmP+1Z
 dJadF7bph5q5ZQWll4GvPeeR4bWR6fpE7CIejftDYidq3NDLDSofdlkKkiw3wMLxvYzJMO4hMT6
 DqrmG+lHvPf+R85RPdBBclZ2/05xpRXVT8xCDmnW3VrkxHUOROXBacLS3kXbP2gPz66VydFUzKF
 tsbaqFJ+nYrKJvbRRN7KYnx2xWUXgHdF+1ltnt/KTrPykMf6z89/PtWtJLQ0mDuwsBPZDpU7io2
 GmDJEP7kGuvldOvDCahNhdcmw8iTOnre/lQ8zI3aUM7sUmA/3hTfTGtX1A1DyqgSZEI3YJR2SlM
 rGyUPdHOIWTH8Sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b95f1d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX+iqbF4IgD0aT
 KQEBXeqx5G9XJwOFuYxC3HYnRBcaDgYzRvqkkBDJN3jMSTaH5ebE2xTVUrzRgsyjuopOocnCTIb
 fvxuRuCTbw+hlKyYrJQawQs9QCkxv5jzJ9O5v2O6pmJ2XN9w2kh9K7iTiS2a7QvYlJhxvTsEzUU
 ASygVpsItBc6VBw70NL/O25t8PCMI69dQmK9GMEkMYDOidaqIN4lCYUheBpvIQBPQtiZTjRArvQ
 fOLs8xV1nfTxJD6qD/ebsxeFpK0cedjFoQqvWdnM4BU8d8+wJi/MbBnH7JvrJQo/FMfj3FMS/4A
 Jb0L6cF3dOVN2YbE3Jd8E0Cyjj92ktXthcs0mzh4EGZNvinJQyThsklK9VPp7KBtqanfNO8J7wB
 1QNCaVyRpsNb3vmpX4EU48Kf3BHud274NiJoecL3qMCJeOl2SZPPflZDoWHb0m/dTN/Z9tCK0uy
 7SUPf6NPB1NDSHELtjg==
X-Proofpoint-ORIG-GUID: 908gx1c-yjSJFVftsUE4_DkQeInKgdGG
X-Proofpoint-GUID: 908gx1c-yjSJFVftsUE4_DkQeInKgdGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124

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

