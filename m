Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295B3E639A
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277434; cv=none; b=dKRKmDEHXug+YDp5NCxuXrP9j3NCJAQUYsH7Bc8o8QnAA0cc4V1lh0gP7BSl+NN0BcKjNCI28TXXfXDNEOvxBOS2zkEtlMn2axMtT+OJBezmjyVPjvemzK7rR4x+02iVP2P3qkttUz+W5iroAIFqdK/wlJTKeSxiwDxFwb4WGW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277434; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkeo+aq+eCQ/Nm6lwlOiGbzdZl2uq3rV1GNRrWOWifR99vOJ5Uk209XVi1te1mI8V9HlUrz1TVniSgr6pP2tIiwNkrwrw+hLsrewy5paRpASHE9yzrorGVw5JsffC6c0QvZsQOn2xQSNGjVAuCkeGJsha6c2H1JHT71DrdEbNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9JPLqxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZoqGAeu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9JPLqxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZoqGAeu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d3EN821143
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=O9JPLqxsZkCgr197
	M/tpqBmxSAADbhZYhHXVwD3wXMilrw3Fc3ZntwHY/F0coinkqs0D1n0Tu7zw01j/
	U/AGROZ3OBz+Q1x46l7zOboFq7A+e8u7mlxMi2KPpel/urKTPeLYDFb5pnHiOW2q
	ayQP1LY3oFawv/9rp7zBK51fkBLS91O/P325+7APznXmBbve7w41+29L5V9gQQeY
	gUtfBEvWjx64HJBl5x/PYBW8/4W/M9pJ3hjRoI9JMrj3/8EGT2OOZlATfxaOMTE1
	djsfnG0byTLCb6H3U6hfQ9HsT6bcZ0ulCzFV8fnojOHuooUGoyFlj0lM5IUooQ33
	vEK4CA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag8dcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso155110091cf.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277429; x=1784882229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=fZoqGAeubn8m6hVwj3jq3s2P6GZDcKSJtYw6qmTg/VwRc5JXs+e3U9XVLKgoVSe+nY
         BhFjTjlU118jg6GrFatcne6KVtw0owJJGjsA1YvHVokV3lbFEcU31WSk7+wIUDn8wOD3
         vwE4o9lpihi3iUUzIVGA9cRundyEzM6lAtEVqF2y7YcYfqeP0jbUB1vdLb6kuSTaYwfs
         cAUKw9tt5u90S1Y8U1iGQSIEHsx1EsuBpzSKRbfizy/jvk4B/fbMA2EqiptMES4I32w7
         ERXXjlVfDzfyD6AogrijjBplfaQRx+P1ymJCcTaD8vSZ9/ECszh5VrfeEciA50h0xpkD
         T2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277429; x=1784882229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=MKTZD+z1/efYMIxZPUhd+S4kOqzeZlrWrku3KcHa8eUpCTXAy/F275c7luqS12FnHz
         UAFc/Xb4Jgo0xp0/R1vcYgTcdtGTSH/WVhKVdNJc13/Jr7M9HZ7fp/C3D1F6OGfb/p/u
         usijfL415JkonLmGqCCRFfUvxNrjrOdvj4ls/WoxPnHDT1pdenkxefMP5M/5nt9ooKVW
         lDY85PvE2lw0WPYMf68wIsvbqevMPD1NiYEQqIdwwZDo95vMuOjB3L5BaP83pzUY2LLG
         LPBIdm3sY7HWjpyonnvlZ+K2L4BHY/r8G88xzjcxE2yUa4G876ABSMr2MTBnsZcYendV
         9ySQ==
X-Forwarded-Encrypted: i=1; AHgh+RplpzxJa3t8KmTSkoRAHUxqU/7NKUmPV1BV/pjY1gGIF3ChR3YnMY7fQiLxXp5dJf4G9Ic96zgV9ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvVc9RZ25Z1C2d4Ci69LR/84Nzsy+WcFkjJOMCaq3qDh0qwF0r
	4uBuzWntizoC+D9fqNB3VUQ5WynjMHHyLn2EbdUrgGDKLeow33Zks8u/fWAJWpjE2r9zAayyvQv
	rswIQwZow1tXIqTV4S25oj/pinuNUGyHE81QRcggSma5wj+ZNWcpivI71l9Nje6c=
