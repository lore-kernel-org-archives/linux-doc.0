Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D02D238A
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747180; cv=none; b=V2/BOTV9SMuRrX+/rrlrHt+eDep83N0ETAhWtOKcGvBsjSzWZUOqywvVhZPyTI4ek+upzCvxNH5Lcj85aL0ZfrBmFN72zH9DrHlY5oj1JowRPARc1KK3qWA9FtSeD1NQLxHLjH3hZBnEi69eTv7VL3mFpnLG27ObxH33cgA22dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747180; c=relaxed/simple;
	bh=iyX0qmfaG81Rj41H7X2QPhit2JQzbYOp/KdP09pUD9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJqbOA9r1hhNJRwJje4namTGjl/bcwwRMdFNePL31KPwEr1Sxuj0iphM6SGPABgbtlhKJVkJUFxQrkqW+n2rjrQKqp0iEpOapjlqc8OLJVXcleRMKfvKokrx0un7mNQTZCQ4mx5EbrCRGbg1M1VRMen190F2/0GQAjB23OJGYAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNchSM+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE8n7s4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNchSM+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE8n7s4i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmYfm1802716
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 21:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w6k8+DCPmvVS0VzBd1DlzrWskZqznfWtGoXnFeE7JRQ=; b=nNchSM+9zrXqc//l
	I9qvK5eJ8PrIe7ZtPyZPSreumwlr6NNn12k4VvWKWATdQJ4gO08lvE92ccQotyKu
	/4GTyvQeyB6iFe2Kwb5j+IkAo93aq/k5Puobc1IH9/BIPzqkh0sT9EpwSc26y6It
	3cl+xfxtYfsfXnFo/SdQNO5bsRVzEyGXMElogOpQo4IAjqmKqrx4IY/ZjUrqC2K2
	xnpBmMq48g6kdDpE1HfWyqI6JH9/w94Qyd3cRgjJs5qfQL5+UwlOY2qIZQ4kh26O
	V33uBXs1pbuT5oDwZuk91ZQ2XXwxR/cvm0GcZNXP9bpB06v/cLCwKZBYsGsw5mut
	cDvlsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srhtjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 21:46:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so5876283885a.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747177; x=1773351977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6k8+DCPmvVS0VzBd1DlzrWskZqznfWtGoXnFeE7JRQ=;
        b=XE8n7s4iC4gB37HqsZDo3523SXgMArVsUrvUpkENuaOitYynePFWDAkRxrLIsonUPx
         WEP5k3vYLYBK9sRR6lnhKZtJeJzaQ9/W8oY6gXmSQXdVN9S4WrcBxn6uV/P6eQow/Y+U
         eb1FOa+4HmkOOjfsepgg6q2EWvi2NmzLZZSfLLSkucrgi1tRkH2EoweRIkSqodTyyuBA
         NoNJgvL+LSX60mLNaiDKx6PNdfJ0g9P7ddLw+1Loi7gsz5dh2ZcF8bFhzSUcFOnPFold
         f2n6VfIM2GMz8Y+dg0MApN5WHLQ4pZyficw3QzAhJeHpQvZ8q1XuVN9ku0o+CMMssYcS
         vt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747177; x=1773351977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w6k8+DCPmvVS0VzBd1DlzrWskZqznfWtGoXnFeE7JRQ=;
        b=vmyK1lhSMCcysxgvVo8eQSjvRjPz70jdlRYuikgiS7GUAKZegpgkxsa6LCXBFpy2MF
         fnQc/gJkl/JF2I/7GkArMqc/q6/VOQEGJewlGsUIQxHbY7IvlbdQ6G7Pb5RW9u3/950Z
         sdZql6MGxbMu/QkGRlwosX7MFiMQbpurrMvzfPNnitAmM6RqvEjXerhc7krKPwZiTdVs
         GQHSONaVuFWTgAut99SR37UxKEvdlQGPJmlaJs6+m/CR9tfhgfbc3qqtvP01pJ8gcVo5
         A7pSs4bMHbmR6jswNDRnaW5sK7FZjQeY2tOUrqkwN7tY1jshZN6il5O6xaYfppdeMtXU
         /eVg==
X-Forwarded-Encrypted: i=1; AJvYcCXQAZRmz2tbeNanLQ99g49+LpAu3t+yzM7aKDKHIki/j7Qy7emfnfaA3ugG6sOiE/VRIFOsHnd83fA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZWr5Agr4lYIMGNo3BJlaCIEfCzlSjvckZkIZFN7qgftbbI2J
	N9K/msM8Cvl0+67HX4TPOdDAJCcteqYWNpd1EhW21Hw0MWVIrpj4z3toXe4Ip7y5X802AQ62w2v
	Qncn3icW0OLVMSFpSaE5T18Gc2P1UCfK9Wg9InPG1exbOjhbjum1jhgwVrP1SccZL04yRdXs=
