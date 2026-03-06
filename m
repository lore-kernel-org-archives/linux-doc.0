Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65619425CDE
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817812; cv=none; b=jGnkRtf9cWNxtDaDN73+/jh091VrrXwB9wCmKXoCEfy8yhcdmW1aH+IbAmzAvF2q83Q5IWG42dw1i6W0bbRwBUp/T+EJTsYQcmkInkByj+xaAGQZud17uomKxGLkH4haUlVZCOMRYyjmRzv/YsPVHRSyf9tAIGBD6gU/6Vmeozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817812; c=relaxed/simple;
	bh=cFVRek2ApJRDsXIzvIHRimHH12mRJMFB9qA0OR3X75s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qUWoThXm9vC0DLoQ9zYdS0YND2P+b53T9pQdQ/SJWFRkEpIvjMADJ10TnxX7t8QBHHzjAtP1+xPWMdCe04zl+YACeuYGecApmuy1NrUvyMeS3k95Z3jyZ65UX45L0yHojZLEMLD8zjZxy58u87ug+l41FSWkiq+4uVkUb2Q7IwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XuDEZbTB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBgLCJle; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XuDEZbTB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBgLCJle"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1Z6a3957935
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mvf/fMp10klr3lNcw5FhLLQnphhOnIvjXrPlO1YIOoA=; b=XuDEZbTBDUms0QL3
	pFHun+6dMmZl22RgOFv5W6Ag0v5s4encCtJ3efLqQzC2Zx6Yu2ch3aiLDcB8NDdZ
	PDGuL53/ZPNMq6Z4HCsAk++Je84zgNgzN+NAf0R5HWfM678CLKCLe6krhHFnOEM6
	pGUHt2Y8oCXy2ZEO4CqpX/zFck0ItQwBQc7nAFhA/Rk/BtSK4pMJ1aA7jrV7QYve
	hdmD08c13KFofXIGntrQEvKwQs8ENpa5GHbCXlp20mLR2kypV/FPfTOBWLpNaenj
	/2RtjtpNF7wo9ORVcFayT+dwWp3D5zZikxHEzqEOfFM0fw/NfnAZf+iNa9m2MWAq
	MpFJOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2up04cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb42f56c4aso5409211585a.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817810; x=1773422610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mvf/fMp10klr3lNcw5FhLLQnphhOnIvjXrPlO1YIOoA=;
        b=eBgLCJleTEdO0QfhkCsSl5R5t2P0hJP88DDTqb3Zhw/z2anYp7PhuLbEEM2Rs3b4t2
         CRUptjSHK6UJb3Vz2vmpYvrwSNK78MvRTLTynzSpOIUbdcoYoqaIe3ba/Y5TC7KqRisW
         eWf/67bqJjYVgFAzLxeRemwMBIzWCqc/v379Z0eY+9eSHaon0iJ++QI1kaD9hxi49avy
         8ZRdDI1OvJqNDzMlrAYyZSSbkVKHTPGwqRFkpVoZsio0ysRoBDmotBv9juABvU7iFsQS
         fwrBkggOIHg47NAwur8Axoomo1dkycEhxS7iJmmlpKBstEfCh8azICzD45HUjVOcTddD
         erRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817810; x=1773422610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mvf/fMp10klr3lNcw5FhLLQnphhOnIvjXrPlO1YIOoA=;
        b=ErkaV3upZ6+7/9WbTKcY7aazVJiKl+kIh3171qaWBpqDsr1sxBsA8USjyRUiq0on3J
         ddbxLEUUv2PgSuI5U0wsVTE6NA5TV5tBDfu5cpS6V8ofJ4LewqZl8zD5FPNi+ldlbWcE
         QfZUp5pJ5RUWRT0gdOUhVHHeFBWa6rMvnSsqvPntqsrZUKMEatZ33VVlPmSI/kZj/ZKa
         kPpcGHFHNcoAgJ7AAK4inXVzBvDkZ5Wgv+QNv7NqztE5xDbjJvnfNisU6jcpISxzBKSM
         OoMlVZ2mutFyEznNlmvA9+zs/gDEbYktJ0U/wDPjTMO5iGMhq4HWLa+1JyGW+ZctI/uH
         xVGw==
