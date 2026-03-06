Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA124219F3
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817806; cv=none; b=BBS6zmr6KLBsvq1YlpIXBm5/K3uKbhky4vuypT7ALFKirDXpYPMa0f1d6CPLKU4R0fsShust2RxLbAD1LwxMt2oulNAbjQsv/1vJRgJRc9h39/BQ3LO3kvuYkJMzL+uwpmAYDPLK6bDObiP02L1ffHaBj4LZrRODKFqQL0AnSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817806; c=relaxed/simple;
	bh=/jjMTVDR3mYie9Ncx8hCNOw7mqA4MQBimid9vXcyuh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siC9NF2DSZ/CCT2gnoe9hMIUvGLjd2L7Q//Nu5M3TiqCrQVf18eG5Lqqnhg5VddNsWf5SeUrAcB43u2BVWp56bG+fW3al02cvb6Ivq/V/j0u5kYatwzU0Og05p6NZdHg64lbufrqICNG7etEhX9rcOdM7fFi3EHhsk4NeTe27Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhp5QHr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYSd8S+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhp5QHr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYSd8S+Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1liu667885
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pF0yH52MXQzce/UyYuQvs5aAI01bJoZ8xpfaV+SRcyQ=; b=jhp5QHr4a6DYAb2R
	kT2WNnMLysSVGTitOQ5JUgEcaGjPnZgG5TwxhG6K3kP60AT5j3+uXMe0NVZ7V0x8
	ONMl0czZKoO0+Jr8kL6WY+4bCsTv29IEyZ1PxGc0j5zxHVZXRQvY3wx5ZV6aCU26
	JVnGFRoUYpc+zw+ZNBlq3xAQLPOHFVY3uryGwrYm2kXGX7Byaf+go/yD4C7xzrgn
	coNtf/DXuIuOKlTShgJXuHEE+/eRSFs6bci1z+Nk24xcz9L64UOkgrZ2s5QEalH4
	IVrHMBC6aQBp+SXXI8JDWshxUhHG0VEK8uoL/2ZsGP9zn6WgH9XAIz/TLfnY2I0w
	hYcz4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2ye03c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso6953625585a.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817803; x=1773422603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF0yH52MXQzce/UyYuQvs5aAI01bJoZ8xpfaV+SRcyQ=;
        b=eYSd8S+ZvyRgESFxROVqscqQbNbW/wRHtV2HjKwNItXOOsgRa0Kpg82tNjNGZxE+db
         fwNZwMXidTw8sVb+0JfRdwgob/pQ3MvwxqtWnQQi2UnjZVPp7PhbWrmDdUFuGvfFVELs
         2DIW5W4OV74bMrOuhw3y5YxImS7AhlTMqLp7qJeH4d694CjzPC51FfTz4KTzgLVEEoOA
         +RR7sSpiQRBLF2Q3vGy6gS8MreeT89PSiw4BzaABT1xGtm6nf+qol7PAHfLK4T5t6ON7
         piObiyZFfe2Gszgca0AGkKAK1kE8seqnX65g8Djg+FXirBsbqt5JPE3Fq5TDpSLV3jVp
         XHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817803; x=1773422603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pF0yH52MXQzce/UyYuQvs5aAI01bJoZ8xpfaV+SRcyQ=;
        b=J5J2PRyFKGKlujJNNZZbkAbRicSKpZVvInIMID2+GwGffcw8JJOq1LDtPDAs4hs7Zp
         mCqJYSW3h1DrCSBDj5ss8Dfb/0KCxwGYsuCamOnhyv1L1ELfJf69Jq2D/BbRJbVhJS3s
         314ApCS/Lb0JhTJE4fg1SpNCbEBkjYSVQ8U1ZWp/YaqYWJKqh0QtpoYw/PO+uRNfudxc
         z9O52IyGTbiSUwz5b4ILmWO/sznf0x20Rxap+1tf6uBG+vfASmuCCZUBiWtBrtMHQUgs
         ZYiB5sWPoe3pxEtSsFXyhWwjDQDAB/BYXWOM9wqJoAiISUs1zNBucAJOeKuUf5SgIVVb
         GSkw==
