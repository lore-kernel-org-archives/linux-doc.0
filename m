Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E873FFFAD
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727311; cv=none; b=aSG6GK6YkndIccSTB/ow+0gqx4Qem92IVKkL8ovzemmYUf+NvD+4NmNX+FUGlByhY28PDHFP/WszNUwIoYNZQS7cZ6UX7zrqA5594P2YoMkjwpiTC828j/Zb+6X+3WqfRbtFsz0irLdBx/IY/E0CfMNxD+4TgKA8LsaIQ4gzsko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727311; c=relaxed/simple;
	bh=3yBeQNw3jzjlpjDFEUCe3Cu5wMqOMdw6j0aFa7VZxZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFU5f05CYB7oPa/eocQh2F2Rog+HiEhoK0D/8C64XH/+eFU4GhVl4u8crVJZjzcDn/kdxKe2KLyhTC/OduF/QL3JueYuFiDjdf2fOGN51S5RAH6lSLheof20yDNqVLvcUzTJtFoXh8gUuGVuGSw5sF4KPCbI4WUG3Ck9qpu7z8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XztrSDxP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rv6FOPEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XztrSDxP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rv6FOPEd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6raSP2077441
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=; b=XztrSDxPyclJi8we
	vRgiAtBVobJ+eerpJLvNwf1p5kAvzavzKHffis4m6GRbnKiQGjFqk6YU8xmRK/Dj
	ISq0927/c5LdfTKIPXZeAitwPTBLPQeDEk0JKwIUpe3kNvOgCnIu5XLxDOfk83a+
	xrkcZGbgYeuzdlN/jwonLtciBCisKFYel0LRQZEl7BlMb41ruYa8wzRyR6I8mqYW
	3vNCJ705lfoT+KAOuujn4x8RJBcz3bgCXdIB4fg1wRG+f8p5Cx74XZKL4XtgqgZ6
	xpzucLNybjVg93OTouKGD3UJD7xI+OuEsanf7h99aY9dsMjaxcqhJt1gQ92F5DrF
	6gA5ow==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gt5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd7f21101aso3396325e0c.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727309; x=1783332109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=Rv6FOPEdjkwps405rmlTyj2joldEzjgtJIg8vqcQbUZrhpTJR1XKituch8i4Tqewr9
         k3kQxxm67Y5SVS24lkJBD4Nr18gLaL6rMIGLBlEx8xwyInl4Jd91OgAGSYsdLiLH8D3W
         lHdmpEftu9tt6IDc839J/QwuNROJPFpkmB4U3+nEV2aYlqWtv9dWuHN8VlsMlzE9Mb7O
         TSgYVys1tfnv/jdXIYsBPSaCUNhrPudprH/FhE2hOpmNmVCOQvadiN7Na/KWhv7pLGz1
         HjIXCojJl0w5brRb5GbnmRJPx/e8tZF0MDE7Sj8pP91LgJGhwC4mDXsDueAu8SFhPQVV
         LB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727309; x=1783332109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=dagybgv135CfOY+oeRXrIgi2adB+JrzZpyZlH6PVQgt+0Bm40UhhXnGOCiSi1ts0U+
         FoqbaEkUlFxfVkNyPMkDY3XXOkumZn2y2VgHucdcfuhul890ENQCRO5b4hC6dv/W+AkM
         YkfGH38twX5IXdfn0Y6c5wF3PwAZyYciZWzqhbBYsiSN8r9B9/ZMUhsB1q13VVJJe7KU
         gw7pOxCFhAvJqpzzj1IUjoXvloak99uQWSSw25ZQGcPrhMqpVHtnrXVbcArdY1Maxpf1
         06ipfp8ltE0tF9noj7qWsxpgma+e0EEpAPsMfS601vzr+TPQk+vwR4JT3P9yG0Z2XhXn
         OCcA==
X-Forwarded-Encrypted: i=1; AHgh+Rqun+4EK5WiBg536+AVn+xxbsoR/hvL9T1uE2GD1tR8CtKakQA1kR5K3ddh3AeKZi9BtN3rZtfaOL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWG4BmLyQYoQ+sYGMVdykXCynGXGYOVzZMlpO1dpzaQJup3rQt
	inB2qQ4FTQavQADXzZEFD/FmWWp1PTMAGghBFtsocrm+9w/nyrmU9JUidSoG0iQmf4wTKJwAxGd
	2LGg4khnAdWhcBzkEUtllP48QC83NjxsEcY/eDJ2nnL4KU3ng9HAWH0gLppxoU+w=
