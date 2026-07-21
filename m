Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF336A34C
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640845; cv=none; b=ThpFEziwDJ2689ufdh4ip4b76JP+Z5D6mjoUqCpVeUhmuuiOkG5ng4RDi3nW7CmpjhvbPNnu5j/0a2qzdGo2tGo2Vr3W1P9pXx4QiZbg0+oI1aM+7nxzBRquLcLZ42ZOLTOq9O+MGEwhVo5M9r8RvKmXjMI6Ho0RAoUu4Q3Kvks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640845; c=relaxed/simple;
	bh=vpDVf/b6zHPEUgtVCAl2sRJELM4MLJc6gtP24/up104=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1+VVzwq9Z5752wY65+8ZMPST+8EvfPwSWcNiSLpZOimeFhN0yrPyqEa++XtOlx/qkUO1w7iMT7HxGzmWwXo46oQZTpLtQ4UbOAtwY6e0zwSPeAbXvseDutYAYG05lUyHFm9aTm/CcdF2TKQFFtEBM3KRw1SzFqS9HYaBFqAlFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6/MAT0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfO8SVKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6/MAT0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfO8SVKK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMHYm1793845
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=o6/MAT0bVMJGg42J
	i32afc4DY4EC8niDPtbZJXNmErFCVSAIkPjkUn4fz8Se4gv69IxfSY3l7PPgatsX
	zf/7zpjjdU+23nzm6VeuXp9CGTGEPqHNoUeKJLxhdXhnlr0SSPXsO0dL4e/PToEg
	cHb/NF9xk1+enamy6VQRjOCB7GNQCkGCMOJJddqj/LsA/gdKiu76FltZ3FVjsS8v
	BpPrNuzqBtSP0ifL5E7KPixhLwZhfNyjWTgbghawlq2iPbPm9zBuEpbmiWdAUrNr
	hANsfYAPALH7UW9gUvWkzHEOYUGB09EGbUwS0/HZrrqHCoN8TEgGEJNnon8+0RFD
	vMErTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2enb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so208530421cf.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640843; x=1785245643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=GfO8SVKKu2+dOzIQCClHgdqPfUwE1bYZHl2D3UidnaUqbXtfu4fnBYLQHTHeDpfCof
         QdmnFYSFGUJCpCVzil3+iWAO1o16aQMpqCFVP2kK7Qete++cFwkPC8lJbA7P4NAa4DOf
         agFxCMGZ/oY8xUpkg1VhOydZI4H7YNfDy1VRnRPzdf+fp20/8dRVErmiyIc6MqohDI/C
         0vDPDXE+EXnjVlHU73+Pl9HnmsC0RilP0Tym0xJH4x57FYvHp13HyxEE1ri7E7sZwmCe
         6jv3ESOjsDZ08FsMIHEmGJ74YtUHMyowY9bGzoWRQKWAr41TjXoKZiGbszrSat8sxXbo
         QQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640843; x=1785245643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=c3OFAaLRcv5tXq5cWqsYbvxDDGI1Xc/YWqzZFrYdXOKRcUIDrHvOkMDHO5z546CKKp
         MD6Xi9rr4OOXxHMm5MEJHc5reuQO7Qhv4JM9LnVfL34u8v35UatxcFB0bivVQt2IE1WW
         eUq2G1U3j8n5kBhAPigVntBZzQpkS6gTyaBF9edk/u9QZ/y+L7F03X2yjSsOaZ3ViwXF
         feVNi4OZtnkqgSW/lrqZu00kiut70i8kvWmkoMHT3t3Ny6vwcX80oI/Mq2HiG2T0aWtw
         mSbA/L+hIuQw7xGed7QN0dKFHrv+WMyY7I+snDYge3lvuzOt6PFPs1hFvS1rI6znG9Ki
         mFRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/gzl2t2JwpIVI1WHDPOdtp0ruWQfpubi5qaikbaWGlA1uDPFV8F2v+tNl5JsFtZEBcnsVmygqDL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2PnjmabUJZ0rBnuFU0OY/fkb3FhKiBg4w2qKkxSEyUwx6EdY
	YVEqbQ/uc/LJl6envWasUqCGDOJodDWh+pfXDiqfy8gKJi18NVgJLIpXxKP1CjW3FC88j7m6EWK
	4G3V1kBMLBbftQF6+rsGpE5dg6DGK42EdpAQLTypU4yC7gYbBMtSRpOqOW52qLf8=