X-Forwarded-Encrypted: i=1; AJvYcCUw4q8T0aS2oHtFKUskh0X8c3fZHoq3NjsJuBh76nUGvc3/CGe5MP6ASoEvJxlgZA6doJljPO6CYOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlokODMPYWA9zem4IYVvhQW6wJ48rNUii5h4RfhqmxOZhTfvUZ
	oGTC125ZEGZspK+mITjDwvHOKKHgQ328opEXqzvIxKy52xWjZQdlZQzZWis2ICEQ9typLC5Ov44
	X5zN1PWDwTTh5KT5l6pDkKPIXH49Fx6LEVtBMyE1G9oR8N0KRijwlCW/ROZA57EM=
X-Gm-Gg: ATEYQzw9c/ThReio/s6Pk/oSyxPh7c5e1adTKHlDBKqEl26GfyWBiD8UmoVU7KbPCm1
	bepwW7KYwBU4EML68+fZGHOZvXikttQKLa7X1T5AyLA0HKzHeaQ+KqHZSIHFZ1uVtx5O5lGoe6L
	eXW6Sqhv7eunwn56XOr7dLS1k0yN1jL2PS7MQ/FXB+5Gd/bX71GkO9HnRpf1Dz1XkRHWQIyTq+9
	/wN9iZfFWVIxARNvd61PujTM9uKHzQMbhUGQq/nVSUhRAMbzT5nMEU1sua7s6SosTYBVQDG3A7S
	SSgwzcow3vw18TkuMuahqiWWm4djFy/+0TMh79HcjSjqOcsBbgQXd+k7yKj2XHjV5oDYONgZaqQ
	5LS3wrvqC5rX7Y180X+oX6q0JpJacK67bEp9MUHmKXfhXHJirGplt
X-Received: by 2002:a05:620a:4048:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8cd6d427f8cmr362535185a.33.1772817809734;
        Fri, 06 Mar 2026 09:23:29 -0800 (PST)
X-Received: by 2002:a05:620a:4048:b0:8a9:ef98:6835 with SMTP id af79cd13be357-8cd6d427f8cmr362530285a.33.1772817809266;
        Fri, 06 Mar 2026 09:23:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:54 +0100
Subject: [PATCH v3 10/14] reset: protect struct reset_control with its own
 mutex
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-10-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5788;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cFVRek2ApJRDsXIzvIHRimHH12mRJMFB9qA0OR3X75s=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw17iaFtggQHPnqQeoX6wV2u7jiA/Zt0AhKg5
 G4sX5hoQcCJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNewAKCRAFnS7L/zaE
 w7M3D/iEPA6rpq1rm36ayc2LrKWizgL8xoiQf8aOOk4cvBH3DBgINVNvndeijAGsro1UpJ9XKfO
 h9YaXg6YuQHWcuC1SzzPDWZ0wvUEKwzOXzSxktr+QvEHQ4O3Isyqz/MKdiEv5lp/0BB0GECg6/x
 DJD8ojCR6GpPvxFz9quWIRm+ARh9HO2DHwEl7mEz1LMEzwusI//JhaSUZGvRzrCl/38Q8wRn9E4
 wtM0B4tkbBjpUqhTjHybXtu27ewTSZCIV5nRltIHpXFyAH+4+d9adfQUTBndjZaodNItzyqs64r
 ghTEP3NgvtcnppN7zG9FtI7lvi6osuB4jxV9T8wI9SioW2ELpkM8yvJWPeNVpBl8/gzGxWpH1V/
 lH/gWnQ337c6qjwxcpjvoxC6cleT91+Ago3gx1MUvG+C57eI10rrpbv7XKg+XnEKgP9IypqIUM6
 e/wL+LfmXIYBehAY4kLHc4uzgJ4X+wds7+Cc6PiSc28TOXmG/eafmDWGabM8lZJ2a8MDEPp4243
 mIyBe8vDF4oxQ0Myn7Vf2IklMR56NQid0QZt/Y2h3bigR1+CoiyVR6ZKBYXx/+Go6kvOChepvYH
 4jQn/iXc4fX8UqFpVl9EdaANlXRh9y2zXlrhX+SvvTU+6faHjPoJ/l30JYtLP1YidqQ9IXdamv5
 NUJz02liJG2Td
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfXz0VAcckS6Afc
 7zmM8dOD2wtvnh7og/B5gCIF/jKI+mwybWP/ivB81rUdRXYdoB8XhA3lOUUBkhWKe9hTIVIgCol
 9tG20aMQ9z2i9w71lWRJwL1XbhQZT14SKst2MoIq09aIKt49k9etP6pQo1EBVe1/mkBsjKE/Jok
 YwiiaGuDobUqFwuNVwH6NC/N9h9VszxKDHV6MJw48nkGjPG0mOdguisABTpMa8JNFzcUAXtmED+
 MmGys4LvOgMdtrHENpma732AoR5izkDCw0Vd+2/gCUxxqohoJND9bE3vp0lbXCeEIRniiN7f0mz
 Q8At7TtFi42+/xe7DcV0rdFRZOAeKlkmqMUmibfRHAlkC7J8zo5tYQsOgdNQF+k7DPcyUlJDXnp
 mp3Pg0wG3PLZmftSv1GJ+tc4lS4imGom+SVzd6yWEsu1qdyb4/WRN9MhAGnyFS7iZm4I7LJ5fq8
 FSnJ6K/YJEPEhsfakKQ==