X-Forwarded-Encrypted: i=1; AJvYcCVileN2emEhaxfeImy6rtsc+bgE5KqgAPpgc96qRRtfGOuetC8U/np+fWVsYMVKN/54Q2S3SspSpG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9J5rUGRS59Jb+eF8T68qpe1/FuWy1nRRI7KD7udhetGp6lWlz
	EZuGD+KgLnuwAXMazytWfSPuFeuaAEEzJ/Rk/edHB9avvzksyRNFP3HXbxVyNhbaxgT6bRTak/V
	mMzr/pu99TRGedmoxjoq+jumXZLldLfQtpHWDpXVSOZQPTKteba7IEIIqAA8zuTU=
X-Gm-Gg: ATEYQzw52agsn/cjHisOYv8mRTl0S6SnzNBfpx+GeWiVZj5dmyc64uaH/9197UOVcwQ
	TZalDgGXysoZEZ9h3fxVzTTK38Qizt+h/vYSHMbny3dsPS3mC2ESRR4ovRYQS2bJhiFAn/saNFV
	GrvBR/cypVjqgvoQEy6vbi9jxiIJrssZEP74bR/WjG3+ECdcYbHLYNcfFA7rglev+lg1O8FRkp8
	jOxGIk1UtxYFe8tHCIg87znf65dPXxvItMT268rU2hVCIaO2/Xx56MknlK//J7kn9HsGNZsMiDv
	8PnfRUW17gnlh+xdm7HmR1P/137q2hVOh2jVkjYqaonwA4yqqQmx5Ru3kvWwkWxhL+52r+j7BIM
	h2/kaGmTIPU58u5UsCsXuZ0muTP3KcPaznkNzNX3a6NujqnfJGS3t
X-Received: by 2002:a05:620a:44c2:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd6d514b43mr369049585a.76.1772817803367;
        Fri, 06 Mar 2026 09:23:23 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd6d514b43mr369046185a.76.1772817802939;
        Fri, 06 Mar 2026 09:23:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:50 +0100
Subject: [PATCH v3 06/14] reset: fold ida_alloc() into
 reset_create_gpio_aux_device()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-6-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2926;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/jjMTVDR3mYie9Ncx8hCNOw7mqA4MQBimid9vXcyuh8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw13fhD22RfgUyNV9WI3x5Cfl0CiYxYyUScQN
 J5790rkL1eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNdwAKCRAFnS7L/zaE
 w84+D/9HUwKbZAn77bYJq3B44FnlbNRZ/xP25QgLDMLyxGczye9ORJAs246zvRZCm8HENUax8Za
 f1Zo9kXrw7jlRqPEd2vrdE/GaOP97r75Tff8knIClDTcFesttx5ncs50evX/alFOcrY2JBeHOJt
 zFX7whynGpjGLuv13KuyXrBjcyhJFYcz+9KZvcHfogKr0wWs7fIu2NLyA9e24zX14uLbcRhxoAN
 kQqISjMf6eqKyG2aSdRg9Jqnq1ZVqjRLErx71nXX4a859RHV0ks0sRNYYaNOZ1ho38FRHM5zgNo
 TASa7Ghg3QaubleJAHnIwmhQIjMF9mXm6C9mN2vCBB9nbnO1QXZXHzscye6vLipIFaiPwO0FP3B
 SKBp2M0rbnZhVowpXCn00Rf+/K1TASyywqHFtjlS4uWwxzi+6yaFAlNzK6CnYITrdJMpJopaOaW
 UUZCPfAjxok5trf3Q8IhFDYlIPBspWamBBWQpkkbS1ce3HBfdDYLgoXSFMj/OCNL/ARYuYrKand
 Kxb/S82zYvQDqd0BO/GX+mKrcZuom5JgzKv3Q+DlR/4gMwhnVtzWkyePbP3qENoaYHTzsVSyJmM
 8JJiYKmr/52ASbLbC6q6OaTckxDBZcTCE/AONSMVEQsxtktm2r4tOTUcKEbw118KUXk7M3Vc+z4
 9fwnbd6TPQmEZ3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX2M++Fpxg7JfI
 rf/OoK/fsqzRsSC0RNWq1RQCF864eGqFDyIFvdeC1nM/iQV1rFuKc19u2sZ0Sr5aaMp4eJdGPZr
 EC72MUGMrxEYYHEW1itiMnXu7+p/oi4i08s8Ky93h5Cy8v6gsSZVtpkyMrXZg7MvRkhoT9djwAh
 ubVTFih3xxYzDbmZjIUSfNnBqi3XqiBlW6EQb5h3+nspqzPA+GYMEm8JsRbg4rths8/SP3b//hW
 G2wC6oJO42BiGku/BxtI0IbSunKFR+HWrH1O5PWkKGBPL7WZuugXjRF4BFy4eXcQO3yzUxfRCF9
 oxyc8TkAqPJV7cOtbzcncNE7NCeQbk6wPQsVHARgxZleI9aWszNgXvhL6SU1O+m9VcgNBlCZZFo
 QyE4HEkVN0HVPDTOHu+ZsB2K9/662hoknPwZWahQw+pE7ywmR7xJR3Pz368lq6Ydwa4+0ZKgKms
 w7dZtkLO/1TCW8MtQbQ==
