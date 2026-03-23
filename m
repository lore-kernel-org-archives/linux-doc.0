Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E123C3C1F
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279065; cv=none; b=esB3lLSBw9/y/j2iCsQz/yI7twhDX2qyeT/g+F1M+uFvHIxSZRau2Drfq0omM0jxy5aMiq47Rz19jvZT615olG0pCEYI51oaEGJACKkC7ifEOR1XToMuRt/TeKlMvD68SAqlcpLVIOw6qm6HyEwO+s73/OY2lHORwjFYwKr+DGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279065; c=relaxed/simple;
	bh=D/DbbvsYNV6WfJJN+Y3qtsfzsdueJP3Q7cdgK44aCk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMwxNhq5wkRWmnGz2QGiTFAtLyUcEg3JzFBHo2bIpPERZsnsEwx9UCXgjI93gczm2dYWUoEQaHzeZjaHKQazKzVpST0TRw0JK+3u5/jACeRQqlnYBq5+ltdcuDOD/AJnbYJ/c5w9eHgDFMWRcwnEbZ5sJcCircY54JoZYLFlyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa+3xmrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDky20dv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa+3xmrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDky20dv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDTkMT1176236
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=pa+3xmrYIo39UDIg
	YLcBiQ4lG5KDMC6Ply1GiYnsIn6X2qjP7K0CpJjtUWT/5ItlObDcONIXXt87lS9E
	GZBKDOPlcWhPbJhqixzJbg+m93+kJFA2CzQjB6P0zMTuh8GbCVQF8Z4WKTv5jH0U
	4wHLO5rl0QBl0ojaGoKZUWWvuVFWWqZl9qWfU0G6huxwd2jOpIiHCn30tMx2FuUE
	ZnKRXkPChYu4bi9ka/0L66JW0iN1n5DfMRLG/sQc4tH5FcRnxrL0t4pZTicHNItv
	x8GG9/1c01QXAbd4Gjp3kUSgVviCRqdscyw2g/UQsQxgqWu15AdsKsPUb8lxiMqA
	9/rDpA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f08djv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5662a21d35bso28241819e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279061; x=1774883861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=HDky20dvcXBjXsQFM+Y+e2SRJndV5cTP0GV47ePULtcgYYb249PM286/LzqccSlYJ/
         yYcZjyKFwaqRPi5AwFleeoV04pqDiwQqa7q1+HJwWUhnbUf8e/TNOhLRJiK35q7iDUJG
         VhzaHpvdwnz4l4ztIKGjAMZCHdx1n11eUmuP3haTTf+Z7P9BrJBpLwT1jLyJvOfsrbjr
         2LkcuixyKtUT1GJ/BieG4gY5mUEle6dzHkJ49uNkkiIVgTZHfkXurZ2pHpUX352Uw49+
         12HIiDvgJNJVIrFRJboNKDUOJ4X0zrrzuYO5SX4wWVCjnClTIcG8LLk7THmtGr3Avrxt
         TWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279061; x=1774883861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=FQJdOs2Sw+IxPcIE1pS1ex1Rt5rCVrHvLKJz1YiNR4CC6h0Lqjlz02a8sK3TwRQEOj
         ecaxoccIb3H8vny8mr7322EH/Bo764trq7Lv1T0ekbk3OmiWLT7xfK0WiWfBTMhc0Ebw
         JuhzGayORV7zZjZ1h8FAad40ZUaX2xUpuyW5uJh9DrRDQHjIz/vEba/Cpy8mEvI/VBbP
         tAKDc4kE78VT7Oq1G5NDXZ9OI6AVwoBBQnv93ZalJKorzRoLjGFMQ2+/Mfx+30mi7M91
         lMfu2Ec7MdZcXcmT0zU1wRY88fHDo6vbMcJgoxkVwqGeELFoV5sr/PRJMCx7x06QBpNE
         D3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWV8HK/HMgzslQbFjXJtwRg2hkRdz/PgbysO8Q8EVlP3zN+Jl86/Or88+5LNGw7xZ154hYwuL2YQZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ4+pPNOHZzzL/EsV98S2BD8BbWkZSEVkht6Xj5WJTUYBrigdD
	g/EBgKyp9JtNWJu66K+aj+n8DorGY8aeAs+qJt/5KyUjHp5i22UHUmXoK2wVRs85esA1bAhoKKa
	ht5bDORSFPF7+WGu++KKV7HZJ5sCfjwgDk7F35GLXX2tO61w4YdEWK0UplzL9aPo=