X-Authority-Analysis: v=2.4 cv=QfBrf8bv c=1 sm=1 tr=0 ts=69ab0d92 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BqEP8_E81RGvC7HVDgcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cWYdvDOLB5vNxYV9AokRmNQurEtom5Hd
X-Proofpoint-GUID: cWYdvDOLB5vNxYV9AokRmNQurEtom5Hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

Currently we use a single, global mutex - misleadingly names
reset_list_mutex - to protect the global list of reset devices,
per-controller list of reset control handles and also internal fields of
struct reset_control. Locking can be made a lot more fine-grained if we
use a separate mutex for serializing operations on the list AND
accessing the reset control handle.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c | 68 +++++++++++++++++++++++++++-------------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index d4813c712abf3df7993b0c2be1fe292b89241d11..34b11a68f28cd32e7b0ac852503193b0d9514915 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -49,6 +49,7 @@ static DEFINE_IDA(reset_gpio_ida);
  * @triggered_count: Number of times this reset line has been reset. Currently
  *                   only used for shared resets, which means that the value
  *                   will be either 0 or 1.
+ * @lock: serializes the internals of reset_control_acquire()
  */
 struct reset_control {
 	struct reset_controller_dev __rcu *rcdev;
@@ -61,6 +62,7 @@ struct reset_control {
 	bool array;
 	atomic_t deassert_count;
 	atomic_t triggered_count;
+	struct mutex lock;
 };
 
 /**
@@ -707,7 +709,7 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_acquire(rstc_to_array(rstc));
 
-	guard(mutex)(&reset_list_mutex);
+	guard(mutex)(&rstc->lock);
 
 	if (rstc->acquired)
 		return 0;
@@ -859,6 +861,7 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	list_add(&rstc->list, &rcdev->reset_control_head);
 	rstc->id = index;
 	kref_init(&rstc->refcnt);
+	mutex_init(&rstc->lock);
 	rstc->acquired = acquired;
 	rstc->shared = shared;
 	get_device(rcdev->dev);
@@ -872,29 +875,40 @@ static void __reset_control_release(struct kref *kref)
 						  refcnt);
 	struct reset_controller_dev *rcdev;
 
-	lockdep_assert_held(&reset_list_mutex);
+	lockdep_assert_held(&rstc->srcu);
 
-	scoped_guard(srcu, &rstc->srcu) {
-		rcdev = rcu_replace_pointer(rstc->rcdev, NULL, true);
-		if (rcdev) {
-			guard(mutex)(&rcdev->lock);
-			reset_controller_remove(rcdev, rstc);
-		}
+	rcdev = rcu_replace_pointer(rstc->rcdev, NULL, true);
+	if (rcdev) {
+		lockdep_assert_held(&rcdev->lock);
+		reset_controller_remove(rcdev, rstc);
 	}
 
-	synchronize_srcu(&rstc->srcu);
-	cleanup_srcu_struct(&rstc->srcu);
-	kfree(rstc);
+	mutex_destroy(&rstc->lock);
 }
 
-static void __reset_control_put_internal(struct reset_control *rstc)
+static void reset_control_put_internal(struct reset_control *rstc)
 {
-	lockdep_assert_held(&reset_list_mutex);
+	struct reset_controller_dev *rcdev;
+	int ret = 0;
 
 	if (IS_ERR_OR_NULL(rstc))
 		return;
 
-	kref_put(&rstc->refcnt, __reset_control_release);
+	scoped_guard(srcu, &rstc->srcu) {
+		rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
+		if (!rcdev)
+			/* Already released. */
+			return;
+
+		guard(mutex)(&rcdev->lock);
+		ret = kref_put(&rstc->refcnt, __reset_control_release);
+	}
+
+	if (ret) {
+		synchronize_srcu(&rstc->srcu);
+		cleanup_srcu_struct(&rstc->srcu);
+		kfree(rstc);
+	}
 }
 
 static void reset_gpio_aux_device_release(struct device *dev)
