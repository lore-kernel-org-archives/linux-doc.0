Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E4421F05
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817810; cv=none; b=u1V4/35ME5RaYtQepRge87cUA19u9xKmKy/6YBKBB4jHeagI41YAnzj12nrOjdA/xp/BJNId7g2bnz65YVP17t20L4bNWihnQs6zLSJUl4G4zm7KCdAVg9hpf6M+1CY84AACVxrzH70NMovGvHRhy60tr5E4XEQGn+BOTOiJ8MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817810; c=relaxed/simple;
	bh=sL1q9wwhxHZZrZlh7F46CRESH8uPDctEF3AFiujRX4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSFQRgvOtpNhsxYhAsPZpfacg7hbfENXl2iVfI1ghpkWgxrna8/+P9oT0zP0Qk5RMHM6Bb8b4ZpdyLpsg7q7jsB5TiNjJALMt7L2AiGLH8HtrMEy1M8mRwwg4znQdlxNEg7krSHhZ3SWwx5gS30ZoQJ0wYDGtxKWmb5A6MieCMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9MX6hU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpOpZiz3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9MX6hU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpOpZiz3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1l80667886
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fazAAiBrJ7rgJoOI1TWI0OtZrQogm6Eto7WktTDuRyg=; b=W9MX6hU81VQfwHLq
	+3fst/M5fdxsNaIRZRb3F0JrEHkIJBmeQxyo6gCF7IXRMTudp1/DER/q3oEQgyiK
	Up+6NujwvwH8JCEahFnh/41+KZ4lOBAokdL1sTP59EbqJ42/IGasCKRW3uvliLhx
	Je1iTy8tNroO/v/98dFKRnikwZiPWQnG0ne72fbqpxT5Nof7fYMNMB/EDNeZ1XtV
	kc5bZFrjgwrKyE50O3g71pDzDvNAZV/P3RkTPuRjY2ouOCNkSJaX/AhkSBUjnqGm
	vlkku+XUrVuHbamANAhHhLbP93A58rK0kCsauJxYJ5G27OxlpE23U8t/aivwYPTF
	U8s6rQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2ye03cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b6a5821so4474966285a.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817807; x=1773422607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fazAAiBrJ7rgJoOI1TWI0OtZrQogm6Eto7WktTDuRyg=;
        b=JpOpZiz3QO+J4bhps7a0foh48MkMvkYAwV+f3jY17RXO/MKYvczLasmznKzywVQgPd
         9KYN+B5bN/zn05aCJmZyCi/yYiAMKM3Rf1y+qmbMSpv0oFi/OK8tJl+Gbx86ziDlDIxw
         Pdx3e/+wdjb99BidpwzdlGiwKhT8fgndiHbLqv9e94fHtm6yX3lcJOfavW9a+RT8dwP7
         IdNxhJ81dwubhhy9ipdLXVeJvQnv3SrxajfpOsQcSQefVEMkOH0+aO6IExYhkayKY6EI
         nvwHtZNh2W1+ztE/aeT3pXcnmrhyLSWyTfVn0zEMoAa+yFl61+1g8fiqPVhSZmqymZVH
         cDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817807; x=1773422607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fazAAiBrJ7rgJoOI1TWI0OtZrQogm6Eto7WktTDuRyg=;
        b=wmY5WdpZ+18r8qznzr06wucFqaUlqUsuFilvoY6d8oosiwn2MdP7x8t6Iq1Re2MP6g
         777ETm83Qxhh/gpXDh5Dd7W3J1VZbWoLnMAkMwYupQ8Qu7/hoxbUfRbhpPh1wBtFmK3b
         ejA6tlXIV6OHtugBh1Q84EomiUUe2sf3GEeHrjyfP55rW6OfcUQM93fQIDxBv9xa7YVz
         758yrasmGLtCYLe3KyXbeip/piOYUdmae8lMt4Xf5/YaMJVc+DEvIuftbWHGNcEjfBE8
         Sq3UorX9nnoIvT3/lTf/iJWhBqDtZtvGt41GoU79v4utZP/5gOQoCbT9wQWv2lLzCQda
         vpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8IxxISF5dcjosHE8fR0Ptwa6tCRkc7mQTErjRSSjYxOHgv+2Sea7qomQdOMJc+DE4L7YPQ2fWQK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUJ799jrnNoEh7zgaMiBKemniNMjEuFIxeHP1zaX7gGASVLRTu
	MIw9Yss6sB8MRxI3eM/ZERhNOI2w24nPmSUZ/FL9rI6wDBiH0t4DP3cOeZcxxQjnf/0pkmTFoX5
	fi/4J72dKoeFz95tIs1CgZ7UEnKH4XV40gu3AhRHkfY0d4B8TilzMEtEVGIIsfKg=
