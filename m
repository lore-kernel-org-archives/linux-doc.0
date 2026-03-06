Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758FA428490
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817818; cv=none; b=o+Jqk7kh3gQCwrOx7ZhCCvSw8hvT1yZIdztPBGCgDScZWojKso9luhsJmSQKozM6p9mQAUgr5JD9w6WXWigFOBiDcgBI9qXKipf7ldfOtf91WnNqXesu2rxEfPDZ1mDA9ZjqsTdnttAGMKJPXGOiAWNzAe7S9qwiDdyPSEIvQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817818; c=relaxed/simple;
	bh=6FY6/NpoOq7Rdpg5gYZySEQvwKsaI6/Ar0wZmyeBw3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5QUJIMWC8eOtzKX5CniMoUVu6v5tqTe3z/k/pT/A7GxKnmMimrx133uxYVEEZJqAyZfFgHOsph7eNEn/6lyz/7KH62gySEchtvwVdi8JwKcIFu5jjXhnKwM6ldZttdCWaibThD9d8YAEf4UpBLlPNdBrWjvtVJ64nI4PKzjbF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhYJIfcx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9NjZmTd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhYJIfcx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9NjZmTd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1dWA1343525
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnCHGaTyIrO+/XHi40pHajxkTWJ3etB/P/3gSFJpnBk=; b=DhYJIfcxVOzcWuWg
	RwxVm+VBl2KvsbtLt9VbqP2xsb2bjYPbgNgkRSVffQb7q3emlUC4vBkltMSinphm
	AcXbMxW9eoVeUOlysHCoT9x7yANaajDiupCY/WidBp9iCVAhV1c360d382FwzeDQ
	J7JQzAps7WleZu59ePjHWqoeZ6gid3AgWc09+YyXuaymd3Kzy7hm2l+KTqPsHAVf
	/7yTBjTHwDe4BcsCrUGHmNu9vZxESQrbY6OFsLUoDDFjlfvxaCil5tAoB7MYQ1Zd
	fZGnxzVY1dp8fyRlyiOVHuzefrgtCU+r9IDLYrP5uP2CmUI7gmJZrZX7MlljdWqk
	4JEpkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2uqr4gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4e37a796so5218292985a.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817815; x=1773422615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnCHGaTyIrO+/XHi40pHajxkTWJ3etB/P/3gSFJpnBk=;
        b=j9NjZmTdOwNQPXfDNiMJhuHZhmQZiyjP7Qh/lypiGnDnhQezv9yk6jini784gXqyhE
         tdZ3QXEgi6wXwLeCVdRyiz98OF4M59dERSrktZ0xlmYvtuc0YJsl9W7VoePT0Um4tlH3
         rmNNDa40S0YVsNjaeZb0+qgaeUidsk3fggwnAkX2fgLqahMfKG/sDkhxvDyZVStPJSN1
         Z0H+Sf/XvaY6iop8aM/ZXaUdImAUSwQ1QPY16UyxBbCUSxXLGlGGbYoB7GMs7HoiUli/
         AIp22iM1VpVAJJ45eC0xjASriJgEn3nSObc6f5qafz00zx8tNO8CKUjNOH5vIX2xOaAw
         HjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817815; x=1773422615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnCHGaTyIrO+/XHi40pHajxkTWJ3etB/P/3gSFJpnBk=;
        b=Y0CvRgYRKBSPxaclMOmcsPrLT2/L0B3cPlzWnImXM3fZy1o5dW18vBtM5nkRAwhePb
         7XMPU1T57DaP7b3LKOUqPGbYArxSbcyqOKO6/xFYDNzR3m5NKHaCHF8irOOTNDs2q++5
         e3bKmA9leRAYeZ8sfH0eQBjqYHsvcbHVOtfw57Bexa7nUwqloMi5BcL1Up6zJGiRCUqW
         tALQCC3UPVr5dJGdXrb1oZYfxPrURSd6a3C3P5w+33gEN+8GlAg5S7MZA9DutdQa2te1
         eo/1SS9/F+xhXoluy9IxQqDE7SOmDbTHiIewqpbwC+30lKZXgpPycxAxpMf5pRwHiof4
         w0gw==