X-Authority-Analysis: v=2.4 cv=Bt+QAIX5 c=1 sm=1 tr=0 ts=69ab0d8c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HM6bUx3eE857ULQHB2EA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XSAIZCWsQh9ySpAoD4ZWBa9SU8Sv379n
X-Proofpoint-ORIG-GUID: XSAIZCWsQh9ySpAoD4ZWBa9SU8Sv379n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

We don't need to know the IDA value outside of the function that creates
the auxiliary reset-gpio device. Simplify error handling by folding it
into reset_create_gpio_aux_device().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 3e55f794d539e4edc99104cb5396cac72ba30618..025004989595ac60381804a7705a1eb584b63326 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -824,10 +824,14 @@ static void reset_gpio_aux_device_release(struct device *dev)
 }
 
 static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
-					struct device *parent, int id)
+					struct device *parent)
 {
 	struct auxiliary_device *adev = &rgpio_dev->adev;
-	int ret;
+	int ret, id;
+
+	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
+	if (id < 0)
+		return -ENOMEM;
 
 	adev->id = id;
 	adev->name = "gpio";
@@ -837,12 +841,15 @@ static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
 	device_set_node(&adev->dev, rgpio_dev->swnode);
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		ida_free(&reset_gpio_ida, id);
 		return ret;
+	}
 
 	ret = __auxiliary_device_add(adev, "reset");
 	if (ret) {
 		auxiliary_device_uninit(adev);
+		ida_free(&reset_gpio_ida, id);
 		return ret;
 	}
 
@@ -891,7 +898,7 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 	unsigned int offset, of_flags, lflags;
 	struct reset_gpio_lookup *rgpio_dev;
 	struct device *parent;
-	int id, ret, prop = 0;
+	int ret, prop = 0;
 
 	/*
 	 * Currently only #gpio-cells=2 is supported with the meaning of:
@@ -951,16 +958,10 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 	properties[prop++] = PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
 	properties[prop++] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
 
-	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
-	if (id < 0)
-		return id;
-
 	/* Not freed on success, because it is persisent subsystem data. */
 	rgpio_dev = kzalloc_obj(*rgpio_dev);
-	if (!rgpio_dev) {
-		ret = -ENOMEM;
-		goto err_ida_free;
-	}
+	if (!rgpio_dev)
+		return -ENOMEM;
 
 	rgpio_dev->of_args = *args;
 	/*
@@ -976,7 +977,7 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 		goto err_put_of_node;
 	}
 
-	ret = reset_create_gpio_aux_device(rgpio_dev, parent, id);
+	ret = reset_create_gpio_aux_device(rgpio_dev, parent);
 	if (ret)
 		goto err_del_swnode;
 
@@ -990,8 +991,6 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 err_put_of_node:
 	of_node_put(rgpio_dev->of_args.np);
 	kfree(rgpio_dev);
-err_ida_free:
-	ida_free(&reset_gpio_ida, id);
 
 	return ret;
 }

-- 
2.47.3

