Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7034CFC3
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831687; cv=none; b=R30jRqEB9lXIvv7Pm/BnmvO8ohOZYeHBzpKPXim/K8zVAYWMweLyDR1RrORk9dZJNRc050Gl6uZ5Bo7czpz+gD5dvoDdSXwURdt3ORgJ8oKr27ezJCzMakKUTjZ+Qep1OIpa6zazbaQRyZJ5kA+PamLaYvw9gwEiPoCXK4Y5e1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831687; c=relaxed/simple;
	bh=Tz7aCKZpxvE/URE9NHfPfJCIW6o+Wox+HN1jMO8zCgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XC4seI+5UTeTyjs+LFb4Cj/wlO3Zkk+L5DLYfY41xSeJG+wA8OV9Lazs7S2r2sX4gic/5WbDldhdrTogT96aNWpx6cmz6rcv5zdY4RuoV5f2ZPxXbeeROv+34vwZkTB0ZZ5nOtVQ4qfLoNfgjVvvzAmG9rq8BOjsbIsChbHWvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqdUhSGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWgRlwIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqdUhSGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWgRlwIk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrK7m3486255
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=; b=bqdUhSGg4fNXC5Tt
	lBynV7L5CjuSOXJESYwWx3vFyqDGDls7Zwtx7n9sISNSuMJzh7UN16lJ1w6hz4s5
	2bThB4m0OzgpMqh7TiUxcmBjPWZOLk2wkaBSYBw5RNRm93k55D3BIgWqvIon0MIr
	ZbghUmGcXmjMY7v7Kc5oWG0gRwQRAJCmhK7yj8iTuw2EEiwBhm5GLL1E8ryEqvwp
	tJnt0AEfpr8xKWCvvxkvKVaIBiHl9KFAnKVTR+vOCizkWpraNxR7J5XHJNG3dOX9
	mEG5mvwhpWDUHVP9s6z26/akucfbtWNRM1FpY2dp8NShJqDdJljAs+CiJj/M7ACH
	VitS8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8krxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:28:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4e37a796so3385689985a.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 23:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831682; x=1772436482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=;
        b=aWgRlwIkeetvYNGYEU+ReUUyQ5r6XdpIiGTbreZTCRZ7xbUrqAv/S+Uj7AQvI9odK3
         nt2B3HDub7VowEq6Hns5cwJmJc9Pn4AV+6/ZyJi/AhaJSCXLsCaX9ghV0VNs8VV8HMhm
         MZIF1JXqsg9lHP0U+ACbfZYuGv9CxXrIii1Ijeb29gyqVfFwc6RdStEt/mX1+0wnlMQR
         gpC38sQSQ3slMVb2UhOLFzzGAE7/bHFX7HeJ30r30zwJC8X/qT2+jqPjxQbxfWlku/ZI
         zfxG0J3SVlU/YwWQdVvCeLMN9c+fWddABq54eGk2TuLz66JHGcfxCyFHmNFPqxoN+0JJ
         3jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831682; x=1772436482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=;
        b=Etp/a09rM0f6kgi2rB6AgmXKomxIREcEB3xMb2x0OEZoyccqYg6/6f2GAyXfrEWK9c
         mv3JqjTdPYTE0B8bz7y8TkHeY+ZJ+xyo/p/wLC2Bgl12Bq1+1KpvWwIAxU9NUcStRrno
         jCOgiQ/5ZTDxrhiIPACcZi4WToaQsRcLGRx7MAi55KPtFc/Zd/ddoFCybv3QngfJXHal
         fp+U+LKNZs7PW/GOFEKJchQJBRenAUoYKJFvL2fRKFLIzRx5cm3W1Scrz7LkMOU2Ti+Z
         7HsbJACjbgoyi9MHtj7keESHAa9rNLrWzSIFlKUqJrhzIP1VP42y6jmTgKvtKa9nNhXw
         RopA==
X-Forwarded-Encrypted: i=1; AJvYcCWV3moWB+ilAOHSRzN+wt/jz3P2sv0TVDaPIPpXp/bCtE8eQ5iT0h5maq1+T26egCRPvpKhAIcyv/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJp1546/4Q/LeLup3cJKcJg4x1/vaYtvwrltwfAJfC/B/fM48a
	GGOi8HMWTxOL5DBAccFjFQjOoWzIMeCR5mkbaca2NEutWtGXIhqtyhDWxbPXfqSU2jB/LfshFFY
	mSR61OEioqhwXsXH7zRW02bcFyQ6/e2MBgjR3cYcCh3EUMa2VtjPHCesZK5xApOE=
X-Gm-Gg: AZuq6aLg73oKvNWZYoaqFnjUoirV6avtcLP43YtjlwazEILy6DjgYTRZUpvOZBKB0hz
	VULNjUqtD0CTtmltdHEnZlACipGeQPbuMmRCXmDYAMsGvF644TUqX8KvxIYa6vmFBjdPkda7K3q
	7u3nVY9Lw89k4P1ojLk3cAFfYefBv8Hhs+e1swribkp85kn9KEwm0Z+qf2o69KAq9KUeSWJrh7x
	PPk/R0rVaSYiRBrQuS0SLPUAgIX2gOsYnI7L5i0+dw/r72zF7ZG8WnAiyzn6QvT7KT6KX2+Qk3H
	XDuV+PVJGnmBIIbv6HZl6adh9QdA7HOTWNFISnjJTifad3bPFj/RlmOR1cJMbjcLOGbAY569Is2
	Qh9jfGf0XpwuHyxMnb3EMH4zYq0tePuUht1DL8r0uw8rhDg==
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr1030172085a.72.1771831682500;
        Sun, 22 Feb 2026 23:28:02 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr1030168285a.72.1771831682019;
        Sun, 22 Feb 2026 23:28:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:28:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:37 +0100
