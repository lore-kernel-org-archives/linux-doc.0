Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A00490BE1
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 07:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395601; cv=none; b=Qtu0iWv2IXeV2KDL34fwVY3Wsdodpewm2+mU3CswQAzVjUKcOxnZ/vqs0EFdndy/STRPUhVAhPYPsIUMdm0Nd8pPPHT8Cj2NJy6UhEbFtpdtcxcQrkWv7ZPW40/4+4F5Tuspjti0S8f9ydxzFIUCq/aMZznAKr47ZYVYu8+dJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395601; c=relaxed/simple;
	bh=hJjJGa4eBm7XtrMdXHGCS4ZkQZ5TfCxifDEVQsme3NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AklpOpGfv152dvoPVve52F9tt3I/uuzkL9X79jg8dhiSt585UpXlSFYIaI4KHwDMESYUUgpTcxqVpC0G1nB004wplElou7xcJA6HS+KlWXDdszomdLhnZw+SD18B111H77j6AJi0M/HYbrBuE4okI8wcDntn/CRhasK8x0yfZug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmNiMSkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaQSVjAi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmNiMSkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaQSVjAi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jO1w1751539
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 07:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tnpf683EmeZ
	q2xc7PTdD0vDegWDcKYsb++VcsnkPTqo=; b=WmNiMSkg5Mc/B0i1q7tBCLIZQv6
	3GIJZX8h+Hq1Jc3KHvwyxCnEBDUOsG38b1P7rvweKXkYsaxtwOar2R3PKgD99eaz
	1MhoMbb+oijoTJF5BlhS5WcNnHvk/iCgYfKS6q0XgFEZUTFDESKUpOLJQkfm5UjP
	Rx/0dJYLSk2p1PBQbBYhspEpmH7B8G6D8A5snqinSNZQlNNlqsozI7PzPeKZw042
	wUIHdB/WRXYi7eLMxdOle62rqiQ239kbKih7RjbTYFP7oS//31t+2Ls+nLCHmQmq
	a0QMjtinT5Zzj4Ga6Feh6oun/IyqQlJRzHp7CdGuozPwzV+EMc+CWxbUQnQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183dgun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 07:39:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bebff9fcaso46676626d6.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792395591; x=1793000391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnpf683EmeZq2xc7PTdD0vDegWDcKYsb++VcsnkPTqo=;
        b=QaQSVjAivoUnRpueJ7+/y1afEI65t/G/0TxZ+ySHLhnB2eYF+YoasnsAiBT9S5S+te
         eP8X/s1s28sjoLJE/eZQql6J/uxQhybTmMSBgyjRtazG+acABV/YNB0pM5UQ3zPHWqIZ
         l54M9gkXUf5pntGYvY8f+qVgkY0Q3d+l4gxaYOd3VpcicxqRQokvQWMWAHMtWy7icSSj
         acl3Fw9UbwC/tCvCfk8kd2wjaXTw7QmazK01+sg1cJllJv+Y3H01TQtx3SxInYobyktd
         qJR/1OOi9mY6yelIszutVuFM0ajz0E2ikMZnqyHZ8HR2hN5syu+8Quo8JqgLyQ2AQxAN
         bf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395591; x=1793000391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnpf683EmeZq2xc7PTdD0vDegWDcKYsb++VcsnkPTqo=;
        b=O0NxxLl7vIzVKYLD2w0A+Y3f16EBK6p6BngG3OFTtdq+d/K7zERkSkMwVSxhHdrfMx
         Ucgtei43XAte5x2/jIldmkfR2j7G0Ex1rbnBKss+sbP19R2g3Yx8FEKzceohHGawqQRh
         svFTSvl5ezDXXHC7xqTu+7NJBY32fXzAflVdcCppukBlxWyk4hYnX3bF28QFjp9tCs7D
         rGliEsDFfW2Y95oLM6/i52WQohkiWv1htGmLu2oub4OxRvazRJUQ1G+yS/TzvrxO7cWA
         9DKxg7h7/UvVivhmPVzw1UkGzbnCTdVMRuLTYTd9B19ZT4athmMPI+Qgp/QfohAvcPRx
         X0Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxHSysQ7CHaeaDmiTlujpN/Ur8UJHx1xmgjHi+UqMUqjIF0RLD6Kbpm0dDGhTmEu1w5XYlZ6SPojiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSEr2RX4aa9WQIgfnoa0R93iAYXGnLrap7MTvjFObLCs/RFJUR
	ontBdRHZXiYtXjikuERkoM6KTK6qrQKotGIs3ZTUWXwTm0h6RhlOmfel/3Lak/HbieXqg6oP2+x
	k3vzN8ykrDG7a8v548EVruMXTso1xbCP7ywPAxnzr77u/m6XgH7/RmvAxgx+W9Zw=
