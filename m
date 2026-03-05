Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C3135E934
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747187; cv=none; b=Ra+WI73vBXD5EHcNW2zgCbqWZC9JM+aVsSDjyGCr5lgZSB2OjMbWJyfdGBy4IRz50t2oPYMSifg+Mgep4GY0G8Msgj5DSgWxQcwzHRfZLw0PTdhvLPtbxBtdrJ+sDoJf5QKRcJeMZmKTW+bgatWJ+ZI5bcDKo4J/xpBLiNoc6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747187; c=relaxed/simple;
	bh=PoZ0eKm8MLgOO90bXKtZwxPlfboU8J3eYOJIbv0VDv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYmwimA4U3gmtuNRgIUj/ylnr7oH9qVy6Sw+3yNJUsx28ojsIn82xFt2Oiwbr2m412In6XRrcPfTy9pJQ5R9q8zR9THeRFq5tnckAo5K3l8nDUnhZdmoNtPlov+5PUpYRGwFYMb0ZvUUCleVrxWxTmWQHL/vVnRLW/Mz681/XAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov+IYeXy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwOpYvV8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ov+IYeXy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwOpYvV8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmXjZ3136467
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 21:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=; b=Ov+IYeXyCQyHl580
	YhbBes9RuhaotmCUAKz0h4zKFaOLd8/tSHTcFEVJdB6KXopiHp9iUXCwo2Fap0D2
	Tm631Kk4frs+VjP2udIj16K0WIpmkuQwAqmDaqP0nFv5H80yO3BFD/f5lb8sKE4D
	4YDPr99ljDYrD/YO59LlT12dnSK7tqc33oCibG7vKq3BS8yflyJCHAVZLTAjlWzX
	AnG5ISA08aa66pOBVm9ALdkuEAe7GizpbZdWTTNY5mcBpOWV3RTJe2/T+4DiaS99
	NWFYIC8KxY1qTqOhEPprHTKb3WbwGFsKvXNcqAfnkzrSR/HxANEXlqJ3bMERuPlq
	T095Lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk3hwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 21:46:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso1095477885a.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747184; x=1773351984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=;
        b=OwOpYvV8l43peyrJ1bWHJyl2UyhmP+5yOCrLfsLmsES0ecGFvPkdgBRTeFjJ3VW8zl
         hZopyVzYmsj+PgHQZFu660QuPvoTN490BYOGQKLr4tFJ2KBdmGQKi/+sYP9O1gVj/iDn
         S0Z80vJdvxBYdVen9ofqn/qiHVo3TTQDzxjF91B4ke/ltpKnFHnNszCS/QKh+cMAbbhw
         au/mfK/smjLvKTccYsRO05OtN7yMO/HmpcuVHRsToghObosLtizXmOG+r0K1yp8M2r6C
         vRKcReEtxnHydK4BHXZDztMP2K46mrdjgzQCcNN4sRm0G5UxCNqNIuKV1H+KbzChiYcr
         CI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747184; x=1773351984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vcpaugt/kV8VwsdX8NCcfQ7MWxrzT9ru/yIG08skX+8=;
        b=FcOKWdH5DlGMiGWbVL6vfyAeXgAETvKUSXZ1+RSS5ZKteSps13gM6G0DMOGhZ+hE2h
         b2Or6vPKQT3S7U+5MimWko/nGF9denckw+GTiL8mQyCQUZDZtHm+uLkgA7PcA9zpL3TZ
         oz5uXppDz28p1YYToMn4TwUI46OJCFgtgMltkkn37We+1vte1ngt0AKfWiItSiV5+Z+T
         nYGLNdWePjI7IPF6u8nyGzpeR8MN4lxQJI7wCGeQLBLTihFNXrGiWP7sYRJQy6e5F5/e
         KopOU1/jYEafxaeuGG0GCMw8Y5EnFKK6/kX1HwN4rHQZb6n2UtxDUViKAACxvmBQ9krX
         IpxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcgeqp4t88wLVKdYAwG4L0u85dxaHc8hm7i3JynZy+Ul2PmhftR4bffy6J5mDeVtBBhxOB7Y/nDXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxwjys7T0OSOvsSTduATmxG7buX2fxmnge4E1dqOCeluCU6dZ4
	+p49vEIwsrvhUVvsXfonP4mUO7e61eGzQMfiEZ4aSOvVlzYS+bvV0lEijcxRGtKCc57g7DdO6KO
	VrKY/fNdCfybDxp7eEnLcR1KF0S3J6Sd4lUgy+GgnteRw0p7SEcB02fGBRoee2PA=
X-Gm-Gg: ATEYQzxmkdJYsSKmlqeYJCS2Gi8Gqr22JlBAGAQwgc19b6USLc0WzP/bRHCdt4rHqZ0
	yEBzAyPi5ltgfEUG+FxhCtf4etYPVaI/SkPMVMAiWBDfucQm189bg8ULDeB4T6ih04D2A+0pPfw
	5HFz6MDLscq1GOh+NCOHuaLKIgjzLQMrXlogPqmwr98kwh9Xeq5asP+actez0QXIMbkH59ybjMO
	V/o5kdLgXbp8wzsqUhQQBUmb3vYTTRbcYw/UCQqHtPWI/22SJTpCr6JNNO0AhQTIRJo/MNb83gd
	FwyTrxFup3hlfeLiqQqoDu6R9jTMlsJ45vPyMoen5979rvGvHjEOE3sSV3sBqk+SgHbdrdyYQOT
	defaEEHlzNJfN+ZvGlcS/SqWM1lLGkMDhEs8GDwQV8+Nr
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr5040085a.7.1772747184118;
        Thu, 05 Mar 2026 13:46:24 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8ca:1107:1214 with SMTP id af79cd13be357-8cd6d3fb768mr5033785a.7.1772747183545;
        Thu, 05 Mar 2026 13:46:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:43 +0100
