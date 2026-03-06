Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76577401484
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817800; cv=none; b=VnaZbJRlClKFUS9NjwqtMoFnxr2Lr3MUqHJ27yQZyTpQCFGXsDGLVX4XD3EyX4hp4rO3kkYuJvvmXlo/EhSpofY2r1fCZcxu5Ehe+agTqaT3NlEHJnFE5kW7ImUdtgmDNI2NJ105a8Bw/+4NceNU8dvxPowz5AvOZjGfpNghiMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817800; c=relaxed/simple;
	bh=GjWmZ7UsKa/vuwzXv3KQhNd5hOTDSEtPzIm/qhoa4Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSsUUr2Ju5jA5RGb+qUFVAvxMDedh1JvjQ7NWI2r8lWj8IKmPno4v763qL88RNwMuZwtrRDbyBygaCkxvn/8IOx+UE9SKWDq1lr0xMFfmY4oKw6rN68sAjVApfDTQQzv+/VBidulVTs1aRmT7DLuFmpT9u6gnlS6+rKXrktCjsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHtiq9Qw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRqOgX+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHtiq9Qw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRqOgX+X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1cjV3958062
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sutqqXPyVGTmhwh/v3UBnqNenmMWrkTG9ZhyeCtSTOg=; b=PHtiq9Qw2hkGNCaY
	wVwASITB1/cEhFUqfrdkcZVJzmeTyonxZgbPBee/7khW9l/MZmonJHBZWFDDxTJl
	jxsuFwhpHzMm0aChoqQ2+8/7TKrTPduPFs0q/wBhb1eDK/vX758gSIcS2a9l3QjW
	NsH9FNweJ4cjJyueYIJQ5HjFxOe3CCw3uH0ipZF2YkLUaEj+JpD0T3tdJLP7xWeu
	WC/vYSXPMPxU0n3HiLtYQOJiyvZ1q8maBmbJlpASxWXz5S+EIx00U+nAfVZZgT3d
	mJtz5on5OkSX70AFfHFAvcCcGCZEvCKea+0an+6/anE/y1NEJ8DxtW+ik2PS3/59
	mCFxvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2up04c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3ad1b81aso1730776785a.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817798; x=1773422598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sutqqXPyVGTmhwh/v3UBnqNenmMWrkTG9ZhyeCtSTOg=;
        b=QRqOgX+XPGAHiuv5zLoKrq+S0ib5bNz+925l+7XRz0odXz7qsOSZ4FI3ZMtudgu/z3
         1VdeyxtPpcpBG7Rn23lsQsNa0l38Kd+GTFrZH5l9QBrnCuSSw7DiMwSEOIEAfifyWPMo
         2z89d/l2GCbNSl1db2z1zQS4H7g2f4wVeJEpNnO3lsDcEPwKMCsNursxPwcw/oMbq1SX
         2gyxuPZYzUf6tBtLF0PuYUkti/Dg5kAIxiWD+m4NS9VXgxrGEOaxHLyJOSabQGpiVdWi
         w+GL4wsaUqQcPy+ZJWuEhrMO7fZtmlbSyhrHWRK6DZOehkUtdaFmKRJEv8G7dCw1d6GN
         TKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817798; x=1773422598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sutqqXPyVGTmhwh/v3UBnqNenmMWrkTG9ZhyeCtSTOg=;
        b=GoKXAhrNnPsmzo2pHndrRdAgszmBLgrQ1SbQz9MJ8mOG6zUissIeCuYWBeSAFprmc9
         Qu9a2GX3pL5SVoQWrEWHoIuoJdY0+Fe7UMR2VUQDUlPnjOguXoOftMBNbTD5KxO61GNO
         1WcpgCnv77/hl6WOe/V5CEwcdq9t2UmCe9h24rvOMuWMaBdxKJE2dY4RM/CV674lVc0s
         nmBA72v9Qivry0fWfoTxGTbMYDN9wJf6N0eesXsID1GKX9IVQp3m/JYMqyARl6+QeuDv
         1kHd0EXZ4th7r7EhxEInUH9Gf7IfJ426Fb41TL1DUS7m7chukj+2lbjRiycBfm6iyTJe
         Dm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcKKodwwzUOGA/9LUhubupu5Hw54kT+VCmz0Yb18q1Qbgari1vDGIF0Qf/L/xWG2Wyssf2hMAuvc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YznYug80FDFM2DP2CMqM87mBBNFUtmxSsfuqdppe6/mYeUiPfmz
	6aFFieHcSu6Mt0NyvUzjyjT7dVBnivUqIURi6j9jH20i7C2gPPX0dn+Lq2I8pGZFQNpYrwBFxKk
	d0PJiQgPRxOmJRjWC24ArmzEPwLBe6TDjtQv0j5S44pz6OKk8uF3ynGf6jOIrQ0M=
