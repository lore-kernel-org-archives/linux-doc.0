Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430536CDE7
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817798; cv=none; b=gCiLJGpdhBqrv1s3F0Q7EyfJIVyfQ83RMG8FypsRDr/w9WUq1S3KClDhnoPep95mPyNjHz+70geEV+HWKxEaY4JrL93zCOoijTrDD8Et7J5l8R/xYb5hbqFvSikaXgzDTesb8LRuADhKzVaxy/hNKgXYcqTpLBj5VkUyAsDXr+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817798; c=relaxed/simple;
	bh=JZWuny8/TcvSZjzaVdqaESeV6oNV6YTL1+iT2y0pExo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZC/JVExly6MWjdDgepdlwr0yEQrf3bdlUUpukuf+8tptyRGoeIrV3WoaGE5D26hgwFMp+/bOl+9DNav621LTJw5RwlHTRtqJkI4T/rkUxQAropFFjhRZXFTdBnbCgufgzRtNKRtoS8CAWJja//PVZIqEzV2Yp+faaHe8ZwKnG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zps6wFoa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vfm1AI6g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zps6wFoa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vfm1AI6g"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1p451898321
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3rlwUodHa1xBLQFp92Dedtm+Zhls9xlJ8VVyipx7aA=; b=Zps6wFoawyBN9+Y8
	eJbXqIFiwJkGTe2NPepBopSoIK8oVN9m9cQJyzzb8X+f0a7x2QYBrbVtVIx/hp+7
	Y5RChy8/ClJIt3q42jgsFUCkkTtZsm3AOEmAx9OoLWHwDJtAfN2Cw39JRK+WbR0t
	R37+R19Z4DYiY/GdFgJGkXNYnMNVIIOUl+zM3pscDdn2AV8gj//3YP7R+FZT5Tgq
	i+yvsiUVupWDcFlO5W6I1dHYQ+sPtCrHkq92KPKsYctxxfjQxCsHZK0wcCi89Cga
	Z7qOLMKSIFd59Wo8A0dKFvYTgHsCbxvkNQ6z/E8Z56BwLHmPulyID2e4rZK8r5LF
	zPf61w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14h5de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so6488285785a.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817796; x=1773422596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3rlwUodHa1xBLQFp92Dedtm+Zhls9xlJ8VVyipx7aA=;
        b=Vfm1AI6gyfe+ZSVskaxgb93ojl8hyL0J/Pgqfe3Uec18jWbZs8LuZQHxpcGHAlV0vv
         sGlVBDvQNvR9+RpuBA2Kq5VFHZnebqs+bVzflGW7/SE1uSPtvZIPF5nXsZmVq4fCH1To
         mrt9dgF+h0l7TRNeteI718W6OetgjqwnuMheU4ldpyNHRIKSvHYM0enW0wJfyckxhHTY
         7B7UCs4swYilYgmL1SI7mAtw37nqASOCYTRxCNCq/VFSgbJDTzDO5NgozVvMqMZF43uE
         S/8Q0rv6GHjmJthF0S3GUM7yL4zb87rS7Ez3c8+ng4fVy8umFzlHdqlrc0nhtjgVUQYf
         Uqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817796; x=1773422596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3rlwUodHa1xBLQFp92Dedtm+Zhls9xlJ8VVyipx7aA=;
        b=lUrfiWm0IL9iS7gt7zFTgA+shMBQ2AQzTW/u3LEGf+OAOJzgRhY9gRfT0ySqESNHHj
         SkDEVwXMEPDG9hkV/aXex2yzVFqRH4iwaOIFfX3lkFE4Ppk/POCV1KfUm0s1qRFXGi5j
         SQ9flVC/DwHgv9DqAXGgSerGSj6vDvWRG7zyo5wotnK2/okVbXNYCDcK9mKbVoGXgeAm
         GlTouXEKqCQPpq5FbS9h7P+WBW6Tf7qVD9eTh5VGkBl/1p0bJTgdDbmNFrA3umxdoiO+
         OmK3EYpy3igKMBzNZI6OAp+iqpNImmxq98o4uvOTpGq3GlsKxihnlscTZ9VspbZkwrKJ
         BHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU06QfB9k/yJi4lRZ42N8wMfz8bymxJCNRc4GrhCvF+jBuFGT2iBICdSeEVFZFed+ZxX+79quzjaVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTSF4sI46h1Z5bI0xPRg4hqv2Is+vrGyMr/mPyPAhz5XGi5aC
	wmXB8jcG2fRPlpSqdNh9iOzNrT/UNu7wYTAXHeq9gc/G2ZILrtv+EEyznCzqnrnpzl7VYjp+IT4
	AjTvSsqKdFm92UnKyJG2WDbFfPQtKVpEbAnOXS67xiVkUcHz7CSp7YDqrZHfwxpqh4l8fVJc=