X-Gm-Gg: AYBFou3V6qFkseV/gZGVTqbPKr+s7VXq3FO+s5U/P+Ojs4f8imYlYfzp3IUn7R6e5ik
	3QeoBoQc06EfIaErRCQ3NYS6MP6Fdiru3s8SLxVZwy5AUrQC1pfkvoIOi/CriapUgkjm3amT2+Y
	yfmqbRZjhmxxhrHcA/xcISj1TSFz8gfevQtICj5zMYcnxTVT57lNySnu+xb2ucYwDOZciycl1k1
	0je1BoofVJboRmVyrTMmLqz2+3redYm+8avdu8vG3IK5O9l4MeZC1371UoYh3wC6TYs/IMDXYa0
	DC8Vul5ozC7zZsaGTjmpRAmNObagM0OpAg2hplRMSaHRE53e6C3f4nbBKGWmZCFZYyn3K4WowDq
	qmQW+bM4SsjMUNDOvPsm21++5LTc=
X-Received: by 2002:a05:620a:40c7:b0:93f:26d6:d70d with SMTP id af79cd13be357-93f29cf7ddcmr1207148185a.31.1792395591511;
        Mon, 19 Oct 2026 00:39:51 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:93f:26d6:d70d with SMTP id af79cd13be357-93f29cf7ddcmr1207146085a.31.1792395591068;
        Mon, 19 Oct 2026 00:39:51 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d01d:2002:4b7d:4c30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce325107sm212812955e9.3.2026.10.19.00.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:39:50 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        Jack Wu <jackbb_wu@compal.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Zhang DM <jixianqiang1540@gmail.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/5] platform profile: Complete class notifications and registration cleanup
Date: Mon, 19 Oct 2026 09:39:06 +0200
Message-ID: <20261019073930.2352283-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073930.2352283-1-daniel.lezcano@oss.qualcomm.com>
References: <20261019073930.2352283-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX1TSpftgV5TXJ
 Yi8OpGpVj2uo4KlJ387U9kv259xe6ZQGPE9cDbLFi+5ImtSuolcbxjtkhwFhg0RqP/2J42ODLJG
 w7Qz+VPJ0NuV2Rl5x3MkP5M/rkxd90c=
X-Proofpoint-GUID: 7t7dMpAEXiMqdSEigRsSfZL6HglVdELl
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad5c948 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=sNWLPp6fUqVo4Qx2xT0A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX38PzQY3JLvvD
 oXKzGSJdIWOmJbHe3SS5fsHvsCgodWA22cGdexJrsOL/eNcz3CEQqRxPbcmPHu1k4rcQmTkAMto
 F9eslfBZ2MYUfk3d+yl8CjFtB6AXBjSnWes7ct4sS3ar9ft4caH3egUCWthuZI870ULrZqVNK3H
 SwngQ4EVQXl9fxAwwAmofyc2D3NyJOhxoq7Elt/evzQ121OsRl1q+XZrQEY9Ar8NHzRNN9/kW4y
 FShZMv++ypS6WSTuESPO70ANvi3eXPjMiZYIMH2KDTWS2MHVdaiqYDZfkRZBpONQQQufnkR2IDE
 ovvWbPq30QEvbLX91iCnNj8eAmL+F/B+jj2y5RanFJ6YI3wm5y68PX38uq1OCKVs4DtfMzS92yP
 LobzlS+rjK3ysp1LZvc/hJ40QMK6M0CtgbkjHXMumi+ML4erSa91qwCFsE4F4eWaY9oTo6WFhpZ
 3/vaaTjKL6dSd9b3bOg==