@@ -1104,7 +1118,7 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 {
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	bool gpio_fallback = false;
-	struct reset_control *rstc;
+	struct reset_control *rstc = ERR_PTR(-EINVAL);
 	struct reset_controller_dev *rcdev;
 	struct of_phandle_args args;
 	int rstc_id;
@@ -1169,8 +1183,8 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 
 	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 
-	/* reset_list_mutex also protects the rcdev's reset_control list */
-	rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
+	scoped_guard(mutex, &rcdev->lock)
+		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
 
 out_put:
 	of_node_put(args.np);
@@ -1213,10 +1227,8 @@ int __reset_control_bulk_get(struct device *dev, int num_rstcs,
 	return 0;
 
 err:
-	guard(mutex)(&reset_list_mutex);
-
 	while (i--)
-		__reset_control_put_internal(rstcs[i].rstc);
+		reset_control_put_internal(rstcs[i].rstc);
 
 	return ret;
 }
@@ -1226,10 +1238,8 @@ static void reset_control_array_put(struct reset_control_array *resets)
 {
 	int i;
 
-	guard(mutex)(&reset_list_mutex);
-
 	for (i = 0; i < resets->num_rstcs; i++)
-		__reset_control_put_internal(resets->rstc[i]);
+		reset_control_put_internal(resets->rstc[i]);
 	kfree(resets);
 }
 
@@ -1247,9 +1257,7 @@ void reset_control_put(struct reset_control *rstc)
 		return;
 	}
 
-	guard(mutex)(&reset_list_mutex);
-
-	__reset_control_put_internal(rstc);
+	reset_control_put_internal(rstc);
 }
 EXPORT_SYMBOL_GPL(reset_control_put);
 
@@ -1260,10 +1268,8 @@ EXPORT_SYMBOL_GPL(reset_control_put);
  */
 void reset_control_bulk_put(int num_rstcs, struct reset_control_bulk_data *rstcs)
 {
-	guard(mutex)(&reset_list_mutex);
-
 	while (num_rstcs--)
-		__reset_control_put_internal(rstcs[num_rstcs].rstc);
+		reset_control_put_internal(rstcs[num_rstcs].rstc);
 }
 EXPORT_SYMBOL_GPL(reset_control_bulk_put);
 
@@ -1482,10 +1488,8 @@ of_reset_control_array_get(struct device_node *np, enum reset_control_flags flag
 	return &resets->base;
 
 err_rst:
-	guard(mutex)(&reset_list_mutex);
-
 	while (--i >= 0)
-		__reset_control_put_internal(resets->rstc[i]);
+		reset_control_put_internal(resets->rstc[i]);
 
 	kfree(resets);
 

-- 
2.47.3

