Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D044E046
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457245; cv=none; b=KrXpjw3pZU0lBVKB0nczpgO3VYbEEzyJP669o3qwMQR1t7vY0+ZF2G9xg+tWT06qicEjDBt9liqsZP+Qkma1FBnCR9rSjjXyPJ+4KwxyLPDEGHZhl+9KMtN2VRKOXZJGNBMfw6qyp0Rq4iuXVUgD7uQVSw1da98B5grilTz523Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457245; c=relaxed/simple;
	bh=1hqWDd/0bXE3LgLE1RPTV9B4kaYMiY3xCYD1OrMkUU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPI+33FTtnZr/N/b9g3yx67Bi1SDJ322t6BUrIi31uUgWFdt7JICwqH0Nz4Cy2ErHRusGTmnaZB8BpOYHErC3A7MTXgH/0nAulsn1GvULF0I/ZxNI3nqWUUQ5nwkpMRJMO85nso+lTnQsYbie82lv3z5kh8w6zScPN7UUgb121I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtBaVqoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzNCRUr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtBaVqoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EzNCRUr3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9qmHp313099
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4JgpUHbn9N6lGMSwan1LLLr3sxikf8Sswa1p6VG+q4=; b=VtBaVqoZwk5lMZV3
	UD3TtCxT47gJEz2u728obOtbgeK7KHN3RLDsFeKa+o5HZKcDojGAprLzAbWXJti6
	drsSgC81+qtkdh5kG/APkyrWY694X81vQ4EdRVx0Gc3Pwj7P6jM0E+R1fzH+WyB8
	i7eDkQ8UYdeRhfr8S4nVuELqHHyQ0EaLdjgVoJgBpoFrdJ7mAGoeaCcwif+eXydn
	k8C5/tSLDoVjWesd5VW2jpfvnU/TghkFT7j0eEVDNwVxaMX76z1GNVrpm/d5AprR
	v0bfTzRcOoWaef7ZaXD/LTmk8Cla7T0QCcYSQ9vW76gczWsQcaRFrelWzAmBNiWK
	+ivbzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8834133-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d19f68acso26874881cf.2
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 06:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457240; x=1780062040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4JgpUHbn9N6lGMSwan1LLLr3sxikf8Sswa1p6VG+q4=;
        b=EzNCRUr3voNaCvf69x+K9Yn0DvWKQkolFHojx/xpQ4eRgk/KXFCPAgzWfOpgN9oYVq
         Mx7CO5fNW3qgEt1MtIzzo5yX3lXbjH5lZ/KSPTbyfjawBCXVMs/L36atRLbxm8EkBSlk
         IOvtn9pV/EIRfl87LcKnSwpfrI1d0P1GddU5I7Oon4PRHFJ950EoshfSBxbbuzk3aufV
         Ifn99oXv9Uatwxcp5SiV2RBbY+YyaRVt8VqcfKVge+i9vq7fbqc4nJ6VuhWnpqNyDIzC
         d3zWNJRqiFFikncLjwWKNQMuXGBg4xNyoNKkjvUkKi66fGReYPGrdY01cL9rs8y30Osh
         yX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457240; x=1780062040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4JgpUHbn9N6lGMSwan1LLLr3sxikf8Sswa1p6VG+q4=;
        b=IT4W1KbF+nU9EceS3m1f/oDYpszFw7DdJKKQ8rrulepjbRW/1TwPd0qqsH3R9nIabm
         bXobiC0hi4J04aOE3yKH8r1WpeHVSTtEE192KAtPYm0VNaMSgDwk0g5ZLkwSlIx8LI7+
         qlLmpHR1o7YhibncMb2ZWXl3FAF6OLBiZ0i/ek5lNSSuCdUBgKngEkESr2jdgUxlWZuI
         wMcfGRzuZ1mwYUPvQ7auNww6reWlKkAvuXKU/dz5AffB2G1enc50WU+W/DqlGqBr7vNN
         9/CbCarnPrLrq339oyoXIMYUMWvyZC5nD/b5x/wTUvgwevuBQi2bV3wmPV5Q1d/7XLs2
         zHCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lHUiQ1gBXGxd8wQ7hE/HOuwDRxAwhbNEafPILhUNJRxMnUMOrA2Eznhwi9q0NPtjwpGDc7aVQAh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXMeSVU+bibQc0HESHgHm6QtBB0WbPdZ1qX9PRiLIj4Me4TasF
	pgiNFvUbgUpO4geiXfstknqh0YmZ8nBUtrLJd/HuORye4GM/TEiQ5ee/NyBpJXVD3FayIIWp+DK
	73QAmWt2QDy8G9ZZMDlS0DA5te0VLDmZHmxApEP/Te/fIbzCANf/l5iMDqn52OU0=
