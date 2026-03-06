Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CB426EC4
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817816; cv=none; b=j/3/EQjDDduZ92V6+eIySrSdZ2Sm70qyNtUoix6MdSP81hHoS8uCx7OnMi15vYTHCS2+8/1RZLol9LL86avZGvEWWsEOJL4Fr5lX2U/F3ZZ5A0kIgZv9iaVCG5hMllcgVD29pFhfAzdVdLlUPBqkdk76jYAFa9BT1keMDzW3Lx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817816; c=relaxed/simple;
	bh=4vN/CH/Ew7F6Yrlk1iGPVHH8dyM6IgQN0K5btZhTK6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raCB90RT+RDM2qbM6JDwHOh4UP3eNZnuopQ0TMmvF3gry3olGdahs8lmN8G9tGUgsks+EwAJ/wlUfZPhs4JG6g4tp0rFgdsfuO2dIEXXjf4l2KUPxiMjAGPDe7ioFU75PEf6Be1XkKU5/HKEm0IPOlBH7Q3RporNHvH+Skb/eNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ef986gxe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cfy4CaeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ef986gxe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cfy4CaeZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H2GYZ2734342
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/SFmN0fSeYUX8mnZDbivqXkUlI6+o4LvIFTJM1awn4=; b=Ef986gxea7bWr+XN
	jix1eatl3S5OwAtD0K0Dc8LYfalsSNGVE2/9v+veul750dYOZsdoNW8oF8xRT2Iz
	oP3tCxKqVYorcKcQAM+XEzAPrrQzNmEfgwVfY9HAPSI16amgvRdOiTC9GRm1uX/R
	eECBwLnthNE7MxnXt/m5dyz2IZ7pOCifU3++1gSkS04b5R3UfcsjNWfPdV0z9d0Y
	A3Vl+ZzBtBtEsORZ1HYOXTbBsr7JIfhBPLyrHmIeqKXuw113F+UPg8fkOz2o+0XY
	3kA1+HPAEqtloJIGF7K7maWX41MDcMHzGxsLpXAm+TNqzuXGvExYxS8wzwvj7iwQ
	8CA5OA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2utr46u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so6488401285a.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817813; x=1773422613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/SFmN0fSeYUX8mnZDbivqXkUlI6+o4LvIFTJM1awn4=;
        b=Cfy4CaeZSp1Fbm15xItO7CMRZmFqAZDrP1AR7yE8uSG+Wd9nASozleZGkfYGWDm0RX
         C1dOTakllFC6+DoKS9aidRfiHE9AUCxPVjkAyxnGJXXrkPpuVVJ+Warr0fW42t4X+HJQ
         X9p4R0K3KytMoycvn7fgE1MP675zxS4dLHdvyz2H9WCLD1dWEt9Pnc+G+WlTx2ALWyh1
         T7SXMHhNH5TN9AXMETIvVVchJYmpMlP+wp5C3TWyHySmDrHkcpOYuBTjmk6JO+pPTxAg
         pchZa9tRFux2XF4oqD1Pza0Ja5NW3OCBeh643d9Tembq69fnLlVkvIIHa4KAAG8wQQX2
         7u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817813; x=1773422613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q/SFmN0fSeYUX8mnZDbivqXkUlI6+o4LvIFTJM1awn4=;
        b=eSp6Ve57nJxzgNN2s3WlptBon9qEiB3f//KWGI1QM9hK+5QljklHyCXM6NOkOWQsie
         mGAdF1r0vovpCEy67QiIwfYYMkvTI1NYIqZpGUhjgTHZoRz3FMNjJMLkiNsWWduXMa7L
         9hbgKStaOvJVMZDfYr61Uekc0/4lpIJipoqgxoaoelEPN2leOSvXbR3DCOJE4cgjEkJw
         1n6Ai0vYwiXnmFaWTrNNzDYY1egZ5h9rTgZGcVsGs8HR9DsmrqdleNO/NdFgBxF7odoH
         DrohaDMzRTQyifXf5NuJ6iLVIiGX3B4SDDuvvBauQjgzZ6XAcL0NXQBQrVDObcFDDvRG
         sdkw==
