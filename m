Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57532372684
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640843; cv=none; b=gWWOrSWgqFUxVVV+gnVVus8AawikF5PGVVUiDjDm0xBz5wajST/mfvRVr/QKuDYRUvMg1kngEwaIaDuxZKvoWt2DhWNUZ5T+t9fauBauhbZiF6FLgOcR4pR64vEUpNHBzdUrev9NjsDsvboppbpkyQ5mDIHrpsTx/bf6FQjJLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640843; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQjXcdB8UdyOLwgeSUjkBtyD4kmWr81tI6MoqOXXAlL7XJERCEI5TsgJ89PUNJebGTmeJNgVAcHbfM0C6AiII4n+VaYYgBlf2aFQ9uygL6n1K4dgWAXYTrqYRFAm3Yp3s48lwfpg+yqhOqhOi87tfmGvJw8XuJAJenEqVuccTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fznZGV4u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBCiSUjE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fznZGV4u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBCiSUjE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMBw51922897
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=fznZGV4uujPZ9rz4
	zOVg/UlXGfAWa0YqfBxATkkWSDRnTFwKCedpMKoh6b/Ok53lBhnQR3CA3WlkEmBS
	K5iMZtpt6ZS9xXuAYK8/sScOpXqMHlVFm4pPhiX/iqsM6KPoGiTL/oc8Sy03BFOl
	GYje0ee3rlYEkjqZs+BAPUWGZonn+yjHP/xHy9CdC62Ezd7kNMlQ0s3baxZkANgd
	Hw4loQXoHYMsjfnAxzOCOG0BVuQveXiqf8IyLegCZPMH5sew34kZro4pqeYyJaFv
	uCg554WKFccEzYSE1SoebHkmnI0RvOwCGuU8jhyHcrjanTduSQtR3tYa9grtyVyF
	P89IRg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68611pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:34:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso116390121cf.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640839; x=1785245639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=bBCiSUjE3lGM0eobOLBdY7DYio6FDs1f5TXJZEoHmsesN6N+ZwdZJg3IHxFHb67j4K
         0WCTTqoVoj4demYosiW+gjcDPfqsmAYP/+1jCM1Aj6Day5qr1z2ucdixDDpZCXK4Yk5V
         ABPoKOdDGtF++NEIQxnaES1ToCsoVv016dc7qGtY3Mv4qmljCO65q8WJb0gz4C6MPb5v
         DeXfVYoPrSbfBtWp1vpSP2k6iMzihTfUmAUFtmg8rabQPOZl3N8+ajZWCXZejy6GdMOr
         n5RhXZPSblrsJGyPmm/7SsrCXu4dd541D2OAiYWlnpDj/tcQcSIOsHtcQKO9qL7v29Dj
         Bs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640839; x=1785245639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=kkqYoFpbKjQ+AGL4ILtB+AnJM2NmT1vhHwan2KlseYhJY/FNiojKMjSyNFhmei7swv
         FtyWwEoAVv2kBHpekLm091R43TbYCxRZFoeam+usbq273f+uqxNjjTgAuXOnSBBwQh2m
         rVL5jBo/hK+RkX5WbEgtNJa9OEc+Y66kHSywOKyq5tLw8hcJ/5dNkrwD8kY0VqU4tODo
         lTkzCVLvULoixwzNEU6HZAU9io572Guenyb7rJC4cdaIMLZxMz44CfyB0iMw0boK9A3s
         5mUupvcIYpf2t6GS499qpFZi4tOBaKVAIW6Mxh6UC1ZD5rHSdP2Jp/LOepn2NcTPgSAU
         dGYA==
X-Forwarded-Encrypted: i=1; AHgh+RpiA/tGV7rEHwFKKbJQRgMremGjbLUhnQ6x3v2eWLGZUFjNxEZ8KI0WL+k0ghnhxgjy688O3/cckSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkFfGm+eWZ9VeS8gKsesI/G/+fX/iWaUfGXI5NCDuLGdb0CV5
	mDM+nd0JXfPcEpJRHX+UW8nRU3CdAqAWu6UsggVJutIxMAu/84XiramzMHnfx+Esi3aMyybglMz
	Fgd6o3Tp3Dg58Tm8lWBc/yIvGfDE7rmqAMvG/YS0OlNLIuHQ+W7b8/k1ywKma3CQ=
