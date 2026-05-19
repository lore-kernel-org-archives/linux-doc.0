Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4D4028DD
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196715; cv=none; b=t1YVBhXYMPtupzS5Ky8GhbVsqn0kpg4yH70MXrBzLCgQEa9AEH4OC/qCHZAv7fBR7c3KNEzcEerf02EySls2jpD0GZStiO9ozMV8c9dJ2QfUM2xAIVjgeefAFjSQ3RlGJNvFCrjeBCeIYHlR6CDYTHnj4XoBxW+3b+0dYRPzjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196715; c=relaxed/simple;
	bh=9uIzNvyfvjB7Lfk2BX/bVvJu1lFsXDUaVj1eiyJyLZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oygDnSJLG9TXaFEGzm4LGefV6koG5tggRAbEWvRNRfpZu1Ed4IawNhAK4yrK1+Q4YC9qdxsMtW3PyG/C4q0IwXiMdEj8+Q1dMrJBbfIDSCcV6v7FwBoh1TWQBjPqe20tMzyVkcsFbScz/+7iZw/3pgHxoSr5FCO0f7qzZk/NDEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuNNPpeS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ind2SGDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuNNPpeS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ind2SGDR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EIhe3612464
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=; b=MuNNPpeSGs2mmyOE
	81M7YgB8TXY1c8g2eOoiNqKrUIikddT3MhnsM7bxqdWjcB3mVWgIhaGbnjtvt6kw
	ugWAK9iZlmaV3iWekg8o5s/Ui3K0CnW0ec5zrrHKHZHb53eLBBu0zQoxKjzcM5Sn
	5xvusjrvTqAw/m5T758jrUjgwGQlxelP0UosZHQD2xe5LTLYzPxsESaU2F2836fV
	DStVRcwUgTvjM93YXd7dCeEtMe1tnEs91t9jNAksxoeJEmhgRt4X6wNqryPnFgeJ
	ygDT15NlIvtzobgyfvWaY7+tr7XhbE+qZutF2bsTCU/eu39OepfAlmsyn9FbGRBL
	cf/XuQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64s7a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:18:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5758156cc93so4132350e0c.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196712; x=1779801512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=ind2SGDRVfdK7KA5HJDohhwlOXs004fO/gv+21/fzcprNbU0J/6sA/fZ4TjzULst++
         7Uk0/y5Nl7Vn628V6jLjHDxt36BO+IIkcGIsFg/k8HFt3qSefr8RAdpQP4rIYiTR6vq/
         9CCPZuOz59OGPpCgridMNJWKg0kVenvIXKf1pqWBcb40uCbwS89rQ+3U7IJx0wAsg9UC
         4loJp9JVy2e+ByM5ornJbq8trMONn5/nGTFeZhkeDdTSMJXCswcxlX5Hp32fZ+2pxYDG
         JDaEmo8g2gwnpU9NMDhSfn6aIEw245s8ZHCOMgR3N5KCKdZujfnC4tUJb7KnSCAGV+FX
         rxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196712; x=1779801512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=hXs1L4z6+Uoz/eNQDPPPmfvZsca0pnC91t3UIyB7JtWMlS3Za0UlLO+hBBnySJWkvG
         wikI5Jy4RGkyzkcw7lVHRCjlPD4avrxtmd4VpBkTDS4FOUMCK2m/ugJqtDB8DWi4Xvcb
         r1zVVyNwctM01PO8uTwQDoe6fRtC7H74XXHXW9b89Gzm10irq/YFqE7J5CpXU8UWioSP
         q2Q5IGwc40r/aQS3tz02Lhg7HFfWRTV88+8xaZysqAPC9acdW6+G0Nf28SrE7+MqJcjw
         Ol7ms8k+maGCwdpwZ2xqMzCTwM7bUJTSp0ussem15rZKiEr/Lcfd2q7bk2tjOc2vW+pf
         v8Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+jV4fVLlFsjMsvT+NxB/CcaqfqObgUwffU0fldQ2eoXmpnJxFhYZej12V9U/fLI/mWc/dNsJLMwKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOo6e5HUHQNSDyZxZ/dcxlIDpB0iA1lPAEC+gPp9K6rQOF/1n0
	TXbKlSEXBwJkAfBwycUQTQpuJXi0e5mjqtd9uh7FcPRwM3g1IDuM0BD1QG7O+BN8kd05igF411H
	DFWU6hvo59qkbkW7c0nDqiEKsBhDpvkCDNh8recDPMmaQng5gkgO/beCac54112g=