X-Forwarded-Encrypted: i=1; AJvYcCUJcE20t77v3bKkpxa3s4+g7gRBT3cierr191NVEMOCLPWhe3r6eTZkJB0KH5y3TPjC1vIEJm1StNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHT+6+19N1G8TMWb+q0muqbyoab0iHuG2LLUIpwLiMOmvlTsOf
	PXU9FDF50PCL/NIsNBvOChS9LESPp9vAM3KclY/1ehkBmzKUzb6FI2zYkNoffrP6I2EsYBp4Jg1
	aNeimwSiDlWw2nexG5+ET/HyclnkeB93MvyZ3WUVDfsGqm50xPHE9Q+MCkcb3zLU=
X-Gm-Gg: ATEYQzwHPQCMGUaFPvhtrXMlOqW/0oUAUr21nS8ctuAX5tr2reFngm3aTzTJn58Ilm7
	MSftBK7gZz6xOcBVcmy0Or0MX/A9uZJsjE6nW3mWocJ/vG8b9/8KCRFCy/bepYNPDK2I4FKSM1C
	jpCzUmZ7UYnsw2WRF/jPFShhWdMbmLfnin5UPRpOVcCokRqPJ8PJK9NJT16Js0hUoSB/mr9ReDK
	/2CjVhd2HP0w5wEUr41AfIQu4f+DeOmW1UDO6HYD7uoFZwjLH8gXDeo/3vcjE3+1x5Uf9TKCd8e
	N6vrL//5bEqXeF6YhNJveK5+B/g4luY61ul/oewaAjhpYgiOGiFrnbtGoBRwUPAQ2Xf2wOdBSnF
	jKVjF02JrRVhZoAUl5GGMmEySWYnl6MwQfbPvGAUjfklR+2JpI1bJ
X-Received: by 2002:a05:620a:4591:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cd634bc514mr809725285a.26.1772817813022;
        Fri, 06 Mar 2026 09:23:33 -0800 (PST)
X-Received: by 2002:a05:620a:4591:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cd634bc514mr809721385a.26.1772817812406;
        Fri, 06 Mar 2026 09:23:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:56 +0100
Subject: [PATCH v3 12/14] reset: convert the core API to using firmware
 nodes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-12-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11980;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4vN/CH/Ew7F6Yrlk1iGPVHH8dyM6IgQN0K5btZhTK6E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw18EEbJdpceXE4g+P1BycAU6/88ZL1gLQuHu
 9rYGzLN2hWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNfAAKCRAFnS7L/zaE
 w3HUD/4xIc9qZ363fHU7vClyoIa74LIcUe1uB8lTuL4sRGi3l1rty7SBXHygZ1hEFSEEAwmtVfF
 6eP2MCawftRtSf6TS5uatBSfiGCWgf9sCny0v2Ayza5KHU0loIOi8PvArnZZxiIzZtv257CWWxP
 n+0kt4AyqPcBxwd4/TZdwsA6wsVctlDwSanWFcINYfTkV7x13oHdYiVAJbYNBJ01ba7nSd7Nh27
 7naQFexf2lMCA6vzWQWhR3+3iAQH7BLl1cNGoLhVZx6wRRb8UbYN+EM7P73Krfito3J4a2AHrsM
 S3DgKvX4TLEGJUAESVZTVtBVI6eG3OIGmwxE3O22CFIghvOsrEUxWS+3RkOGYd0tL6brpFCGU/y
 B9hyfV2XhVq2eIN3XZbavz/qHRZGBiWMfof+HljRjuybK2ZZ2Bqfyg6jbUB1WxwlcVeaQFaaUtc
 u5Cz7pbYNd1FNiATZcnB9+m5qZYfGo26GOJiROERmOq5xc941VoI/EaTwuM813XRZZKyBXqABAw
 oXx/OHfUOlp3WLihXjlZ/aCxwlbOLkzzDIFRodCdnutxrei5R1bOeF9jrtfpwLjr26LbmRk8YDF
 Nq4xbRZVq5F5IOLbJwvwUrsQKPYfPl+nfMFKLYikJ84x6ykI5dFFnPapd/kl0b1NohfIEsb1sGJ
 0JW2dnDAr+6ky+g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=N8ok1m9B c=1 sm=1 tr=0 ts=69ab0d96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=O0KKrJeO1xfbjrHHZ3QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX4l1fzKGm1q20
 PyI9v2N5QQjcMuPmaIGLZRIvW17bY2UMK1PVTkIwM6vhPfcRQwoTYVes/xaZ02tN/WPJ6q7ah4s
 JzGC3XPomifZF+ndz7szUtbjlffPBmpti14bF77ZlR4vcQVAtAx6XuoTNa+HAp4Ve0gt+tWGGZu
 ah9xWbl49pgfPWx+UvigYQviD/H5QkWQSJGjmRuIf1wlr0PIo9iivk08uiqP3UMyqOh5Lw6Ew3k
 ZoPW/ml89nYb0YQNG04v7B0sUz+UlPeX3wBsdHs49StYifL8gn9D3ECGhgN7t31VRLrLRXIxHS0
 s0GGJ+S5s46OAWIGoDddjaYO0J9mSRXsv+HxPcEpNTDAtoDwMrgo5ZHQ0gIgA9pV2UxcK6qXCvT
 sXItf3Smf3NWYm8Odw/SD2bTCPi3by2qhujoYZ623a4GFMPkqwqNeyS5T/HJKUUf2hLBkBHLiPF
 naeT1/KTpzHusbjjdkw==