X-Forwarded-Encrypted: i=1; AJvYcCWC9qpD1gyglF2Zg/zipU3oMviGq92+gCujHGpelGV+MdA3+ZN9fIwW2k6DV7wsaErM9OAaOms6paU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwJlho/V1VTRAbFjVGV+MIhBLUOjpTVSeAEhg27jjS28o6O9K
	AaC9fIxQ0dsxygfBl193v1KkAL8M+xBppwGPcak2yAn2vmDi9RPphzHM2gWHbmAhDLFv4dSibaq
	G/mbHPEKLO1z5tsi9xxWbfSZZRhP5cNOcKERfORHx1FETe5LyhVxzg5TLs9EA14Y=
X-Gm-Gg: ATEYQzxAkih9OyqOQPgdk0fQNsk+LnA9c1SU+sUO5dIX/3UAWDtCHcz2XbkeGXwmsdI
	8vLWwULa9kj2aOv29y/7ntkIJph4bc+gCBFfdi8V+wKLfcrkP3/VIsZV8BbKzNxSVr2aABTAEN2
	fR/Sr7qWESszwMJ8DU8acYsygJ5KgZQ3B+ZWV63Lhdw8bMe+FK1kWTQ0XTI7Esip3N2jzwngJAl
	e3QgLC2lSBZv/NTWZwuzZ8kjn/rywk901j6D3+glR9wPJKDTrJmd3MwKNHBFh9gVCMtlulxiMGm
	V1FdPR8ZtiXFF+gskwbIyjMqi46y72wD9qzlT9IogrXuTEdIYyY3KA3eenawMRMxPtFbxlkGVzK
	yTw34OyA2PQue0MhsfKmp7Pwo7apt9142WKrTfhlW8Yxsx0GsHim8
X-Received: by 2002:a05:620a:1925:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8cd6d468037mr344777885a.34.1772817814554;
        Fri, 06 Mar 2026 09:23:34 -0800 (PST)
X-Received: by 2002:a05:620a:1925:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8cd6d468037mr344772385a.34.1772817813888;
        Fri, 06 Mar 2026 09:23:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:57 +0100
Subject: [PATCH v3 13/14] reset: convert reset core to using firmware nodes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-13-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15703;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6FY6/NpoOq7Rdpg5gYZySEQvwKsaI6/Ar0wZmyeBw3Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw19/45UfXqlpcldxprhPodcq9u5EhnP2HgEQ
 Nv7cMKFn9+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNfQAKCRAFnS7L/zaE
 ww5hD/95X1Pdm2D5Xd/3RdQPg0LQ5DXT128KonLWkljxQxPVGoSSG+602nZjuUgk4YJuxTwYMmP
 Be6a0i8qqeyVg7Z3EmM52doVPL2drkszQNzte0ydveE3z7S3EmlAIVBKTRml62ZVJyfKbSBBIrj
 y7GgL/1xpNyPgXPEBpoDAi3xOEzuiHqAitqNQZQ4lc9FdquRaBdGgxiLm8rxGRE+HN40PXrRQJw
 8nifk3P6PmWNTUczXBImX3bsXmIyAoYfGESoyOC/BPgTIEkgHIPuRiJBF+4VtebBCWvjwnoeBP9
 9NwDoYySsFbPbOKbmQKFeQ/HFegFvSCuDpsJiQGm//MAA/sKFVx6t8QffkvXSVO861zXHf7XFGy
 Vx3EpC1csSRBZSA6Ak8i9q1Wq+NpaCO2wJwyIPwpDk0amx5TQpnby6dVTigVnpA4uvGep2G4myC
 76VBWyIDC5Em9GRi1BcYlqfhxSG/VS8p0WYWPDaHzl0/8QGC3HOrmuQfWQUzNkc1C5ZWkbXkzsQ
 Qicus+4bLSwOLBv93EJ/3y/sYC3El7DPFDAO8cw36PS03cz90HrBHnPVdr1FiFLL2+2S6Ccmhk2
 j81ZrpaQapaYxhtnuAfgeF7+mhIz3+oYrUPoo21ibzwyjagSsNOaxTIwJERbpPavn0Wtm/Ijk05
 UZSRgdede4TGOhQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfXw+A5Sa0FRfq7
 6GOLPFsJuFVoIm44uPiQHjiBCGjz3UPPd+MDOAZj7aAKCZPe6eR2NiMVzAOICJVVxkg3xlQrmW5
 7N2tN6lt9HWT2AWczLpHCzf4ouaAuy+2RfSztudaLfd+KqTTnkIKA96aaIOJnC6v0jaa1uw0JEc
 VZOOo8PvfcP5f3HnrmB75Gqls9MZk1GbYVIh0Am0LswPE0chkRSxX4V/o+6cewSEezhHriYd3iK
 FyuoWaDhUzmt6tgSfWcS+PZJ/NV6/RdfKiJhvEDmkrxiS9tmVmbDP3C/E3wpSS4ki4+Ban5crqz
 pua9TnXuc6fuyu3634gcH4PlE5HIvAkRlTTGIV7bOEK+ZBOXPhLooqB8xh7ZfBAv6oaiHE5YqdX
 k/SVFIX38WRxKUW2+bzJC86zENnqJfGGLsKilEv0KlxgxiOQq7EAaufPrkDFO/9w0GBQsLMeNk4
 rRYs7eyOVHB0+/ch4JQ==