X-Gm-Gg: AfdE7cm/lPrwnMUEECX7BxBqyeerb1gvc1rrU0addFIqEimVZ3Mv7iz02T7kyFu5QxJ
	FixtPNsK/NOubHEgldei9UbEoLmnxBmNPoTIXfjFJFlO0YbalEPBMCcMaGL3D85gu/FmWkE7BKs
	VnP/7SSsVoNaQI1gHr2AvY2Nnn6N05Z/hY2xc0fSf1/g/sDb9MqhwHKDX//fYbyjhEOuvHEVEtJ
	Ubpt3Gspr31HumSlJqQDz2gLHJ1gZv+5msbS5ZOt7faS9KxLssmV+VCPjU711BoS0nWfQ7Z0/wR
	NmSEeZOI5p2AUK6xdDtuyDhYqLUKULd4HY+365ME2B9pzBzeH/pdEYZ+MQDnVq3/oqxjAHeSwc6
	79dDrPIDADR4WdsPyY+KwGb/hCBYpag==
X-Received: by 2002:ac8:7d4d:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-5213a87ef78mr172630001cf.24.1784640839556;
        Tue, 21 Jul 2026 06:33:59 -0700 (PDT)
X-Received: by 2002:ac8:7d4d:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-5213a87ef78mr172629421cf.24.1784640839033;
        Tue, 21 Jul 2026 06:33:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:13 +0200
Subject: [PATCH v23 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-8-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Ul3/iDvHg4aUP3q+akLVH0AH2O/TqlOHrv4
 XiXVsg3n7aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JQAKCRAFnS7L/zaE
 w/CSEACkAW/OT+lifakWOFLO39FQXmm/C7sQQ0BvEXwrxsR6of/E0WqLCGTB6gpyCZdicqlK5HN
 VkEfYabhgAspLJDJV4N+nau20sEYLZc37UDBMjS/yFOJKAen2OM9X/lUvzH5F4k0VP4NUaZKE6s
 3Hk//Tkc5jY9fLhv1XnfvgxgLar2acM4WM8P9CknamSU1Q6gD7ngkP8SnMJem+RbxOaRXqTD5hY
 kGykFDcG1mZL15jy8jNQlBVaXxZzIxJDV9QwY401ZPAS+0KTb3hQluK7SZsRhr9sMnWRQVddJin
 r0i4jejB5wRED33HrhD4Yae0DLMSbM9g3xvdHqcwO9K31sUmOBYM08wEGZN9eHzOd3h7TOIqLin
 6gJQKZS7QbXafmqRE08WOGhUXJgU7+YkXAQISgRGHJg27TfEs/23zJW5uW33q0RGEKky+xyZrFI
 pL0QuOPEAwB4oQwvjFO0Gh0T+R06HwOwJXJvyOR5Qku/Cum4iI6DNRwHZT9XkrOc30foahJ972S
 CARntKBk+IXP4dHgceVPzaeI27iMMjbfVipWeCaALLWxtHaZjfuCYB+GoxSxSk7q6T+Fdsc2nwC
 fCdhq9jPe1dY2JYhfHylMs5mufyrbMgTMU7ojZUHyXQzK6mUl15IRcSXmmCFjjdtFFLQzaZLM0Z
 0ao6rqrkrtCZ68w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX0QLNJF2GvGI+
 1ui/gtsCeCGbFYRj+axMU+DNgLfr0I2MRSgY9JJ8p0XaSH6p3qINcT7lCCVQpUXFXDphPXEg0kj
 4J9wQ4j2v2djFLL3b5lOvWwN97KURgA=
X-Proofpoint-ORIG-GUID: xhw393owAw_K9QhIopRtSrmb8LUdKnlb
X-Proofpoint-GUID: xhw393owAw_K9QhIopRtSrmb8LUdKnlb
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f7548 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX61tGipeyKEDG
 7bLDGiiEwKlKXXPjrrCn8so6+outkfI6XwGceXwm6ddDVTf873FNEKAjgUFz9ZSYvXdvDVx4WrC
 ixotQc6jGD/P8EatTML2IlOXgj2vhOalQrIlaloh/AT9CeYkZ7woPuZOjy4Oz6bMSoq27JJEY+6
 EbiA2toI8BEaFUr6lv0Y+DiuuWgb+OsErZ8Ya9e/Hj+7spZ0mr+TsCcE9Sg4sftWiQVgXOLbWzL
 yjtQnmhh8V9SuBAFShSXwkQ4J4nZMPlBLiCTXjGx41TwY6Y3NfBqiVhbbUAAcd2WU+FQb8iHUTo
 k8Y6NqJRQniDq8xU74hTwOJeREPyCKebqxIwg+fqw8FwulKVlMoY/hUiTnYq+8VMvmmXpCr94zP
 TrI0tdURtPLVoapKA06uoExnKAPVtvSdGjRBi/bFJReezY9sRz+VrQvo05M6AUQ/exDeXdNtiSQ
 ++PR+F3MqhYcAEKKZZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

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

