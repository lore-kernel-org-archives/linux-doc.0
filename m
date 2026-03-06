Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DAC41325D
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817811; cv=none; b=k5tB547JKmyqSbciLgXmBuL/5PH1+USHNDB5mgvpv19sEvcOGSqDE67+VwlpzDpYtE1czwF1Xw14dbxiVp1EeXB0RgbmfIptyCEnGB+v7dNFYFOj8q6XGpvkWuRoujl8pcgCWL6UPlI79GH7bVC1R+YpFV9dLDV0yqwH3XppE84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817811; c=relaxed/simple;
	bh=2dSbt+BiOQcE24R8y3iG8J4EmvYs/25ZYHkB6KVqJ7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/LF8Qhruswf+RcfJa9uCQPOdSLpiIvrrHukBJtyofZvNjN4EHRBc629F+cXKYxjRxSv3J3BvqSLpMpCbwbRyBCwJgga7d4P0t5fpoQ53RcPayanY88QIjLbBFacSfSaXDu2tqm1I0E17qnxTzHGccK9bXJSaw3xAIU9OQoOR2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJtnvyku; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWjHzmo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJtnvyku";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWjHzmo5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1p481898321
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kz1YhNjIW+4C6uoNZPj8hC4jLrXx/lkbggRKdn14qv8=; b=jJtnvyku+zJPiPYt
	SBATWlj3HgfZKdk5YsHy+0BS4zq+87U4LrtPlYNCWyJboKap3VwRxAbLJSM+zIZk
	sR9CdLKeaRxdlp1yNKIl+4nte/hOz/a1SlVZZscUVcBXIsbs9ljtUeC9/kYbyDQc
	eNz0V6SYg79d5gIxuUt5CxnY6/ptGhYlmnm1hEaNtTAeIRx9hTqi95FeN6gH49Kz
	kt3K07SArSMMvwQszNmhINmCMlN4REFacwOcZaU24eBYE0ZFD/gpshaxQ1nWHkBR
	ovNvtVAr9xmWr44xCTul94mRlXqmPShyAgkOPRz4F/XuQqKQWfXLBFuTQ/qF6jAh
	NUAbIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14h5e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so4756248985a.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817808; x=1773422608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kz1YhNjIW+4C6uoNZPj8hC4jLrXx/lkbggRKdn14qv8=;
        b=SWjHzmo5kaWjTRBGl1QGjblg7PmlBF6rsGxR0MGQM26FYFOyDCDTnjnOBO3BbUqXxw
         2N8MhphdfKsunP4sa4ndCnGmgpC1IPHEjgkfAAwm/ACS+BXwPVpKjXfRxUj+jyLuAgLx
         m9QoSwN72MjfvQyBdg053eXi5LCH9XeZE4x2oCTSdm0XkRdxG9AaR3uf9IriyvZa0Yr+
         QEPm0Lc0yiO9MfjHdqyoO43JSkqzXw+f6dEuSJ+/TtM64pNSKGThEPr1X5PoImIG07cP
         DlxeqZ8szbjg1IKeW/u0s+B/LT0GE64kVqhvclx8Nw/04W+bEK1r4zSoMqTpjbM8T35T
         v/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817808; x=1773422608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kz1YhNjIW+4C6uoNZPj8hC4jLrXx/lkbggRKdn14qv8=;
        b=PZeQgxgonss/s1XAlYW66Et4LooANy1wUTd7/N9nFz0HQCYJg6S4baOjPzWVP5GjM6
         qPVjKIf3pe3HEDaEnJ3wdLxp89Bnkz4TsljVXPiyUjZWQDOM9GYER6WI3lZLTAJBeCMe
         fCkMnIT/vCbHTqeaILw92KhbWcamOdWquxKYcdVS2JcmkZDftgoU2IiwXqybsKRWRn1g
         HibCPGDlc8FdgsrG00tg69d8xy18gIyBp52sMzq/RV2ugwqOy7ZjrcELrnlUxSnyd1gg
         RrJ4/ShI+ETZpbxaBYOBpaAWepsDOEI1DHIlwpvDySRNx104kDDptrnFEwrF4RtIL961
         oW/g==
X-Forwarded-Encrypted: i=1; AJvYcCWVAmLuBua2zLg46+2aDahRFD93wzI19NZpBiAj6tr9cFtVTCNNrzbOdzWlQp6zDvs2qbAPreWtmLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfwLUoCLx61N5iq1ijCfGecIvLXTNbddXZZXHRDzZ8g71byXP
	iZfm91G6mNLw/1hMWJFaqeORtoZggZgVOkGJ8rrdvRPlqAYCRYIcwjBVCPwLQsf8+iyRFmgN6oG
	pO8MvW3WXGN5q+HezDc1h7d7GPzWA5En/HVvroXp/5OBBlyMlpBZGRLOwtaNKsXE=