X-Gm-Gg: AfdE7cnxtuihpGMa2nEHu9SZo31Vw9n9tbswyC+Ok2qVwRZrbKvaE/dqpxG1DBCN+n7
	uMp+6Yet772SG+sYg/UCDj/+e8E2eRbcbVmQF8UYlwM9rjEdGxkfRSMpehRO/t/WNbhaLd1QwJj
	nH7DuDnOmBPefm3V10A+Jdv5A37z9cT9RPaSTYsN7obLzidP2XsAJANptt1TbP70H9WlFo16vz+
	UKf7u+7219pPP0sV9cWaPx8NOZuTo3mQUsG/mK6BZuTqFbHTdJp8eQ+FOfnezpm7TAATdpBwIu1
	bGGmlRKfJevF/ajXkFQ3LAFAer7DQQGv/5eJ0mVr+KCopNk7smQtW/sQ4iUaQDfti9ejIaQ4Os0
	xWXYTBgWRDFlgbFgaKBje58iU/dY0gw==
X-Received: by 2002:a05:622a:2596:b0:517:71d2:37d2 with SMTP id d75a77b69052e-52138ec1fefmr50714161cf.0.1784640842434;
        Tue, 21 Jul 2026 06:34:02 -0700 (PDT)
X-Received: by 2002:a05:622a:2596:b0:517:71d2:37d2 with SMTP id d75a77b69052e-52138ec1fefmr50713441cf.0.1784640841870;
        Tue, 21 Jul 2026 06:34:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:14 +0200
Subject: [PATCH v23 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-9-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UmKxOf6XYLZXDGszszberRtz3YMnxxcysIg
 9wCyls4v0CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JgAKCRAFnS7L/zaE
 wyWNEAC6YTYGYL5Tmdztdv9YHscz6FqTO3G1BxoZMQypB3nMZFhflG95fXlIphbCzz/4DhGmszJ
 9i+6ZPNgF0FkJeZyjVZDjGOyb2MGFFHD94vHOYlWsJYmrIE8d9WK/dhYE7AxkISS23Eb0sHXtcr
 lH5uQPEge6eFoHZO8oPT35dVNP/2pEQWyXskL6OZmh6kpVJ+HL3SI9NB8A+Nm3THzNRQvxzTE67
 sejCFjHbuE9HLGZxf8znL+D88EiEYc5FrG2OjYkXMhRiz73YnYE/aztnXxEgjEhmelv97/dvyEA
 EmYlFoHs9BB0o2A8u2P7I9O9jc+k50VX+i+/Q9veFoC5jnHVW/YK4BgYTN+g/HKMeUj5MbY8WqA
 Zu0PKEqBNMQNAPsGGhWB2xF2cvNRLMbzQHa0YjVMYEWiImRh9SdGH9CMCr6U6j69WvuZoYpVhc0
 SEz6GsEGMgrAcMpCk5+JTlnH4Tblt/ScZFtN5mub7dq2L3ergVzJR/1X3SDHnsp/sm7YkiYRjxX
 RsaMPad46VlC7fADepU85gDWsKEyYE8FXv/flnOFiS0Z9D+xLWhFZwlcTIDIOcV23uNI7Huphy9
 l+5sEVYcjP9o5lLmKrz6JVGE+8/p78JA0QvpsukT/jvfRYp+YZuREBY1EhFb3vuIFz0afps12Ua
 GvOJ+XDuEbiYS1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: uLujOw_fRC3en_4wt6eZICWBblXVMN3F
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f754b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX6LEcHUajQUvt
 p81WaMN4OOT3sS0mRCqmL8/ypI81GYYJAkAwy8MsmJtyNKueqEL/F7xjl+gGwoTuWPt+v0S1Ue6
 olU8o2YTYsJSYANA8EL9XrcMOzN9Lm8=
X-Proofpoint-GUID: uLujOw_fRC3en_4wt6eZICWBblXVMN3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX8l5nct1k10OP
 9axwuzQLwNofdXbqzKZFsGn0/FeFrqQsqNXu1W7jMTmzfZWOId750bG5Scz3fN472Yhx6ivyyyO
 nxpj72gi8aNzaQ5ouUQLtudmioD2bxYOnfdNGjpOdZZr3cGVZzVHh5crP9rkNNvywajoWE2ayN/
 pH99srQyLxuJR2Y1sMbWdaSRl4wQUaswjLm6wV30KS7dTCaySa6xAJ6wklEkYPz27RMFYzyOy66
 SvDHr/sL+vJglcX2eAC2914xNUGtAu6FbreRcsQrp8PYE9ChT0KgiTttAH/U3VsrCER96Jqc6s2
 qEtTi3R0Z8dV3JFTRQZgOya/JRImidya+QfqR3oCepF1/tHCUuwb/AmVCkvdIw/oJRvo2Y/5z+V
 lH67jN47IzBKADIZv8Nhn9kWnDH7N9qlnu9a/CpWU41E35U9vFaJSSetb6+5C5OMO+c/eJh3Lc9
 8/WCclZOW47HwD7Txdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3