Subject: [PATCH 9/9] platform/chrome: cros_usbpd_logger: Simplify with devm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-9-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tz7aCKZpxvE/URE9NHfPfJCIW6o+Wox+HN1jMO8zCgg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFu3KNp+CTKSy+V7k67mEChB+6tEknfgjT/Q
 0+9orefkKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbgAKCRDBN2bmhouD
 1wuWD/9J+JqARU6TsvU4zvVDheM7Vy4GbVVCDxKaqTn1LB64+jTh7G+qQDyEO+/8tfwnovEz32a
 dZfCA3g8kmt9XMucw0VfKlsZIX+GwOFNPaCzVAIUDxeJAZLU7RU0qIm5Sr9Tfvg2BRzyeDraYlT
 J7liSpFkaTD39Xe9e+ncf8BMH+iTwVSEDGmzCDAoM8binwflLgSFhX8+1BAAD+6dGF7I8S5Jd9F
 f+Yfs6XweClFjvk/QYcBtkxFZgTpt1p4s/Ksnk40iJqDUWV9nT7P4LCPGIedS+T3FPn0QWCatUy
 WQrnAzUWqundJe80uxqAF47q1sVAqylM2iuodrq7bUXWaR8M1DHKMOsQK60jEyt+n0BrWTqTC4X
 0OvX08AJfnLsjhGl7MXfKjH+t/A+dPPQeqxzDF//csXt0QJqWoJNq9HCMfDdAkCxvlSeo4H9Z+z
 cYCbIcdRo8JQNn5a6H/48X2v7YhZV8tkKw2OTs2JmW54h38R8qRm/EVPRfMRk0VxUtTcZIuj/Vm
 qUIhXscFFPVRJCkWfps7q1UEqNoWwk6x+NdWrH7EYppRe0NRgJ7xIAgldkle635fxHyB2C0sUgo
 yylFHJPeufQjL0tRBOlpP0gjwNExCI+B70e1ZlGbs4mOM7RJCdTfEZLGq4326lxqaEVTZZ5aRHq
 kW1pfV1AjFgY8vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Y_CPx2OKSaMPVZ-6fWQQr_A5oe3sXxhI
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c0183 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fg_Lw6XCFRazdZfdaoQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Y_CPx2OKSaMPVZ-6fWQQr_A5oe3sXxhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX/nX8WnFI0CNL
 i7w1YB85kfrsNAYky+Tzkf44GlQHgMmp7KJj+XnifvOdxWwhqka9V/bGWSDlHsgcvhMdr98eTp2
 FoPqyh2/WxBk4LPTmrkfwYnZvuWks8w360tPS9eCETi4fKMFPsOWg3Y5IpdO2tLrqtnETEOsrVt
 KJPbVJwgp5DWYxJ6lGGYDDSupW6gU99IjnGS6sS8bDhMNOdDIzDO5+Lz9fFEe8OAHD04Jrd7n1W
 f6Vpk7007lWLJXkTBy7nm8ZMp7KNdkBsq/jPGwYipUe8/Uh5Hwv6tvpXDIEjrZt5gSRpQnSEMyQ
 32ntm9VqXRM2/7qvUEAtxTAtimL7s7tp3l0Pw1n89lIg9XgZF1Qqgr6ZVshB8IPYbIFmSEB2dT9
 XVrlett9fQBrJhGpyJOp5g1q0TTWVTnTIrFuMZONZtuvG92Sb9yY5UuFxP7DkIGx1/4e0KVZA5R
 4yExK5UVHiMDP2vmWSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/platform/chrome/cros_usbpd_logger.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 7ce75e2e039e..b0d176c0f4cc 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -5,6 +5,7 @@
  * Copyright 2018 Google LLC.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/ktime.h>
 #include <linux/math64.h>
 #include <linux/mod_devicetable.h>
@@ -199,6 +200,7 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	struct logger_data *logger;
+	int ret;
 
 	logger = devm_kzalloc(dev, sizeof(*logger), GFP_KERNEL);
 	if (!logger)
@@ -210,25 +212,20 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	platform_set_drvdata(pd, logger);
 
 	/* Retrieve PD event logs periodically */
-	INIT_DELAYED_WORK(&logger->log_work, cros_usbpd_log_check);
-	logger->log_workqueue =	create_singlethread_workqueue("cros_usbpd_log");
+	logger->log_workqueue =	devm_create_singlethread_workqueue(dev, "cros_usbpd_log");
 	if (!logger->log_workqueue)
 		return -ENOMEM;
 
+	ret = devm_delayed_work_autocancel(dev, &logger->log_work, cros_usbpd_log_check);
+	if (ret)
+		return ret;
+
 	queue_delayed_work(logger->log_workqueue, &logger->log_work,
 			   CROS_USBPD_LOG_UPDATE_DELAY);
 
 	return 0;
 }
 
-static void cros_usbpd_logger_remove(struct platform_device *pd)
-{
-	struct logger_data *logger = platform_get_drvdata(pd);
-
-	cancel_delayed_work_sync(&logger->log_work);
-	destroy_workqueue(logger->log_workqueue);
-}
-
 static int __maybe_unused cros_usbpd_logger_resume(struct device *dev)
 {
 	struct logger_data *logger = dev_get_drvdata(dev);
@@ -263,7 +260,6 @@ static struct platform_driver cros_usbpd_logger_driver = {
 		.pm = &cros_usbpd_logger_pm_ops,
 	},
 	.probe = cros_usbpd_logger_probe,
-	.remove = cros_usbpd_logger_remove,
 	.id_table = cros_usbpd_logger_id,
 };
 

-- 
2.51.0

