Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CAF426D11
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817814; cv=none; b=c6ihscOURZJy6UWi7svIMJOnwqjQd8avnFsIOMrCszT2c460I+84ktj5Q9BZYSzJYXguyvjpUI64uM9l1f3jsVa1l8vetSQi6vyVd9adhK3UswKEoblHofwTXtYbt5Aghguou8prt36JpKZZl2ShHrEEmkPXUAV6NbkLMGvvANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817814; c=relaxed/simple;
	bh=R1f/gn/CCqQNQe1p8nz4Iaf4f8ssq3xNMEkgqrIOH7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3EuOsvFuLpcRmK3XYoHr1eLBjoAy6l+JbrwUutpS29iPoArtIjzd4ZbwTpncLtpcGz1QsCLyoWR5yQRauI2vrJePvAAOu3+sb/TWWJjAFHSc5vO2gDiCg1dIH1Xr0TBpKvVeWLLTAVWUsp15iJcc7WrZHyG9Vt2+f4dntrcI8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdkUDiwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dExWOlYr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdkUDiwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dExWOlYr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H2R5p742790
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxmVpfU4ghgx7p0NFFaaSzcbw/Vegvb2ZtWvuV7tfgQ=; b=XdkUDiwU1kGRMBSv
	SEHM6pHR2LYW+iZVJiGfDf0r8oiHsLca3cVrgqtjmyclz7KLO86HOzq9s9IhyUCp
	58LvTI9C8ame/t5R059emASZlkLNI3iz5DnZWKvk1IWo+rJwtSjxQS4jIfiFELnm
	Hw/TaQI4IOhnbUU8Lj6bb5Apb9y7EL2mCXyTccolfx7zpR3A/6z1I4SxcZE9KOiW
	524ezU9xczqGVL9pnhW0itjMI9f6/rdWTuD2UQCmbX8XN6ioU9GkB87034+r8e7i
	a6rRiAM8fZJe+MSGtwtZ5nYAgSbPiItBxTl7Ye3pMnEjxrWFYn9CMD+cGcjCrq8G
	Y3CV5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdtqbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4e37a796so5218266585a.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817812; x=1773422612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxmVpfU4ghgx7p0NFFaaSzcbw/Vegvb2ZtWvuV7tfgQ=;
        b=dExWOlYr/xb+SGbmlWUbf0b6vdw3J4eSFZP6++pkI8jh7CY3uEC4rTUU3LQezDcIB0
         OFyW2RrUWuh0CYgY29nVa7HqIRLDLwvZFPoM/1tbHia2rzP2LupyhZDAKpKUrYpOC2JI
         67Arfd4FZ3jk3afkrCttPaS0S+t3kEeZWriSX4C8Qk2FVdKFtANtA9qm44ZlojUUvIHq
         rdgMUxvfgi2p/3sYOxWLOkNUOqcF92zcFH42tV3O1aGGgjghhrTsSzIRXJDGHtZARvDo
         30OOUdHnky54xeCKbbmWzVpBOPtoCjQ1VBl9XHnd79GcqFJ42SAM2ZTtkzraPo6YNliv
         ht4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817812; x=1773422612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IxmVpfU4ghgx7p0NFFaaSzcbw/Vegvb2ZtWvuV7tfgQ=;
        b=UCnrDny7SQXzJGN316bM4V7iYDd0JSvgK5890RlLaEmBhZpDfFbUoNHIT7YyBXLQLy
         UHfnGPbCLZeuA5faaUlP5COM+hbsnbrE/dmrweXdey5pfkvvuxEDZXJwYnaSZQ1+ewIo
         K4fN9EQuk4l6xSBm3+UyfdU48KjceD2O2MWLIbbHFuZK3O1fXIUUeMl4K46RMPYd/HBl
         17auaPbCulFilwrFFR4QoHJyP4WJixOJ1Yw/IOhwvHL/TzzIYuWt/7on+TWOZSBlpGRZ
         6gVUp1ydYyRT3L2leDM/F5boOQ46ONggSRgCW93Nmb25D0fgTHtFqx3E3D7nm6sshbhT
         +3eg==