X-Gm-Gg: ATEYQzx7+/oHFG5VETPLjrJMywdXW6ljxyXqKstxN/GjKRre+EaQe41EBUPW9KwADwh
	PWQ03WhEP/YWbaydAUyUMUgULKeU0Ivhm/qYPssAPM3ia/k50JPLx1LNMBdxPOUyGuHzqbGmgCx
	biJ+6dckB+lMZu97ddViRg1FiwUs8C5h0LefTJKgrm6c8o1Z2cdjAmn88FyVd+EaDFe4p0cxLgr
	7CW5JrBtOB6zte9r7mfKvSB2q4oY4tXw+/NlopNzvYTSj7G3SEEL7WDit8OXVK3l4yUWd09w8v/
	BVNHirhmnTnkib2EBG4ddhM5btpX5XL7cXh1b4mm2pK0Oz+TpBpJVeuIhWHKpoy6Qek5SNQIk7n
	YnFMmx/mYTt1Wokx9gW+FgiE2DMVKJYU2xI869TiIaoherntTiBTj
X-Received: by 2002:a05:620a:254b:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8cd6d40d267mr359556785a.12.1772817806871;
        Fri, 06 Mar 2026 09:23:26 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8cd6d40d267mr359552685a.12.1772817806371;
        Fri, 06 Mar 2026 09:23:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:52 +0100
Subject: [PATCH v3 08/14] reset: handle removing supplier before consumers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-8-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10031;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sL1q9wwhxHZZrZlh7F46CRESH8uPDctEF3AFiujRX4A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw15Ls0YS7j9WVv1iX72gt+CjrpvW/q/jC3p0
 cOBuXz1cCSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNeQAKCRAFnS7L/zaE
 w/3YD/9j0ymPwkWZFU91RLCWsUFScuvva76Tq5IPTY3c9hJSFzZ6zUt/lc0hg0bepX8s+pXd/78
 HBEVqWxFObobj/VUe5efx+mkErVTwMBtz0UPdqAuex3QwNkxjqw+21St+e6Hi91TC+cGgat284F
 XLgn/qDTQ+lETUBcEH39AYfF2QAhrqnjkWOrokT6Le0sZsoyCSIuxlOHbV+FCiIjb2ZcrZZcwwb
 UZrjkGTsQi+I3IFRmBe7skYV4NFL+q+riRanXOBcCyyQJFp0lPBaKbf5BJqkgjW/1m7O0cwtAQd
 mo06H7aC/9IvaBi8rJlxrqGeE/4+mVzk01WLs7E1ysgtToZoe1xQgyQeREAcS1ADe4fh8d4jeCv
 wU+7rvWJ8TJKhhsEPT43n6e6JLz/oPWL/Em2paf0pwHaayOMYoSJEBnI8p3cYtNjqIXFp2KyynO
 CWatyKhcFNtH/Y6YBR80nTzBvEOkl8r5ApxFCNjSqakQNdBAL3dW4THy2aY+nmU1o3+Ha/CkrZ3
 h2HZBOB0NMIxdjBhKJNprxYa6yqs2hwrqG75cglS2nHt7QgAJlqum/LUpOgo2G6uEyTx8nA4ccw
 u13AXIdStUrtavBq44MlsP9b6nghD4G4Zu2wEyGbMVRLCGwBldGSWNuy7XDUqcYLa1Ne/VE/cEz
 ZFEQSrtkgVZCulQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX562Le0HTJnKM
 bjbBWw2BIT7TCl1YiPYlcF/K61Gi7rQqL664A1ghBDi130k0yNJWpKu7LE0oFJvBfmbP2dtpszn
 SbFqfN3LmqLJmkeHPlEKY4KhsZtf0lXO0H8LriMVmc8szTXtbmEqzwRYZh8yqPSKGmbMRYwrWMI
 xH6Ht+II75rFruc1Tp5Be06EbGeF5VKcciGRwZg4x4P1lJVXxiZrzZi08BtYO3NcVYnR+Pp02yQ
 iblMCuXs62sfL5K9MqE735mr9tkRK55u1nMXJVG7qY5rcoP+TfFxJkOO6JfYEoSsChqFR9GsXCO
 vrEgNIcix9qXYfLh5N5QC87kHTqcC+QxzIxnA6t8B4MV/OACGDXdb56ol8HWz4R7ENc8xqDWSeF
 5KkOcRlwQ+E3fNwuCJo2ryrRm4G2GhOWBHXpNrv0FWvjedLK9r1vX8D+JMaOIq78BlNkKYGlX1F
 eN/RMmImFwHCpjSSKTg==