X-Gm-Gg: ATEYQzx3SmmHLiNBuKeRskhEm8uHcEMaSKcePax3bZfUTQLnY8a9JGIuiEyrPapvXxH
	iPq8bxNaWNasqWG3TK7Fo3KWDzcVl5Jplhb2iYEwnYoAx4+kGKx0FBXtCJGck8CkpFO/pKoakIf
	lm+5tZNC8/bJYokiEV8W5aYrdZUwpoj9RvjJ6I3nySRd0e5NECI1hPlGGr57HLHNjf+Io99sFJa
	GjhPnPAU6yLsKhJij6qIV/y0staHLseLoN1AKfSssATq6DGGbT4n0INra7HQBWIbRYdjXxj5DH6
	rdolFBS5w1Mx5Q7niMLjwgO9DmEvEirLbrWQKQxJK0yYMvlQ2PIIr7z89YQD+Ek01dlnMLix5rR
	wT/zrvMJPghmQS+YIcoulxhi+dNf8ABFa5V314foEfcFtPyLTFJhC
X-Received: by 2002:a05:620a:4588:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cd6d4285famr337149485a.52.1772817808245;
        Fri, 06 Mar 2026 09:23:28 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cd6d4285famr337146185a.52.1772817807777;
        Fri, 06 Mar 2026 09:23:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:53 +0100
Subject: [PATCH v3 09/14] reset: protect struct reset_controller_dev with
 its own mutex
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-9-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4633;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2dSbt+BiOQcE24R8y3iG8J4EmvYs/25ZYHkB6KVqJ7M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw16njLyn0oTsNoBmOjieQryV6bt2dJsikFub
 4L2rzaeCKyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNegAKCRAFnS7L/zaE
 w1aiD/4n/5Mtrwfvl+1QYE1hw0YE6CljDRSJK+VeqIsU08Sjd+jKa0n7O4EPx5ZWQWsxu4S/9Nb
 e06pi9FXHhgPXuzPw8AJkXnGHwLmouQ+tua+Y6CMcs8q7Gb7JqNcv0LMfSeJRjV7rNVKia3AS/C
 CmPe3AMA8OOr2jk8eYZxZP3Dn2fakxtfGoofc4dQ6CBsZ2zIj2n+ow9iLVUM3VQdOVylbAkOq/N
 MbjIrwl3GR/WPmvcF1YX4pSUXSwHg7b7NYyRjEQJWQVKG76awsXbz3IAuiWFhEL3jCh+wp3afq/
 93WnD/XgShtrpddf0b5D48u4oDAlb3iNLq6JOZVfMfUk8kuRukPqF6AQxN8ldTzDDQAsplKoPqa
 lBvO9vhoRm+Kcx+ZaiJIN1lkbp8wFNsSVbvgavV75LIS/7N3UxYmRiSraz78dxEVShiFXw5aR92
 iTPyzzHEzsAnlw4CQQo3QkZrsr0SOVGzFw//Zp11pF4yDjTSdjIvBdKX/b5+xjRdZoc4dRZfvvU
 eAFxrCFXWcCxuSNBEgZAI1kyTqZI+cR645QY4ZLh1GArgkb0psMj2HTbJviAYmZ6WUaVdMM+1dF
 eiXn4qBtxfYqJE/kYGXDrUNZIvuQF74XlNljYHVrqTd8pJ+Iql32M8xUzGpOvyfe7OtiRjN6tmt
 pdWkw7wbPNnXF2A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX1bSBP96UXr2M
 FHq4TQKnIshc4KyOQH18Cb/tdUm5JtzlunOOHwhmFfbQUDbBj5MK7FhnpO8RZFRNvtOp8Z1COC1
 03H3y2fsb/Zx6yt8k8IepRasl4dy31O9JcDCYd7vQmc2w1xJEFPIvxKfjIzFSbuEWdxGoILCBJl
 vIOzIKfqniOWl9smDE9qv88KiEd65ghezOIPRQpJd8VYqw4VLSqf0CXHkJwBkByuKCtUuxfjnvu
 FcPTOLzmyJuowsQaEOBSK6rJlYTTMDFYEGLdG3PMtNSl3/HGptbHagYRDwmeLBds4p5xdYHg98M
 8IQijZEOx7cYkx5n/vYtXQ+mKCTkTtzQWe6ouIULP3FSzIdABXbOJshTaoWj0lZq1qFMXIZgsw1
 O2bRmqN5KVhXqP4HjOolKLwxgjnEwWw8FAGAP3i5KAG92PdV+MHupYrpLadEj8JWzk6Zi+yzZLG
 vDLt6mOu0LgtG34rW1A==
X-Proofpoint-GUID: 1VGfACwY7yC7U1a6XGXSxShTMNFKSTp6
X-Proofpoint-ORIG-GUID: 1VGfACwY7yC7U1a6XGXSxShTMNFKSTp6
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69ab0d91 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nQ7P6-40-II7rw7jOZoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

