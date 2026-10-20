Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507545;
	b=KuirHMTjFHtvmoSv5hN2DE6+U9DIkivDgxoXwrMInwT2j/t3Dd2Q4rggu1TkGl6DBzM1
	 Rm7l+wsERorTjoOv1ykACOqmNNW3Zpt8MLHO4Psq28gjW3Pd2FeAeg2B0Cg+l4Keox7T7
	 qWTzkFV+ii3lVDN7eQrA6oDhRUlMYAq6PnY9+91gdmFH+PgHvuBJR01B/3d+0gmgzgVcH
	 b4cn9OeO+G5+3LnbKOBvQRjyM2wCHbu0gEVXrFV93YdKKBcW/Q+xHn6gbqE1fK0ig2Ehn
	 8jRezdOgj0TPYF+30+VorPLyXPQRhWegh9y043eLZee48JieNZtubaBQbUFvPeyyCyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQJux036u0=;
	b=aeYxWniD722Qbk9ODuUXt0LFYhlCXDK0NjvEh2GFSdLjsd/jJ9hANp9S+fVwolPYmyHg
	 ZZAecsuskTbYYVXweQNJR4n+BG4+RU5Ogggf93jcI/DSW6qfuYu03GY6VjwQZCZsZqrbZ
	 yAKjXaqJ8z7yua4KWvxi40d1IVKGbISbjkbx20whWbaNuZdx+e894rcMGFADaqh4e3Pvy
	 1J2+SiKPd/9FTCCt2G0lj7O0rndw4CZgHPdN7RXPdayEq/RMotaqbJpZvS6tdsKJSHV+D
	 iLDH/R4YX/m5i6UBbM6hfJRYDEn6KYG4TBf8CKsAAJWFuhLTSIyrKgMB5ONKzq3CkSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hLMMg0QP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiixKM7c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073FC606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 073FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hLMMg0QP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiixKM7c
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA5Bm2809827
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQ
	Jux036u0=; b=hLMMg0QPCCSRW1jxQN0pwOX162ofZo2sdj7Uph673jP7aGe2K7a
	/+rirvtt/Grar/hgd667SoVlXSplzEGDDDZ2NfWUXoDCmVN5b4qUntDRnmbmPLZW
	TgfzPoiQyXQCf1RoWSLOXotJ0wH6C0ONGfHtpf68OfTxQ9XpSXEmemUvvSEcUhfK
	xtCT8PjJSns+Z0jTYP0aRN2P5+wRFQUunr59qVRYQeM5LCKy2dIRZR2ECaXM3M7F
	b5227oqMXtn7yoi7dcJdPnsYWxi+5W/PlyDAdAb7PqjJvuopDwM6yUDomyci9D0t
	X3Yb9E/vByA3podX9AoPFZUamMaceyvF+2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2yuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:45:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so701587085a.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792507543; x=1793112343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQJux036u0=;
        b=AiixKM7c3pezyKQVLd/LBGuIZLym/YwVBCn9cslknsPTk4Xe3rW5o16DpINd83xK7n
         7dy251gV7On5WREI5Zz5V7cJRsh1Pnp0vdTP/5/9iq7MQBmlGoP3B+OHllIqnyzQV6/8
         f65Cadulv4P8cVSjtR0XdWhMLBS4ys2GB4uxTSk07czc3yXG5d43ROJFwKnY3URIVHBW
         whpLFqRFJs3F8P/3xeY/qKvLzmDNjw0L7D7k1Nu7X3MEH22vVYneJ6plDKaSjifZvMFo
         84Ws5i7zoCDmxUIqZT4PWJb8WT41PpWsRbcZzRvaMqlEZhkmJLICUFDLiIqqQmsFG4e/
         LygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507543; x=1793112343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQJux036u0=;
        b=s3EUDgVahuFprK79ft3I9JOJG7ius1dLy1gwjx4pZ9m6Po7RZRgeparS6JwWBvC2kP
         CqtRYcZtcx3VKBdrJGzOcR4FCMprMEsTn8ZwFOClNBSd3ruiiYssHndSIogcid44xpWB
         72+RxrbyNCaqLl5BlU75ntiYbguHQq/uGiz6d1J1pAYQdtcXVZbJsZFoWedi1VZ+GfBu
         vSyk46BXLBD6ieExlSQHNJCwVp7z2l9vpZE8q0/UBqRcOdmy/TU/F0Qmna/jjfHOlSR3
         mXmuzKikn80P8JL0C59J2gAcBbQ+fyAFKvr1VVvz4EEoxKaicRKw4z0N2zXvRw5uHlJt
         BVgw==