X-Gm-Gg: ATEYQzxlDi1stUrGUWhN+ycCHFA7dQikoUm4rpTfbKbiEt2tI8c0DALAfuBwBvDR9U7
	BgSvIB0q5eGwRy8Pv2G5CV/ee88o2uOTFpUx8bX4hUV+aMRt5ZRW2W7JJFIIOmTmeZDgnFGlEdw
	CWmpWzfvVsx7/fRDziJ0b1/d58bx9es/IurMv5G+BHsx1DpKAQaMxS6dx/w+ABEnBokYCS7ieLL
	zMoIwQzwloI3MSqTzfsO1GyYUYOuwaa0gWv9kQWczlXVL9mHVK5lx2J82/tX4mkbk/trYXaqq1y
	Tl8gtyO7rOw1+mKJjm2yBwf+kBfPPsCdF5fsT6970u8EyYbAJdNpcLGf4xqe08t9nNMK6yR5asg
	N5zX/9jxooBiWWKeURWv1Epu8AhOMtcWO1ZueIlCqci3WsQKrxbR5
X-Received: by 2002:a05:620a:4108:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd6340948fmr779455685a.2.1772817795577;
        Fri, 06 Mar 2026 09:23:15 -0800 (PST)
X-Received: by 2002:a05:620a:4108:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd6340948fmr779451685a.2.1772817795106;
        Fri, 06 Mar 2026 09:23:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:46 +0100
Subject: [PATCH v3 02/14] reset: gpio: add a devlink between reset-gpio and
 its consumer
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-2-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5824;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JZWuny8/TcvSZjzaVdqaESeV6oNV6YTL1+iT2y0pExo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw1ylgyDtzyxnSBJ24a/2UESI44Vwgd9VFqsN
 tz+8PXs1DKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNcgAKCRAFnS7L/zaE
 wxyrD/99l7U7KDDr9wuTxIwPv9ff1I3RQKIiY6Vp8F0GiURx96KPkJWYoTeLAespzrgy6+fB0pV
 mkHfKW/O4MrU4c4dU+qQV84X9Het4FF94PRM0t5800yEqNOY5n0O7JX/qtmhwrZ1CS8L3bYPjeP
 fe/yCoZ6oG0SB1zYP7NU4+kVDHK3XRg8xEFgBer+Z9ql2T3iu5oFtYyxVCaoHTQ8cr/G3y/aXPF
 6OJ3xhGMzMDMf76T98vdnxexmLbx6RNjg7KFSQLHtg6bIzIjxMOpCzpGYQbAkBgqsrfIS9flZfW
 abzRi6BuwMokF4suOtAZ0y6NgHyQ2hnj5KQXgwKmdeWvpQDCO2xydvforQPGaF+GX/iIwWydlah
 9E0U8Gl3bkUl1aHUWmxOlM+2nCuRo8GxNZ76d5AjUMHj4QTiCv7qyubtTuQ05k/qcIM9BBZEAAu
 M+td4muLTfGW5nBwML+AKlLllDQr3EKP2LYKceuOn1o4xXWMMBhJ1ojj8oAcgH0lPfm+xnhi/qO
 0wqbx824cFtg2pLfZh1xQohZQQoRbMNGfKFgL6iyKn/KqH2gdvIuXhNk3VrbZi21/1v1ekayei7
 oBvZVq0nCzSRKSN76K/RHxRsoGFSuCjhxsVwSVGJcs+bA7t0NukXwMibrDABqWKn6kGmi96RubQ
 IG6vzetDZ0LEyeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX1VUjzXa95EdU
 rRZmu6zT0FxPE/BVIw+75pBsBf8FRmDIbLaegqFcU9bi69nbaGoiYvLwsC/WI/xiwcyCNdBzfy/
 6iMUKinO3NIi5Nj39y/ox3gddRd08mkD+OL5iiCt/+G+sbkFMR3NWMp/RYEQ9LuPkt8H6/ad4aF
 FVohxDi34W+WUtuv+cmSWnXc/nc91LOaoasdEYBhuJnBbXifSXcwRjCFP3nSC25dcby6tVOBTa0
 jXK4slsvMMKs1dD/fA4EbDN6PBoKzQ+wn4KQHyi/uxZY8nabS8k6Z2gzCIMwvNLu83sverjCwjY
 UdnQGjfaLXV1r9H6wPUClExj2p/ovIZlww+2tkxxfR7eAV4f481PMtn/h+265oImf7Dgi3mGv3n
 h7JpcWpxNpYGGJ8KTpEROrUy+AkvK65mN3sp9WLqZepDrVnLkmlvnMmK8BnA2PeCSsWDJryFFzn
 LsZw1wlW/50l4fAnD+g==
X-Proofpoint-GUID: dsxAqtrUlhE6Wvn3Hejn1JreuAVhZJdo
X-Proofpoint-ORIG-GUID: dsxAqtrUlhE6Wvn3Hejn1JreuAVhZJdo
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69ab0d84 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gl4R_IGdbvU1KyCt79YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

