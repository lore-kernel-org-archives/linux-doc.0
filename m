Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8453FFAB0
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817807; cv=none; b=M+mhY8ljXoE/YxII8kW34WIwziiWFR87XmLSA8ZIjk8kY4XswdhJ/X36eAQkpNhIfloTuEMN80TRjjsjzrpu6UyZneuT0xlGn8X98d8YklDrjbyZe+5Ywwz+0tZuv6sd+4/CoK4ZyiCYHf9UCgaBhBiSH70EU9xjjC4kw89HPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817807; c=relaxed/simple;
	bh=9YSv7wtpGa141adYQ/rdBQI2YnEMb3TYt0lWc6jH/QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tN7hF4YgKHZEEnz1AQhxfaO+/Z5mOsDQAXQpnsrEUgGRHtJFo1W3S/NADliQ1JUqyrP1CfiODG1H+YEksXnkLfr1dmTPwhfPf+EbCqQ/FPRish+JJJ8tj+61W/JwAcZ6gri2wjKnpXK1Vpgo2DfANuUweKcrVc55Gpxj5De3XB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIhEbY5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk14XUNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIhEbY5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk14XUNa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1aeS3957979
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLydKXB0JWJLsnXJze4R0n4wEWXjTx6InhOjX4qLoAM=; b=JIhEbY5FJPaWntyd
	orT0IalwHnadHGlRyCrlZ5U5lkg5v5xAwmliehiuPtyzO6A9QoNIf7E6AO0pf1I+
	g9qcxw87mbqnB7w4MXFJe0c3lSyfXNXZk0e6LyGPvVX5Pqv3j4akGS0r3GPoic5R
	kY1W3Ye7Bazi3wO8dUcyZToIbwmksemVawlVH9tI0v7KgmAPfYePkbFJe6PRJA7x
	/JZHfm+Z+9QR/7q5CtPWAvHPrnAZm9qGAIaJk7pWZj3Kx4I1nCm+nyT4VBj2+SQe
	gWF62+CWSP3dyb9XWlNJoocZ0ulJywL8R6gGMTVMhQjHnnywxYUucGpxhhhjA3/n
	qdvmHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2up04cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4e37a796so5218216485a.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817805; x=1773422605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLydKXB0JWJLsnXJze4R0n4wEWXjTx6InhOjX4qLoAM=;
        b=Hk14XUNaEA1Ycfv/EquFGAHmYGmHpZSyJDaWQIphFAGszGpO5r4xX1oSYPaVI2E+hc
         kKxFOQPimY9gZnS3xPRxoccrT78ANiu/NyiHPgViPhJwDKzzwVi3UyFwmorD742E7VOM
         UHtSRbj8piEnzxKxUdEk1pG1g5ZkmLW1Ch4qtdy2xlfvDPVBhbUTPLBthaDRvlmiojHc
         wZQOuAlNLZ8LMvoXnr4LDaPNMI173U1yZYGFu3riP9NXQ593Ccls1xdcujkvOUoGQlgF
         9LEP+XEe+zZViFZPsjAC+h4WO1jjiiS1UsROIJChb5yZTjcdWUjqwZXJu71g3PaLaqoM
         lkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817805; x=1773422605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dLydKXB0JWJLsnXJze4R0n4wEWXjTx6InhOjX4qLoAM=;
        b=no/F8+Wy1n590TPhqXoZVMlXsenCkGF+RdZzgu3UDgyBQecbEGQ8ld7dnZMJalq05V
         h3tBHXQG9zYm6AljrABGWkCkLOp/fHcP8NNuVMWErALrouneP2Cki4p/s/qmY27MTg27
         qT+/3jK9FtqV5q+NFii3UuHrhydCwVxKLnRfPtvSJZ3z/PeJ5DunnhzU01CVTSS3sROO
         4B/MBtj1VnEkBThldpiLfs0RTzMNZLyu7l/uEMY7MARKiC8NiCztmBgqkW/uaKhHeJ36
         dkF7jRaGE8+qLMKxM8P3vBi4rayJOP7s+tqAcR9EmtEbk32Gb+EK9/t+KiZhOrJ0t7pc
         FRHA==
X-Forwarded-Encrypted: i=1; AJvYcCUCTsSQ8C105Y9y/N9oSxdr9Oh5g2g2CjPgSBOeC2yR90r2LJyJTBKtEXPJSM4MVsusaMItdJ0MF6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+q6/ei3Jfn/X/L9l92/74xPjqeOWeEgTj4FZrHCAZkVAgC+C
	LiuNKJzXY4TIh6eOcIqlEOrtmQ3NF67qpu1D9LRJ8Gruz+LL+APsiCdX42XA06Bffz/fflDwhmX
	GhyeHXRMPBe2Ek7yyPcn9viDEjuBeK3107/w1+0ghOR/rSleWK0k0q28dA3gpt9bZZI4hTjc=