Subject: [PATCH v2 04/10] power: supply: max77705: Free allocated workqueue
 and fix removal order
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-4-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PoZ0eKm8MLgOO90bXKtZwxPlfboU8J3eYOJIbv0VDv8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmb2gO7y2En1OEl5OFrZ4KkZpCqXAC1BJCWa
 rs6OqZthfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mwAKCRDBN2bmhouD
 1xQjD/45+o2CDJzfafztbtIZA6A6uwd2/M6StDF+nW79PQVfIupsEalhQKwpwZ4AsUkT0Uw8RGj
 wj0rA71xQpR3ABUAkbkTWK29AtuiG3exU1uIDH9aCZRainZVaR7wkSUHCvMgKsaTp9dlIsn/7bY
 w4bO3g2L5ptohXvEgDXiLd7V+2bX89tyyI0oCiQhDwFCBlhvzFZ6x7iqZbQ4E/CLc++QQQA6CZH
 nzuCgbL17+egu2SJsyhPXHZe/+O2mKiTAYmgK1tYwfD3BErfUDoR2RNwOR9JzpmeufDlWnGqlTO
 EIDMTiPrXSaF4bQEb/ft3SNHmkCmKeufktwmwfOLdpfyL4Y3JXmolp+1IjpJeLodU4EXEOIYQqa
 v9/iviO4p0/enW/wWzn0wYZhB9qAUGTF2Zq4hs1xJqhr6Wd46MkRRpEdOFUntVvF0WnTuR6rHil
 d8tykmlOpdqR/4hP4S9icOrQ38dyPg90iLESKGi7zVvjVXzDWThzA60B0cJjcgCUxSAVtOIW3vK
 MXACsTA6NJTMi/oPTFMFJJjHJHXFLTEvTxIsHdN6fDLQTWtAHkD7Bate29s1YA3OC2CEx7umvTZ
 5nmi58PnCwirVetEziWYHH+9AfaojA/6g2yTy2rWOnwHbU0uXY75M11oJychETq9y86bCN0o7bV
 jVaMqs2Z9iuPX7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: x5IiFCXzhUQOtjJNQYPc6QnfF2PDn729
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9f9b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NrNmjpoQ7DW6B6PU5UcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: x5IiFCXzhUQOtjJNQYPc6QnfF2PDn729
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX4yQr/Z3ssuC5
 G8r36H4W76r9W6YSjkdFTH/BBVU5aU2wr4Jp+HsBa68Qk4z+hbX4HoaQPzrpF2XeaBcmVEqlOWG
 tuowdaoJ0OMf5nLxZfUVmos+HrJKvVjzsR2Clr/BQ5TbuSiIbr99HnAChG8Mi6iJMKr8MaF61Kz
 kxyXx3gYzCZRQXqeZinsie7l4WkBdQEE+e1NeFT+wksv5JjjSICAdGnEFdKlW/s/+w6BLuUgLjd
 5DEp/4QO+rxoSekusGU7zLABOKkql0iqcmYFLrztSP98AgWvk6QK9lAvNsuTjdrwmsDQyHHFs76
 m+gC/4v4ZU0JcZFdulzkavU7qi/1wtzHKsgqnSBasiinyujuqPMCXC6zRAlxIRZe2Ib9Dk/R/hl
 ai+Y5AAv96iPgs6/46cHdkmx8qpb/HLCaBnF8VRMWE1BRg8OEx9UCn3diJkJ4IZuTVoTVE62T1T
 8VwLnBz6BCyTeJYagEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Use devm interface for allocating workqueue to fix two bugs at the same
time:

1. Driver leaks the memory on remove(), because the workqueue is not
   destroyed.

2. Driver allocates workqueue and then registers interrupt handlers
   with devm interface.  This means that probe error paths will not use a
   reversed order, but first destroy the workqueue and then, via devm
   release handlers, free the interrupt.

   The interrupt handler schedules work on this exact workqueue, thus if
   interrupt is hit in this short time window - after destroying
   workqueue, but before devm() frees the interrupt - the schedulled
   work will lead to use of freed memory.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update power supply (power_supply_changed()) status, thus there
is no point to run it for memory reclaim.  Note that dev_name() is not
directly used in second argument to prevent possible unlikely parsing
any "%" character in device name as format.

Fixes: 11741b8e382d ("power: supply: max77705: Fix workqueue error handling in probe")
Fixes: a6a494c8e3ce ("power: supply: max77705: Add charger driver for Maxim 77705")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/max77705_charger.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 0dfe4ab10919..63b0b4f0cd21 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -646,47 +646,37 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add irq chip\n");
 
-	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
+	chg->wqueue = devm_alloc_ordered_workqueue(dev, "%s", 0, dev_name(dev));
 	if (!chg->wqueue)
 		return -ENOMEM;
 
 	ret = devm_work_autocancel(dev, &chg->chgin_work, max77705_chgin_isr_work);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
 
 	ret = max77705_charger_initialize(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize charger IC\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize charger IC\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
 	if (ret)
-		goto destroy_wq;
+		return ret;
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
 	if (ret)
-		goto destroy_wq;
+		return ret;
 
 	ret = max77705_charger_enable(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to enable charge\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable charge\n");
 
 	return devm_add_action_or_reset(dev, max77705_charger_disable, chg);
-
-destroy_wq:
-	destroy_workqueue(chg->wqueue);
-	return ret;
 }
 
 static const struct of_device_id max77705_charger_of_match[] = {

-- 
2.51.0

