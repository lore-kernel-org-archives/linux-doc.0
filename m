Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A532D0D1
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954305; cv=none; b=Oh0WIBsKgUqjSSBHpp5SJ6EtwYRTsKTzxkPj3PZwV/tdM1he3/G/kUAa+wSmYkJBq9e9jxS0cpiF0OlSDaGRsNuVaMouDOPiuxWCXh+zqqsEYMN40InvXSdpHrp8VDfo9j32a9q/EH/UJ4VzGxF3lqyW7DxNIhyAfoCg6kLSA24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954305; c=relaxed/simple;
	bh=pJMvf4gE2407W+gdv4k3Yff8Slpho2ovd+794M5ZMsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohqsswftpPUe7NhmvySvJI5X2NORcw1LM/L6HSVKXs4WR7sOm3KYzua1qNZ6gG8sle2kwnA1cY7vluFA65vC5og6boailD0QFDD+Bq3DBt5wcfddyTqDw5S+SB9FopkqUMmyv9LaePzhZaqibchetxZWIQQdB8W33LTwCfODG+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvAUBtua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8j0pshZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvAUBtua";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8j0pshZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4XNDw2316087
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ob5zAEDq9ei
	IuOeJH/1kBFZzN1Bl+vkD4rqBtnGwSaE=; b=lvAUBtuakOsB/1RYpCYNFp7RKeg
	3AEwA0HA4CvzRAVT2AfkOVwOP3lnJ5bhL4iFatXtBjMOH8f+5ipgaVdteUJdlIgj
	xmbQ7EBHCmWFmSoXLG8ZrbphzJ20cSoqmogwQWgTSwWnzMYg+FluVRQmgweBoncs
	v56QZuu4oGCneQEyzo0p+pj1jUr8zsXPo1HRtaSgJnDYH8h1yt0jAYEqmeIebOmi
	SmduESu4vVcyuk7n/QEBurQwbdkgqHRRuby+tDpEFL3Q0QB5cDopJGXveN8o/9fc
	FqGYPFZBFzng837BYsJdAixi3PVL33lPZUVlD9IhA4ourVukaimQygecjAg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkgcse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f47c0e60so69609255ad.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954290; x=1766559090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob5zAEDq9eiIuOeJH/1kBFZzN1Bl+vkD4rqBtnGwSaE=;
        b=e8j0pshZHDbU6FBHVU0sidcUn9+xlVGe3ldirHRe7fWY57LzrHuqkJHcikfZeV03G7
         9kPy0x60YJPY6oIL1NSLDt4V0Aal32KXw1ADyfR7rYMTWS+4vJ8xG6dj2UTO6yMMRfLx
         9X2xrgjR/i/+ZDSnT3BdUG0snbxYTETVHLyacS+vs8yp4Dhcc6AsB6mRkyW+tsmFXnmZ
         YZLpdKkfLQ7kKA+Ojvk16Lj8+sg1DWrJPH8CYkct6dtRTyHq+HJqdQekVKxO5t9u7O4k
         F8pfhzvMYz8lb3ZHTu2rYc4x7owgtZb1AeQeKu+Af57v8m1KxTExxdO3DK1UdERoVDLX
         wBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954290; x=1766559090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ob5zAEDq9eiIuOeJH/1kBFZzN1Bl+vkD4rqBtnGwSaE=;
        b=lFtS/QmHjoMyc//cl0mpzZ6Arx7aJroXM7PKEZC+ckBIgREJixFyzhiIB918IwnEQm
         SVriFdL5L7S1lvbB8fYEaW6pmXsEKzvagXDzk7JnLPS9zkMmr6vB8MaZ3fo0iI09/Ay0
         AblwfW8EyHFSVViWno8rrJdumi8DSf6A/pGQms9Sb9QnOclBvpQrm7fBr9F8wuCqgIZ2
         Fteqr0gi//9n/oAnkFprEdgkm8yKsWIuXyt6ZqQR7nOh32VBE0yZdWVO4R5GItMCx7iV
         ASxLqm3d26oRBg7afSgnrpv8ziQ1wr1ITwb+AXnjVCpNe6CLfe3iqGV1BeEnCLTYbH8Z
         df7g==
X-Forwarded-Encrypted: i=1; AJvYcCWTybYbjf/IAYSbkobEROuB2YTLlNRJrz6AHOSeGQ+24EzAn6EI0kpCmTaVL0a3l4o1hQgOk7IRnxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUarbJ0pe8U7dLkKM7J05APE151083ZSbSe5nLXmUHortoyao/
	/ktgx2B+tqC7gcRragpqh/PBVcIZy/aw9Ivfb9dr2k39zKPNQPTF614gFJZkowg11rtMOT5faMD
	YeUnPlYoPv9n0HMvd9UBwf4P7BUMhwITmygs9E1M1fp4aQX7E9UpdavzIL+Sfnpk7ukVaKomatg
	==
X-Gm-Gg: AY/fxX5ThsUWEHEmy1xgMR/lRwmBvu5AcNRQzVgoV6St/fdb+YUZ/dsdHbDMmJJ5l+y
	mcvv+8YPkp7RVvhXicuF5omG1RHGDspSQp5bzqXoQm6TrNJ0uBAtsB0ecbDWwk1hCcStRS0kZba
	xMp20uB9ySlAGxc9zxyru9ILej6EgAynn5JZfET31gzlmR4wHfzepqQReOaDILjYEUSkloRNWw3
	xu7xEe8zNYCtcfJoSo/vFx336I3V9zuZtLD0oLcYvAQDcKoQ0yXF883QbKmzahbzzePClH8iTMq
	F3GcgWFZhB++yiRlUnPYP+s8l+Q6CH8oVTtnudqu3odjC9//dTR1uaNBO4Q2ErPJEBgb1vVvuDt
	kIK3leNJsU85iCieS1iNXhcU/hfoR+FC1vSg4rnia6FORGP+Rcbkk/RdebGTUDWJMKOPHmupWxp
	8p
