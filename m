Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0446A3FFABF
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801111; cv=none; b=VtN+5LfnYUn22c2r7uL6riFEtBfkSo7db2YkVUmISPmLFrLgGWb88wZdDAy/KvDtBirI/gnJvHLP5Kp+LyicBRK21gHlZzUpiZybgHaAGG5P0INzrJ7eRnFa6DiB8zTlmTZ+V6ZDZcWcENKZ8b2zBFepJxPYPzfJ2NeANEyaJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801111; c=relaxed/simple;
	bh=wYb8hULMzww90PvO6ikCdSc5niQ+bjPp5Yt9PZ3KUhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhEI1b8NTucbH+ON8gdMYyvOHM76yChmi77S0kym+WVzYUSVAkBGEs8EWQJcBulUV01JjO+SRaL6FRYjdeQaqYEZX2vBVytBK9xaj3/peE3/60FsmdPQBsvBRxbgrBk5XggV0klA0xj5c16/NJy1gz2G/wOFR763mXeCzt7TQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVQAAu3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASKVkKTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVQAAu3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASKVkKTt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsbVA1575548
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=; b=LVQAAu3r4aDq6EIQ
	7bR/wma6Rra4RG5Yhk+pjblvuattCKxBpprJ/R9sku3jK0CMH5qP8Y2j+YlnWWmp
	E5WWGqXyM/G0tbrYFxQWkDrLMwOTACv0NCFDA6xEARmf0ba/Px6nSY+BjU5jZ73o
	h3FRnAnBsaMxpiFaXcywmGtnXDymY6wayor66LjQhEFZxTofhZrII04G7spZfvfH
	Wl14zwh8c3fISM21okivh5RHUzZOeH3ADHS08Tg6729xt9w7ipgWoMaqckON7+/L
	YDwQnnDvwSKhwNmhkg0sflb3sSpSbQvDYYdNQ3mZ9CaP772w+OVPCoM6EbTPbP88
	WLu2dA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwv4ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6314daf0053so4339400137.0
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801107; x=1780405907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=;
        b=ASKVkKTtzyGz9Yzq0i9+ymCNWhXovR4l9Z1BBiA5pRJON5yBFmIVX0Uxo0a0Ief1sP
         tUmHpMRRH59Nk/QPNrbx6PdgHhlm4q9QWlP9diizZQpFRt+XP4MiRnoktl4I1m1+wTeT
         HrEyZVLR2EOdAQWwUqE+gE3DpNX7jBeKiPukvIGCRZOFPp7bGa5FgcfkqvRrfKbLS3iH
         h2hmWV7ui71S21D45rM8MpMJz/Upf92H6QU0GXapBhI3oZGTQQV/eSJmzYnEDvp+7oX+
         Wrz9CSl/Nh4c1bImDbPeqRaS+ISgnPCkJQ5xW+khKjuy3lfIB4Lxf8QBxPlQSyrb2heM
         umFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801107; x=1780405907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=;
        b=YYxEe5xxL0w11v0NuRcZUf61p7lrKLG9BrZ6+iX5Ra+mkV5apUf7coYREVNkFG1+wk
         KLiD5U8eUS/J5XgL8ubTfCUr8WV/CUIeRxQSo3PAVaN7+8YLUf4oy94/nADOwIkeQD/Z
         P0+qjekwtSh01Z23Cf3zp15BakpFHI4PZToDRAolucwm/bjZ7AdnriIE7946ehNLbT7o
         Tt2FfJZXQHmskLhEPovNSOHAz4Jxm3G5MjGu4LspxE5VXAvjVoe1g1tson8LWPHAmihJ
         d9mlAFxjiY9n+hoWPeyG5ixJX3kQgR3NPI5Q4FF47N66+OcrO4YI5OL4/B/T5SkQEydx
         gwUg==
X-Forwarded-Encrypted: i=1; AFNElJ/qH7SZqtzNTxVn56Kf9xZQPgmzbBK/zR7hP1474LO+G2kltsxOYfT4KlNFhOh8dvgXG0IpZEziLBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYiYDrirI7rjeM3yafVRuqc5ubQlb9vIWiDhGgozWW+cdE1HX
	vslpb9PJj7iC1gYkhq5lfC/xQyx7NFB2O2vVZMzTjS34WxkpGypW1mEaTFJxbtYQ0rbLhafZwC2
	My5OsCT+gcbk0MRUaVqwtQhunMakENUWWIhpRk4cbu/OlWDhOSzIwun4R4iAli5UZ8n2m6us=