X-Proofpoint-GUID: mL0GWiXrEb2edKhOWbszzTjEslpvaavQ
X-Proofpoint-ORIG-GUID: mL0GWiXrEb2edKhOWbszzTjEslpvaavQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060164

In order to simplify the commit converting the internals of reset core
to using firmware nodes, first convert the user-facing API. Modify the
signature of the core consumer functions but leave the specialized
wrappers as is to avoid modifying users for now.

No functional change intended.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/driver-api/reset.rst |  1 -
 drivers/reset/core.c               | 33 ++++++++++++++++-------------
 include/linux/reset.h              | 43 +++++++++++++++++++++++++-------------
 3 files changed, 46 insertions(+), 31 deletions(-)

diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
index f773100daaa415ac2c74b7b0db7a4f6f05d736d8..7a6571849664f08758a975fca3e078cd45967c8d 100644
--- a/Documentation/driver-api/reset.rst
+++ b/Documentation/driver-api/reset.rst
@@ -198,7 +198,6 @@ query the reset line status using reset_control_status().
                reset_control_rearm
                reset_control_put
                of_reset_control_get_count
-               of_reset_control_array_get
                devm_reset_control_array_get
                reset_control_get_count
 
diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index a00a08b3ca9e90853659a4a94607947fddcfcff4..0817afe72de75f795d62e02451520726da7c9844 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1061,7 +1061,7 @@ static int __reset_add_reset_gpio_device(struct device_node *np,
 	rgpio_dev->of_args = *args;
 	/*
 	 * We keep the device_node reference, but of_args.np is put at the end
-	 * of __of_reset_control_get(), so get it one more time.
+	 * of __fwnode_reset_control_get(), so get it one more time.
 	 * Hold reference as long as rgpio_dev memory is valid.
 	 */
 	of_node_get(rgpio_dev->of_args.np);
@@ -1115,18 +1115,19 @@ static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_a
 }
 
 struct reset_control *
-__of_reset_control_get(struct device_node *node, const char *id, int index,
-		       enum reset_control_flags flags)
+__fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int index,
+			   enum reset_control_flags flags)
 {
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	bool gpio_fallback = false;
+	struct device_node *node = to_of_node(fwnode);
 	struct reset_control *rstc = ERR_PTR(-EINVAL);
 	struct reset_controller_dev *rcdev;
 	struct of_phandle_args args;
 	int rstc_id;
 	int ret;
 
-	if (!node)
+	if (!fwnode)
 		return ERR_PTR(-EINVAL);
 
 	if (id) {
@@ -1193,7 +1194,7 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 
 	return rstc;
 }
-EXPORT_SYMBOL_GPL(__of_reset_control_get);
+EXPORT_SYMBOL_GPL(__fwnode_reset_control_get);
 
 struct reset_control *__reset_control_get(struct device *dev, const char *id,
 					  int index, enum reset_control_flags flags)
@@ -1201,12 +1202,13 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
 	bool shared = flags & RESET_CONTROL_FLAGS_BIT_SHARED;
 	bool acquired = flags & RESET_CONTROL_FLAGS_BIT_ACQUIRED;
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 
 	if (WARN_ON(shared && acquired))
 		return ERR_PTR(-EINVAL);
 
-	if (dev->of_node)
-		return __of_reset_control_get(dev->of_node, id, index, flags);
+	if (fwnode)
+		return __fwnode_reset_control_get(fwnode, id, index, flags);
 
 	return optional ? NULL : ERR_PTR(-ENOENT);
 }
