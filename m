Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74C23659F8
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817796; cv=none; b=oG8d8uPdCMKlqpNZyEO2mWgSh59DHOJdHiXE/nGjtFn9Oo6VYIM3tSExN9C7Gci2W5QaRhB0hwHEMRU/tjwJnzzxeH7znI+VIO4FGM09fWy4TxiCh9dEzEWYMblPU4HBju7JUXZ9YUUmxCO+NxpVlCyHvE+tRXgWPVsY9zEeUWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817796; c=relaxed/simple;
	bh=+mk4ppL9XWF9OnQIKVkGYEAnsfhU9QaSc9cxpk6TKTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYYnxV+1KrEV56KuCY0tpaV37IIJi4wodDmk5myCeVTHCTUnshAbu2xW7RdeF5dZi5QqGASGTBQR83vKlwPEFXXSjxstwas31hII9SVo4R+ItM5UhV/WAyECGony3ZbJPZ8epCNaYz8OafbRRZ9zLMZcG4Oyzi7l2XdvNeO1oI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpTHM7dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXCgZxVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpTHM7dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXCgZxVq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1p441898321
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3cNLjTDzr/nLnZnG7PjL1WTHdf61SjrQzPwxu8BAtc=; b=OpTHM7dzpodWzTs/
	yxAFrzmlkm4P9xoroXuQUvIrzvmk1AJcLRAoPAo+WCJxXWuRsWGqlc3bJ8Gtl15a
	bYNQkIvlxSdQefk8kKKWrVF//YCD3y9yuILPjKMSPvsEJ2AAFnW68mhiH9GWdiy2
	5wA4by7nvNdU7O0JJ5oJEnxiq+TSggIgVPhRTaUPCrLuCqK5VbotSP72g6/461hK
	9wz/3BahAJbW2HVdx1EUYjQQDDSndR8Q7n1K2lYyIkRidsCLVaj4KbHWo+Uke6qk
	viIiGGsz/sJSykg+vWDNotEzeQmi4EoX+H4/sKaaFZCg+Lfo9fQ5L9AaKGsINg28
	DFNOLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14h5da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so5086758885a.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817794; x=1773422594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3cNLjTDzr/nLnZnG7PjL1WTHdf61SjrQzPwxu8BAtc=;
        b=TXCgZxVqEjhPpp3hqL114kl4xhfnqouzuOty8wX2cPHmX0IMyJAx/oDVqAKMhBbDHW
         1X4l7ja5RU88MLzRx2kMqFmuwdME4gAQwCs4ndsHG83kY0zY1K7tUlxn4+D9ZHF0MpiG
         q6TOUz7ysqaPZjG5R+eZBZUN6b8nuhF4C6JJVrYigtpspV2+JSOdMAKVIwt72bF8AObY
         i/Sqm7Fon8nXnl6lp7ILHyeAgOWb/hh/2JhUuAjaqnlkfeLxfyjgka3cj9YipLa0bZRu
         qefMMXFNe2odcgGbudjasfV5QNE+oSUFzDu7HOxtnCiubY10nw+dDg5sC1ZsWbiGU1DE
         wtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817794; x=1773422594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q3cNLjTDzr/nLnZnG7PjL1WTHdf61SjrQzPwxu8BAtc=;
        b=reF8kDhzMjWkUnj/WVLmQigiz4lCWZwVEzKhNOrdms6YQLcdGS4lvKk9PaDwGtvaBB
         rswMX3dDp+euuWDZoKJJs4KGQIs9MeEAueoVSaUPjW6DoZ7crQRpm20BLSurXFAiwm4+
         QOmcwp1QT+M+5E7oTNsZ5p2VVp989yF0OVprbU5CG66Pyaboe5GHz2zyIaF4sSqSjuT4
         nFDveFHpePewfoNSCOH7iV0HM1INaIY8P9OcSATpXWPSF2+CceCDY+AA7LjBTVRqAvct
         P81J7EEC1esFNn92rt+69AHdM9+PSRJU7X8K2ylTk0HbUxcW4nWa0pnTUFOkC9saYerj
         Qk+w==
X-Forwarded-Encrypted: i=1; AJvYcCXRWVavxMHGt7UMVVTbFmDCjPSauumFoVi4vtqsUlXJ0t8eoj4UaaRAUvQmcX20lmKiksKVlR3/DB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDbYQe8GyOXMNKaP6okXfphdKtcKK6Rk303X1XPWoGFZBlQiU
	1b8jZ2VTcpQTTXQAvBp+RuT6H1X/+JoR2iieJO2LsNbxRlSTnyHTeBJnQmdRrFk5LZlLkm04tDO
	IHf56hAawqJwCUHY1Y8Wlrizg0SIQ1tPtBKhNoJ+XVvhbSeCLp7DiHaykuyzlt0Y=
X-Gm-Gg: ATEYQzzD6Vw+hgy9FgAGW7mCda3ra2t/nLKINt80MPSunHt++Rq44og/gVF+HUYcQ+t
	Y3Yz5ADtNQCj8yyhNWUjfFQnj9IMo1YKvvuclGUG0/Q2WmZCrLZG7GmSDxVYupQCLhFtpjTirOx
	WCFWT3VtvoQxCoe5VdBZbgaJaMwcIpC9NYSjoj36rYuiTuR+3q1VSS4wO2q8eXQrF/lEcZwkj2O
	oUG8q2XBlu0vTqOPDQHkFahR8h5XWH2QWUHmjbB8ObsghyilSbteGoZcWAH5uljrfKP6QjFYBbu
	7oUeeU1wnHeDA2Dkmaf0mp9Z5MMuMzEzaloWKaimq+P20qIM04eoNvhyqWD5f3ira9uPG1n52wu
	UE2GzguRnIVkQcSizqnL5hL4afJ2iPpT296SndRxcnmhtQy1EzVxU
