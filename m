Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D67E32D0EA
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954303; cv=none; b=q2aO1RuIFEJAjw1mRI2GY7SheTs27SayZwciz/RPS5lwfgG2jnCRSY+rW47IFecp180FIO6NQA5rWSjLm+8y0w/v0wO44P9ZryXgEklRBv5dNo/fwqWvUOJByt4lcwQpZeyPpDSrL1aSJ0ZxX8N/fjqR6W+Qmu7zzlQ1ni1ulc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954303; c=relaxed/simple;
	bh=0I0qvqymRF9QoC70JOSPLWPw0M52SYeSoFmasyfSf3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gukWjWVwDrIfwOwiexsNRymEoAi/7e52CFe9SRWeNQ32s2IiRTvGTsIx6q/Cy3DVm+yiBHhmjtKP+xkkDu7rw9NpB3KZD51tW8MPNceYE/Ynitm+eqhAXqL+rVYE29xWRqZ/eKUvqQLjK9XNdTCKOv4uRg6nYnQbA7r4TirSXfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Li+DlOsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsjiMA3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Li+DlOsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsjiMA3X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FK5t1215338
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yyqEdTkNehZ
	DD9905IPSA7Oq8e/eLNXhAbCD4frPgqQ=; b=Li+DlOsuK5SgcvNPolNg2yRB9hL
	OXELOynD+JAaSPlxYOAsc8cFFWR/GOUyv1q5c0xEGITWS21zrgDZFr/hVBCDEu2R
	dFPwCuGCuBRz79bN/9TL513SbB2u61G/qUCLm7ktK77TVGd90zGFdSKN1R/Eo0Mt
	4+fxlHgug8ixnR753JETKkqufgWhrImoeGUjp/oXbgwRS+mbTqW3utC0Duhg1eRM
	jhNdg3JmskjBKHd2NSE0E2JlqIh/4smmtlmsRoYSiZMeCAYMOYnHtZHGb1MFfLj1
	YfDcnB3V6mOxYSuhxQuJ5IjgY/yj4qxx7QPpKGviFJVMPIsQJ8Z9yqcacmA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7g2686-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f69eec6so58426625ad.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954293; x=1766559093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyqEdTkNehZDD9905IPSA7Oq8e/eLNXhAbCD4frPgqQ=;
        b=QsjiMA3X/TPlaZfTKZ2zJbK9myO1itwW/VwNRnJt+ylPBBuIvuGtMXIPpRVWA7g6nt
         xSVdKh1ZY02ntCiIG2IIGGWKlEA4VQG1/fWfv5X/NHWCGgdprjvyZ1bhEXCcAiDZjN5h
         lW1Uc58F4tLr/fwI8UYrDiOXmVIYSEVmylssjQOXLcvWA2K4w1DHsM3NFQbNy0iUipB9
         WzEvcSY+B5RW+nmdbp7VGk9bdiAC3XnNYCauRULIwG+g/LqwgNA7V1EsytEix5TF65UD
         9P7+0apw3ACHaSmXkIlvdaxG0DQbvXcY702h24EYEdJyDUdckHCrausKCzdjH+iLyJhW
         WZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954293; x=1766559093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyqEdTkNehZDD9905IPSA7Oq8e/eLNXhAbCD4frPgqQ=;
        b=vIL7VUq7xfb9IXFOTr479nfCBXfdESwZ1PHifD6GSyyUdfE7jex7UdNvV3I6+cf9FS
         oIeREEb9FKWbYKpmlysPvmmu0hT6PmTF7elq/nmOt1X26H9o38eWVyhEucn4PZgIAWlD
         dXFGqKJs9UJYxNTwD0RhQKdHbKyKVqP1rKhgBm5pTm0qf45N2ecUeTCydeXIuMz+wX65
         /cXuqbp/8EIpeyiJaw91brtZzRSW+IeRYtTaX38IGkmyNMqBqqqUqRq/WoJrjMmKtlyr
         VqieY0SFdlPa4HByoYRy2m4LB52d/YmRiomEr5UDHcxhx1m2SCmFncT8J4txoBB1tl3t
         EaeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmuuf096ADPktChEiVlkKDuSn+K0bwcrGkRvomYYNGtIBfVz+qe9tNQkWgKaHP8qMNG/KzWrh8fRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOpLHVOhHvW+oMianOXJZWPFZGf3eX6W8kOlzcIT8tq/qGYLs5
	/xUd+UqBeMEiOUN/ZrGLj48kUxefhYoNSlGaTWtouKuBgVIKzsXhHuAQxLo+oSjvttLd6QLtnuJ
	Chuv7NvsVtzs93GaFeKin1IBuJ2LZ/FuyKkYwXDhAoXK3t+VhLqVEQ5e/Bt8U0+E=