@@ -1468,23 +1470,24 @@ static int fwnode_reset_control_get_count(struct fwnode_handle *fwnode)
 }
 
 /**
- * of_reset_control_array_get - Get a list of reset controls using
- *				device node.
+ * fwnode_reset_control_array_get - Get a list of reset controls using
+ *                                  a firmware node.
  *
- * @np: device node for the device that requests the reset controls array
+ * @fwnode: firmware node for the device that requests the reset controls array
  * @flags: whether reset controls are shared, optional, acquired
  *
  * Returns pointer to allocated reset_control on success or error on failure
  */
 struct reset_control *
-of_reset_control_array_get(struct device_node *np, enum reset_control_flags flags)
+fwnode_reset_control_array_get(struct fwnode_handle *fwnode,
+			       enum reset_control_flags flags)
 {
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	struct reset_control_array *resets;
 	struct reset_control *rstc;
 	int num, i;
 
-	num = fwnode_reset_control_get_count(of_fwnode_handle(np));
+	num = fwnode_reset_control_get_count(fwnode);
 	if (num < 0)
 		return optional ? NULL : ERR_PTR(num);
 
@@ -1494,7 +1497,7 @@ of_reset_control_array_get(struct device_node *np, enum reset_control_flags flag
 	resets->num_rstcs = num;
 
 	for (i = 0; i < num; i++) {
-		rstc = __of_reset_control_get(np, NULL, i, flags);
+		rstc = __fwnode_reset_control_get(fwnode, NULL, i, flags);
 		if (IS_ERR(rstc))
 			goto err_rst;
 		resets->rstc[i] = rstc;
@@ -1511,7 +1514,7 @@ of_reset_control_array_get(struct device_node *np, enum reset_control_flags flag
 
 	return rstc;
 }
-EXPORT_SYMBOL_GPL(of_reset_control_array_get);
+EXPORT_SYMBOL_GPL(fwnode_reset_control_array_get);
 
 /**
  * devm_reset_control_array_get - Resource managed reset control array get
@@ -1535,7 +1538,7 @@ devm_reset_control_array_get(struct device *dev, enum reset_control_flags flags)
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	rstc = of_reset_control_array_get(dev->of_node, flags);
+	rstc = fwnode_reset_control_array_get(dev_fwnode(dev), flags);
 	if (IS_ERR_OR_NULL(rstc)) {
 		devres_free(ptr);
 		return rstc;
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 44f9e3415f92c9d7591b898cdb4bf7f05f2b0568..9c391cf0c82298a06a4d84eebd293864ef8c48da 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -5,10 +5,12 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/of.h>
 #include <linux/types.h>
 
 struct device;
 struct device_node;
+struct fwnode_handle;
 struct reset_control;
 
 /**
@@ -84,7 +86,7 @@ int reset_control_bulk_deassert(int num_rstcs, struct reset_control_bulk_data *r
 int reset_control_bulk_acquire(int num_rstcs, struct reset_control_bulk_data *rstcs);
 void reset_control_bulk_release(int num_rstcs, struct reset_control_bulk_data *rstcs);
 
-struct reset_control *__of_reset_control_get(struct device_node *node,
+struct reset_control *__fwnode_reset_control_get(struct fwnode_handle *fwnode,
 				     const char *id, int index, enum reset_control_flags flags);
 struct reset_control *__reset_control_get(struct device *dev, const char *id,
 					  int index, enum reset_control_flags flags);
@@ -103,7 +105,8 @@ int __devm_reset_control_bulk_get(struct device *dev, int num_rstcs,
 
 struct reset_control *devm_reset_control_array_get(struct device *dev,
 						   enum reset_control_flags flags);
-struct reset_control *of_reset_control_array_get(struct device_node *np, enum reset_control_flags);
+struct reset_control *fwnode_reset_control_array_get(struct fwnode_handle *fwnode,
+						     enum reset_control_flags);
 
 int reset_control_get_count(struct device *dev);
 
@@ -152,8 +155,8 @@ static inline int __device_reset(struct device *dev, bool optional)
 	return optional ? 0 : -ENOTSUPP;
 }
 
-static inline struct reset_control *__of_reset_control_get(
-					struct device_node *node,
+static inline struct reset_control *__fwnode_reset_control_get(
+					struct fwnode_handle *fwnode,
 					const char *id, int index, enum reset_control_flags flags)
 {
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
@@ -242,7 +245,7 @@ devm_reset_control_array_get(struct device *dev, enum reset_control_flags flags)
 }
 
 static inline struct reset_control *
-of_reset_control_array_get(struct device_node *np, enum reset_control_flags flags)
+fwnode_reset_control_array_get(struct fwnode_handle *fwnode, enum reset_control_flags flags)
 {
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 
@@ -500,7 +503,8 @@ reset_control_bulk_get_optional_shared(struct device *dev, int num_rstcs,
 static inline struct reset_control *of_reset_control_get_exclusive(
 				struct device_node *node, const char *id)
 {
-	return __of_reset_control_get(node, id, 0, RESET_CONTROL_EXCLUSIVE);
+	return __fwnode_reset_control_get(of_fwnode_handle(node), id, 0,
+					  RESET_CONTROL_EXCLUSIVE);
 }
 
 /**
@@ -520,7 +524,8 @@ static inline struct reset_control *of_reset_control_get_exclusive(
 static inline struct reset_control *of_reset_control_get_optional_exclusive(
 				struct device_node *node, const char *id)
 {
-	return __of_reset_control_get(node, id, 0, RESET_CONTROL_OPTIONAL_EXCLUSIVE);
+	return __fwnode_reset_control_get(of_fwnode_handle(node), id, 0,
+					  RESET_CONTROL_OPTIONAL_EXCLUSIVE);
 }
 
 /**
@@ -545,7 +550,8 @@ static inline struct reset_control *of_reset_control_get_optional_exclusive(
 static inline struct reset_control *of_reset_control_get_shared(
 				struct device_node *node, const char *id)
 {
-	return __of_reset_control_get(node, id, 0, RESET_CONTROL_SHARED);
+	return __fwnode_reset_control_get(of_fwnode_handle(node), id, 0,
+					  RESET_CONTROL_SHARED);
 }
 
 /**
@@ -562,7 +568,8 @@ static inline struct reset_control *of_reset_control_get_shared(
 static inline struct reset_control *of_reset_control_get_exclusive_by_index(
 					struct device_node *node, int index)
 {
-	return __of_reset_control_get(node, NULL, index, RESET_CONTROL_EXCLUSIVE);
+	return __fwnode_reset_control_get(of_fwnode_handle(node), NULL, index,
+					  RESET_CONTROL_EXCLUSIVE);
 }
 
 /**
@@ -590,7 +597,8 @@ static inline struct reset_control *of_reset_control_get_exclusive_by_index(
 static inline struct reset_control *of_reset_control_get_shared_by_index(
 					struct device_node *node, int index)
 {
-	return __of_reset_control_get(node, NULL, index, RESET_CONTROL_SHARED);
+	return __fwnode_reset_control_get(of_fwnode_handle(node), NULL, index,
+					  RESET_CONTROL_SHARED);
 }
 
 /**
@@ -1032,30 +1040,35 @@ devm_reset_control_array_get_optional_shared(struct device *dev)
 static inline struct reset_control *
 of_reset_control_array_get_exclusive(struct device_node *node)
 {
-	return of_reset_control_array_get(node, RESET_CONTROL_EXCLUSIVE);
+	return fwnode_reset_control_array_get(of_fwnode_handle(node),
+					      RESET_CONTROL_EXCLUSIVE);
 }
 
 static inline struct reset_control *
 of_reset_control_array_get_exclusive_released(struct device_node *node)
 {
-	return of_reset_control_array_get(node, RESET_CONTROL_EXCLUSIVE_RELEASED);
+	return fwnode_reset_control_array_get(of_fwnode_handle(node),
+					      RESET_CONTROL_EXCLUSIVE_RELEASED);
 }
 
 static inline struct reset_control *
 of_reset_control_array_get_shared(struct device_node *node)
 {
-	return of_reset_control_array_get(node, RESET_CONTROL_SHARED);
+	return fwnode_reset_control_array_get(of_fwnode_handle(node),
+					      RESET_CONTROL_SHARED);
 }
 
 static inline struct reset_control *
 of_reset_control_array_get_optional_exclusive(struct device_node *node)
 {
-	return of_reset_control_array_get(node, RESET_CONTROL_OPTIONAL_EXCLUSIVE);
+	return fwnode_reset_control_array_get(of_fwnode_handle(node),
+					      RESET_CONTROL_OPTIONAL_EXCLUSIVE);
 }
 
 static inline struct reset_control *
 of_reset_control_array_get_optional_shared(struct device_node *node)
 {
-	return of_reset_control_array_get(node, RESET_CONTROL_OPTIONAL_SHARED);
+	return fwnode_reset_control_array_get(of_fwnode_handle(node),
+					      RESET_CONTROL_OPTIONAL_SHARED);
 }
 #endif

-- 
2.47.3