X-Received: by 2002:a05:620a:1925:b0:8c9:f4ed:c383 with SMTP id af79cd13be357-8cd6d47f328mr338634385a.33.1772817793841;
        Fri, 06 Mar 2026 09:23:13 -0800 (PST)
X-Received: by 2002:a05:620a:1925:b0:8c9:f4ed:c383 with SMTP id af79cd13be357-8cd6d47f328mr338630085a.33.1772817793417;
        Fri, 06 Mar 2026 09:23:13 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:45 +0100
Subject: [PATCH v3 01/14] reset: gpio: remove unneeded OF-node put
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-1-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+mk4ppL9XWF9OnQIKVkGYEAnsfhU9QaSc9cxpk6TKTM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw1xOkQhd+rB6pDIeELX9xfWtZzzDx0q39wy6
 j5KEYFbCTSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNcQAKCRAFnS7L/zaE
 wwx5EACstGVJDVO7uTcvBIPfJlwLjEfER2IA2XhDmvu0hwG8oLhF+1KWbY6Io2rAmfOx/ypJmDe
 nl+VNpEryICAbvye3FZXLDoc2mrbySNHcdRY/uIC6D4VxZXNtlatAQnUGfdCFdpm2WRliBdpZrk
 Np2pUL7rwogp2gc9Mp+YiNN9ELeDmehGg9+QzMP2QCNWNTzr11zXE9bZyrDbLvv4T2Nou02AaUD
 Rg8gIoSibOEJ22Xls24z6DdRIw2c1C4P13rtv7FQbo1RZDRpwUjUQnrA4xxcQ5xLjVGbyg6MSjx
 hhm3rOjtTzPVRrWc6xY9unW+FWEMeaVbn7Oyopcacz/nzUQ39KEmwY+7YlG+2zzK7aZh7SMHjNP
 Nz+vo4UP1NJ+qxZCeuofxMxoLstXdLFCtasgKFp6X317VL9ypo52m87H8JOrzWHBOuoApkchYog
 3HLPbf6DIKOvl6vFj232hFwQX/nkESA5ctYpWXQEal6ymt4Ircy65vgrGWcEEX9sCRcIwR88Lfs
 M8iO9y5QCtiGHr+SpsppTT8GL/IVgO+86ewSbJY+1qNV8vzx6upQcTg8APSWEgZlAAwhHlOov2w
 7rCSV5EsMp2HU4G7FfYJbJZ2/ywphbSSrS/4Z5gskuuFNEdE41O5wk4Wi+TcTZ5UcHx5cQCqW4j
 UPFSVYm6YJi20aA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfXzcBdIOTRRak5
 K429KtiEEz5TwaLV2+eP/KdREIKewBsUzqnISRFdkEaZbo13hFsfPMTdtNHgivuYU6DU90dyRZ2
 At2WH+WpPWDMdhDlSPihNY8ZVfEDgDVIP0/g9qkLpUJo2wdcRzPOWURlY4LrvvqdDsDamj3MbYb
 J1Z928iy0qPaT9DPFQw5cHl4O7ea5VUh0DIhiPHxkrZzCfkVVuoF5Ecc4PEcZew06YLfALsMgK2
 PRvn9zU8ry9pOW6EWGGDaxxCSoH8zyd79iIDx18sBMlIzZcDqhLE88LOZteO17CkmF3mai4WTsH
 oZh5ZRR4wXilV5yVZkuDo1jPQTE8Ammr2X7L2TPcrqZmzQowIthYq1U7LKyEHJ+NDHxxzRKyig1
 fexv94PREheAoMOTkcSRi2kBAPWuOsTW6ESpKB85MExkFGSQK0evMqqIpZ40rKq8cOHwGVAHGre
 L4kJmP662s9yTugS28g==
X-Proofpoint-GUID: c3uGqmfBogYaZU08AqCtgiCOAMfktg5J
X-Proofpoint-ORIG-GUID: c3uGqmfBogYaZU08AqCtgiCOAMfktg5J
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69ab0d82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ygpbbqW4ee5_35vKHe4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

priv->rc.of_node is never set in reset core. Even if it were: tasking
the reset-gpio driver with controlling the reference count of an OF node
set up in reset core is a weird inversion of responsability. But it's
also wrong in that the underlying device never actually gets removed so
the node should not be put at all and especially not at driver detach.
Remove the devres action.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-gpio.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index 0a1610d9e78a3f1db8f523654a548fbba6087106..ad5bfe27aaef7de57f9566330253333aa2b1253f 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -52,18 +52,12 @@ static int reset_gpio_of_xlate(struct reset_controller_dev *rcdev,
 	return reset_spec->args[0];
 }
 
-static void reset_gpio_of_node_put(void *data)
-{
-	of_node_put(data);
-}
-
 static int reset_gpio_probe(struct auxiliary_device *adev,
 			    const struct auxiliary_device_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct of_phandle_args *platdata = dev_get_platdata(dev);
 	struct reset_gpio_priv *priv;
-	int ret;
 
 	if (!platdata)
 		return -EINVAL;
@@ -83,10 +77,6 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
 	priv->rc.owner = THIS_MODULE;
 	priv->rc.dev = dev;
 	priv->rc.of_args = platdata;
-	ret = devm_add_action_or_reset(dev, reset_gpio_of_node_put,
-				       priv->rc.of_node);
-	if (ret)
-		return ret;
 
 	/* Cells to match GPIO specifier, but it's not really used */
 	priv->rc.of_reset_n_cells = 2;

-- 
2.47.3