X-Gm-Gg: AY/fxX6/Hxz9uF+D+DupvTLXPg+Fl9nN8dMdZ+AxYPA6IX3o8JBFlS27kN5yi8FzgIz
	WUFnX7PPVWW3CD9s/ZkPT2C6StWerYbxMCVIA0XQzYUJYHxJ40m+RJL6ZHTzDZLLkwyUf4gx7h7
	xnSXPp+pkxasoN+ea3OaRqZOQyXHwIfNCoPnicP6OZleHgzpaueIigjURvaDop6OtN9E9Q663q2
	LPkBRk+pgq4yCuSUdECbdcgVPFNxDorlxVByztywKOsSyvt2m2RSV7h9W4w2RURCUQi/LWGUEx4
	HtB0bzonTbPS9i9iBXQSWwHTGu2OWTC3f3A+OSiYfB29U1/GmLSZZTNI8fgDsmUT+d1Pz7f1rQA
	JyXPplMJ5JUz5c5HoAUUas9pXHlHS/eKsOXFkHqrIV93vOeCr1pPpcwO56zDzaODIxCKTaBLXZz
	q/
X-Received: by 2002:a17:903:11ce:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a13cd8d5c2mr49204245ad.57.1765954293257;
        Tue, 16 Dec 2025 22:51:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtqz6CiOwlW1tkl+yctLuwFblPw8bJgxrwHp/33FxU5mFEQrIOanR0EDlUZNhr30xxaWfvwg==
X-Received: by 2002:a17:903:11ce:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a13cd8d5c2mr49204035ad.57.1765954292751;
        Tue, 16 Dec 2025 22:51:32 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:32 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [RFC PATCH 5/5] rpmsg: virtio: Optimize endpoint lookup in RX path with RCU
Date: Wed, 17 Dec 2025 14:51:12 +0800
Message-ID: <20251217065112.18392-6-zhongqiu.han@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: FBxSb50u4gzddaMZcvUuyGJgpM3ivCsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfXyXIwxls7XFiA
 4zXkG6RF6hGzvGCx2J+cW5tOBIagUzGpNzkBo7fZ48JYkvQ4GpG6pDTYUlwGwceRXDtGbBaVPzA
 QrS0hGNqKCHMlKdBzgqlaarPYsoTQAC4PohjJsvNxh9w199B8QymjD8oIHFc1hbtChI6L0AvFzJ
 Sct6Xahoe/agfaNimKLVznvW0VzTTnqLhZ0fPr8b3IfuJUqphHP6KDfVudAbQT22+nnHeIwutaB
 UUqpECgNmpJCbmJ+EHDx2u9UPZOPFqGRd26xuLMXboUVs81cNsGyciBwjfEaA5trnmXphz7zyTd
 ZnTxjjs8YGfstsaqqQMbfPekaz48E3U9lHc+7QGc1EYIgfBpNH9ejvPGfoMo9TYAT0NT5xj9MNm
 W8Vg1Tu4ZvnoDYlDvHRR6QFOjqzjYQ==
X-Proofpoint-GUID: FBxSb50u4gzddaMZcvUuyGJgpM3ivCsL
X-Authority-Analysis: v=2.4 cv=PbLyRyhd c=1 sm=1 tr=0 ts=694252f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4XvfFkW6Ni2-fQWSjOsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

Endpoint lookup in the receive path acts as a demultiplexer routing
incoming messages to the appropriate endpoint. This is a read-heavy
operation (frequent message receives) with infrequent writes
(endpoint creation/destruction). Since idr_find() is safe under RCU
read-side protection, RCU can be used to optimize this path.

Convert endpoint lookup to use RCU:
- Read path: Use rcu_read_lock/unlock for lockless lookup
- Destroy path: Add synchronize_rcu() after endpoint removal

This reduces lock contention in the hot receive path.

RCU safety note:
When idr_alloc() returns, the endpoint becomes immediately visible to
idr_find(), but ept->addr might not yet be set. This creates a theoretical
window where RX could find an endpoint with uninitialized addr.

This is safe because:
1) When endpoints are created via rpmsg core callbacks, initialization
   completes before announce_create() is sent. Remote processors only
   send messages after receiving the announcement.
2) For manually created endpoints, drivers control timing and typically
   do not announce until ready.

Thus, messages only arrive after ept->addr is initialized, making this
RCU optimization safe.

No functional change except reduced contention.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 79d983055b4d..4cbb8a8aaec5 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/rcupdate.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/rpmsg/ns.h>
@@ -297,6 +298,12 @@ __rpmsg_destroy_ept(struct virtproc_info *vrp, struct rpmsg_endpoint *ept)
 	idr_remove(&vrp->endpoints, ept->addr);
 	mutex_unlock(&vrp->endpoints_lock);
 
+	/*
+	 * Wait for any ongoing RCU read-side critical sections to complete.
+	 * This ensures no one is accessing the endpoint after removal.
+	 */
+	synchronize_rcu();
+
 	/* make sure in-flight inbound messages won't invoke cb anymore */
 	mutex_lock(&ept->cb_lock);
 	ept->cb = NULL;
@@ -680,7 +687,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	}
 
 	/* use the dst addr to fetch the callback of the appropriate user */
-	mutex_lock(&vrp->endpoints_lock);
+	rcu_read_lock();
 
 	ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
 
@@ -688,7 +695,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	if (ept)
 		kref_get(&ept->refcount);
 
-	mutex_unlock(&vrp->endpoints_lock);
+	rcu_read_unlock();
 
 	if (ept) {
 		/* make sure ept->cb doesn't go away while we use it */
-- 
2.43.0

