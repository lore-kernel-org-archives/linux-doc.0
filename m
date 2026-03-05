Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CB534D4D5
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747194; cv=none; b=ccsqcHAwwpvjR7F4D+WRT0XnwHlFZRnkQvC8PObHpw7EkXQwjCuJDVhxMkGPU4wlQ3RsPp903wmirB4StO1XaqlQF6n9U0bsim5bl5SKotcqwEY8V/su9Cpq4XPD6i8RAzazK793YR8JM+bmDNKqQzXpajuY7KjI/hOg8ypFxXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747194; c=relaxed/simple;
	bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y51TuTZeK8b+1+/EZbYuE2MPrT38D7OpiBOVaDV8bpOGGCXRzFhEwHpVsE04hprvcbH+4APhdWbMMkiM+0DlaZ/FWFiEjwS1tIeyAKRSSrhUE+LypcnR9/lGjRKoTPy5upkLUHfxClaPr7PdcHTCUrnUhdZNIAHg2QNuVEPdpm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFSxdaVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEinuJIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFSxdaVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEinuJIW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmvSL2267499
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 21:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=WFSxdaViIVPBNC+X
	9bqAQeOpl9vGXSUUioaKpINGyFSaBj1czQ0kQkCk8MAiZaNmcE7wHL7+fV2sSzvQ
	6+x6p53n81WDEWEXo0Nv8GVfz/Bq6O3kyYYQTrRB5tyQjxBDwKMW+0/9IXoQz2Y6
	d4BwliZ31/MTimweCNxGsU/+OJhDIJazRYQ9e0jeS9F19EGb9kvDa4WRvV90AKH6
	2VVrNet5cmq2/CEVpkYGWwoO80ZawsyODj/naisE4DyT4Ns4KkPWvMc1KeARrEeT
	q79E+dOAggE0iGVpm+VqfUmpaIxDya2l8W/S/L/z/yRp6GtTChefieGrRO/pVVkG
	7QkkbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380u825-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 21:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so1116926385a.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747189; x=1773351989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=bEinuJIWCzs8oyxJ1ZQe/B5ibrlzguy8muAk1KsnTZo/ivMShgSxykKHbB8DPs4Sny
         k+g2UVvAfb2S61E6t2Nm8Hu1EF1Ytd93B7lH0Dz2MUtWgDntxPFi8vNPc9XgWGfZIHSw
         mLlKjmXqFi/cUq0hwehoEMQ/7Q++j8gY6eyqnuZQyxpbrYdsCtbvvJj9UpJXyM5JkjxJ
         L2hF2fDkmYBFb7gOzLsF/CDBjzDA1u6CYj+U0gID5bDfHFvSnyaNv+5nIRJYJJnrLyhg
         jFXcw6lFvjnBRkIX0XxXNP39prOOjuTFOUO/oMSrVMpDVwzUW0pbPx12rHFYBqgDWDN7
         npxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747189; x=1773351989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=YMxqbrvtAaNvMDk5o77nVKGtRRqJ/+sqp3gttSwWRJvYF/fGPYtiU2dEl09XwWUcqi
         tnqy3EvHJRUqnWmhcwmBH50juzBAwS4etr3j9X5gcPEge0KyaY6249VD96tIwqI+yXcz
         CDK+9W0K9wWoYiQ+vGNn3QwMyCT0u326MLo9M2KcL4/GUQO24w6X/RErFupKQBKAWWaG
         BnLI/Ses7fjkl+hpdsTqbKDELUINdUHQit+NSSuQNvNq23yrMRpsxIncxiE8K5av+lb8
         uJUz43daIPSjDO5o/6LQLx4AequcA57+DwrIWS29h0NaePweCXgesFdHGBFsgjLAS3Hl
         0I/A==