X-Forwarded-Encrypted: i=1; AJvYcCVeaiDWWmdj/vKj/yVwq1R3LnYTAOhVpy+wueORD7C3jPg7VnBObd0DqCXtrKFWY0wptVJPlSuXtz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3vcm29mzGLxWphsJglaG0GK/GiOrfoE+8kQSTZVktTd0cOYuo
	E4gQg8D1AYKonWuruLyQTyW6shRewsXearLJno4T6NPHcfmEZmPaeaLxU1T2rH/T5SMF7ykKOcH
	lYzvBSX9GRqAKEY9uQyZTud3wi14pkbLcX1GjX6W1jo8vF69ktZcYf19HYfs7ZvU=
X-Gm-Gg: ATEYQzyOM3i//kIknY4GLWP3QWdBIMWD6N3pQfWd8JaatBW4vy3Dq692heBARP/3aHU
	fzrsgzgIVStUJJEBBt1/umgAAv45qmOMeWRFTatH7fuyKzlt8nd1txB5XQFe1j4c0sLypUKcll/
	21aR/0iZtPcFb9/508vrdeZxP+zJ0KP6dkYrqZcgR+K1xv0RF/NqxRrvR5m9pp4bumV6FXflgzG
	IJuqEbodoIkhslZOd/j61kZHh3G+F9Bi7IiQzAMkfHqEFwSLX+uHyIng6jtSxEP0HIAaQeJxuSe
	4USp0K6+6etl7ugSkK7PDOZYYhZHXdHQTu3SbpBMiRU3jC3DcMtPCBc9oyWJpcK4qV4uarKqmCd
	AyKvcvPjSzh6ihix8r5ET+ABgSnXLkAN0pvVmXyOawIwsqJkqyQMF
X-Received: by 2002:a05:620a:4688:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cd6d4d63b1mr356714885a.52.1772817811485;
        Fri, 06 Mar 2026 09:23:31 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cd6d4d63b1mr356710085a.52.1772817810984;
        Fri, 06 Mar 2026 09:23:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:55 +0100
Subject: [PATCH v3 11/14] reset: convert of_reset_control_get_count() to
 using firmware nodes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-11-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2924;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1f/gn/CCqQNQe1p8nz4Iaf4f8ssq3xNMEkgqrIOH7g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw17lVTX4EKuRXHHBiaq6cA/KuA6+/Qm/yyj1
 R1DSIlxVLaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNewAKCRAFnS7L/zaE
 w7XZD/42P+FpdYFpJfThvXqK/68bEYjomYfC1GNnVhBwbqUEB71+6fKnWpIlFGM8auYK0004n5u
 qVOO8a4NkhM3gT4unWDrUMUhPCbwTZ/ZFSshDGxhLHj1WX4YBlDNIqD9EvU09C+2Yx9/yDu6/Ji
 hcIQp+0Y9RXAZItT2sT8Diajtfu2s9Vp86sN58nK/01Pfh4vIEQiedLVEb9ixiFb0kGCYtu6iQ5
 Pdu8uKFmKzPNW+mpDopJayKi5tgX+35N3OU5WyHwcezZbSjbm7xk4kyBtAXA0fpY8yCcBVZbcDN
 /8l6c6NXuIB+ck9eCeRJHlEyooDRMmQbmkuug827+6eFMTpCDbg5wkIxQr/rr84iHb1gBXI0uI5
 3eeXlNd94x8ByVxjCn0h2MGHrryHP1uWXAVc7HrN9oblB8gxdWZvN4pcCqqLy3JcsK2mLnnFzPT
 BA1BKcDz/D5I9UgprBUhPAwhqV+40QF/YaOudB5w/EI9wxalHwLvhXI5j+JJEytAVxHjBf5UOwz
 v0nS+mX+xUzkWiqVGmqOAZAAu/XoHgJEm9ho6VlEES8uqJ3MeJb7fpbOA5GZ1qQQXhQn5cumZd7
 ytADcAJIWcvRDCwPScv9Y5aAlmTVN1FaUT/aHDFP4hmcdzqladuOoglvUCg58CiNrRcfQcRZSsz
 RCt+yl7JrXptqXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JlQ2-OrVp5v7704sgxhirVwiHO6vXW9G
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69ab0d94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=xt4VrH2ZgDK96Vd3V1EA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX1gqnGh5dmu4d
 dDoC5NUlGFUUtiEwWFEX58y5+NfpWCGt/mLvs+THIaDq7G66bY/PCrjCK4AGm3llYy6ttwGfv8u
 TG3JVAE8fsFh6I7I2qGD+7SvrFHGlQkvDp8IKyei5U5zGI69Je6pT7hkjhyXHKEwRIqU305QZ3M
 JrKZ63WUbADObKcoke9FDUEKQlN2lBFpbx/dwNrMIhM/9b9ardyMYCl2XGvSlUuyxNje+m2g/ZE
 W3W7XUA1XQSNRFWStYd7HObfu62mf2CrhSQBfDLTZksr1MF5f86vqfV9G89wPbNIRjFpbF47IWa
 DXts8l9B8QsmO82CgxboB9krmhqj0B/lQNkvzJt/FkLik0TsjyHQjFpuf7Y5NLQVAfo8j+Nqe+k
 pd2HEK7lYb8jNTI4Dy/qCabAwdJuVKsW81vLAm32bCFRKB7LoY0A7EvthMtCHeS99OSWhYDI2KI
 sbCdnGVdLs6BMIkfFWg==