X-Authority-Analysis: v=2.4 cv=Bt+QAIX5 c=1 sm=1 tr=0 ts=69ab0d90 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GiwafSNXLQ0EgbbDNmMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hZEkbmye1h1bsTxP7_EWNSR_seHW5g-x
X-Proofpoint-ORIG-GUID: hZEkbmye1h1bsTxP7_EWNSR_seHW5g-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060164

Except for the reset-gpio, all reset drivers use device tree - and as
such - benefit from the device links set up by driver core. This means,
that no reset supplier will be unbound before all its consumers have
been. For this reason, nobody bothered making the reset core resiliant
to the object life-time issues that are plagueing the kernel. In this
case: reset control handles referencing the reset provider device with
no serialization or NULL-pointer checking.

We now want to make the reset core fwnode-agnostic but before we do, we
must make sure it can survive unbinding of suppliers with consumers
still holding reset control handles.

To that end: use SRCU to protect the rcdev pointer inside struct
reset_control. We protect all sections using the pointer with SRCU
read-only critical sections and synchronize SRCU after every
modification of the pointer.

This is in line with what the GPIO subsystem does and what the proposed
revocable API tries to generalize. When and if the latter makes its way
into the kernel, reset core could potentially also be generalized to use
it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c | 108 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 91 insertions(+), 17 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 9fef9f972e93fb7388f27ac3bbdf68c884b72ff5..96199e7b0dd7c89c5a11e2e2c3e5eb7fd5d49355 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -23,6 +23,7 @@
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
+#include <linux/srcu.h>
 
 static DEFINE_MUTEX(reset_list_mutex);
 static LIST_HEAD(reset_controller_list);
@@ -36,6 +37,7 @@ static DEFINE_IDA(reset_gpio_ida);
  * struct reset_control - a reset control
  * @rcdev: a pointer to the reset controller device
  *         this reset control belongs to
+ * @srcu: protects the rcdev pointer from removal during consumer access
  * @list: list entry for the rcdev's reset controller list
  * @id: ID of the reset controller in the reset
  *      controller device
@@ -49,7 +51,8 @@ static DEFINE_IDA(reset_gpio_ida);
  *                   will be either 0 or 1.
  */
 struct reset_control {
-	struct reset_controller_dev *rcdev;
+	struct reset_controller_dev __rcu *rcdev;
+	struct srcu_struct srcu;
 	struct list_head list;
 	unsigned int id;
 	struct kref refcnt;
@@ -137,15 +140,35 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 }
 EXPORT_SYMBOL_GPL(reset_controller_register);
 
+static void reset_controller_remove(struct reset_controller_dev *rcdev,
+				    struct reset_control *rstc)
+{
+	list_del(&rstc->list);
+	module_put(rcdev->owner);
+	put_device(rcdev->dev);
+}
+
 /**
  * reset_controller_unregister - unregister a reset controller device
  * @rcdev: a pointer to the reset controller device
  */
 void reset_controller_unregister(struct reset_controller_dev *rcdev)
 {
+	struct reset_control *rstc, *pos;
+
 	guard(mutex)(&reset_list_mutex);
 
 	list_del(&rcdev->list);
+
+	/*
+	 * Numb but don't free the remaining reset control handles that are
+	 * still held by consumers.
+	 */
+	list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
+		rcu_assign_pointer(rstc->rcdev, NULL);
+		synchronize_srcu(&rstc->srcu);
+		reset_controller_remove(rcdev, rstc);
+	}
 }
 EXPORT_SYMBOL_GPL(reset_controller_unregister);
 