X-Forwarded-Encrypted: i=1; AKwUvBxWRJEQ5DdPN26WVPwouuo74JO13Y/D+e6rcdNAL+aRfL95xcpXAsVxdpS4v8GcHicoehIwVSOJn1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdRjbdHWjryNjZn80+eulQpZXMnF51rWRdL1svlkuxjQiS+Ajq
	VnQXTTluDAGG3JUifbeb8vXy7tZ429VEnXObhPqsC4d34iQEyQ8lIxMFu6F5A6JN+M+le1C5owH
	jD7ssMnFB3qvA9un9esL6lRDgLkkmfzCUWx6tOpNVDIWDb/Vj27zej9m2ulZGn1k=
X-Gm-Gg: AYBFou10ZsIKr0csUQqsatukn0ESszmDmOrjlI7Z2jmlYQcO8bEUz/YkXUTCZgVNFPZ
	2Ybnpj6riBAr5XIHYU4A4cJ3VAXuoFYs7vjD1j5YOmWDPXcc3f8FENXEnib/q1EADyEkZha/rnD
	KIDQCAJUORcN7J4dc2z7I5DNKv17INGzXaP2Q91dwo6BGrzuH8lbOekwPc8YcqgVrCWIpRfljWX
	8+mpD19NwDrDlAIkdP8NXTMqgP2cOG6xIryqmwT9JAn4zCoFB3SfsQcW+p57HpkEcUafqL31k33
	Yfu+J5pLHpbxDGHv+iWgpwOa7wSGJGya7i57DspDsvxpoiYrgOTPB+Xb0Bju2IDMVQ7ciKYFhw5
	xYv9F8pR5yvoLq+X1EUQ4GXrdrb0=
X-Received: by 2002:a05:620a:7014:b0:912:1206:ddd1 with SMTP id af79cd13be357-93f29b46ad7mr1631406385a.1.1792507543023;
        Tue, 20 Oct 2026 07:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:7014:b0:912:1206:ddd1 with SMTP id af79cd13be357-93f29b46ad7mr1631380385a.1.1792507540863;
        Tue, 20 Oct 2026 07:45:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df370381sm179377585e9.1.2026.10.20.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:45:40 -0700 (PDT)
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
Subject: [PATCH v3] platform profile: Separate handler locking from sysfs lifetime
Date: Tue, 20 Oct 2026 16:45:25 +0200
Message-ID: <20261020144525.3265851-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9LqbUAWIpqUfggw0PKg2AhzMc4m8m7KB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfXzAa9WMnJXsAg
 k1E84rMPJ/fvQcdYLmteaRAeN4vwx+oP4bae5z0AiZ0dw6cJV669nh3K/EYNbIX1BMtOX3D5VCZ
 mGpFD14WlA8YYUYQJAM0VoHzcWe+dp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX9p6uM3wTq5/r
 QZTeYncYRZpZGP9hIJmimJ7FCYHNvNgdYQeP4lbe9QMfA3jKLY3FdZEjH+QxSiu0VYZXh7+SsjQ
 8bP/FggOWit85Wy6Fr+foGFtsrYaP1onyQtNsUUJwq83lYrTTe6/U+ZJZPo/0BMjVqIMkKucboP
 iTgrpgOW5a+k9c04xrUJ3WCUEgrP2DYMstD3euy7q8TDfhi8bpw6+3qK1VKkSuicsXDPTuyBnl+
 eMBNe9ZJnR2mhWS0G+dz0gsSra2s+b58p4tqE7fP6mTCu4wo89a4wllpyO7lCuQlWR/9Rv8wbez
 XTOnyeIJs+GVRNDRP+q8eoA3QCokjLU+6WjF+kO2bPjyePEMo5m1VL7HA2Y6qjXmWWug9S6HPtz
 d42UYOneayIE4TIOJNfJXUjpnKdJfjn5wbcohIzF6lhqfNM4ZyEXXUT8qqSioF6JhXzuf9wu4t+
 cIS0LkROwIqI3zfqz2w==
X-Proofpoint-GUID: 9LqbUAWIpqUfggw0PKg2AhzMc4m8m7KB
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad77e98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=4c0kPULnjDDMktAHOzUA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200058

Registration and removal currently hold profile_lock across
device_unregister() and sysfs_update_group(). These operations can remove
sysfs attributes and wait for their active callbacks to finish. The
profile read and write callbacks acquire profile_lock themselves, so a
concurrent access can deadlock:

  Removal/update path             Active sysfs callback
  -------------------             ---------------------
  acquire profile_lock            hold kernfs active reference
  remove a sysfs attribute         wait for profile_lock
  wait for its active references