X-Gm-Gg: ATEYQzy96WXP5ztln+s9s2DJq2mNPZpufXlVxVfeV+NVIAlz2ukTWXqQHA5+3hrnbmM
	CjSl/wgDF4HqAZu3AvfoWVH92yI3J3Tx3zEa/MFSSvZDRpKsPzpBOgWb2gUW3zzdkF0s1ZFaFCN
	9y7tg/IzNAmDJMI6A/MWCFXZAovqxDZ5NCZIKH+tQoBEOm+eZTjCu0U4cbmZjnxCFA7hHv6q0P+
	VpqiUv3QhUNUnuU4d8yI7bPnsriwo4jCta0fgFZAXc2040FU9a/0PCFrG9rdBKETEvJwPItEtOh
	jxJF0RdUdRRt/o8C+r6rvbS+nRlxV2cKZRZumgzK1CzpfYa+ZnoFEBNR286MJUJBABdJ61Xj9nO
	isFPNRPUkrwjYtwlyVhj/Hu9Jn7WXkG69F6GJzGDjiZv5
X-Received: by 2002:a05:620a:4688:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cd6d4eb0b2mr855085a.65.1772747176642;
        Thu, 05 Mar 2026 13:46:16 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cd6d4eb0b2mr849485a.65.1772747176172;
        Thu, 05 Mar 2026 13:46:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:40 +0100
Subject: [PATCH v2 01/10] workqueue: devres: Add device-managed allocate
 workqueue
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5216;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iyX0qmfaG81Rj41H7X2QPhit2JQzbYOp/KdP09pUD9I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmZqlqPt/O4g+aJVCPVwYCdNiMJivVoKJNv+
 nfTlOEuLkCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mQAKCRDBN2bmhouD
 12BuEACE9UGRO8qQNKFX1PzUCZ/Fq7vepWE4JCBJk0nfeFyl0KogKdTFRFTSJsUiy3dJS0tzFJW
 7WNmnOlxd7SbvQyXqVrx+RdQC5wbgOlI+Sol+ecKeyExdYtDYLCU6Owm28wDGtgEkTE9mJfiM9o
 mUyXPEsHEcoqBmimZTT+FwLmUGknfHEglow4Am76QGjLX7IsZ3LhKVzM7Rj5iFP939x9p3Fk11w
 b+DQjHaOHIrzD9Wa5iyoaD5SyIhn2ixaHFTdqx+km8ivIAkp2A0vJTGfQAcmeqXOmlcJSzg3fSv
 yBMQ5Xz30FMatrz/Zrj9+z3clMPhYokj8lrGHYK0+YKKKrfu6VJaN9XKe9p1JJpWLxQ7M1cWPyt
 rMMSWtOdvNnAqcUcfCchdEQeCIz4WkpMrfcQv/qQcaLUAyED27AZRfrVc+YMK0f3FZz8q4bzJMk
 hqqq995Ee3ptNIv/y1mnunKPueHyuf8L7BiWhF6YA7c4fth+txTnuvKup5geymqojDZqRmq2WK7
 H7jl8/lUbJeUYr4tXJpgcnKQOwns3MJFViLP5yUd38U6Wq0fz/CcCbhh5hF4ga3EPuYgPZjILVl
 fkIsr48Wel9gwyvGlG14kKHUQ4hQe95Gr7l3enhfn4+YMk73kivz3PW3tYXfn3xR7L4J5bS1n+d
 uBhhIvG9s2KLDyA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9f9a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7xz5_SZBKAcHatMQKAYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FqWwJiXMp0Lu1sq3HLiEfoeKlM_7DKBn
X-Proofpoint-ORIG-GUID: FqWwJiXMp0Lu1sq3HLiEfoeKlM_7DKBn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX0YF8G8qlffTO
 nzC/mAguxcr19ZYIlKTmHDGdWo7wU4vdkD9ZWFlj5NAAr1fT7CMATcGXxdTuMZ3clnk77xLOuFn
 ZVAvGNqx8St0AvRRfAz7BgxFFgE8UYmLLGeneXLr+y5nBNRHJ7TKOckapo8bTgNwbQ0I5K6iOoy
 ttsLlPVlMKXUEdE0n8iEiFZf377L047iylRqP5BS5J+dEYOAON5tQih7q7qcdjPxbMQgFI9eSZS
 WnurivH5GlD5egTnUp/9GONizXvquKO1Ii5M3LI1RONGSK1DUFru23TRA6BE2nJdI/zJxPOSte9
 6rocwf8TAeiBSQIiu8qGKuCjPLQVRPwtXBYlqoffDEZ7WydTwZulMXNzIU8wCJ7XtxPB/opOruK
 /vAmZ+1+LlB4SuHbtCQsdNSRbCBUESFiqCfe/VozYx28Vmru/Eb70Y+PYknpqCWF509YDI1hymM
 JweEIYMnSFxXZ+7AeKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Add a Resource-managed version of alloc_workqueue() to fix common