@@ -322,6 +345,7 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
  */
 int reset_control_reset(struct reset_control *rstc)
 {
+	struct reset_controller_dev *rcdev;
 	int ret;
 
 	if (!rstc)
@@ -333,7 +357,13 @@ int reset_control_reset(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_reset(rstc_to_array(rstc));
 
-	if (!rstc->rcdev->ops->reset)
+	guard(srcu)(&rstc->srcu);
+
+	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
+	if (!rcdev)
+		return -ENODEV;
+
+	if (!rcdev->ops->reset)
 		return -ENOTSUPP;
 
 	if (rstc->shared) {
@@ -347,7 +377,7 @@ int reset_control_reset(struct reset_control *rstc)
 			return -EPERM;
 	}
 
-	ret = rstc->rcdev->ops->reset(rstc->rcdev, rstc->id);
+	ret = rcdev->ops->reset(rcdev, rstc->id);
 	if (rstc->shared && ret)
 		atomic_dec(&rstc->triggered_count);
 
@@ -437,6 +467,8 @@ EXPORT_SYMBOL_GPL(reset_control_rearm);
  */
 int reset_control_assert(struct reset_control *rstc)
 {
+	struct reset_controller_dev *rcdev;
+
 	if (!rstc)
 		return 0;
 
@@ -446,6 +478,12 @@ int reset_control_assert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_assert(rstc_to_array(rstc));
 
+	guard(srcu)(&rstc->srcu);
+
+	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
+	if (!rcdev)
+		return -ENODEV;
+
 	if (rstc->shared) {
 		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
 			return -EINVAL;
@@ -460,7 +498,7 @@ int reset_control_assert(struct reset_control *rstc)
 		 * Shared reset controls allow the reset line to be in any state
 		 * after this call, so doing nothing is a valid option.
 		 */
-		if (!rstc->rcdev->ops->assert)
+		if (!rcdev->ops->assert)
 			return 0;
 	} else {
 		/*
@@ -468,17 +506,17 @@ int reset_control_assert(struct reset_control *rstc)
 		 * is no way to guarantee that the reset line is asserted after
 		 * this call.
 		 */
-		if (!rstc->rcdev->ops->assert)
+		if (!rcdev->ops->assert)
 			return -ENOTSUPP;
 
 		if (!rstc->acquired) {
 			WARN(1, "reset %s (ID: %u) is not acquired\n",
-			     rcdev_name(rstc->rcdev), rstc->id);
+			     rcdev_name(rcdev), rstc->id);
 			return -EPERM;
 		}
 	}
 
-	return rstc->rcdev->ops->assert(rstc->rcdev, rstc->id);
+	return rcdev->ops->assert(rcdev, rstc->id);
 }
 EXPORT_SYMBOL_GPL(reset_control_assert);
 
@@ -525,6 +563,8 @@ EXPORT_SYMBOL_GPL(reset_control_bulk_assert);
  */
 int reset_control_deassert(struct reset_control *rstc)
 {
+	struct reset_controller_dev *rcdev;
+
 	if (!rstc)
 		return 0;
 
@@ -534,6 +574,12 @@ int reset_control_deassert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_deassert(rstc_to_array(rstc));
 
+	guard(srcu)(&rstc->srcu);
+
+	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
+	if (!rcdev)
+		return -ENODEV;
+
 	if (rstc->shared) {
 		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
 			return -EINVAL;
@@ -543,7 +589,7 @@ int reset_control_deassert(struct reset_control *rstc)
 	} else {
 		if (!rstc->acquired) {
 			WARN(1, "reset %s (ID: %u) is not acquired\n",
-			     rcdev_name(rstc->rcdev), rstc->id);
+			     rcdev_name(rcdev), rstc->id);
 			return -EPERM;
 		}
 	}
@@ -555,10 +601,10 @@ int reset_control_deassert(struct reset_control *rstc)
 	 * case, the reset controller driver should implement .deassert() and
 	 * return -ENOTSUPP.
 	 */
-	if (!rstc->rcdev->ops->deassert)
+	if (!rcdev->ops->deassert)
 		return 0;
 
-	return rstc->rcdev->ops->deassert(rstc->rcdev, rstc->id);
+	return rcdev->ops->deassert(rcdev, rstc->id);
 }
 EXPORT_SYMBOL_GPL(reset_control_deassert);
 
