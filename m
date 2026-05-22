Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A844B68D
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457241; cv=none; b=EEpKlk2hlmRqUXxntSql3Ii5BFHIb+o32KBknGFHVaSC/d+ZkfWSZK9PMuBJnDBl8N0iI30B8Ycj0TCFzuapYp+rYv21OB2ynKvSkEtWluP4RPpgNfU0lSrFzfp5zHMY3pw2VI4ANYZ5ZeswEOxj5KrQ0QwDtQu+qYRwjaOd7as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457241; c=relaxed/simple;
	bh=3gGtptRmzqmCc/s80la+iOH6ohsBGrbmA4x74A9e/WQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpmf+1ceeLNrnePtnxPLaD9Qq93jXeucGHhUQxt3YUDiKAbtodNKOLULwrhKiIALpn93konRpv/YSF/Rax4MY128wjQ9APx65Ol+puDXO2ai4ogBqhmhIkEaG+LGpVknySnKkG1LCWWy5Z4o3kHVsU+eLAwinDyaTUNIOmQu+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fswkFDvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St9LFKV2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fswkFDvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St9LFKV2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA49pA3947403
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXdt7SVf/FZ6AuLTLKVeyM4jn/YfPr8JdQLw7VC/8Ig=; b=fswkFDvcWcNggqXy
	PqIZBlmngvWd3q/Q0AcKl0BPzXocRb9cU0+6VA/C5dibb6gdgLwHTPCK4z3Te+ij
	nQ0S+yLEK5nMzbPI3469k0Kb0B39ObjlrUicds3fAwLRYDLarGdIMLNLW83HD51j
	V+AQXsylq3DTny8+gR4rFzEbgVxrKEHNP3+N7peHd4aMmhLJt0rxt1vDl7Ft7wQp
	xVL+hWj3pk9GQQx2m5Yta2qhgRHK/sWJkIpNGUrZgeqtncRecB3XVUdRko37g9XX
	FmL1mxwNc7uYXy9p3jgZY6y6Wt42s1L9u3UZjSDMWTCfpX1OLVO2UM4ey3R4Mykp
	dbtmsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngqc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 13:40:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516cdd89225so34477751cf.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457233; x=1780062033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXdt7SVf/FZ6AuLTLKVeyM4jn/YfPr8JdQLw7VC/8Ig=;
        b=St9LFKV2cUMGDv1jA+Kbkc08H/WRf/rZjxk8/Npjd82dbDIY7lG0BEr/2hYKJ39aeb
         MU0wvNU7CXEJRPqJ3XO1vBXogcfnnp5YCL6DnoVyYsPqmGYb42E4KWAtOvrFonrouQVF
         xD3vLU9jzR7TST8X1+fgdcX4jK/w4wJNTJzQAFd/VsdeABLpgK4AIZ2Jy16neCTTm9Ti
         I0c4E3kUi7fAYbPAzRhRSSTjAxt7Z/gd5Y0iNHcWufNsK4t/Z4KykMhK/5v6RsbG+q7j
         9qdRjZv/AN+7uCZ6GefM2D2AYFqi1GlEak/FwyuBI1FvvdfktGI6Qhp3ilJVFWzsl8kG
         FQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457233; x=1780062033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXdt7SVf/FZ6AuLTLKVeyM4jn/YfPr8JdQLw7VC/8Ig=;
        b=eqfxzwtBAjJ6MkMKZBNUh/miZipM0duSsX0EadvfWVaxl7UR3Bb8vkSmlH+cIVxtYN
         LnlIa37F45oHk79N0KujLqG3vym7Oc59hw0O7VuKWqXBbDJ9FfjrRcRLP1P1YTJ9Q++H
         r7Nj9WNHzqBzwR9oBE8gD2gPvxelSmxtvUXiqtx2gJekL7FCo2awM70QKYaUN570UWgH
         yC92w+mv7qSLyyA1CDdH6arKtpCVmSRdKJbzu7DMF2CBGQSd0UsCIzDv5vQ+2oWz0wiL
         B8+7DS7nn8wVEZHbA86CMiXuaygxcqwA0qhJufPbgHpzGgzdkaaOXDaEufhc0+Mz8W8k
         tttw==
X-Forwarded-Encrypted: i=1; AFNElJ8R0DfcukzYPlwnh2UXibL48BolZmjWI+gKtBGME8ZSkGcSW1AqiIKPDd5mbdd7PYXMaR5G4qJyEo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgnWvcMCOhzrzoQ1/CNWa+kK8R4MvxB+p8evByqCmtyTI9D369
	SKnW4M6HHeTb+AJviUxFHWLMExspXwhZhWbMUVzS2hD3v5rXtSC38eOQr3bp1zMyNula/YU1SzB
	Npm/oj56tBiOiIgNQSRGYv4pVhSVZXlu6W5raTtv3AGxTdIjCeusjJJ1tem+pfXs=