problem of drivers mixing devm() calls with destroy_workqueue.  Such
naive and discouraged driver approach leads to difficult to debug bugs
when the driver:

1. Allocates workqueue in standard way and destroys it in driver
   remove() callback,
2. Sets work struct with devm_work_autocancel(),
3. Registers interrupt handler with devm_request_threaded_irq().

Which leads to following unbind/removal path:

1. destroy_workqueue() via driver remove(),
   Any interrupt coming now would still execute the interrupt handler,
   which queues work on destroyed workqueue.
2. devm_irq_release(),
3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.

devm_alloc_workqueue() has two benefits:
1. Solves above problem of mix-and-match devres and non-devres code in
   driver,
2. Simplify any sane drivers which were correctly using
   alloc_workqueue() + devm_add_action_or_reset().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

All further patches depend on this one.

Changes in v2:
1. Drop devm_create_workqueue(), devm_create_freezable_workqueue() and
   devm_create_singlethread_workqueue()

2. Simplify with devm_add_action_or_reset()

3. Do not export devm_destroy_workqueue()

4. I did not move the declarations to devm-helpers.h because consensus
   was not reached and I think it would not be accurate place. The main
   alloc_workqueue() is here, so should be the devm- interface.
---
 Documentation/driver-api/driver-model/devres.rst |  4 ++++
 include/linux/workqueue.h                        | 22 +++++++++++++++++++
 kernel/workqueue.c                               | 28 ++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 7d2b897d66fa..017fb155a5bc 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -464,3 +464,7 @@ SPI
 
 WATCHDOG
   devm_watchdog_register_device()
+
+WORKQUEUE
+  devm_alloc_workqueue()
+  devm_alloc_ordered_workqueue()
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index fc5744402a66..66a94c171b0b 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -512,6 +512,26 @@ __printf(1, 4) struct workqueue_struct *
 alloc_workqueue_noprof(const char *fmt, unsigned int flags, int max_active, ...);
 #define alloc_workqueue(...)	alloc_hooks(alloc_workqueue_noprof(__VA_ARGS__))
 
+/**
+ * devm_alloc_workqueue - Resource-managed allocate a workqueue
+ * @dev: Device to allocate workqueue for
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags
+ * @max_active: max in-flight work items, 0 for default
+ * @...: args for @fmt
+ *
+ * Resource managed workqueue, see alloc_workqueue() for details.
+ *
+ * The workqueue will be automatically destroyed on driver detach.  Typically
+ * this should be used in drivers already relying on devm interafaces.
+ *
+ * RETURNS:
+ * Pointer to the allocated workqueue on success, %NULL on failure.
+ */
+__printf(2, 5) struct workqueue_struct *
+devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int flags,
+		     int max_active, ...);
+
 #ifdef CONFIG_LOCKDEP
 /**
  * alloc_workqueue_lockdep_map - allocate a workqueue with user-defined lockdep_map
@@ -568,6 +588,8 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  */
 #define alloc_ordered_workqueue(fmt, flags, args...)			\
 	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
+#define devm_alloc_ordered_workqueue(dev, fmt, flags, args...)		\
+	devm_alloc_workqueue(dev, fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
 
 #define create_workqueue(name)						\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM | WQ_PERCPU, 1, (name))
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index a1bfabeaef41..5cc5e6a400c9 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -41,6 +41,7 @@
 #include <linux/mempolicy.h>
 #include <linux/freezer.h>
 #include <linux/debug_locks.h>
+#include <linux/device/devres.h>
 #include <linux/lockdep.h>
 #include <linux/idr.h>
 #include <linux/jhash.h>
@@ -5909,6 +5910,33 @@ struct workqueue_struct *alloc_workqueue_noprof(const char *fmt,
 }
 EXPORT_SYMBOL_GPL(alloc_workqueue_noprof);
 
+static void devm_workqueue_release(void *res)
+{
+	destroy_workqueue(res);
+}
+
+__printf(2, 5) struct workqueue_struct *
+devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int flags,
+		     int max_active, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+	int ret;
+
+	va_start(args, max_active);
+	wq = alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+	if (!wq)
+		return NULL;
+
+	ret = devm_add_action_or_reset(dev, devm_workqueue_release, wq);
+	if (ret)
+		return NULL;
+
+	return wq;
+}
+EXPORT_SYMBOL_GPL(devm_alloc_workqueue);
+
 #ifdef CONFIG_LOCKDEP
 __printf(1, 5)
 struct workqueue_struct *

-- 
2.51.0