Currently we use a single, global mutex - misleadingly names
reset_list_mutex - to protect the global list of reset devices,
per-controller list of reset control handles and also internal fields of
struct reset_control. Locking can be made a lot more fine-grained if we
use a separate mutex for serializing operations on the list AND
accessing the reset controller device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c             | 44 ++++++++++++++++++++++++----------------
 include/linux/reset-controller.h |  3 +++
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 96199e7b0dd7c89c5a11e2e2c3e5eb7fd5d49355..d4813c712abf3df7993b0c2be1fe292b89241d11 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -131,6 +131,7 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 	}
 
 	INIT_LIST_HEAD(&rcdev->reset_control_head);
+	mutex_init(&rcdev->lock);
 
 	guard(mutex)(&reset_list_mutex);
 
@@ -143,6 +144,8 @@ EXPORT_SYMBOL_GPL(reset_controller_register);
 static void reset_controller_remove(struct reset_controller_dev *rcdev,
 				    struct reset_control *rstc)
 {
+	lockdep_assert_held(&rcdev->lock);
+
 	list_del(&rstc->list);
 	module_put(rcdev->owner);
 	put_device(rcdev->dev);
@@ -156,19 +159,22 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev)
 {
 	struct reset_control *rstc, *pos;
 
-	guard(mutex)(&reset_list_mutex);
-
-	list_del(&rcdev->list);
+	scoped_guard(mutex, &reset_list_mutex)
+		list_del(&rcdev->list);
 
-	/*
-	 * Numb but don't free the remaining reset control handles that are
-	 * still held by consumers.
-	 */
-	list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
-		rcu_assign_pointer(rstc->rcdev, NULL);
-		synchronize_srcu(&rstc->srcu);
-		reset_controller_remove(rcdev, rstc);
+	scoped_guard(mutex, &rcdev->lock) {
+		/*
+		 * Numb but don't free the remaining reset control handles that are
+		 * still held by consumers.
+		 */
+		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
+			rcu_assign_pointer(rstc->rcdev, NULL);
+			synchronize_srcu(&rstc->srcu);
+			reset_controller_remove(rcdev, rstc);
+		}
 	}
+
+	mutex_destroy(&rcdev->lock);
 }
 EXPORT_SYMBOL_GPL(reset_controller_unregister);
 
@@ -712,10 +718,12 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (!rcdev)
 		return -ENODEV;
 
-	list_for_each_entry(rc, &rcdev->reset_control_head, list) {
-		if (rstc != rc && rstc->id == rc->id) {
-			if (rc->acquired)
-				return -EBUSY;
+	scoped_guard(mutex, &rcdev->lock) {
+		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
+			if (rstc != rc && rstc->id == rc->id) {
+				if (rc->acquired)
+					return -EBUSY;
+			}
 		}
 	}
 
@@ -806,7 +814,7 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	struct reset_control *rstc;
 	int ret;
 
-	lockdep_assert_held(&reset_list_mutex);
+	lockdep_assert_held(&rcdev->lock);
 
 	/* Expect callers to filter out OPTIONAL and DEASSERTED bits */
 	if (WARN_ON(flags & ~(RESET_CONTROL_FLAGS_BIT_SHARED |
@@ -868,8 +876,10 @@ static void __reset_control_release(struct kref *kref)
 
 	scoped_guard(srcu, &rstc->srcu) {
 		rcdev = rcu_replace_pointer(rstc->rcdev, NULL, true);
-		if (rcdev)
+		if (rcdev) {
+			guard(mutex)(&rcdev->lock);
 			reset_controller_remove(rcdev, rstc);
+		}
 	}
 
 	synchronize_srcu(&rstc->srcu);
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index aa95b460fdf86f10002a465e285cd0119da6eeaf..185d2a9bd7cd381ddc51c0f1643c4e3cb196015e 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -3,6 +3,7 @@
 #define _LINUX_RESET_CONTROLLER_H_
 
 #include <linux/list.h>
+#include <linux/mutex.h>
 
 struct reset_controller_dev;
 
@@ -40,6 +41,7 @@ struct of_phandle_args;
  *            device tree to id as given to the reset control ops, defaults
  *            to :c:func:`of_reset_simple_xlate`.
  * @nr_resets: number of reset controls in this reset controller device
+ * @lock: protects the reset control list from concurrent access
  */
 struct reset_controller_dev {
 	const struct reset_control_ops *ops;
@@ -52,6 +54,7 @@ struct reset_controller_dev {
 	int (*of_xlate)(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec);
 	unsigned int nr_resets;
+	struct mutex lock;
 };
 
 #if IS_ENABLED(CONFIG_RESET_CONTROLLER)

-- 
2.47.3