X-Proofpoint-GUID: ofNZAcd1l_T3oamyL42eBjiu2-nViTCS
X-Proofpoint-ORIG-GUID: ofNZAcd1l_T3oamyL42eBjiu2-nViTCS
X-Authority-Analysis: v=2.4 cv=Q+HfIo2a c=1 sm=1 tr=0 ts=69ab0d97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KnmVVp5zvkuUHY8ZiwgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060164

With everything else now in place, we can convert the remaining parts of
the reset subsystem to becoming fwnode-agnostic - meaning it will work
with all kinds of firmware nodes, not only devicetree.

To that end: extend struct reset_controller_dev with fields taking
information relevant for using firmware nodes (which mirrors what we
already do for OF-nodes) and limit using of_ APIs only to where it's
absolutely necessary (mostly around the of_xlate callback).

For backward compatibility of existing drivers we still support OF-nodes
but firmware nodes become the preferred method.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c             | 166 +++++++++++++++++++++++----------------
 include/linux/reset-controller.h |  14 +++-
 2 files changed, 112 insertions(+), 68 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 0817afe72de75f795d62e02451520726da7c9844..e33a9bc9f94fc6867be6efd32178658d99fc088f 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -81,13 +81,13 @@ struct reset_control_array {
 
 /**
  * struct reset_gpio_lookup - lookup key for ad-hoc created reset-gpio devices
- * @of_args: phandle to the reset controller with all the args like GPIO number
+ * @ref_args: Reference to the reset controller with all the args like GPIO number
  * @swnode: Software node containing the reference to the GPIO provider
  * @list: list entry for the reset_gpio_lookup_list
  * @adev: Auxiliary device representing the reset controller
  */
 struct reset_gpio_lookup {
-	struct of_phandle_args of_args;
+	struct fwnode_reference_args ref_args;
 	struct fwnode_handle *swnode;
 	struct list_head list;
 	struct auxiliary_device adev;
@@ -98,24 +98,24 @@ static const char *rcdev_name(struct reset_controller_dev *rcdev)
 	if (rcdev->dev)
 		return dev_name(rcdev->dev);
 
-	if (rcdev->of_node)
-		return rcdev->of_node->full_name;
+	if (rcdev->fwnode)
+		return fwnode_get_name(rcdev->fwnode);
 
 	return NULL;
 }
 
 /**
- * of_reset_simple_xlate - translate reset_spec to the reset line number
+ * fwnode_reset_simple_xlate - translate reset_spec to the reset line number
  * @rcdev: a pointer to the reset controller device
- * @reset_spec: reset line specifier as found in the device tree
+ * @reset_spec: reset line specifier as found in firmware
  *
- * This static translation function is used by default if of_xlate in
- * :c:type:`reset_controller_dev` is not set. It is useful for all reset
- * controllers with 1:1 mapping, where reset lines can be indexed by number
- * without gaps.
+ * This static translation function is used by default if neither fwnode_xlate
+ * not of_xlate in :c:type:`reset_controller_dev` is not set. It is useful for
+ * all reset controllers with 1:1 mapping, where reset lines can be indexed by
+ * number without gaps.
  */
-static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
-				 const struct of_phandle_args *reset_spec)
+static int fwnode_reset_simple_xlate(struct reset_controller_dev *rcdev,
+				     const struct fwnode_reference_args *reset_spec)
 {
 	if (reset_spec->args[0] >= rcdev->nr_resets)
 		return -EINVAL;
@@ -129,9 +129,23 @@ static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
  */
 int reset_controller_register(struct reset_controller_dev *rcdev)
 {
-	if (!rcdev->of_xlate) {
-		rcdev->of_reset_n_cells = 1;
-		rcdev->of_xlate = of_reset_simple_xlate;
+	if ((rcdev->of_node && rcdev->fwnode) || (rcdev->of_xlate && rcdev->fwnode_xlate))
+		return -EINVAL;
+
+	if (!rcdev->of_node && !rcdev->fwnode) {
+		rcdev->fwnode = dev_fwnode(rcdev->dev);
+		if (!rcdev->fwnode)
+			return -EINVAL;
+	}
+
+	if (rcdev->of_node) {
+		rcdev->fwnode = of_fwnode_handle(rcdev->of_node);
+		rcdev->fwnode_reset_n_cells = rcdev->of_reset_n_cells;
+	}
+
+	if (rcdev->fwnode && !rcdev->fwnode_xlate) {
+		rcdev->fwnode_reset_n_cells = 1;
+		rcdev->fwnode_xlate = fwnode_reset_simple_xlate;
 	}
 
 	INIT_LIST_HEAD(&rcdev->reset_control_head);
@@ -931,7 +945,7 @@ static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
 	adev->id = id;
 	adev->name = "gpio";
 	adev->dev.parent = parent;
-	adev->dev.platform_data = &rgpio_dev->of_args;
+	adev->dev.platform_data = &rgpio_dev->ref_args;
 	adev->dev.release = reset_gpio_aux_device_release;
 	device_set_node(&adev->dev, rgpio_dev->swnode);
 
@@ -951,18 +965,18 @@ static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,
 	return 0;
 }
 
-static void reset_gpio_add_devlink(struct device_node *np,
+static void reset_gpio_add_devlink(struct fwnode_handle *fwnode,
 				   struct reset_gpio_lookup *rgpio_dev)
 {
 	struct device *consumer;
 
 	/*
-	 * We must use get_dev_from_fwnode() and not of_find_device_by_node()
+	 * We must use get_dev_from_fwnode() and not ref_find_device_by_node()
 	 * because the latter only considers the platform bus while we want to
 	 * get consumers of any kind that can be associated with firmware
 	 * nodes: auxiliary, soundwire, etc.
 	 */
-	consumer = get_dev_from_fwnode(of_fwnode_handle(np));
+	consumer = get_dev_from_fwnode(fwnode);
 	if (consumer) {
 		if (!device_link_add(consumer, &rgpio_dev->adev.dev,
 				     DL_FLAG_AUTOREMOVE_CONSUMER))
@@ -982,15 +996,23 @@ static void reset_gpio_add_devlink(struct device_node *np,
 	 */
 }
 
+/* TODO: move it out into drivers/base/ */
+static bool fwnode_reference_args_equal(const struct fwnode_reference_args *left,
+					const struct fwnode_reference_args *right)
+{
+	return left->fwnode == right->fwnode && left->nargs == right->nargs &&
+	       !memcmp(left->args, right->args, sizeof(left->args[0]) * left->nargs);
+}
+
 /*
  * @np: OF-node associated with the consumer
- * @args: phandle to the GPIO provider with all the args like GPIO number
+ * @args: Reference to the GPIO provider with all the args like GPIO number
  */
-static int __reset_add_reset_gpio_device(struct device_node *np,
-					 const struct of_phandle_args *args)
+static int __reset_add_reset_gpio_device(struct fwnode_handle *fwnode,
+					 const struct fwnode_reference_args *args)
 {
 	struct property_entry properties[3] = { };
-	unsigned int offset, of_flags, lflags;
+	unsigned int offset, flags, lflags;
 	struct reset_gpio_lookup *rgpio_dev;
 	struct device *parent;
 	int ret, prop = 0;
@@ -1001,7 +1023,7 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 	 * args[1]: GPIO flags
 	 * TODO: Handle other cases.
 	 */
-	if (args->args_count != 2)
+	if (args->nargs != 2)
 		return -ENOENT;
 
 	/*
@@ -1012,7 +1034,7 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 	lockdep_assert_not_held(&reset_list_mutex);
 
 	offset = args->args[0];
-	of_flags = args->args[1];
+	flags = args->args[1];
 
 	/*
 	 * Later we map GPIO flags between OF and Linux, however not all
@@ -1022,33 +1044,31 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 	 * FIXME: Find a better way of translating OF flags to GPIO lookup
 	 * flags.
 	 */
-	if (of_flags > GPIO_ACTIVE_LOW) {
+	if (flags > GPIO_ACTIVE_LOW) {
 		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
-		       of_flags, offset);
+		       flags, offset);
 		return -EINVAL;
 	}
 
 	struct gpio_device *gdev __free(gpio_device_put) =
-		gpio_device_find_by_fwnode(of_fwnode_handle(args->np));
+			gpio_device_find_by_fwnode(args->fwnode);
 	if (!gdev)
 		return -EPROBE_DEFER;
 
 	guard(mutex)(&reset_gpio_lookup_mutex);
 
 	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
-		if (args->np == rgpio_dev->of_args.np) {
-			if (of_phandle_args_equal(args, &rgpio_dev->of_args)) {
-				/*
-				 * Already on the list, create the device link
-				 * and stop here.
-				 */
-				reset_gpio_add_devlink(np, rgpio_dev);
-				return 0;
-			}
+		if (fwnode_reference_args_equal(args, &rgpio_dev->ref_args)) {
+			/*
+			 * Already on the list, create the device link
+			 * and stop here.
+			 */
+			reset_gpio_add_devlink(fwnode, rgpio_dev);
+			return 0;
 		}
 	}
 
-	lflags = GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
+	lflags = GPIO_PERSISTENT | (flags & GPIO_ACTIVE_LOW);
 	parent = gpio_device_to_device(gdev);
 	properties[prop++] = PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
 	properties[prop++] = PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode, offset, lflags);
@@ -1058,43 +1078,43 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 	if (!rgpio_dev)
 		return -ENOMEM;
 
-	rgpio_dev->of_args = *args;
+	rgpio_dev->ref_args = *args;
 	/*
-	 * We keep the device_node reference, but of_args.np is put at the end
-	 * of __fwnode_reset_control_get(), so get it one more time.
+	 * We keep the fwnode_handle reference, but ref_args.fwnode is put at
+	 * the end of __fwnode_reset_control_get(), so get it one more time.
 	 * Hold reference as long as rgpio_dev memory is valid.
 	 */
-	of_node_get(rgpio_dev->of_args.np);
+	fwnode_handle_get(rgpio_dev->ref_args.fwnode);
 
 	rgpio_dev->swnode = fwnode_create_software_node(properties, NULL);
 	if (IS_ERR(rgpio_dev->swnode)) {
 		ret = PTR_ERR(rgpio_dev->swnode);
-		goto err_put_of_node;
+		goto err_put_fwnode;
 	}
 
 	ret = reset_create_gpio_aux_device(rgpio_dev, parent);
 	if (ret)
 		goto err_del_swnode;
 
-	reset_gpio_add_devlink(np, rgpio_dev);
+	reset_gpio_add_devlink(fwnode, rgpio_dev);
 	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
 
 	return 0;
 
 err_del_swnode:
 	fwnode_remove_software_node(rgpio_dev->swnode);
-err_put_of_node:
-	of_node_put(rgpio_dev->of_args.np);
+err_put_fwnode:
+	fwnode_handle_put(rgpio_dev->ref_args.fwnode);
 	kfree(rgpio_dev);
 
 	return ret;
 }
 
-static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_args *args,
-						       bool gpio_fallback)
+static struct reset_controller_dev *
+__reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
 {
+	struct fwnode_reference_args *rc_args;
 	struct reset_controller_dev *rcdev;
-	struct of_phandle_args *rc_args;
 
 	lockdep_assert_held(&reset_list_mutex);
 
@@ -1103,10 +1123,10 @@ static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_a
 		    device_is_compatible(rcdev->dev, "reset-gpio")) {
 			rc_args = dev_get_platdata(rcdev->dev);
 
-			if (of_phandle_args_equal(args, rc_args))
+			if (fwnode_reference_args_equal(args, rc_args))
 				return rcdev;
 		} else {
-			if (args->np == rcdev->of_node)
+			if (args->fwnode == rcdev->fwnode)
 				return rcdev;
 		}
 	}
@@ -1120,27 +1140,26 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 {
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	bool gpio_fallback = false;
-	struct device_node *node = to_of_node(fwnode);
 	struct reset_control *rstc = ERR_PTR(-EINVAL);
 	struct reset_controller_dev *rcdev;
-	struct of_phandle_args args;
-	int rstc_id;
+	struct fwnode_reference_args args;
+	struct of_phandle_args of_args;
+	int rstc_id = -EINVAL;
 	int ret;
 
 	if (!fwnode)
 		return ERR_PTR(-EINVAL);
 
 	if (id) {
-		index = of_property_match_string(node,
-						 "reset-names", id);
+		index = fwnode_property_match_string(fwnode, "reset-names", id);
 		if (index == -EILSEQ)
 			return ERR_PTR(index);
 		if (index < 0)
 			return optional ? NULL : ERR_PTR(-ENOENT);
 	}
 
-	ret = of_parse_phandle_with_args(node, "resets", "#reset-cells",
-					 index, &args);
+	ret = fwnode_property_get_reference_args(fwnode, "resets", "#reset-cells",
+						 0, index, &args);
 	if (ret == -EINVAL)
 		return ERR_PTR(ret);
 	if (ret) {
@@ -1151,16 +1170,16 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 		 * There can be only one reset-gpio for regular devices, so
 		 * don't bother with the "reset-gpios" phandle index.
 		 */
-		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
-						 0, &args);
+		ret = fwnode_property_get_reference_args(fwnode, "reset-gpios",
+							 "#gpio-cells", 0, 0, &args);
 		if (ret)
 			return optional ? NULL : ERR_PTR(ret);
 
 		gpio_fallback = true;
 
-		ret = __reset_add_reset_gpio_device(node, &args);
+		ret = __reset_add_reset_gpio_device(fwnode, &args);
 		if (ret) {
-			of_node_put(args.np);
+			fwnode_handle_put(args.fwnode);
 			return ERR_PTR(ret);
 		}
 	}
@@ -1173,15 +1192,30 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 		goto out_put;
 	}
 