X-Gm-Gg: AfdE7cnJ6XOgCL+kslZ7PQX0bkurBarg9d+mhSKSPLkoF8vdhWUKDnp8Zm3Z/jJWPS6
	DSLnquTGDXLLjKFwCNr/qJdthyLANa3I6Y/0BJWiQndCGOSgaJDQ/g4VnIR2KxGJqEQKzurjV8S
	LTRssfwHLWRPSRXW8MPxmBS5rTGTLLPCUnufPWJlVjenN02JvULbrHdJtif6Ql0/3IkorFol1Wc
	8Gt/LW45+0rXMCmj6IbZ19Y9UDTGA3aNgCIdtT4r+P5MNP07vwlIXd7Wv4F82Er4/2pyQStRoy/
	EYIuJPDwVK9fdVMLjZAU9yafEh5XOXBoHdTgdT3EBQ8saFLuVysTzNZ/j5MIATWqn9Y5zIszB/P
	XIvGdupO8pVMXL5aER/4YB6Phy0+iHw==
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943381cf.46.1784277429602;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7e8b:0:b0:516:e00e:6868 with SMTP id d75a77b69052e-5213e0828a4mr11943321cf.46.1784277429116;
        Fri, 17 Jul 2026 01:37:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:34 +0200
Subject: [PATCH v22 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-8-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemd6cehoOTSgO5KMuQ6mnv8y35bchs1VbAIH
 /rdTqYrAteJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnQAKCRAFnS7L/zaE
 w7vND/9DxMXd0FXloN6YHYOW6Iw51rxkoLImPEgptMEsGc2uqcMLZrvk/mg7ZWygXJFnZjmEL44
 cceP2ouO6GzVURWecwAyquDtun93JntyCV4ZvcD737qZGhv36Xs4ZKolZbLpKOP8lXFxs69Lekg
 ud70LPwoYhBuOBA0wNw/wiaiIVyK9x8QwPvyGMwal27oisVsGw4tro9wneK75y5Wh2bBOsFsJoO
 Z3N78KsB0JCsMfKjTkq8cIdpOu3jgnZdxQdwMXQKk43sHATCzHWLfiFyhlmivLEaGdKg8w8p467
 PW/cjNI9/wxmjTVd/LxKLogNptkmTHi7lvV0oC7HkeZlkI6X7qKkBBMZK0IzRd3gEX5TPoZ8QAR
 TTlXbnVZ6WoEMmM2cpgbNWVL6igCGE6XlfsHJS4ySsyn5A7X4CcgrytCW3KMtUMpmaOLRAxplT4
 mvQ9h/eA7Z/OrhTuk97AQbrVX+j2vLp50BHgrvQYAREPx1UdO7JR/3k/IkX1fdbpTpUaMEtgFT/
 uxuYYlivYgZXGx1ElH9NtNtEH+zYx8CWaezhWCTXz1cxBjMAANRULiQCTmYIa1Csie9jjst9gkz
 zIrXJ5q8UU+cleRDwV6R17pW2YCdNIEIEAx+IAgr09iCmTwRZx6m3CnrWlgqfQcPcRzaYcAFhkk
 uqpAA5FXfTRmagw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX81b5m9yhAFjF
 +88yBQ1PiAnm3zC7bNYoB4ZNk0abBEMOF8yLxr9EMNVd0Eh78u4MUVtnsfxvfN6yWxN4PPz2gJ0
 ARSFpkbn4XmcKVXDY5pm9mwHo4Re/IWYWrHjDvJg/C/eIeYe33SoadF7aRZaFCoIkA3yxX7yGT2
 nM8fX2wnqrobkRkwqUV5RuklK6/kma8415SxHwhTJhPg3ob1FvmvXbnsHPGh55BkeXjXvcbraXL
 53/LoMHTdPuP8C5tUkUfh59HuWnl+MCUx+7jP+EKhs3U8R8RZ1+1dGk8GnWlXpen0Jh0fwntkC1
 ALzXkW/AhhANeahuSm+8QOPRj8gd+0JDadoKrKf38NnN3Fjizr2ixHz7LuE4KcPaPeyyfsZlzR6
 DZbG2U5noQm8AL1BVw1aw+4jY5CE3PhCYDunE+Uc4Yb8hCHrTo2//lUkAI+GOeLD9qLZf/x/5vi
 qL/ubym8DOE+vEf/Bag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX2W1C8RYwSyvu
 jp4opAmcJgqSsdddNmq9LDhRlp3P7abXSP+/G7K84jXu+dOrLcAgNY1KzL2ovNxaZtukl4whp7s
 +Wvom9+wwtdA/S7VjiIuBdgamIU99vw=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59e9b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eHwR0ztcwFuAXST_Vx2qkrlAYgt3c5KQ
X-Proofpoint-ORIG-GUID: eHwR0ztcwFuAXST_Vx2qkrlAYgt3c5KQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b52a26ffff5ee733adcf4e8cf8bef75018dfa63e..dd860435d2c47a608c82cc2686583a44ff96c889 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3