The device that requests the reset control managed by the reset-gpio
device is effectively its consumer but the devlink is only established
between it and the GPIO controller exposing the reset pin. Add a devlink
between the consumer of the reset control and its supplier. This will
allow us to simplify the GPIOLIB code managing shared GPIOs when
handling the corner case of reset-gpio and gpiolib-shared interacting.
While at it and since we need to store the address of the auxiliary
device: don't allocate memory for the device separately but fold it into
struct reset_gpio_lookup instead.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c | 79 ++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 24 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index fceec45c8afc1e74fe46311bdc023ff257e8d770..3845e77a8d32bf615c9d430847b497af0ba374ad 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -77,11 +77,13 @@ struct reset_control_array {
  * @of_args: phandle to the reset controller with all the args like GPIO number
  * @swnode: Software node containing the reference to the GPIO provider
  * @list: list entry for the reset_gpio_lookup_list
+ * @adev: Auxiliary device representing the reset controller
  */
 struct reset_gpio_lookup {
 	struct of_phandle_args of_args;
 	struct fwnode_handle *swnode;
 	struct list_head list;
+	struct auxiliary_device adev;
 };
 
 static const char *rcdev_name(struct reset_controller_dev *rcdev)
@@ -824,49 +826,72 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 
 static void reset_gpio_aux_device_release(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
-	kfree(adev);
 }
 
-static int reset_add_gpio_aux_device(struct device *parent,
-				     struct fwnode_handle *swnode,
-				     int id, void *pdata)
+static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
+					struct device *parent, int id)
 {
-	struct auxiliary_device *adev;
+	struct auxiliary_device *adev = &rgpio_dev->adev;
 	int ret;
 
-	adev = kzalloc_obj(*adev);
-	if (!adev)
-		return -ENOMEM;
-
 	adev->id = id;
 	adev->name = "gpio";
 	adev->dev.parent = parent;
-	adev->dev.platform_data = pdata;
+	adev->dev.platform_data = &rgpio_dev->of_args;
 	adev->dev.release = reset_gpio_aux_device_release;
-	device_set_node(&adev->dev, swnode);
+	device_set_node(&adev->dev, rgpio_dev->swnode);
 
 	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
+	if (ret)
 		return ret;
-	}
 
 	ret = __auxiliary_device_add(adev, "reset");
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		kfree(adev);
 		return ret;
 	}
 
-	return ret;
+	return 0;
+}
+
+static void reset_gpio_add_devlink(struct device_node *np,
+				   struct reset_gpio_lookup *rgpio_dev)
+{
+	struct device *consumer;
+
+	/*
+	 * We must use get_dev_from_fwnode() and not of_find_device_by_node()
+	 * because the latter only considers the platform bus while we want to
+	 * get consumers of any kind that can be associated with firmware
+	 * nodes: auxiliary, soundwire, etc.
+	 */
+	consumer = get_dev_from_fwnode(of_fwnode_handle(np));
+	if (consumer) {
+		if (!device_link_add(consumer, &rgpio_dev->adev.dev,
+				     DL_FLAG_AUTOREMOVE_CONSUMER))
+			pr_warn("Failed to create a device link between reset-gpio and its consumer");
+
+		put_device(consumer);
+	}
+	/*
+	 * else { }
+	 *
+	 * TODO: If ever there's a case where we need to support shared
+	 * reset-gpios retrieved from a device node for which there's no
+	 * device present yet, this is where we'd set up a notifier waiting
+	 * for the device to appear in the system. This would be a lot of code
+	 * that would go unused for now so let's cross that bridge when and if
+	 * we get there.
+	 */
 }
 
 /*
- * @args:	phandle to the GPIO provider with all the args like GPIO number
+ * @np: OF-node associated with the consumer
+ * @args: phandle to the GPIO provider with all the args like GPIO number
  */
-static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
+static int __reset_add_reset_gpio_device(struct device_node *np,
+					 const struct of_phandle_args *args)
 {
 	struct property_entry properties[3] = { };
 	unsigned int offset, of_flags, lflags;
@@ -916,8 +941,14 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 
 	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
 		if (args->np == rgpio_dev->of_args.np) {
-			if (of_phandle_args_equal(args, &rgpio_dev->of_args))
-				return 0; /* Already on the list, done */
+			if (of_phandle_args_equal(args, &rgpio_dev->of_args)) {
+				/*
+				 * Already on the list, create the device link
+				 * and stop here.
+				 */
+				reset_gpio_add_devlink(np, rgpio_dev);
+				return 0;
+			}
 		}
 	}
 
@@ -951,11 +982,11 @@ static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
 		goto err_put_of_node;
 	}
 
-	ret = reset_add_gpio_aux_device(parent, rgpio_dev->swnode, id,
-					&rgpio_dev->of_args);
+	ret = reset_create_gpio_aux_device(rgpio_dev, parent, id);
 	if (ret)
 		goto err_del_swnode;
 
+	reset_gpio_add_devlink(np, rgpio_dev);
 	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
 
 	return 0;
@@ -1035,7 +1066,7 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 
 		gpio_fallback = true;
 
-		ret = __reset_add_reset_gpio_device(&args);
+		ret = __reset_add_reset_gpio_device(node, &args);
 		if (ret) {
 			rstc = ERR_PTR(ret);
 			goto out_put;

-- 
2.47.3