X-Gm-Gg: Acq92OEGZBx3/n2bT/N3F4LEZqKtvc7JL4LPHlWf5HIwXvyIV8L7/evsmnYqPTfuiEd
	wHfzyTCbPkC7P+x+ugs2izbXaaaLnAkHrBk9Crk5uS/76RG5hHOn6XABt2ZNhDglNQg9fHRDidH
	VMJJpRwFuaCR+VHS7wGJqYx2exXxjaRNZrJ8PJOjLo+B2ePXTVdJjcvtaDcUsKSGvQuVQeygG6p
	WOlGN9J6cWEcOv2/XFjWhZchP+AghdDN6mQYgMdiBUeHRL2/YZYi4Yhmr+Y2uCs52phj7eVX3Ke
	R6gDs82ZjCSTg0TrednZbideEv+SpRFUg/1iLPzG58NJu8aa+/o5mntd1J1/JKsHWU3TyL2qKXo
	y0L/2dc/6vexONQOBuqp3u+SWndmzY5Uv7qFARjPACHwBzZFopvE=
X-Received: by 2002:a05:6122:338f:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5760be39b65mr11841947e0c.3.1779196711772;
        Tue, 19 May 2026 06:18:31 -0700 (PDT)
X-Received: by 2002:a05:6122:338f:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5760be39b65mr11841884e0c.3.1779196711297;
        Tue, 19 May 2026 06:18:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:53 +0200
Subject: [PATCH v17 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-11-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kub9ORcm7+PjuGNnZqvGfNQgLhDmAjRY+udGQlXYRFY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMLWsN4P+y0sI6nEo3BmIFA8t/ghg/wXe5qA
 Ql+ONm/pqyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCwAKCRAFnS7L/zaE
 w+krD/9XHniBTHaTTIndeLMo76y+ouTTwRewnyUZAauiPo9reRkjMHBltEt6SiBr3iFPGpXAd/6
 L5gstUto+856tZiKAd1qNe5g9kXSm3lHbgb6xadcJWt8F8zuUgjnW/4VbXV7Ix+2zOHWIyvWYaM
 TkGjKDGFRV2Sf2t9XJ0PbYI9yHZH5RAwmHSP2iuza3+1OddN5CbKu6+DPNJs2ZOmXFFvexdbUZm
 p0Q6CxK/HpRDO+NbqOiM0zbEsrySJ6l0QpNUN53D/0jPiCAsZFNJ8SJTmhUhWhKsEsPFdwG2OCo
 wHaKp6PACef7O6n0awDeHXX4JGrv6wL+1SyAMIN0JNPbim1hmscQFqjQncKd3mP89sb61pMLRAj
 NsUbg1jOdeilx3GPB+WM9z+Jp2gGEQBsDqQg2uHL+OjnvqecGyNTgx4iICm8XGSEcJ42Xbbotvh
 oqanh3S9oO/3tFeNad0mNGjeW9yXc9+ZykbexBzgVU5vCrqRbiJ7hd8Sghs80HnopNR0d8/ANsP
 MQZ9lXcFLzDE2Ykwb+8Wm5gx+ordD7EQxkmcS45P0E6uk7GZnhuaeh069x6H0KoEHSIKA58nfVs
 5r0XXSexj+81IATdH+zKC6mtGZL7Lme0jvulvWJjxAVM2WWtbMT2X1jatuW10rVrm93LBCKp2D0
 RbzhD8Svhh5rK6Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX4MBc1R5klKQz
 Nhk0YZAWIE7ZLsGuayfYKtf0R3srtaek4NUxl/xaBhxjVbjocxv7Q4LHEZKtzcfFd1qbvbI0C7d
 K+XoBDGoFvZn3Sjr7HqOZhnV3cJjq+HritTr2jLDZ6hu4DMTlGpSv15kkJI+mszgRfMqwN4wM7w
 BuwF1ckUF8lqY6vGz8GsStvVg6TvZJxp5l2cc4UFQjrJzkk+RIwym/3PCxaC9OixyowkEIFIp7j
 q6TwuS1HPt2UrT4qDVUy7Lbt3hV+WNVxPt1N0DoswkFOedRyLdBYLfWHptlz444OXvwAjbPbTM0
 zUFIuXBRDc25s5kTAXVZ5xV6kaNkfNrdF8IH/q62q2pLM1aVPmBwdotdjnFrLDnrFdPux41Lxv9
 CgEVrfKe+C1aXFm/zPr62wlKd3l2V7MMqJfeK8n/jEFhX2siFAER172pfUhW3994FLZ8jOeNieW
 sU+UCJmDFb5fxoQwPow==
X-Proofpoint-GUID: MxiduXMXR8VjCASopn4OAkW8xfq8HJ9b
X-Proofpoint-ORIG-GUID: MxiduXMXR8VjCASopn4OAkW8xfq8HJ9b
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c6328 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..3db46fc0c419a0a387abce93649084fbf4b1f128 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3