-	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
+	if (WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
 		rstc = ERR_PTR(-EINVAL);
 		goto out_put;
 	}
 
-	rstc_id = rcdev->of_xlate(rcdev, &args);
+	if (rcdev->of_xlate && is_of_node(fwnode)) {
+		ret = of_parse_phandle_with_args(to_of_node(fwnode),
+					 gpio_fallback ? "reset-gpios" : "resets",
+					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
+					 gpio_fallback ? 0 : index,
+					 &of_args);
+		if (ret) {
+			rstc = ERR_PTR(ret);
+			goto out_put;
+		}
+
+		rstc_id = rcdev->of_xlate(rcdev, &of_args);
+		of_node_put(of_args.np);
+	} else if (rcdev->fwnode_xlate) {
+		rstc_id = rcdev->fwnode_xlate(rcdev, &args);
+	}
 	if (rstc_id < 0) {
 		rstc = ERR_PTR(rstc_id);
-		goto out_put;
+			goto out_put;
 	}
 
 	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
@@ -1190,7 +1224,7 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
 
 out_put:
-	of_node_put(args.np);
+	fwnode_handle_put(args.fwnode);
 
 	return rstc;
 }
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 185d2a9bd7cd381ddc51c0f1643c4e3cb196015e..52a5a4e81f1844075210339bf7ffa46ec5ca6edf 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -5,6 +5,8 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 
+struct fwnode_handle;
+struct fwnode_reference_args;
 struct reset_controller_dev;
 
 /**
@@ -38,8 +40,12 @@ struct of_phandle_args;
  * @of_node: corresponding device tree node as phandle target
  * @of_reset_n_cells: number of cells in reset line specifiers
  * @of_xlate: translation function to translate from specifier as found in the
- *            device tree to id as given to the reset control ops, defaults
- *            to :c:func:`of_reset_simple_xlate`.
+ *            device tree to id as given to the reset control ops
+ * @fwnode: firmware node associated with this device
+ * @fwnode_reset_n_cells: number of cells in reset line specifiers
+ * @fwnode_xlate: translation function to translate from firmware specifier to
+ *                id as given to the reset control ops, defaults to
+ *                :c:func:`fwnode_reset_simple_xlate`
  * @nr_resets: number of reset controls in this reset controller device
  * @lock: protects the reset control list from concurrent access
  */
@@ -53,6 +59,10 @@ struct reset_controller_dev {
 	int of_reset_n_cells;
 	int (*of_xlate)(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec);
+	struct fwnode_handle *fwnode;
+	int fwnode_reset_n_cells;
+	int (*fwnode_xlate)(struct reset_controller_dev *rcdev,
+			    const struct fwnode_reference_args *reset_spec);
 	unsigned int nr_resets;
 	struct mutex lock;
 };

-- 
2.47.3