X-Gm-Gg: Acq92OHJsgaI7fxagWmPg+DSSFFvXTuBhn2X1BBgok3CfMDd7QCF/PzqqWhHjymzeTz
	LmisSl08ahh13JCTiJvyKzPRSNKLGPxjzTJftv2jxz7YtdqxaosALadj+8yOQL3H8soz/4+aVb8
	wuo8ge6e39khCGoEak5wKIOwnYKzlr9VF/w6bHZslOdzxWu66/W4t+isGuSVnVU8LAaC+M15uOp
	J/xSY6SkVjEO1NjDy7J3b44CoZzgcxE/0O7z7Zr7VquKDbo8tpT6XD0wjq3YfqQELOjEqDTdg74
	hS6EQocUuuFgQqrF1TatPH9nk1htc56XBao11dgoPUd2pLHCKpO36TI7HgQ6gewpTOxLE0h23pe
	zHT6y7jSCfc+vkP650d0f+/m+vwMbC8n/JQptUhjYgYYUwhOjYIc=
X-Received: by 2002:a67:e7c9:0:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-67c646469c3mr7519351137.0.1779801107508;
        Tue, 26 May 2026 06:11:47 -0700 (PDT)
X-Received: by 2002:a67:e7c9:0:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-67c646469c3mr7519273137.0.1779801106934;
        Tue, 26 May 2026 06:11:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:11:02 +0200
Subject: [PATCH v19 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-14-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
 bh=wYb8hULMzww90PvO6ikCdSc5niQ+bjPp5Yt9PZ3KUhY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvzxsEoOkXKERoBmJ+YvCvy9mO2/ZVwzzxGW
 SkD5+eOhNGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8wAKCRAFnS7L/zaE
 w01UD/9Qd52H3q5VW0VL6E7KzqRa+d8K+Y+jYtcVKzVY5jLZ4SyZVi3tVBOS1l4w573XttjwpQ9
 bLmG5wgI9YwBOYEKor4l2B4NV5r1RTzWWYY8kkHZbY2pR5ot3GRBk41IHrFkKqJtLCUihkZyTM7
 BRvxv0cDH07RHmyCDeInlnwULWxqvKJtnval/yE78/Rv4z7XOflmK5RLA/3E8agAXFd2qK+EBSI
 HCHt+oBWXtmabclRSm1us0rmipHIsMJu/GXiKVd+Pwl/WF5N/cfq3SxN38ttYfXKzBv3RfSMB/v
 OTK+WGPkOU5rs3mWfHtvQfbArbPnV786v5NWONXLKaohikx5KNatccGpQ5aeQ/WuaNLreW5d0CX
 d+sKayWGvRazJP5WhH7iaw2NE3Ik5X3/AbDFd019x5fs8E0IeQX8CqZvFFQgx9GwYVKh7m8++xj
 eCxrHcDnnjwKXMqmRLUqLEDmxt96FpTmSrvubr3rO8WmtR2K1Rr0+il194IajYmFaXto42h10+P
 J99xrA80QX3GCp6IAOIQa528bkuLn//rMcbinl9x/FWfJN8PNWeyJLTgC+FViy52icXv9KcIaIR
 739qnqXKU4sjQtDrC9EjPhGwzEJJIkxAReeSaJ/bI50Kiy9PgYV3iUz+9wgtb1/+x6A5iHcgS97
 3TG2vGnfRcU3DHg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Ec6gbnGUxDBC-lsdzjY0h8mxplXyVqwY
X-Proofpoint-GUID: Ec6gbnGUxDBC-lsdzjY0h8mxplXyVqwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX6CEVMxC483R/
 7fvlcSo9FJNcTU3jcRrUlf1885HnmcGFF4+vVPZa30vlp1uMP0/FQ/3uCZhSpPk1yZA2JTCarTK
 1ntlgRtbzOmk/h38fsffBuTvvq749zGYCnf9KFq5/rzfLRZTqrwVsGjxKUO36nnK4PPsAEEgT+b
 zqtbRnPvKoyh2ELCn7pqTlckP/8P5DhD4KvZGEFB4jrpVF4fGkTiF5wjC7o6UN54NE95bqGmU01
 RXqCfWfwKYsQ0hNlcsGydB5zrkaxFMB0CVe4/N2UzIuKfA9LR4N7jTXxcIp/3snJnmpivdsQoTs
 Ytz1KbxfdvzvrhGnbu6nNgS0HKbmz0NoBo52T95+IlcMAWjEjFPoWvWD8B+uXU+sw72iCmN2wEQ
 6PK08aWB4iSS/gaoSyeyAqicyYRDWH7EYGnsLTDa8ymYY+UaGqgEuyk/h2FuIFz5uXDWThjfAm8
 28eoj5ELq6IffGbOk8w==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a159c14 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260114

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 769cc71da90076be446cbdf7ec7db27f628fa2ac..349c1d9ce9a2f4628087aa4ed5f8dda2bd9eaedb 100644
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