X-Forwarded-Encrypted: i=1; AJvYcCXfcxP1MiB9cak7iZno3MZgS5kMbkUggQuL7VbK2zTkMVVxi6KUr8cfJGEiVGlkooaWI7dhnkwu178=@vger.kernel.org
X-Gm-Message-State: AOJu0YzumcFSFaU3ToPpNuAsCbvKhF6WNV652PJOckmVCrlzhdmRxSBu
	lLEuDemxD00G/0Sc4aC5Q/XgNBwpH5ArMnVWEOF0iBgyHzoS3/aDNZ5exLi3rSreGZMXxr6VMhJ
	OCR1OoMXPepZfdAuMSn+1lLBgSzptlTlD4pC0gSZRFOTWKCj+4BLH3O96ff33KJw=
X-Gm-Gg: ATEYQzy52v31ayfyVJHngnimHtv8ua0BLQnAN8LkAhx3VdhUmxV25rkSmKQ+aW6BVUV
	rDrC1Mn6kQjdYMDOK4IRjvavZcEr6tJauk8/T5F4spD2T1/sehVnM1WOTvYXVLho5/InNhFwFAn
	RIwbTimmstMp/GyChW5KU0udUt2njFVjsQ6w2nqr8/NM7gvJMsOpqNqlaMyIgavUOvC/VCedtCl
	hLzFpDEMPF+V+s8rk0Gst8zpfGjJyP4oZEvhEa8v7EpGMKPBuYGU8kEMDa7fsmYl/aBASg3YM6v
	Wc9C3ZSFDSLnQqt/KpN7R3x7cXgQ6TiUVvqeBxjLFZx0iAvGUHfGBKM7xk8mSWsQjOq+D/fPrk8
	C07NbR8XZLzwaESydPP3Pf2PR0UYQyHtO7mZiRQWLrjc4
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr2331185a.77.1772747189141;
        Thu, 05 Mar 2026 13:46:29 -0800 (PST)
X-Received: by 2002:a05:620a:1726:b0:8cb:4fa5:d47a with SMTP id af79cd13be357-8cd6d494e49mr2326485a.77.1772747188622;
        Thu, 05 Mar 2026 13:46:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:45 +0100
Subject: [PATCH v2 06/10] power: supply: ipaq_micro: Simplify with devm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-6-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmdS1zMtD2UaoQRfaiq5mLP0QlOTpilY/8TD
 J4ztu2IWgOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nQAKCRDBN2bmhouD
 13BxD/0YZqo0vRusnBrySJI4j7j0qBvMSBLl9ERMwbH5zZQFXisFq0V0/yim2m6aeuWG3sue54q
 cQyLvmbMOtlHEjhHsJW0gAP7otcp1O0SfR3ykSEKToa0wZY7+zGXm7wnrXKcTsXhcddZj9Ywk7G
 k8pxhlb6R/iKHlXjSedxxBM2U3iicVf9s043yF+9ADEZTF2SsoruyLdMui8TCO60ILt39gQjuqx
 9inYM98ZePPGSQtHGfvmONO7Gu1D+EvkseMIaO+YIhDzEMAJUAmew+WPrK567ES5pxsJ/GIg9ul
 ND9JhEpU12ZAB7EKrHhCcxcFQOn6vDEvL5ZJ4rtl/Ts+C8ufpzL1pVEuldmRhFHjG17dv3Mm1hU
 qG4oztSBnPshts2d6Nc/Y4uayRlpNpeK+7SrP2f/PrWGQdd5KdFo5Iu1uJnwGMsiExW0MLOT2eI
 43o7eDO7M+jC3NfI7za2SVUY8POdUyx/ba5BPcXUmJd5RpRiyOgPbEIZeRhYhkxSm6zNITQjBIQ
 7tVjG3QlahgAPAcbxe0FiplwIwhYBRcso/cJGY5XD8IFB9T8+OH6y3pOed4UM7DNe3E2zT03P08
 8/si+s74GY7hTw3HR+7C9YKGWQeAGDNHcOFKDrfcLEjPqmN4Od/VOYDbfizGIxxbX4sM4VQDDfi
 JSVXiCJBbZxkykw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9f9b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PkD0MmKtpR7JdVUpc-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i-g3GykHz8ruJ3fLSiQpGBkGDytdEZ2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX3Ca+/umy23oK
 V+EmRSO3jqByvkeR5BA1Lm0uvsCLdxPx/7JNO6B1upiMD7c7IrlbsKbqlC8QmZCBFufWR/M3+Wz
 LxVaZhHqrX1/N/qlRakA6bL+HF5/Q3vh0+pHNxx9Y+aIBzrD0oVCeZdw2yuuUkPEMhUp41wShms
 1NLsE//QYInTrPLym61A8Ix7oiAkgz7NoJ0mDap/akJ3871YYA1bYAm63AxOCat6QD7r/PbE1BI
 m/sJADrZfm2I69bGu8zv+ZBQb1Vos45QHNiylOUcz3PfSdhkh6Uklm6EPP8TqDLix7RZcT3ynNW
 c8Ohjk7RVHxu8zCU+SQVXLl8NIu+h3BC2+4riIPRoeMz8o2r1Ay8wKM1kWNGAgdonjdyhmpJf1G
 IlHLhxz1hUqfD8ZfuLQj7BlTaaHIGiet2CmxkxQDnlD1cYdwF0PiFqaMLqlvL+uEgfegWg7o9G6
 CGbO+ftTZd7UcLjXP3A==
