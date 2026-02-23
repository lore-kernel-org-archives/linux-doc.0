Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9894434B186
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831679; cv=none; b=CEwtJeHKhm9ITkdfosGvh0XiehbqnYd0zNbw5Evvu2Gwxb7nbX+efUsmd//ebUM0sPfKK0O47yVOrvqWlsXoUlhCb7a14mGB8yUQ5S2wXLqZZ5m2vWI549kErPgqzo6KOEcKVML6/R6xX8uy3ptRsAvhfasoxNADFEosn8qq524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831679; c=relaxed/simple;
	bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghKoDMIAC53waKr9EK5ul3UmhRlDPMMWKw3UKRc95ND/Pwy7pSkciXSjfP3YQXnNhww5NmEXfbvLPVlKMqqQdkkTB50s7nrfqoYsOkxl2XEoPECn2RyJJpbdBK97NpB6hjUePPp6eEk5V67MAV849HKkCIY8Lnz/5Zl22FE6F0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPkQwJkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrO/RMIJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPkQwJkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrO/RMIJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMne9b2783699
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=IPkQwJkV2xswGPCh
	rc3S7O5B9GNV14vX4IX8goHyV0CQK1YBxQHVtKRzM7s59ilh+7WdzmyNwk0bPXo1
	4BtOGKkxBBhQecc+toLDIAgYgKgx5oOC+N9otwEZFgVfHQKJtSlX9txYMWJQJHxD
	xUHTNr7LClPUIZveXVZbDiFmTfdb21XbH410rYJS3nv4+71vAyTjwE8jCfPA9ziA
	b61Lq5jOuNoK1GnE5TKO9/QABCXAQPfFymvBkzuQlukp0j0gJb4u22iIvLXz0rHw
	f9xG75AOu5gdH4B2LSoLOVXpfvnCRMMZE/DnZy3j34HbXdOgUxLXgx54prbFk90E
	yuSbgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgusn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so3045214585a.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831675; x=1772436475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=PrO/RMIJUPw6eGWSAjUIvLqS17ZSwo7HJ5FkWOxkLQGI7rW+nlIUJWPAaXc8zUSaEN
         8i19xNX79qcexlzBN1qRmKFBQJxjlqUPskYQ9nesteGhihc16BcdhNnjJLF8Q7gwiLgq
         +aVpxmzBVpt/yBjrVR4FVkOyLzPwFDikXiMsuPmNfnRdM9V+bSSp60Klb2akACM5LgFn
         +K/Bt3sIWOogAw/Gu9XeGCyZsdcqNtqOWntNbEd7HTfwYLlEstQILqphnt96s5k9FpSk
         E5nl8aDSPqwhb+Ztr2EQCBH9zBTDu/8Rq0KPa0dfNLN881xHcDo2hmG7Oopsz6AyLMov
         pokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831675; x=1772436475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=ZasiQPM7mAJCLUycQDHvmWYR9NLgmNc2hLSs09yM4QyixkqEdvChvl0X6jOHI0U9hH
         T1Q+c9YhorA2Mscx0uTC04ixV1vGxKWGlqAUanzfUDFJ+lUZ2YwUJLmPBDviblVbKO0k
         bdM+HCeoYXncQNYOoYuCNrwdrdhUGVCMU8JJEeAZJq2Kt0cGi3+tLTbj8GJhuYqe9vq+
         wNxh/urfasAUNczSHSRx8/Vm16X7xeoM/BEcBN0N4Q7XUcGUvZqIfMPDY4kb1REVKXtN
         ozO+oOlU3F0GGwY7pJJU/8P2GP17N9DhhR/bxDN1LqK35CYl6j5C29wMhZr4/VO5DL3L
         pxgg==
X-Forwarded-Encrypted: i=1; AJvYcCXf+iQ9gWfSQcMulJlv+xRzmIQPlYWd/4SKDcOvylygKZNkJKd22+3CEI60xqf+QX02quudJxiUhUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHsGUSkM6OewzHmvhNCOBueyUChbqrE6BukORz7CA7ftChyv1A
	H1uh4QBXk5prSUUgMN3hwSLovXuNyAFgiCW1II9uodrwWObvzA/Gjn8YFN5FwauJFcHGzFRwRzZ
	S92WxQlyPHxsKlFzMn4fKmZXxdwbSxVf8U7OlaieUuhTAJk9TK2n9iVAX3JF346A=
