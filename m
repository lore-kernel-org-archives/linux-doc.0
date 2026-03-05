Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B83603DD
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747203; cv=none; b=mgFs++YhXSsQiDjKm+N6SKwmwYJ+e3Zblphc9y94n+5JMlYFsG2GrUTFt7GIKa+cSN3t4eD4KUVsxCvByRcyig+M+phMWu2o/ZXU8RZe+iEYfsyuzXkJUo/oJX1yAbJnLlgVABzEy8NXRuoAI9T/BAPLzVSoH/Kz6/WOlyQyP7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747203; c=relaxed/simple;
	bh=KKE0bInc4S8yLhSPSFu/FMkb8dRGE2OpkgkDbv0pcmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgPC1uxt/s3D1ubAVmMLTNc8jVaMKcx/g+8v66vQnBSiXx3SCOtdluffYa3DogLu6wqlWn2YaRc6dGSuHx5MkF2WIumiRC8bclaCyoot4LsHwJg8eYwrNfFf78SbAVbXkftbnnaTiKDC1Yx6KZry8qW7VrZ2lC20u8acKFx7Elk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bvnfZbaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrD65KFv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvnfZbaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrD65KFv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmufZ1810042
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 21:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=; b=bvnfZbaaoSTnNtHJ
	QLu3/Je1kxQ2NwEeQVij7O2D+9K1jEBlNqTe7grsTCNYOGAuAFRocrNLDemddCp+
	Brczs2v4ky3Pzpq7muaILKAVG6pTtyalgnmT3S1DUowfPFQJ4RZhwmtKxUFKPvqa
	QAKPMwPTSE7joWXqNnYLCYZjwGydwEsJBakCtU8ayRP3foURvgKRM0pAAHf9DZBQ
	/E+3mKo+18ProDWtpfS3nFk3garSSlTFjVKU/3Zv6adS42u6pekPj33QYBrQMTMc
	yIYg6wMPkER/m+2G2NCIONv31IYeS4v4V96I6mxI7g2OmpuX4br73S0vmBBDK7WN
	5uQ9ZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp407qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 21:46:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a08e6cd15so241767556d6.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747200; x=1773352000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=;
        b=MrD65KFv0RZ8ObkWmHUWGfgrkXYa4g66GKb2tbIUWAyXYGawwy5+/29FdpR7MJE+ow
         CZ90oaWWRvzYqsMmnP6WTwlDC3Fya83AVzxqgY9+K1taGrd8pyOF8EMZ2CAfblkq5jBi
         xXckyAa59wDQBbZ2EKAnDcjOSmN4i1ZtcwKgPe2+PrVglACJyv3f+twWRGyA58JE3Z39
         vJ8Qm+NUOn94AC+bwvk7BIeIOKL5x/BhvLFEIPz0X+WTtHSc2N9/bjh9w2xfuZqhezJU
         9Ow0DWhK+we727bwA6NPFr27xm1DNizbEx/l7EE3y4LKql9X8yACvxohtctsS1MJsls2
         EUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747200; x=1773352000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgZIxx9eLQfleV3COI3H9DXbp3fax2/aDjoFoxNcevs=;
        b=PGicwc35zeNBShwloV6CnKoJ+OCU7+p7IE/QLKLWD1jfkE8/wcys4dLPSEwpRLqx6e
         lFIkqV87sWqtb+kWNIXLjtNz158byVVQKlOtI1TBCI32sjLqumDQA5SdxUyntC5h4l12
         lcqlnOnOpujOK6gUBy9qmdnVzXA0unDfnFBA5x4zjnldw5C7R7g3P7R/ch7fS1JNkPt4
         y7Bk+cp0BuUYawqetYiPdrr5Y7MJnb2LVxXiLLbxGer9Uci5WHn2JPVKC5N0HlCyDMKF
         gZkqsBxF8PFVLcLsALN7WLywU9/4o+zV8kNxhcS4tsGKrk07nS5SuQegc/cuT6Ijx+pv
         T8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHCFM4Fb+YULvy2lWVF/8qaVAi3OYiK7ZIMJIOQwhJIiqd2cuNrj+/ET8WAk14K8zeHa3eVkyn/3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9BOn1eMEXdQOeJNyyfpIstlzpGWvnqmz6xAV4lGDKA7qHQCJ
	YkT0Fam0sVJOt3BOAWbk4ZHxSybBBm7fd938uPJSyk0Z8uTut4iFId3ONXNqvautXt7O1aQ6Dzm
	ZSRNFdZRknlUExXdkgxvU/G5LICfvaEloYXR12h/3E3AkRi2kiyBB9WZTrXSr/YQ=