X-Gm-Gg: ATEYQzyALI5+j6OS9tlmHlAj/898C07pTPVrz5aMhbM3ujv+BRnsbXJc9QFYG29HUfY
	osJTCaLyVHz1jeslqgqRcBKtHgiXVQBnPhXtTMw5BPGbeuhV2LkDl+UFAI+KOOkORjg7c7tYSwu
	kLPNTG7rz9kn8Q5U9r9zTOIqI40tohGhAJzZFs1xFLqZYwm9Q704AoXo/ksIiIFc3ts3oVpL2Bt
	M+ugpFoyxcEWdy4aCeKtSNwlpRh5EbPH4Ru2Vs9RXHgMTyz3JjdzGUC1LkOXbFwuHBRrloE2YN2
	HH679qVlm3DjuceHCe9WoXAR2YE8xSuzriGJ5c2aRPM/5a7SvZnJLxsRnM2uexS6D0EuYqWnwZk
	tDUX5U9jCwnnu57qZj2UyfzkH6iWVPBX3CS4gOrZf+XTZC/3lI2+i
X-Received: by 2002:a05:620a:1a84:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8cd6d42cebfmr378736885a.21.1772817797807;
        Fri, 06 Mar 2026 09:23:17 -0800 (PST)
X-Received: by 2002:a05:620a:1a84:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8cd6d42cebfmr378732885a.21.1772817797338;
        Fri, 06 Mar 2026 09:23:17 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:47 +0100
Subject: [PATCH v3 03/14] reset: gpio: simplify fallback device matching
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-3-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4521;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GjWmZ7UsKa/vuwzXv3KQhNd5hOTDSEtPzIm/qhoa4Tw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw1zYJu/cWjl8704sRUJ+m17bcpVLAtRiuUHV
 ykEsAhLE6eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNcwAKCRAFnS7L/zaE
 ww2BD/9tOKrDXkfbNHwBWkiFRny7BmsERwZ/foSWQaS5YX8Wc8ZPlyRmmOEja3IkqN6/4afYzW1
 T2YpLtFRrRC0uZ1kFZx0hVGvEsEjpQJ9TWCdlguP9s9EX6WdiHsmd6oeTzJDZHTmWmDkvJ/hh5q
 7cpXDFFWnBTAmnHR06fTVIQYOsCrpA71OhdySTUXPBxtkOmcKsGaQCtSS6C769d4UdVtycd+cSF
 z1lkGbes+uVF8IZ7OvfjT+tQEMH6B+mgAyPnRaeF8FGXWbH7AYdX0aDz7dIrQW8/rqlpClnu/S+
 vgHSzugk47MZ4dmI7WS1CTec7v9ewjA/xjT+UUUv1/gtkHleuheWxaZc0zv5kWwyWkC/vxTheoO
 DEckeKADDGajPP91TZMWWmDJnk8nYV906YerfT433wC+Vgrmig18zDA27gWT3Ze3XhhtUT9Flkm
 NtJjN9LvOy6fPVHEFILjSKHbXd73s/Eyg1dSkoMWIFThtzzs+VZJKHXczK1mkk1qJ1z23v9rEDM
 lhuBzZxZVRklT9kmS03E7bfEQdU5rY6kFjekHOBzVw4HL/KYbffLDae9GZ90C7OYQTFLkioYC88
 uYnV8hmEJZbNMd46jPSjEtbQQt4e78X7bGi583rWaGEKrRdIZYkRMAideGswkaN5LOoWC81PNhh
 5kkoBBYVC80ObHg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX97K8BLIg2Ofn
 jsAszkCSNp1iAY1RjdD+DPY/Wdpe5nXt63+btRKi5Pd306BzXmdxshfFlMsHDMAqEvKUPflFUHq
 zHEWSrwL9LyCRHjhx5tqWVMUHb02aJP60vjzi756dl3cmIunzz7MtyS84jRw3sjb4pFQpRkqVQw
 JkhinpgBtEA+SGHJLLfUR5y28DhfFpUYgDjRgCQaQPBOOnv+X/zL/oqqyM+6oPiMcFziI2Yuszt
 4ivUodqialzIRQkrOQ4R5ONT/+EZa3Y0jrGGefF4g+cObvvBSPtrQ0PRn1HGpzgbbUKg2+Ui/wr
 OI5u14F5r2vjT6Cy0qj48GhSf6mK2IQUYuSfLP9/6Jm4h3+Sp414saYGRp/2sZB7Va2nj84tWym
 HKDWjkjyN1A1G03kShe+88R9dK0e0avTcJwUJwSSa4FtQnuQaBBDBKAWWZ+JaK5JJ6Uk8om6OGq
 GplX2RAdQMcabUFhejQ==