X-Gm-Gg: ATEYQzyDdU9iycF+1DVbTdKUP3KMA46WhgLfWUVM2+kYU2Tk27DBKaiWGGrMdNC6zRe
	IP8Kl08+MROs/5+1kQ9SEtdu0MaTGRbh2djsZ8UjWrq5Ge2v9gVlxAzbbdpW2bsMK8NUo2IOSaP
	V5F726X79kkdB5cmKFxzEV2AhYCOWfQhG1JF9JSYkmvHaXR5h2MbG1WPiDJT8hVMMBajWQyOY3n
	V8GD65CyYU6f7SMv0/iN9VTnecvHDoXl6sEB2RJExHgXCH7MzW/pPYOrV2LW1Vk87cz8N5bAsGl
	1ypnVE+QLD3axXq+78Y+uhYA8Z/SF/BFlBJYCrHluhaMLXADJaPtf43KBDbqroZTLojCTpGqsPM
	jZNTBhul0XjCta9V99kYv3GEVyEhYZ2kcRIUu9kb+GOINIdBgAO6c
X-Received: by 2002:a05:620a:44c2:b0:828:aff4:3c03 with SMTP id af79cd13be357-8cd6d513470mr359530885a.61.1772817804975;
        Fri, 06 Mar 2026 09:23:24 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:828:aff4:3c03 with SMTP id af79cd13be357-8cd6d513470mr359528285a.61.1772817804522;
        Fri, 06 Mar 2026 09:23:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:51 +0100
Subject: [PATCH v3 07/14] reset: use lock guards in reset core
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-7-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4861;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9YSv7wtpGa141adYQ/rdBQI2YnEMb3TYt0lWc6jH/QU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw14rqT6eFAOAqyry2cBjGPr71g1aWH0Gh+II
 iM6UMIsi6CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNeAAKCRAFnS7L/zaE
 w3rnD/45RHUgmnLY67BY1fHMIKdLWFdF411zg65Gq41Gh1Tw9CP0A9S9lzFK2goDfLlBI9FJnuz
 kZMMLeDw1vuwnkltDaN5HPaSgA6bH0aqYy104S3OayeqkDJ8mE3WG8nZgCxXt0bExVFY4J9tYau
 NNsL0z7gtptjlSEtXEHj1/BXwcsRYwnF1zP8BEVm9pjTgX0uGgW9oQqtJ8k22PE+iztKeGvkRPN
 04xJDberL+QeWB5hJvR0+69XCKqwjdXY0Y7hhD9WOAvGTcpExHPN4UPJHjA9z/EPDlaSNoXhkgZ
 Wp9Fa+4e3kuCItQb6wuxtMZQm4r0RMIoDapd5beHTbW1i/F39G88OktSNjTaip7Rtfq+s3127tL
 nQpBgh3u02zf3NoiKpx/vY2sPj1ApDg1Iq45tTOAUn+mmpvgL+GMvBPc0frtETOUQ1U7wSQVKW1
 Oce5Kins9UJlABCM3s1UZV2UrYDgn189du9It0kzhRhnXDf107DYi6s19/eQ8AjA7H5WP7QiPOp
 xYjbmr0WOhmTmEMRTu7mE5dpDhMdClM13DXfgiUex6CTCGkQmlYJkwqTP1+SJ+aI8dJHaWLxKzM
 pRrFDEwIfF2hamrqZdp1KIFSaINE9se2ql+0EvaRzEjgIXC7I7iso9Vj2+J4Sq7nlq3py6PlB+c
 hyGEeR9a7kiHO9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX4OkLnx5Vg2v9
 YLhp7MS3oEwvOmL2AsqT24ADpouo3FSSt+DmkqyEA6GNEluR8jKApzkqrgaEN9v560qcP9LSrKb
 1dndaEyru2ywp6Sdmx/7x9f5fP4ZmZuTO5KVoowS2LHLK87khve0faPkjYH9jzCXO7OEuV36njV
 +pF81DQAhA2xhgN9LPUaAOtNUZNqxMgDn8/06he2ybBS+kikTpffas9jeMKvzYHpXepojZzhU3u
 c0wVuanDEYFkWPfUrP7/m3ZnZN3ySFkGyWW5uSVNjq2tIwmTDuctaKZxx2p17E1WMliHKNuXwHN
 5WzZAbnh8CSnwjb3HJiHForelt5PD2Bgkk5Tft9QELrg89PeYH0itaJU2izjvI+Cuoh62DCzxLp
 sRCr9zg2wInSCsPX9BCOBSFgzBrJT2Q3d2oeJRoxpK16DE8v+nl0PdfxEHhz7c+txEUIpYnRxN+
 DMThrS5msCGr/f53j5A==