X-Gm-Gg: ATEYQzyyLmu2Il/3oCWPqYD41o6qBPsdCFKyGjwImZn9deVzpFnZStQFBEpeI0KVElZ
	1RUvyOaazQFrmSd+x7WbDERBgiSS6O4e/gqwbFWNx1jAXpe8qzoGpFkEDlhN2oOHI55rrlSRz2k
	an5okaeqeRo2ZWMCzIf7WHndLrOlfSGdeVZsSdXUyA+WELdKiZZPaXH0HvbI/GJ52qyqMeWmKl8
	dr0UzfVRFBAyT0Cwu2kqyxFncSn3n0ki2ZwMdnnhXgTKRvIkNddVsUbvpBRP244FCrOgzotrSFy
	WnFd55a/Tr5vvqYs9Vnf+Yh4o7lgfy9Ue6UDBxJmuTq/NDjCmRoYlJIJVzyB/4g7Chuzj8K2MaG
	FuQWB1hdIXGiLtQmAd2mO/H+gvyJD7PRnHuUxNUhyI1AiO1/QVP9G
X-Received: by 2002:a05:6122:8c24:b0:56a:f34d:f225 with SMTP id 71dfb90a1353d-56cde3fb2e1mr6327699e0c.11.1774279061029;
        Mon, 23 Mar 2026 08:17:41 -0700 (PDT)
X-Received: by 2002:a05:6122:8c24:b0:56a:f34d:f225 with SMTP id 71dfb90a1353d-56cde3fb2e1mr6327634e0c.11.1774279060589;
        Mon, 23 Mar 2026 08:17:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:12 +0100
Subject: [PATCH v14 06/12] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-6-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmAhu8moplJ8pqXHH4fRnifztUVhJgIpoChw
 kDtIV7AXb2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZgAAKCRAFnS7L/zaE
 w0AeEACXfpNMwOBQHUkchG/Va8chbPZrXTY4ipRIK/aTbAWlxOQ2Ml7MmhfkppYmbI0hHBwF0QG
 9J+852i2qW02O8aKYUnxOwuTC+fLIY2U0HA8cSyeKCmyLJQDaeDdYwK+++aKJeSEiFywL6IciQ+
 iSA36P0m71JcKImO7/VckqewAKtw3r3uOKZTCagqfP/hlci9AaKW9r2MADqyAG+n3i3/vQ437b2
 nhU05VqpsCf58iDutx/z1uHGaBkP17ZPKIdOJg8FZUAT/b48xysNigp64CxcE3VZ5EJBSTKqkOt
 XhJLH+6TYbnSvHsCh5t4WY58EEQz6nVqSWI6VdSoOX4b3khVf95g9k9N2Kw3xSVtAoZiET5l5eB
 esPCo93MpEjJUjErK1cNMh7SIoPjj+kCqIrF3oE7LX7s0BAup2XGXGEB7naAQayD6Ap9EnUON2S
 ET2p/BO5DC7dWfWJlsmOV7/fZGVz30aVLDU0USWklTPzh1nd9ChJJCgtO8FJZzd0xgFMkE3c1VK
 8oH59LhVz6GsK2XZKkVblxwlafShxJU+qglU42SlIKpdIuzZ5t58y3OfcQDTgeK28ZXVaUcWl7g
 zlb2gQduJvKUWgTvt/mOESR6A0noJ4HKv4YFktEF3dK4RcvOEzH4LgkMy0oAZrf95F11N/23xEA
 RCjHrU7a7oekk8g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c15995 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fS8JjO8v7kdlwppnOg7_dXxgejUoEKsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX0zSyLnKQj2kD
 yNlzQob6GLaL9uIJz7+nNU1FkOTDsGwQTzjQzqThaEG2QqWx1PIinfpH9axCHpNzPUfjeOnMrt2
 GD/G9ztQCmfJfyaXoltfITVdmVQp3sI3wI7A0o/XRabDVwkDB0kzsBL3ionf7beSWsQ+39YhZ6I
 6svyyFxKjTYTeVf9cGuqhXDlADrPULRcWzXTInDHlmYyhlYnZiA9AB76LlQgUz7cfoCGxRS9/yu
 hVjlZaGGVGaXqwNoQCmkq4dgQCHE/CEfYoXE9ANAoJ4RDyjIaMlCMBnIC1bq7n8tVIB7aTvik9x
 d0ATwoPJJywyfliBDuX02Qo2Ccw0hZ2tLq3Ad/3vUXOS3pVL7AaMlO2ex6HqrBgOskbc8l0dR66
 8+nubO9yR9SpAauIppV14EANotINe6f4g7vl0OXnI2O94XzP4FmBIml0VbHa5bGowmwWEy+J+1c
 HmxeHgqFsbvIH2ef3Sw==
X-Proofpoint-GUID: fS8JjO8v7kdlwppnOg7_dXxgejUoEKsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230118

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
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