The removal path cannot finish until the callback returns, and the
callback cannot return until the removal path releases profile_lock.
This applies both to per-provider device teardown and to updates of the
legacy aggregate attribute group.

Commit 041142d7d252 ("ACPI: platform-profile: Fix possible deadlock in
platform_profile_remove()") previously fixed this lock ordering by moving
sysfs_remove_group() outside profile_lock. Commit 55b1e68134bf ("ACPI:
platform_profile: Use guard(mutex) for register/unregister") reintroduced
the issue by extending the mutex guard over sysfs_remove_group(). Later,
commit 77be5cacb2c2 ("ACPI: platform_profile: Create class for ACPI
platform profile") replaced that teardown with device_unregister() and
sysfs_update_group(), still under the same mutex, extending the problem
to class-device teardown and aggregate attribute updates.

Simply dropping profile_lock around these operations is insufficient.
Aggregate operations currently discover providers through the class
device list. A provider being unregistered could therefore still be
selected for an aggregate read, write or cycle while its sysfs files are
being torn down. Concurrent registrations and removals would also race
when updating aggregate attribute visibility.

Introduce profile_registration_lock to serialize registration, removal
and aggregate sysfs updates. Sysfs callbacks never acquire this mutex.
Retain profile_lock for profile operations and use it to protect an
explicit list of handlers participating in the aggregate interface.

Add a handler to that list only after device_register() succeeds. On
removal, unlink it under profile_lock before calling device_unregister().
Acquiring profile_lock first waits for any aggregate operation already
using the handler to complete; unlinking prevents later aggregate
operations from finding it. Release profile_lock before draining sysfs
callbacks, allowing active per-provider callbacks to complete before the
device is released. Apply the same unlink-before-unregister ordering to
registration error cleanup.

Walk this list for aggregate reads, writes and profile cycling, and use
its emptiness to determine aggregate attribute visibility. The class
devices remain the per-provider userspace interface.

There can now be an interval between removing the last handler from the
list and removing the aggregate attributes. Explicitly reject choices
reads and writes during that interval: the intersection bitmap starts
with every bit set, so an empty traversal must not advertise all profiles
or report a successful write without updating a provider.

This separates aggregate membership from class device teardown while
preserving the existing class and ACPI sysfs interfaces.

Fixes: 55b1e68134bf ("ACPI: platform_profile: Use guard(mutex) for register/unregister")
Assisted-by: OpenCode:gpt-6.1-sol
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3:
  - Send the locking fix as a standalone patch, independently of the
    firmware-agnostic extraction and legacy-interface deprecation series.
  - Document that profile_lock protects handler-list membership and
    serializes profile operations against each other and handler removal.
    Explain why it must not be held across sysfs teardown.

Changes in v2:
  - Expand the deadlock and handler-lifetime explanation.
  - Add the Fixes tag and describe the earlier fix, regression and later
    extension to class-device teardown and sysfs group updates.

 drivers/acpi/platform_profile.c | 80 ++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 33 deletions(-)

diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index 79d2e92e5c28..d79080a20e21 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -8,15 +8,25 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/init.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/platform_profile.h>
 #include <linux/sysfs.h>
 
 #define to_pprof_handler(d)	(container_of(d, struct platform_profile_handler, dev))
 
+/*
+ * Protects profile_handlers membership and serializes profile operations
+ * against each other and handler removal. Never held across sysfs teardown,
+ * which can wait for callbacks that acquire this lock.
+ */
 static DEFINE_MUTEX(profile_lock);
+/* Serialize registration and sysfs updates without blocking sysfs callbacks. */
+static DEFINE_MUTEX(profile_registration_lock);
+static LIST_HEAD(profile_handlers);
 
 struct platform_profile_handler {
+	struct list_head node;
 	const char *name;
 	struct device dev;
 	int minor;
@@ -44,6 +54,22 @@ static_assert(ARRAY_SIZE(profile_names) == PLATFORM_PROFILE_LAST);
 
 static DEFINE_IDA(platform_profile_ida);
 
+static int profile_walk_handlers(void *data,
+				 int (*fn)(struct device *dev, void *data))
+{
+	struct platform_profile_handler *handler;
+	int ret;
+
+	lockdep_assert_held(&profile_lock);
+	list_for_each_entry(handler, &profile_handlers, node) {
+		ret = fn(&handler->dev, data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * _commmon_choices_show - Show the available profile choices
  * @choices: The available profile choices
@@ -306,20 +332,18 @@ static ssize_t platform_profile_choices_show(struct kobject *kobj,
 	int err;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &data, _aggregate_choices);
+		err = profile_walk_handlers(&data, _aggregate_choices);
 		if (err)
 			return err;
 		if (data.count == 1) {
-			err = class_for_each_device(&platform_profile_class, NULL,
-						    &data, _remove_hidden_choices);
+			err = profile_walk_handlers(&data, _remove_hidden_choices);
 			if (err)
 				return err;
 		}
 	}
 
 	/* no profile handler registered any more */
-	if (bitmap_empty(data.aggregate, PLATFORM_PROFILE_LAST))
+	if (!data.count || bitmap_empty(data.aggregate, PLATFORM_PROFILE_LAST))
 		return -EINVAL;
 
 	return _commmon_choices_show(data.aggregate, buf);
@@ -384,8 +408,7 @@ static ssize_t platform_profile_show(struct kobject *kobj,
 	int err;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &profile, _aggregate_profiles);
+		err = profile_walk_handlers(&profile, _aggregate_profiles);
 		if (err)
 			return err;
 	}
@@ -423,15 +446,13 @@ static ssize_t platform_profile_store(struct kobject *kobj,
 		return -EINVAL;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		ret = class_for_each_device(&platform_profile_class, NULL,
-					    &data, _aggregate_choices);
+		ret = profile_walk_handlers(&data, _aggregate_choices);
 		if (ret)
 			return ret;
-		if (!test_bit(i, data.aggregate))
+		if (!data.count || !test_bit(i, data.aggregate))
 			return -EOPNOTSUPP;
 
-		ret = class_for_each_device(&platform_profile_class, NULL, &i,
-					    _store_and_notify);
+		ret = profile_walk_handlers(&i, _store_and_notify);
 		if (ret)
 			return ret;
 	}
@@ -450,22 +471,11 @@ static struct attribute *platform_profile_attrs[] = {
 	NULL
 };
 
-static int profile_class_registered(struct device *dev, const void *data)
-{
-	return 1;
-}
-
 static umode_t profile_class_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
 {
-	struct device *dev;
-
-	dev = class_find_device(&platform_profile_class, NULL, NULL, profile_class_registered);
-	if (!dev)
-		return 0;
-
-	put_device(dev);
+	guard(mutex)(&profile_lock);
 
-	return attr->mode;
+	return list_empty(&profile_handlers) ? 0 : attr->mode;
 }
 
 static const struct attribute_group platform_profile_group = {
@@ -502,8 +512,7 @@ int platform_profile_cycle(void)
 	int err;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &profile, _aggregate_profiles);
+		err = profile_walk_handlers(&profile, _aggregate_profiles);
 		if (err)
 			return err;
 
@@ -512,8 +521,7 @@ int platform_profile_cycle(void)
 		    profile == PLATFORM_PROFILE_LAST)
 			return -EINVAL;
 
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &data, _aggregate_choices);
+		err = profile_walk_handlers(&data, _aggregate_choices);
 		if (err)
 			return err;
 
@@ -525,8 +533,7 @@ int platform_profile_cycle(void)
 					  PLATFORM_PROFILE_LAST,
 					  profile + 1);
 
-		err = class_for_each_device(&platform_profile_class, NULL, &next,
-					    _store_and_notify);
+		err = profile_walk_handlers(&next, _store_and_notify);
 
 		if (err)
 			return err;
@@ -583,7 +590,7 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 		}
 	}
 