X-Gm-Gg: AZuq6aKYZmtWsz0NB43axXbUCMyAPkRV1HdbgFYtIhxgpMEUONUNmvREQRFyrgpOAxK
	16vWrCRwShx8E4mauLLHgEO4V5tpDswkSxZR+398edQbTF0dUdXWseKh0JTAq11Lq92sNs6m0XW
	W0SWmnXeU2FpBJ7hsbJUnKOqjs97rE47x0+KthPKui9gzAwUIpZGXcrHvdIfxfwQOwfV4hqU/OM
	rvLzCeImeAJn8XezTuVxcCvU9VCWgdVSREPAp1m8Fc6272Mq3RXv5Z/8RaaV/20gdHoLiDJF6TP
	AWmEFZXsq/TdxC+ihBAFOEBriMafJc0ZgO1Su08reATk85KKhduyeTXik9Z+9VGVet/fsoMeg0w
	i9JBdZ7LByoXocwkqu7r62SYoEm6+RSZ7ELHhR6hj3yJO6g==
X-Received: by 2002:a05:620a:25c7:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb8ca8926emr880336985a.71.1771831674952;
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb8ca8926emr880334085a.71.1771831674487;
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:33 +0100
Subject: [PATCH 5/9] power: supply: ipaq_micro: Simplify with devm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-5-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
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
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFqVbGd+Oyd+isBnLp3Irn3IzZIFzgrOBn+8
 5TEkaEct86JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBagAKCRDBN2bmhouD
 1/PbEACD32lwshZ2ZGTfWR2j4TEzEqcr5UkWKivQj4l2BDJ3b0cx3v9UXC+uQpxEwQRsNqj0BvG
 I1fbqNt2AyWmkGgU5CQ/mctWF9CLx35r8IK/9NdFjOqcFxht4uwjb6upeBsp+J9Pv4HEfYA0wAN
 KTA7ic+gakOj5ORF0AX0XB+z9UwqeB8IbQrIH7214fJQfuMgYgOooGihxSqfiOsUPuOZ9ls5/dM
 epmwdKvIbeyOiwRprJ77lkVrp+OMFQXa7Z3PUu0SZkkyFzbd7PZxw1z192ZbcfxAarusRPDYPy3
 wg9eYXwcNtW8bxgrkKEeFuuHIQYLM/XjrlvnAGGRttd3REFDczgFmq2NJxW17OOVDZeYCMfKj4U
 x50tsh+z6Y0ziwp0yrkLamVu++cpOHEeoets78gt/cg4eSkEFdA7Bm6o1PBYHVqPrYUMwYO3uzw
 jTyOPwQM3T2UT6UB95Cz2t5+dDzKC/lSPReC0bsI+qBURe6pUl4SOcPr44WISrvlDFn+uxccMAP
 cZ9tGiPuZpEGR4H7DnWR1quOQzOJwWZEQ/EbBXRzQS0zF1KAcc0gxH1sTluqtgGKh/1LOGDmNJk
 ILB2rMYlea2r74+WwfmYhcO0zntsIz41R1A3mBVMXjAxQHSN1RCq0uN/1cASc2WbfdgyvfjfE/z
 84W99rJwWh793pg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX5DqCInfsXR4i
 qkak21gA3Hjk2oMynnZeW0jw8R7qljFgTXPqgS4x1+83hNXgy5nU1Mzkbm+u2qBA3rH6fotEGmJ
 snzlr9HjJGKS9PqILhH1SogJrnNMVnqfVoPmCii8dMNboRRmFslGP5lNkGfxfswLc6JWgwXpc8/
 gmFOrD9KPAVTlFL7qhqrckfHqSnDf7q9ptLvVoEnahDgrPsD/uXJGmMxP66RCpvGYtBf9d6zSD7
 hh7plUeP8r/lIDFL6OftAjT8G/hxf3lxq0OZIuesxlwXgp2pbL4zvri0RJwQJ416xoQyLBCjXIT
 SSOwoq9qqHScsV2pNG/6YBOEUsjYPpKTYmy4/96/0tPbb950+cwrLsWtR30z0ZJbSDG3HFAaPfj
 dWPmKvtMLMH4MCM5je2RL3sdbTXp7+QmxCzZgCujndk38hl39n/NnOMMhY2JStNsQqbH5X0MiSY
 DmKoCYlLuciZMtbMafQ==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c017b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PkD0MmKtpR7JdVUpc-MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KmhF2XrSEbEGYCIJdy1MGMmBUdnS7pLw
X-Proofpoint-ORIG-GUID: KmhF2XrSEbEGYCIJdy1MGMmBUdnS7pLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

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