X-Proofpoint-GUID: JlQ2-OrVp5v7704sgxhirVwiHO6vXW9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

Start the conversion of reset core to using firmware nodes by reworking
of_reset_control_get_count(). Unfortunately there is no fwnode-based
alternative to of_count_phandle_with_args() so we have to hand-code it.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 34b11a68f28cd32e7b0ac852503193b0d9514915..a00a08b3ca9e90853659a4a94607947fddcfcff4 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
@@ -20,6 +21,7 @@
 #include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -1430,21 +1432,35 @@ EXPORT_SYMBOL_GPL(__device_reset);
  */
 
 /**
- * of_reset_control_get_count - Count number of resets available with a device
+ * fwnode_reset_control_get_count - Count number of resets available with a device
  *
- * @node: device node that contains 'resets'.
+ * @fwnode: firmware node that contains 'resets'.
  *
  * Returns positive reset count on success, or error number on failure and
  * on count being zero.
  */
-static int of_reset_control_get_count(struct device_node *node)
+static int fwnode_reset_control_get_count(struct fwnode_handle *fwnode)
 {
-	int count;
+	struct fwnode_reference_args args;
+	int count = 0, ret;
 
-	if (!node)
+	if (!fwnode)
 		return -EINVAL;
 
-	count = of_count_phandle_with_args(node, "resets", "#reset-cells");
+	for (;;) {
+		ret = fwnode_property_get_reference_args(fwnode, "resets", "#reset-cells",
+							 0, count, &args);
+		if (ret) {
+			if (ret == -ENOENT)
+				break;
+
+			return ret;
+		}
+
+		fwnode_handle_put(args.fwnode);
+		count++;
+	}
+
 	if (count == 0)
 		count = -ENOENT;
 
@@ -1468,7 +1484,7 @@ of_reset_control_array_get(struct device_node *np, enum reset_control_flags flag
 	struct reset_control *rstc;
 	int num, i;
 
-	num = of_reset_control_get_count(np);
+	num = fwnode_reset_control_get_count(of_fwnode_handle(np));
 	if (num < 0)
 		return optional ? NULL : ERR_PTR(num);
 
@@ -1542,8 +1558,10 @@ EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
  */
 int reset_control_get_count(struct device *dev)
 {
-	if (dev->of_node)
-		return of_reset_control_get_count(dev->of_node);
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+
+	if (fwnode)
+		return fwnode_reset_control_get_count(fwnode);
 
 	return -ENOENT;
 }

-- 
2.47.3