@@ -600,14 +646,22 @@ EXPORT_SYMBOL_GPL(reset_control_bulk_deassert);
  */
 int reset_control_status(struct reset_control *rstc)
 {
+	struct reset_controller_dev *rcdev;
+
 	if (!rstc)
 		return 0;
 
 	if (WARN_ON(IS_ERR(rstc)) || reset_control_is_array(rstc))
 		return -EINVAL;
 
-	if (rstc->rcdev->ops->status)
-		return rstc->rcdev->ops->status(rstc->rcdev, rstc->id);
+	guard(srcu)(&rstc->srcu);
+
+	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
+	if (!rcdev)
+		return -ENODEV;
+
+	if (rcdev->ops->status)
+		return rcdev->ops->status(rcdev, rstc->id);
 
 	return -ENOTSUPP;
 }
@@ -635,6 +689,7 @@ EXPORT_SYMBOL_GPL(reset_control_status);
  */
 int reset_control_acquire(struct reset_control *rstc)
 {
+	struct reset_controller_dev *rcdev;
 	struct reset_control *rc;
 
 	if (!rstc)
@@ -651,7 +706,13 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (rstc->acquired)
 		return 0;
 
-	list_for_each_entry(rc, &rstc->rcdev->reset_control_head, list) {
+	guard(srcu)(&rstc->srcu);
+
+	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
+	if (!rcdev)
+		return -ENODEV;
+
+	list_for_each_entry(rc, &rcdev->reset_control_head, list) {
 		if (rstc != rc && rstc->id == rc->id) {
 			if (rc->acquired)
 				return -EBUSY;
@@ -743,6 +804,7 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	bool shared = flags & RESET_CONTROL_FLAGS_BIT_SHARED;
 	bool acquired = flags & RESET_CONTROL_FLAGS_BIT_ACQUIRED;
 	struct reset_control *rstc;
+	int ret;
 
 	lockdep_assert_held(&reset_list_mutex);
 
@@ -773,12 +835,19 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	if (!rstc)
 		return ERR_PTR(-ENOMEM);
 
+	ret = init_srcu_struct(&rstc->srcu);
+	if (ret) {
+		kfree(rstc);
+		return ERR_PTR(ret);
+	}
+
 	if (!try_module_get(rcdev->owner)) {
+		cleanup_srcu_struct(&rstc->srcu);
 		kfree(rstc);
 		return ERR_PTR(-ENODEV);
 	}
 
-	rstc->rcdev = rcdev;
+	rcu_assign_pointer(rstc->rcdev, rcdev);
 	list_add(&rstc->list, &rcdev->reset_control_head);
 	rstc->id = index;
 	kref_init(&rstc->refcnt);
@@ -793,13 +862,18 @@ static void __reset_control_release(struct kref *kref)
 {
 	struct reset_control *rstc = container_of(kref, struct reset_control,
 						  refcnt);
+	struct reset_controller_dev *rcdev;
 
 	lockdep_assert_held(&reset_list_mutex);
 
-	module_put(rstc->rcdev->owner);
+	scoped_guard(srcu, &rstc->srcu) {
+		rcdev = rcu_replace_pointer(rstc->rcdev, NULL, true);
+		if (rcdev)
+			reset_controller_remove(rcdev, rstc);
+	}
 
-	list_del(&rstc->list);
-	put_device(rstc->rcdev->dev);
+	synchronize_srcu(&rstc->srcu);
+	cleanup_srcu_struct(&rstc->srcu);
 	kfree(rstc);
 }
 

-- 
2.47.3

