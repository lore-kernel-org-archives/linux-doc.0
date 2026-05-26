Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92303FC5CA
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801098; cv=none; b=ZV5IxvLxFbFsTHaL/ELFvPHkHJ7P5q8Fxp79q888V4dKCQq3wUpeaptIC6q+drzUmPaDDr51XPDf/qqt4Tn+UpSi49Z3sbsNEWqCKb8JX+iyxgNTj2IX9UyvPG5i3ebqMLp6GQajUuPj/XnnrOvbnIvuEr8XRZGjAJQZ08UlU3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801098; c=relaxed/simple;
	bh=atD/C70BmAbtLpgtk/gvN3TNLFsQT9cfTHvoiJm5/zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFSQO2pxfbyE9x/9jyyEUNkKu5jlnT/rmmcK6dslbUXHktiVlSC+NOxGPWDln5PpWkxVETzB6vHo5IftIJUkc52PkPAmNjrtj51Po6b1ogqFomTtX/eWnpYi3IQMcla9plW6idZA3Pzl32Z04inF6L9kNH51qIpLMNa9Fj82yPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GimBwBjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPZlrBbA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GimBwBjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPZlrBbA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsVqM2411684
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1nmBooCYIL6gijj0RhLOpiyGlP850IpBxaJF2Uaxp4=; b=GimBwBjMGP2fclBL
	AKTWRMQn0pV40D2BED3S/IHANk4+2s3Hqm3BEfrhTZjsUVYVZEm3wQKL6zL/uCYa
	XsqNhUBT1IIhmJ9SD8zypKE50zX/Or6/rzM73vlVdIgZAUJzhIogcQ65ZIbUe+TZ
	bTG4SiNE8gZ07p4SYA7B2KP897aZiCwsMIhUiKQ0yXbM6hP/fT+CLvB+yJIOFjFr
	qnoB5Rtl+OFXdvpN9yM9Ji7/rmuXK+oJE+qDcDCNvh8eBLDeFbZHHT/gGald/1JD
	YuI5Al59xQFokwRrfbwZO+9D7XPwJvcz/USZlbRWIXyOii7UZCoC3QGnvQG4Xj7D
	QkJc+w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqync64m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so14481189241.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 06:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801093; x=1780405893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1nmBooCYIL6gijj0RhLOpiyGlP850IpBxaJF2Uaxp4=;
        b=BPZlrBbAwj1O4QcFHZe1sGli54zbfAKoo9mbu3TMxcKs7oDlmLBuPW8wBhYgQIcDVA
         AuR7VmrjOnN5KEMss/5bmgU5oGFA3Kx4ai5TKo5YEYQetAk6Peg+Hh2c04IB+Xh2Snss
         as+3fCtA9/p+CW3KQYoGOJxlEgVusaMym4mnrQQz8l0iIk79zQgEY8IQEjWB8LMuu8/t
         NeyaedJkfE4X8CvXWcQQuESxo0jpCLTD/9MAtIS6zLc/2GVb6kRlxho5OIBB74t5mTU8
         xvQuj/istiB7cKJ9O0e6CX2Q5ixoJWnOZLYytPyWqpRkeEvzvOlFA/LA8cQm3mM+1FXv
         BRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801093; x=1780405893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t1nmBooCYIL6gijj0RhLOpiyGlP850IpBxaJF2Uaxp4=;
        b=YVybjnOvNNJ+4U9U4aGgsOKxcWqmT0Gh6G1oxEcGrq2Q/yuD5cKlPdy+T6zbHNZ5e3
         HOawWjJze/5hJoyVpKoQDWplRZkOmoAdVGFOwKlSi4qSfJbv2a7AktayShy6e3AQ+OWf
         iDHCpQvSjs3kktmsCeAohiAQkDjhE665Kb386wcF3IcrnXPLqlWtSoJmuiJu+cwHAckf
         psD26WbRJCQIM3fTdLS67oBgqOy1K6vr++eyzqNX2t1jQy3D0SZ1hGJ+ArTxrpvIBZAo
         BbSkp7xWsofYlREpU06r+4Dy6voGGI2Kjlrr+n4h7zJUsbZVqreuflV207grt/BGiZnW
         4OHw==
X-Forwarded-Encrypted: i=1; AFNElJ/ixCc0RE2IeTCDTJ4yXNF8ElXx32bHeiKOjKcH4Znw6Ywxp4CHit7H/sfefIdQ3Ot3YFFm+6qCkbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFupAr/seN7Q356sec7ZABz02sP2juinzfBHEevgPxYICPZlf
	pNF9Jpl5mLNkiCO1NannAvuf83VzuX17IXwAB8WfMrc4yU2/M0pNZ4EfrnvRqNbz2YjVX6p8uTX
	X7cQ2me+vW6TTu/DcisaE2NpPB3M0P1oBxdRHZx3ACNYc6jxxkkd/2J863jBbOxgPjY4j7wQ=