X-Gm-Gg: Acq92OHgG+sYoc/eGEiLolN4u1QCtvn20lrCB60yZiFG9v2N+MdePDqpmcvaF5hZNMd
	ZIuw7AYk9wF/tWXt4S3m+ZTPmOTAAeQH/9LdrS81cpf41Jau9moQDaHKAhfsW3qZGCHoF8pNrn+
	AkP+ZqS7cL4ftfliCsu5YDdxTefG9EYI7S41qWBr7Gm5JIXKXA7j869SUyVc00Usugy31YoL/8C
	PS7EU224t49ffhABdlvv86jdHAYHOzdT9YcnN5r1KBVatZ7PxJNbEBtdlkmX7h7Z7xwwI+AcrEw
	8Wnt/I5lYgmvdCU+rrYCNTrwXlBCiXfmoDD58ED2HbuWtDRhf6bKqZKlVuzjuLgJueuSyA++hDS
	YdJthuZm4qMo54uLy3douOYblQhLrZ9WNauIU26iqTugn1kiYqA==
X-Received: by 2002:ac8:7d49:0:b0:50f:af1b:1dec with SMTP id d75a77b69052e-516d43a1a08mr50136601cf.40.1779457239927;
        Fri, 22 May 2026 06:40:39 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:50f:af1b:1dec with SMTP id d75a77b69052e-516d43a1a08mr50136121cf.40.1779457239371;
        Fri, 22 May 2026 06:40:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:03 +0200
Subject: [PATCH v18 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-10-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ngcILYEJOF3Hp9tIAViTgKfkzbk8A+3CFbfctgioS4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy7XqE0J6HFR5/qidJsYGFAAf4n9alpoXZOM
 /lz7y48oA2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcuwAKCRAFnS7L/zaE
 w+4AD/41ATu3vdLYLOhWDKx46u6g9Yg6MCPYiPYG+5qEz3ulKJmxsA3Gd7QVw6ZvZeJ5ZLaWV3V
 ZKZ1WY3LvfiuMJumw6WsMoVc3kqnt5ATafmLA5wnTt6A00y2jBg16umeMUxguFiJQHqllJ+fWFf
 XWfuJdrlxaS0nPntfzsxG1b40Q4eBFZAPIImiZ9cR1lQeXoK1bPKG9DjctMoU06WGQhgBPlbZ1t
 UBPNsbXjGK/jKt5et3IGgMNRZ7uDh21ETHojZPOAo8t98NwQic5WJ752AHb1PUd2DaVHhpY3IM1
 w+S7PN46GShJdKYT27ZP5mnU6QwDPOmNpiuiLqajrg92vZwz7pfLb40o8TdX/thaD2jhvne+DKg
 YHmrOfMJrS3zfeAhWPp7YdhZTVpD/tLpRd9+2vCyJWjflCnC/2C4rqOsHSe90PWTaLK73TdLHJh
 e48eo8X4MFDQsOqFcSi5+XTTKl2y0l/J164nf6R4/gN9MeJVytsdOP0FAU8hW5X5gtjuWyFt670
 tywRYbs8Lz3sDIg1Jc3QsawDhxOhuAIe0lL8VXn6kiEJLPxdu5Qn6GmNBrY41r/JsqFyhZQ/QV1
 QauHuWPcK33VaowA+wRtlRa1QY8Q4KUzMOP8qRUiIzA37P3i0nfg4xoXzhaMUCKqVs8jhXj6SOi
 4wyHqSHHNPKmkkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfXyDTA8fCxJ1sl
 08HfolL8Fjgqz1qAznudDvhDIWTPR4rDKHeKNE354BlSExp55ETdsmuzrSMTvvS/hxGgPOAoEMi
 tx+0Zrz2xIG2U+A++iQqIKGNhRi6hRZ9mFwADaznHE50sD/BvQicA6O6L7g1fHhd8MyesCRN7Mi
 xV4j/GmEjnCicBzpt28iKTANLP+IL650SRhFOM3DQ8gQ7Yasf2Jdp/Kus+aiGfyjoyqN9Q08Iyx
 VG4KdwE/+Yyjg+xTotaTN8t386DY/i2GxP2ZC84Gi+uwq08CFFywpLu9sHelWDKz4KTB7TY4nO7
 8xEPonNSel6xmboHiK3Meealuf22KsfPcCvfSAVABiBuWk1pEjmPRzHIk3LbYTYZHysi+tC4/KM
 +rYK4o5qvprTOOIarXiZYfyQI/czLaLEnDatjKQDj9krp3JX+YnXazg5DUCTHAAA12HFLhAh86K
 BIc2aamvX1ICG3j96nQ==
X-Proofpoint-GUID: 87BHZPWqwZ3UCVJXTd1xIY8igge6-LW2
X-Proofpoint-ORIG-GUID: 87BHZPWqwZ3UCVJXTd1xIY8igge6-LW2
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a105cd8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136

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
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
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