X-Gm-Gg: ATEYQzxcjSKUOjf8wQENxPaBCL3SWxA2Kybw4Vt62e4dN5l7c2HldukbqErhwtvq8oY
	h8OkJ8XAndFpick9vma2T1pTjx36rrFTaOzc4mQ3yo2jZCdkCWHRwQUM+6pLtToDwxILuodYGxn
	hvAjb4Lq/k4m41eD6mFNstjjasOY0+4AX6pu2gVXQnIcXGa70JRh/5x+t05x+BIKWUq8pdFZ/S6
	wVim7Qgrk8jjtho/aD/vpNaSHwRlQXqXYUVfH4kM5DRZZLz/J3RkRzFHXcmqC/CMGnPSdlIu5Dc
	WhsZ7j7xFueO8aIhZS/CVooQEuPXmnBwKNB5Q33WwcFeSjGLo2pfKNbOOx9Dp6abMnwl2qmjX+A
	e7yK4oEOy9AL1Dgzc/8dziyjEGkNQ+ON52d1uxvjNAck9
X-Received: by 2002:a05:620a:7016:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cd6d437779mr3216885a.42.1772747200195;
        Thu, 05 Mar 2026 13:46:40 -0800 (PST)
X-Received: by 2002:a05:620a:7016:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cd6d437779mr3212985a.42.1772747199687;
        Thu, 05 Mar 2026 13:46:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:49 +0100
Subject: [PATCH v2 10/10] platform/chrome: cros_usbpd_logger: Simplify with
 devm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-10-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKE0bInc4S8yLhSPSFu/FMkb8dRGE2OpkgkDbv0pcmo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmhjGldKQP5o21zPRfDRDP+tGkXe48E0j3pE
 6xnUGNmWe2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5oQAKCRDBN2bmhouD
 18WOD/4v7VpFEZzjp0sl26+pDvHQyMyN1WAQj3Vsl3sQmb9jimlUvI1QOVLIuvMNOKKBU7VTVZB
 P+9vnO/+LOEYm89+Jr59jeey5RNqtDUlwk2VjinTcgW2sqYZiAMYQEOdehNCahgQCwBHX1eOkQo
 Qxytd1zdJAUblIz7+q5TfeXZ/WbOr0rLPKZUlMIOYqethUDTLCz9kyCCxeE3G2JpWuSxcEMBExd
 /ZWbCbxe85dFWg4JFCMUfH3N4ZaZPsBvasQLh0BRYusq6/7d0KrqAVxbe5vUA66X6MT/7I7pEDG
 /BDpfmkyMAG/349ekOnqQ9sZ9wMNf5b7acHa5NBm6N1/td0khdgFCwWzK9/UZ6YP/8MllnhU5vI
 7cBRVz2rR1eNDnpzD/SsRRKpuFC3BAM2gEuXzTPKSEfhfa4rTnvfHX4LbjDUpB5lPtm3KBJpTmL
 FQsF4DyfRnKSCZ5OfJd90X/TW8sjpSLe3JrRdwFjPjgfWkwfMFa9kU5Ut4FdxGSOz/ToEOulLx5
 atvPr3JE06SlX10hhzkWmxgRBYpg0OJV9ov3R6evSxpSrJ96YndLn/2uttJyh2avyAbNv+T2hQg
 i1Ar+ZOQSn+81ns4U7+yR/vRmmOZSXetZmXHbbY7yQV7i3GRywDQhoTIWPvUqoZMqyYJOxLns+l
 HZeQV+6JaRutfYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: mQLyIZCCk_gfPoUznfhJDeInRVGk_l3q
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69a9f9c0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_A9l7huuyFcfbLupPaEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX1llmEwdhAxBn
 DFBXkT1L6L2UUrrEbqjGXWX9zzxfFKsmEsuf9gox5oF4Rgyeza4VwtHAelYaFxTjzNrxYlcwVoL
 ZkOHBosZoozTzSOOsh64DUOCf+FOWcItg1aWjvszPuIGyhhfz6d0bZA849V8o9ZAZ1zjrMFuA8K
 hmGVri0MifHwrNHRltxuPw9tUWT/p1DNsublWpfFD1HNvPj3wnWdlTsxyFcVkdkEBi2hPzcbUlA
 9hnV5zCSC7Fq3mb8OqgD/C23tJPZ7wo+BBW7scC0iL4tALZLbWdKnBwvUl6dVkiUxhwogtMUXjd
 yCHWuEkjuN7PQQJPYof7ZessrsKbG0+bXe3TC72wMPb73v3Jbu8yDwVVKtd0iEZ85saxdujFp/F
 1Twm6tbBNjW+mqRXxHrmGQbaeT6JSSw6zY3MhIRUS3dT4q+bsURWdRM3WI/wmPGQ+4ZFIfZ8UQt
 +b9Bzh3RzuW6RU63K7Q==
X-Proofpoint-GUID: mQLyIZCCk_gfPoUznfhJDeInRVGk_l3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update logs, thus there is no point to run it for memory
reclaim.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/platform/chrome/cros_usbpd_logger.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 7ce75e2e039e..d343e1ab6f08 100644
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
+	logger->log_workqueue =	devm_alloc_ordered_workqueue(dev, "cros_usbpd_log", 0);
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