X-Received: by 2002:a17:903:41c4:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a0e1a4fcd5mr111457545ad.54.1765954290245;
        Tue, 16 Dec 2025 22:51:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+jLipged6UvMrD3Na8ulynn8bBpRtRrg63DRf/JcDs+2XzdYdiq9BaBHF86AMCoyglgGi1Q==
X-Received: by 2002:a17:903:41c4:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a0e1a4fcd5mr111457315ad.54.1765954289763;
        Tue, 16 Dec 2025 22:51:29 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:29 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 4/5] rpmsg: Handle dev_set_name() failures properly
Date: Wed, 17 Dec 2025 14:51:11 +0800
Message-ID: <20251217065112.18392-5-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MzMhlAmfX5UMxWolc2r7J3gCn1jJOH-c
X-Proofpoint-ORIG-GUID: MzMhlAmfX5UMxWolc2r7J3gCn1jJOH-c
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=694252f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=R6Is9h_wUuj108RMq48A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX2eNURXWIYp11
 hfYbHyEYKm5nX+vyq5b6LGOnTp00gcvHq3l7fCh2UDaxuL3v/7GfaQtpg71a6OISd9T3Pt/XwZG
 WjRTC6ASxSHBdb6JoAF3i8rqt+WrWQ2MP6q2iRajvBubw7G1ZwREMMBUTB7qCEvXTq1HUK4tLry
 O7rGd1WKsi2SvsPG69LsdpFYATwzQBMvwxvDlppw6xz+cpvpIOcOQGhJ++r2RCRiIbSKs80rhC/
 ATd+YEAHR9KgW6sLU9sWHWTJT9wgFcDMahVO9G0AYiEuwqGtTRcUsQVKWb2jAZb3Mh1aVyiiuMc
 /3CTrXsCmR6x3ZClMBOc5VPzat2yt0Rj9pay4lmC6WvH6+UUpy9BaWH1a1Ok36BTxN5bk21yLCd
 xvrMFqDoG5ExXHZIbH03IqKIPwgZiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

The dev_set_name() function can fail and return an error code. Ignoring
these failures leads to undefined behavior as the device lacks a proper
name, which may cause subsequent operations like device_register() or
sysfs interactions to crash or behave unpredictably.

Add error checking across all rpmsg drivers to ensure proper error
propagation and resource cleanup.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 8 +++++++-
 drivers/rpmsg/qcom_smd.c        | 8 +++++++-
 drivers/rpmsg/rpmsg_char.c      | 5 ++++-
 drivers/rpmsg/rpmsg_core.c      | 8 ++++++--
 drivers/rpmsg/rpmsg_ctrl.c      | 5 ++++-
 5 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 7a982c60a8dd..843bf04eecb3 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -239,7 +239,13 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	dev->parent = parent;
 	dev->of_node = node;
 	dev->release = qcom_glink_smem_release;
-	dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
+	ret = dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
+	if (ret) {
+		pr_err("failed to set device name\n");
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = device_register(dev);
 	if (ret) {
 		pr_err("failed to register glink edge\n");
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 2793096aba45..61f580ee04ec 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1494,7 +1494,13 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 	edge->dev.release = qcom_smd_edge_release;
 	edge->dev.of_node = node;
 	edge->dev.groups = qcom_smd_edge_groups;
-	dev_set_name(&edge->dev, "%s:%pOFn", dev_name(parent), node);
+	ret = dev_set_name(&edge->dev, "%s:%pOFn", dev_name(parent), node);
+	if (ret) {
+		pr_err("failed to set device name\n");
+		put_device(&edge->dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = device_register(&edge->dev);
 	if (ret) {
 		pr_err("failed to register smd edge\n");
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 073d56858b88..89d232d80df2 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -450,7 +450,10 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
 	if (ret < 0)
 		goto free_minor_ida;
 	dev->id = ret;
-	dev_set_name(dev, "rpmsg%d", ret);
+
+	ret = dev_set_name(dev, "rpmsg%d", ret);
+	if (ret)
+		goto free_ept_ida;
 
 	ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
 	if (ret)
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index a5dd09f19b14..49737d69b44c 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -553,8 +553,12 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
 	if (driver_override)
 		strscpy_pad(rpdev->id.name, driver_override, RPMSG_NAME_SIZE);
 
-	dev_set_name(dev, "%s.%s.%d.%d", dev_name(dev->parent),
-		     rpdev->id.name, rpdev->src, rpdev->dst);
+	ret = dev_set_name(dev, "%s.%s.%d.%d", dev_name(dev->parent),
+			   rpdev->id.name, rpdev->src, rpdev->dst);
+	if (ret) {
+		pr_err("failed to set device name\n");
+		return ret;
+	}
 
 	dev->bus = &rpmsg_bus;
 
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 28f57945ccd9..3e2cfd16df6a 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -165,7 +165,10 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
 	if (ret < 0)
 		goto free_minor_ida;
 	dev->id = ret;
-	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+
+	ret = dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+	if (ret)
+		goto free_ctrl_ida;
 
 	ret = cdev_device_add(&ctrldev->cdev, &ctrldev->dev);
 	if (ret)
-- 
2.43.0