X-Gm-Gg: AfdE7ckTwX/QohlwrEDTS/6q9KJgsSoaE7sRpflGIiJ8/bnJkqf01oHK+Pl4QAL9WdG
	s5GyLG6mOqtpRiA5+NsQikonOzxA3ljZEMpkvTSceNSWuf1RKBaOqpgUW71pE0DX1tgLWoEKluX
	Xj/ZSKjyChUX29SCoP3XpHZcj8TTsppsgnZxnZs6P1ebKH4cXeYiX94yMuTTZFpLEs85xhbgty5
	PgK/xYW/3cvJck79cJUqpLP2QWSBakoUQZmzNvKGKQDiW7A4LQJNfGrwvcTPaJ83WLk9wmV4DEe
	xKrjBbBYw/DIhypOFfRvE7hLOqlObR06oKavSsNN9kJRl68Uc2+g1cxCQo78g7okDNy9QplgGK4
	G3qpb9WM6NudiW/e10NagsF4BOAiofcW18eOm58I1
X-Received: by 2002:a05:6122:8b1c:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5bdba8a339bmr27626e0c.6.1782727308329;
        Mon, 29 Jun 2026 03:01:48 -0700 (PDT)
X-Received: by 2002:a05:6122:8b1c:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5bdba8a339bmr27486e0c.6.1782727307238;
        Mon, 29 Jun 2026 03:01:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:12 +0200
Subject: [PATCH v20 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-10-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fDLeS2ZDhx+ScijOniaw6DzPwcx1IpnjO8zSFEJey9c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJxWoYdaECBMJU1ae5UmTpJ/sF45cGJdaurU
 vfvAW1JcVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcQAKCRAFnS7L/zaE
 wwkpEACzlOolvjYNbjF180IhoXcv1UxMesWJbsR+q/6GDNbH+H+8Y05PJSygIP0eesV6iOV9bSA
 sb/B32oxvvNkEOuf/+4zat7qcfOfqxpzqji4lotN5JPp6ATjXsk6yTA6UyKBGmH38zMieAV8DsE
 jeyxGxYU916OZctTn7CsnBJ/EaS9NhnwsvtI0Gp8VeBYS6AdvTBL8UkUXT/QQ2tGAiM2PFcXuBz
 czP5dJTlb2krm6mdRFXp/7Zs6OgGC45S9h1oK9pvxwp5UA73ohfkhg4/f87D6Wr9wv2d3Vq9nn+
 nEcExiMZGdh2wt/rjpILDQDBycJiKN/FWO8POtrF2w3AFA+6YxORycPUKMz/9DaasiLHCaoG5yC
 /BA4ccjFCH8/ycLcd7VGFSb/tRK3a8zoM0ilSPMpVahiIUN9QFNp1/1ZFyZA3aXqfoHeXdtrgXP
 rkP0g18Pe8GJwl96LpRgas3uUG0Jn+FuWoMdkaasUmNJtbjgqJq2g01n/qhAxaeFz6F3MoZdAkH
 y+UjR7eIjmfRpFpjvUiKPCKIA98R42RGJVlIdplsF+CdERgwQF2V2FHbA5nnRcbLph4OxA8T00O
 93KFIUcl1IO1UMfVHA691gjl/11QIvRk9fR2sLrNhkT/TBKH6Rsv8tV3SVolIYvx8jhMGJ3HNn6
 nA772RGyHavwIpQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX3DP6Z/YVI6YY
 96IDWUN1w4WvUOygbBEttZZNxdOIatFekxRBpMZWlAICrezlMc0ZmmJYtDz420noG/S+Yn+crGD
 VWVVbBIpwh3cou1rErFKAJl1oUr6O9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXzMgOD50g1xkp
 ya0Zs3SKrMLwTZWiBDPF4KSAoDQnA665avSq+m4CLVTzZ5hQ28EML26ensp6G25OIj63xE+NdIc
 8VQPjJnMGO+3ZFN2SFnpbeNIHsG/1GUEGpOtsXz6ZxAIyDbvBE1NzScOZjmk96DtISsQZn3j+yj
 iP9cT0pp1hutbykNc6TMngIizgtEqhmRr8xAG5ZGQnU4N+ZG3j5kWrx5mord4QgMlVCKsUVEBgA
 r5W2V/4yytpjAcDuKMuuZOZbkJwfbA0RQNe/vMd/QS34WPnqcUFZ++Ik+HpTLfE5XQMNIJkCfQy
 q5+L2mSDndnZLKEMgzP/5V/W1xHkFuQl/EZmWildL5TlERu80lyaEtpz8RQFDEzFLVNc7ophfi7
 wpaILzvNxXTzsSuJZf2Ud1g1iILE8BLvm0H98iPjvrH6OHm90b17uU7CEDRArukD+mpLQjcCUad
 BRwu/JdnJFh6fGg+2Og==
X-Proofpoint-ORIG-GUID: oqajRkSXpZBllHDL7tXgDq3N7HN4EBVF
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42428d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oqajRkSXpZBllHDL7tXgDq3N7HN4EBVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ad37c2b8ae53a373bb248aff06c3b7946e8439a8..a0e2eadc3afd5f83e46724c8bc3e3690146b86ba 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -238,7 +238,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3