X-Gm-Gg: Acq92OGUl0pUp7Ub7s3RCWu+55l/olPzZmsiiL+2SG8H5Krro/kAHqvfpwaaHVg8yll
	8asp+GSGIDxTU4OStB9QDfEMgvbL3EvTs8RuY97Dr+VZ5Jh+aYpC7MQp3fNc8zOx9oCzpL0bVoZ
	VeA24Mjc/R71weWinY5PcF7s1prCS8Dkt5JSdFCJo3bJ92v2brt/4pcM1otkRpmCjeqbtvv2sV8
	9PwcTI6t8q41DNSV0bV1KFKdxJzyLUNkUpr7C8YFgSRl5UBee66IpYMUXlTwzpjv1KrvL7mwPMZ
	WTEVlqmpBpjp210VrQa01RubxntmZ84/07giZP9GzbFR0BAj2pvi+/aVJuYOVA8ATBOJEZqtsSn
	TjYcX82GtxDzyUqKXN9r1SOc2nxnzN4qXUpr+R1HtlrP6LDXQiQ==
X-Received: by 2002:a05:622a:5984:b0:50e:5819:d7e7 with SMTP id d75a77b69052e-516d43dc0dbmr47748881cf.3.1779457233297;
        Fri, 22 May 2026 06:40:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5984:b0:50e:5819:d7e7 with SMTP id d75a77b69052e-516d43dc0dbmr47748331cf.3.1779457232774;
        Fri, 22 May 2026 06:40:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:00 +0200
Subject: [PATCH v18 07/14] crypto: qce - Cancel work on device detach
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-7-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3gGtptRmzqmCc/s80la+iOH6ohsBGrbmA4x74A9e/WQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy5mkKClz2fgik+N1QTc+VutSiwBTRy+E7IJ
 MSlUN86WayJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcuQAKCRAFnS7L/zaE
 wxMwEAC11uWJsM+dHhtr9jLXScbswvOXkSzN4sO+6uRizeQwBY0QOxHsKrAtgQO4ZYJIP9pzLbv
 Yy6li0Stg/PaIitZnP67l5Vlga3V4ElVg3Ih1N4l6p9QlL9Vm1ZrSh/1bqAhlyfURBPCw56FrV5
 x0A9LZXfBn41Xj8jlBjQ52ZiHHAOzd8LpWdXaDevoqUlyzAr5PBaYWSyJGkRhGYGnj9CVCCYVlc
 b0MmGbM1UFWfFknLVZtNpf3k9Q+2aeY3Zz1z35NDLKuVkvORlDJrGR18t8ZN3oDnG1PKyuuFj/7
 HsNotGFhzhgPLQo3f28zpInfBh1ValihEOQoIBO/wd561cbr/etjVUOGuawbUy0gouBh9j2mnxf
 E31qjFRxK1mTEYypb1C1mXRik3P03+9y8kZSF4Ji1x6y3Y9WlO/pxh9lx35D2XSeOHqXpCubh9Q
 nO03kCbiTcDnQDQ3QZVNF5eWsOmed9rlQg1h3Vr1XwCc3SOnOSAv1e4yibbHvLwU1KqHchSDDZ2
 0KRoIdO9L6mAdYoK5ln7hhMznc/rXCbZewKujkiSZ7arbFEz5TfTZc/PE5gTtY5EOE8C55/e88q
 h2d5F24x968paTCS69AUg/XsUcKA7LvcQPVFig/Q1ROKK8JAJeBindm49qV6iJbHNggXXkEuED0
 sw+x0xgVA6rOcXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a105cd2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=ETIHtu0_8y4auhP-DQsA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: OgCaMDIaz6Y-AYpDnXgIlZ8P6k5PBV7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfXyYvFA2ws1eRt
 muiqGhf1lZFzdV0qGqrogzfcXDYRjX03PpldG9h39/0y6+mknsRsYPXCPEBKEAhZ/wNoLg3cDlM
 zkZkl5Xck/zSf3+StBsFY26dWxQaZZF29nDw4OA5sQFnZ7SXCdzeufbOa9y0XmSAOWlINDl0MN8
 qGFTMWlXwzPJlJdqSIFySF51UqwOLagw6VS4SZw/Yx+Le9yOEtaLWEUsVB9UagJIrLeY7Zjf2Io
 enUP3Cx5Vtx5Nyk/C+q8ebT9EE29iTblfXUuDMZlzelfwqw95xmsrSt0mDMUi3JaMg6I0NicsI8
 bqeKmlwJgp2dEuOOHZlvgh5sv6HxTMkaTIbuo4D4tjo4fm8/VIn3tT127C9r7fPkrZznFI+z1lz
 pP2sbARWE8z2vZFy5BLNZyq9klv0RBfBa1VjdwcMAB37xyfuv3h30EiYLaW+Xa3rc41JI/dFtKy
 gShDbXvmYvUoWHI8Kkw==
X-Proofpoint-ORIG-GUID: OgCaMDIaz6Y-AYpDnXgIlZ8P6k5PBV7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

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

-- 
2.47.3