X-Gm-Gg: Acq92OGPQY5i//c2A5vg6ONZ42kboGx5sK2VAKMEYxo66LhUwT0gLjNpFCS7ry4uz4d
	FVleA6SAdrzS4vc0cTgHz0RTu02Y2NhqhDJMLmHPq2YV19QwmfTD43A7MWH9eMUPjR/HLDtDH7J
	AvML/KlgYfLE0VzB2a6t8iY28O51GyAfX7rGXUKIAS9vR5WpJh2Q16/cv9nlPiJQPAKyUFiBbtM
	khFyfm+ECHF/EYtRQIZOyVRO2WvNIX+ilQSsqgtB12VMAYSsEvSPB4d47imCpbEnrSryfHG4tTg
	or0tkKf7bihYvbWPYYoIcvw4aHeq1iDiiMZ3Bsy3IFv03sR4P9c5uHafO0xmCYLVMJDItBtsOkP
	aCB723zmJgf0VHr+u+FUSXIOlk3nsiP1mHoESoaGB/lSSIOHW0ZySazyfdW5W+g==
X-Received: by 2002:a05:6102:1453:10b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-673bf88569amr7323123137.4.1779801093245;
        Tue, 26 May 2026 06:11:33 -0700 (PDT)
X-Received: by 2002:a05:6102:1453:10b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-673bf88569amr7323089137.4.1779801092792;
        Tue, 26 May 2026 06:11:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:55 +0200
Subject: [PATCH v19 07/14] crypto: qce - Cancel work on device detach
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-7-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=atD/C70BmAbtLpgtk/gvN3TNLFsQT9cfTHvoiJm5/zo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvub4oPxpUvAbSVN4B/pj5xEWuzyl0SR2VFe
 rF8kbhuJYaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb7gAKCRAFnS7L/zaE
 wyeFD/46/l63yuSUdQlhfYT4OY/W+59STZtAewnx+aiAWACncqNoBszVXsTs7wsrckSz0VvVGaS
 29ESTPTJbrPNF7es3LUrk+dZ9e1clxUNaDDw1v1p2wk7Ppy2itCaDxO6TGOL8VNWUC5ppAv5e31
 gZprPnxh62JRjqFBqTEGLOGLLyVHy9jAVdPNvD793KQb+egpZrFw0MTMQZf+Rq2lQl4bmboXt6D
 +U16DuZPtw6KXxPUg7UQp/SSey+jiFr/zUd0Xb2juh9TsvXOK7V24UTJc1/ooLH4ossJwVJDpON
 lcrCUrOANF9NvsSDH74i/UYjXzr0NGMyy7fAXUwiJ45U7ofzg2/JMcBNY1i4VPSucL/504OEKDR
 vlaocEYX313WRsXI1Q4MLru3WQbJ73qX3JgPdEDE+Oitdi1hr9cXfXbrMXRlzq0bVv36LFXOsuF
 jFgZeOcS/W1qT5lDsj9XukBwleBmYfvray2BDzRftHqKmq3xGtTS4ThOhHPthm3NEFpO3IqjsG7
 C70BRz+oqcQGrXxSN6pdJ1fs6RGdcsy0rVf8GRIKe1PYyLX1XBE2SduPJNKPNfRR/mFWZzci0gm
 8wlPzyCSzk4I1SynlWAl5Zk0nVrkI7EzK+tCmLAqHdYYAPfLqepSXqqjC+JjeiwriryO+BRrG6+
 bA8kjd5gU5WehkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a159c05 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: A_sSvgJJDhdeuhweqM6tcXZR_ifQ_WBO
X-Proofpoint-ORIG-GUID: A_sSvgJJDhdeuhweqM6tcXZR_ifQ_WBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfX+LirzuHTCNHo
 MZU1SZwGyzNjoq+mSs8BtcPoyVuvCqL1W84me1+cDHHTLcsLyN+D4Dxmtu5zGXnhQOUBeyHxbsO
 PrpRhjqkXduFDT/BlOi4DpDF1WMQ6w5ahLcgEa75YpjkZnTAx8qOQZf6wVvGAWnPSuPPRe6FOjJ
 YD0cZ80ZrgyOcsUV0PS0Ee2qTpo5gQ1czIx1plCDAFoGPL5kYDAQs8TauMFLIKUpGFAppdkrcGZ
 du1Wtap0ikYEgli6aynDyE3K2Ap/ipyRbAwbScQpjOcJS+vnkv33Iryc3nBHV2rg4bwWCNfmQ0i
 FvmqESMlw+Tyi3H/grIp0eSLcMDSXm5hrFcu9SLhuEYs+mpAvLri27jEtygunY+mOwG8K2A1aqj
 MaVPtZz1+vFUxDMBlNrvmu9StFglMrzTOv4r8BbNSZswCOrFstv2O7+CDW3EWKqh/Xr3Al1YmY4
 pQO34xmHeVnUqk/b0Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260113

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated. Make sure we do terminate all
transfers in qce_dma_release() devres action.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 drivers/crypto/qce/dma.c  |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..f671946cf7351cd5f0c319909bafd87e3af701c7 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -186,6 +186,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -227,6 +234,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -239,7 +251,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
 
+	dmaengine_terminate_sync(dma->txchan);
+	dmaengine_terminate_sync(dma->rxchan);
 	dma_release_channel(dma->txchan);
 	dma_release_channel(dma->rxchan);
 	kfree(dma->result_buf);

-- 
2.47.3