X-Authority-Analysis: v=2.4 cv=QfBrf8bv c=1 sm=1 tr=0 ts=69ab0d8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ABYPN_TNRu3JwaOvJ3UA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: riyzdNfnZSJizS_K24sU1bawl7cjMtjt
X-Proofpoint-GUID: riyzdNfnZSJizS_K24sU1bawl7cjMtjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

Simplify the locking code in reset core by using lock guard from
linux/cleanup.h.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c | 55 ++++++++++++++++++++++++----------------------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 025004989595ac60381804a7705a1eb584b63326..9fef9f972e93fb7388f27ac3bbdf68c884b72ff5 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -129,9 +129,9 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 
 	INIT_LIST_HEAD(&rcdev->reset_control_head);
 
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	list_add(&rcdev->list, &reset_controller_list);
-	mutex_unlock(&reset_list_mutex);
 
 	return 0;
 }
@@ -143,9 +143,9 @@ EXPORT_SYMBOL_GPL(reset_controller_register);
  */
 void reset_controller_unregister(struct reset_controller_dev *rcdev)
 {
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	list_del(&rcdev->list);
-	mutex_unlock(&reset_list_mutex);
 }
 EXPORT_SYMBOL_GPL(reset_controller_unregister);
 
@@ -646,25 +646,20 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_acquire(rstc_to_array(rstc));
 
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
 
-	if (rstc->acquired) {
-		mutex_unlock(&reset_list_mutex);
+	if (rstc->acquired)
 		return 0;
-	}
 
 	list_for_each_entry(rc, &rstc->rcdev->reset_control_head, list) {
 		if (rstc != rc && rstc->id == rc->id) {
-			if (rc->acquired) {
-				mutex_unlock(&reset_list_mutex);
+			if (rc->acquired)
 				return -EBUSY;
-			}
 		}
 	}
 
 	rstc->acquired = true;
 
-	mutex_unlock(&reset_list_mutex);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(reset_control_acquire);
@@ -1064,27 +1059,28 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 
 		ret = __reset_add_reset_gpio_device(node, &args);
 		if (ret) {
-			rstc = ERR_PTR(ret);
-			goto out_put;
+			of_node_put(args.np);
+			return ERR_PTR(ret);
 		}
 	}
 
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	rcdev = __reset_find_rcdev(&args, gpio_fallback);
 	if (!rcdev) {
 		rstc = ERR_PTR(-EPROBE_DEFER);
-		goto out_unlock;
+		goto out_put;
 	}
 
 	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
 		rstc = ERR_PTR(-EINVAL);
-		goto out_unlock;
+		goto out_put;
 	}
 
 	rstc_id = rcdev->of_xlate(rcdev, &args);
 	if (rstc_id < 0) {
 		rstc = ERR_PTR(rstc_id);
-		goto out_unlock;
+		goto out_put;
 	}
 
 	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
@@ -1092,8 +1088,6 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 	/* reset_list_mutex also protects the rcdev's reset_control list */
 	rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
 
-out_unlock:
-	mutex_unlock(&reset_list_mutex);
 out_put:
 	of_node_put(args.np);
 
@@ -1135,10 +1129,11 @@ int __reset_control_bulk_get(struct device *dev, int num_rstcs,
 	return 0;
 
 err:
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	while (i--)
 		__reset_control_put_internal(rstcs[i].rstc);
-	mutex_unlock(&reset_list_mutex);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(__reset_control_bulk_get);
@@ -1147,10 +1142,10 @@ static void reset_control_array_put(struct reset_control_array *resets)
 {
 	int i;
 
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	for (i = 0; i < resets->num_rstcs; i++)
 		__reset_control_put_internal(resets->rstc[i]);
-	mutex_unlock(&reset_list_mutex);
 	kfree(resets);
 }
 
@@ -1168,9 +1163,9 @@ void reset_control_put(struct reset_control *rstc)
 		return;
 	}
 
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	__reset_control_put_internal(rstc);
-	mutex_unlock(&reset_list_mutex);
 }
 EXPORT_SYMBOL_GPL(reset_control_put);
 
@@ -1181,10 +1176,10 @@ EXPORT_SYMBOL_GPL(reset_control_put);
  */
 void reset_control_bulk_put(int num_rstcs, struct reset_control_bulk_data *rstcs)
 {
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	while (num_rstcs--)
 		__reset_control_put_internal(rstcs[num_rstcs].rstc);
-	mutex_unlock(&reset_list_mutex);
 }
 EXPORT_SYMBOL_GPL(reset_control_bulk_put);
 
@@ -1403,10 +1398,10 @@ of_reset_control_array_get(struct device_node *np, enum reset_control_flags flag
 	return &resets->base;
 
 err_rst:
-	mutex_lock(&reset_list_mutex);
+	guard(mutex)(&reset_list_mutex);
+
 	while (--i >= 0)
 		__reset_control_put_internal(resets->rstc[i]);
-	mutex_unlock(&reset_list_mutex);
 
 	kfree(resets);
 

-- 
2.47.3