X-Authority-Analysis: v=2.4 cv=QfBrf8bv c=1 sm=1 tr=0 ts=69ab0d86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=C-6xm7Ge3zJZVfUZFQkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NVn8XyTU09wYCBYF3W7oO7kstOnAelRB
X-Proofpoint-GUID: NVn8XyTU09wYCBYF3W7oO7kstOnAelRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

The of_args field of struct reset_controller_dev was introduced to allow
the reset-gpio driver to pass the phandle arguments back to reset core.
The thing is: it doesn't even have to do it. The core sets the platform
data of the auxiliary device *AND* has access to it later on during the
lookup. This means the field is unneeded and all can happen entirely in
reset core.

Remove the field from the public header and don't set it in
reset-gpio.c. Retrieve the platform data in reset core when needed
instead.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c             | 15 ++++++---------
 drivers/reset/reset-gpio.c       |  5 -----
 include/linux/reset-controller.h |  4 ----
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 3845e77a8d32bf615c9d430847b497af0ba374ad..954df36a242e804b639027384700b8d988be0e90 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -94,9 +94,6 @@ static const char *rcdev_name(struct reset_controller_dev *rcdev)
 	if (rcdev->of_node)
 		return rcdev->of_node->full_name;
 
-	if (rcdev->of_args)
-		return rcdev->of_args->np->full_name;
-
 	return NULL;
 }
 
@@ -125,9 +122,6 @@ static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
  */
 int reset_controller_register(struct reset_controller_dev *rcdev)
 {
-	if (rcdev->of_node && rcdev->of_args)
-		return -EINVAL;
-
 	if (!rcdev->of_xlate) {
 		rcdev->of_reset_n_cells = 1;
 		rcdev->of_xlate = of_reset_simple_xlate;
@@ -1006,13 +1000,16 @@ static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_a
 						       bool gpio_fallback)
 {
 	struct reset_controller_dev *rcdev;
+	struct of_phandle_args *rc_args;
 
 	lockdep_assert_held(&reset_list_mutex);
 
 	list_for_each_entry(rcdev, &reset_controller_list, list) {
-		if (gpio_fallback) {
-			if (rcdev->of_args && of_phandle_args_equal(args,
-								    rcdev->of_args))
+		if (gpio_fallback && rcdev->dev &&
+		    device_is_compatible(rcdev->dev, "reset-gpio")) {
+			rc_args = dev_get_platdata(rcdev->dev);
+
+			if (of_phandle_args_equal(args, rc_args))
 				return rcdev;
 		} else {
 			if (args->np == rcdev->of_node)
diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index ad5bfe27aaef7de57f9566330253333aa2b1253f..6e1c4f990bc0e54f4a47186340cef03b1a2ee29b 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -56,12 +56,8 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
 			    const struct auxiliary_device_id *id)
 {
 	struct device *dev = &adev->dev;
-	struct of_phandle_args *platdata = dev_get_platdata(dev);
 	struct reset_gpio_priv *priv;
 
-	if (!platdata)
-		return -EINVAL;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -76,7 +72,6 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
 	priv->rc.ops = &reset_gpio_ops;
 	priv->rc.owner = THIS_MODULE;
 	priv->rc.dev = dev;
-	priv->rc.of_args = platdata;
 
 	/* Cells to match GPIO specifier, but it's not really used */
 	priv->rc.of_reset_n_cells = 2;
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 46514cb1b9e0626872fe71357b24d54ff0e81a8b..aa95b460fdf86f10002a465e285cd0119da6eeaf 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -35,9 +35,6 @@ struct of_phandle_args;
  * @reset_control_head: head of internal list of requested reset controls
  * @dev: corresponding driver model device struct
  * @of_node: corresponding device tree node as phandle target
- * @of_args: for reset-gpios controllers: corresponding phandle args with
- *           of_node and GPIO number complementing of_node; either this or
- *           of_node should be present
  * @of_reset_n_cells: number of cells in reset line specifiers
  * @of_xlate: translation function to translate from specifier as found in the
  *            device tree to id as given to the reset control ops, defaults
@@ -51,7 +48,6 @@ struct reset_controller_dev {
 	struct list_head reset_control_head;
 	struct device *dev;
 	struct device_node *of_node;
-	const struct of_phandle_args *of_args;
 	int of_reset_n_cells;
 	int (*of_xlate)(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec);

-- 
2.47.3