X-Proofpoint-GUID: i-g3GykHz8ruJ3fLSiQpGBkGDytdEZ2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/ipaq_micro_battery.c | 50 ++++++++++---------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/power/supply/ipaq_micro_battery.c b/drivers/power/supply/ipaq_micro_battery.c
index ff8573a5ca6d..5e3fe3852d0e 100644
--- a/drivers/power/supply/ipaq_micro_battery.c
+++ b/drivers/power/supply/ipaq_micro_battery.c
@@ -7,6 +7,7 @@
  * Author : Linus Walleij <linus.walleij@linaro.org>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -232,49 +233,31 @@ static int micro_batt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mb->micro = dev_get_drvdata(pdev->dev.parent);
-	mb->wq = alloc_workqueue("ipaq-battery-wq",
-				 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
+	mb->wq = devm_alloc_workqueue(&pdev->dev, "ipaq-battery-wq",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!mb->wq)
 		return -ENOMEM;
 
-	INIT_DELAYED_WORK(&mb->update, micro_battery_work);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &mb->update, micro_battery_work);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, mb);
 	queue_delayed_work(mb->wq, &mb->update, 1);
 
-	micro_batt_power = power_supply_register(&pdev->dev,
-						 &micro_batt_power_desc, NULL);
-	if (IS_ERR(micro_batt_power)) {
-		ret = PTR_ERR(micro_batt_power);
-		goto batt_err;
-	}
+	micro_batt_power = devm_power_supply_register(&pdev->dev,
+						      &micro_batt_power_desc,
+						      NULL);
+	if (IS_ERR(micro_batt_power))
+		return PTR_ERR(micro_batt_power);
 
-	micro_ac_power = power_supply_register(&pdev->dev,
-					       &micro_ac_power_desc, NULL);
-	if (IS_ERR(micro_ac_power)) {
-		ret = PTR_ERR(micro_ac_power);
-		goto ac_err;
-	}
+	micro_ac_power = devm_power_supply_register(&pdev->dev,
+						    &micro_ac_power_desc, NULL);
+	if (IS_ERR(micro_ac_power))
+		return PTR_ERR(micro_ac_power);
 
 	dev_info(&pdev->dev, "iPAQ micro battery driver\n");
 	return 0;
-
-ac_err:
-	power_supply_unregister(micro_batt_power);
-batt_err:
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
-	return ret;
-}
-
-static void micro_batt_remove(struct platform_device *pdev)
-
-{
-	struct micro_battery *mb = platform_get_drvdata(pdev);
-
-	power_supply_unregister(micro_ac_power);
-	power_supply_unregister(micro_batt_power);
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
 }
 
 static int __maybe_unused micro_batt_suspend(struct device *dev)
@@ -303,7 +286,6 @@ static struct platform_driver micro_batt_device_driver = {
 		.pm	= &micro_batt_dev_pm_ops,
 	},
 	.probe		= micro_batt_probe,
-	.remove		= micro_batt_remove,
 };
 module_platform_driver(micro_batt_device_driver);
 

-- 
2.51.0