X-Proofpoint-ORIG-GUID: 7t7dMpAEXiMqdSEigRsSfZL6HglVdELl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190030

The class profile attribute documents POLLPRI notifications for changes
made through userspace writes as well as changes reported by providers.
However, a direct write currently notifies only the legacy ACPI aggregate
attribute, leaving listeners on the provider's own profile attribute
unaware of the change.

Notify the class device after a successful direct write, using the same
helper as aggregate writes and provider-originated notifications. This
also makes notifications available when ACPI is absent or disabled.

Restore aggregate attribute visibility after unlinking a handler whose
registration failed during a sysfs group update. Keep aggregation exposed
only through the existing ACPI interface; the existing class devices
provide firmware-independent userspace access.

Assisted-by: OpenCode:gpt-6.1-sol
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/profile/core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/profile/core.c b/drivers/platform/profile/core.c
index f18fd96b942c..320a5a964fea 100644
--- a/drivers/platform/profile/core.c
+++ b/drivers/platform/profile/core.c
@@ -250,6 +250,7 @@ static ssize_t profile_store(struct device *dev,
 		ret = _store_class_profile(dev, &index);
 		if (ret)
 			return ret;
+		_notify_class_profile(dev, NULL);
 	}
 
 	profile_notify();
@@ -324,7 +325,7 @@ static int _remove_hidden_choices(struct device *dev, void *arg)
 }
 
 /**
- * platform_profile_choices_show - Show the available profile choices for legacy sysfs interface
+ * platform_profile_choices_show - Show the aggregate profile choices
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to write to
@@ -360,7 +361,7 @@ static ssize_t platform_profile_choices_show(struct kobject *kobj,
 }
 
 /**
- * _aggregate_profiles - Aggregate the profiles for legacy sysfs interface
+ * _aggregate_profiles - Aggregate the profiles across providers
  * @dev: The device
  * @data: The profile to return
  *
@@ -385,7 +386,7 @@ static int _aggregate_profiles(struct device *dev, void *data)
 }
 
 /**
- * _store_and_notify - Store and notify a class from legacy sysfs interface
+ * _store_and_notify - Store and notify a provider from an aggregate write
  * @dev: The device
  * @data: The profile to return
  *
@@ -403,7 +404,7 @@ static int _store_and_notify(struct device *dev, void *data)
 }
 
 /**
- * platform_profile_show - Show the current profile for legacy sysfs interface
+ * platform_profile_show - Show the current aggregate profile
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to write to
@@ -431,7 +432,7 @@ static ssize_t platform_profile_show(struct kobject *kobj,
 }
 
 /**
- * platform_profile_store - Set the profile for legacy sysfs interface
+ * platform_profile_store - Set the profile across all providers
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to read from
@@ -502,7 +503,7 @@ static int profile_update(void)
 }
 
 /**
- * platform_profile_notify - Notify class device and legacy sysfs interface
+ * platform_profile_notify - Notify the provider and aggregate sysfs interfaces
  * @dev: The class device
  */
 void platform_profile_notify(struct device *dev)
@@ -643,6 +644,7 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 cleanup_cur:
 	scoped_guard(mutex, &profile_lock)
 		list_del(&to_pprof_handler(ppdev)->node);
+	profile_update();
 	device_unregister(ppdev);
 
 cleanup_ida:
-- 
2.43.0