-	guard(mutex)(&profile_lock);
+	guard(mutex)(&profile_registration_lock);
 
 	/* create class interface for individual handler */
 	minor = ida_alloc(&platform_profile_ida, GFP_KERNEL);
@@ -604,6 +611,8 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 		put_device(ppdev);
 		goto cleanup_ida;
 	}
+	scoped_guard(mutex, &profile_lock)
+		list_add_tail(&to_pprof_handler(ppdev)->node, &profile_handlers);
 
 	sysfs_notify(acpi_kobj, NULL, "platform_profile");
 
@@ -614,6 +623,8 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 	return ppdev;
 
 cleanup_cur:
+	scoped_guard(mutex, &profile_lock)
+		list_del(&to_pprof_handler(ppdev)->node);
 	device_unregister(ppdev);
 
 cleanup_ida:
@@ -636,7 +647,10 @@ void platform_profile_remove(struct device *dev)
 
 	pprof = to_pprof_handler(dev);
 
-	guard(mutex)(&profile_lock);
+	guard(mutex)(&profile_registration_lock);
+
+	scoped_guard(mutex, &profile_lock)
+		list_del(&pprof->node);
 
 	ida_free(&platform_profile_ida, pprof->minor);
 	device_unregister(&pprof->dev);

base-commit: d0cd1e850e1602729dd60dc3c5fd96f80e0cdc5d
