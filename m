Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811440;
	b=5dRuUCDJgL4YAJHbj7wksaVIW3SMou9WlB0JLZIIeE1wfHsJ9WZnyNcwp/3nGsJDvLkt
	 5s1di51J5Q8MOAJAcq34lECZZaMPHfZvbpQxH108rwQX7XJzBBTGZRKMSeXOC1yJw+DLV
	 CAqTUF3CxCTVmu0Bc61l9+nEDAt54X5KYgLFr5Kr/4zZ7LcZYeBwMOTTFB141076R+Znz
	 eZQFYGRwHMxIHfcYlOcPHDyewUVYVYygY1uxtvbqFupM197LYd4ECYyyc1B7UexE8kICh
	 ghHvJPN2Wz6P872RfNRldHU1kiVlqO7f4hJ4Rl6v0QmmXwgCF2D+AlBw8HylRwFNcjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
	b=M5z4b1x/Y5T3JCwLTWZXeTpoe2Jsg2Weib35ZqbdO9c5IM08TD/rv1xHC/wzHzUUOadP
	 Lr+tbErm3gsHOODd4zMCDMlGKYTbI09P59htyts4gCnLGOSnQ6B3JbJxm2319Ir6CTUaM
	 uEpBbxZ6pDc4LMBqlSxjs/emFhbnmXh4a97lN8XMQLQcbRAxpOjl6cPLXVY06LctAN0nM
	 kse5Khm/LVIZYChQ+I3rXTt1/xEy+8YHW2WdAjDwbx9C2VokVhA5xuYqCVX+cbpuE128r
	 BSBRKY19yJCwM8OGraT3vL/v8Zpxk9ViOoP3ehLTv35E5jFPGEHdmJJQQImXAFPXm3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2vGqyXw;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C6606D81D
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 545C6606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2vGqyXw
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so1615350c88.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811439; x=1794416239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=s2vGqyXwPr8s8Gwnu+VGfdfhZQeEInJKusCv7m1LoH8gsWmASFBvbyNMs9FBKJlW4O
         w/PVKNUu/g2ucDcu6JfiST2Wof2Fl94gdHZ4+ToBlnIzT/4AIJVZdBXNtfPGgAsBSqgL
         1/H7gD79joZjeV2l7BTgbhHhmsrcUArqUyxofoaxNIRNKZ6pXyvjQoIzVqbOhoi8nuhZ
         fkgYG+m4CXSEayHsN/tPLXn4fNqtbBO24dqtc4eImBmZZc46UFPcDPz6pSP8397LHEzs
         VPar8yqhNIXgw10k7ke3w5+ezHaZBRs6WLV+x1r+x1dxeu/U2t3tk2qW6oum4qlCYTQ4
         cs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811439; x=1794416239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=yW2ROwOvNftPCKg1cMdZsYXcvfnpCT87DQGc9y7OBOzdoHzNi5VYJBJQhf/+x6UmPl
         KKIwybjJJt5SXcfio1JahhndOGthZuR4/+2+wITj4Sm1pwComMowk9c4T2SVmPHpKaB7
         5tlkhRstOgqhvBr3Ygy/bIGILw88DSc5f+n2OQnLr+gBYrXtf9obth+BYpyAOwJEmlYh
         mQFJ1KpnTC3VJVZ9AiHjMPzr6Vfc01KmsLE+hlW7lXA2gE9bdY688aiTg7R6WHMoBpGN
         H6c/nw1ot9k8U8RY9NIdtO/IfAtCTdjPYIwAJ0dICjgyKBnNgA+rYGQoKpLVBKJC2KVJ
         +v7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzA0yhATPJ8eX6eU4x7uHPHI7eXwGAVQivJhANuDl5dr1vE6Ie5Uc2Bl+oB3ZAco7gJOAVwCdpcnKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pwssgyKNLZeYxu6sZ15m1oNlfDD9luZcnbr3+y7QB1b/0Au2Z
	Ou7HrDVMGfNtaX0h0NpXEmvw4owOcgZF3ENZgJXIX2idfZV+b9vrIGh6
X-Gm-Gg: AYBFou0yr6YTDrJlvgLyCvlUGMr3TvvltdLjCeHP9OKgbHU59r3scOr+iJgqu6onytC
	tYFg7n4Fy8N7yW10zB5e+payPmvqWTAI2dHBfJs1ZOB+xZgMAFChh2nMEsFJSAEMZKwFJv3LQml
	jQRv3MykLg8tKVwnidvJ3z/HiRylX31ge3pNSthPScBVE4HUaFJFlxB4xA2wMksdgh8dMTDFbO1
	YIpc2TOBad4IuTzdFgqmOh1u7kpmIpXbFNvqne4btFSkIhC9hxv/GGFYFk1KD0L57VKRRG0Axl1
	PzIKTfzi0vXrCZqNxNetXpwWkceNaUIWfQR6mySN1x2n7ZCKg/xeGN546xVY+mkdjCsYKAP8w29
	fFTeLNJoOEcxFqKGuz2nSnGECL9i7tjCBew5NwRTapArJaAEwdZOSNA8V/fW7O3aSOB2NQx/+kC
	sdJSL+tjbPRrl62brFZ6aPy7F4LG9lqBGxq7x4/Ghuh8+XVvtt4+LCeTcwDyQITgYcUrUXCTiaj
	j0L6NOQyx7U0KtMos4VLbhfsIUX2gdg4d98Ye4icQvqVSmv0Xnbru1XHhZs09D2NKI5s8dcY6LA
	aaCZZEkPmeAqCzUmJn3eRhpuibluySHG688bvMY=
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr24847940c88.8.1793811439033;
        Wed, 04 Nov 2026 08:57:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:18 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 13/28] hazptr: Add waiter-enqueue tracepoint
Date: Thu,  5 Nov 2026 00:54:31 +0800
Message-ID: <20261104165504.2430480-14-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Production tracepoint fired when hazptr_synchronize() enqueues a
waiter onto the scan kthread's pending list.  Downstream users
include hazptrtorture's staged hot-address scenario, which uses
it to confirm enqueue before running its controls.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/trace/events/hazptr.h | 29 +++++++++++++++++++++++++++++
 kernel/hazptr.c               |  5 +++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/trace/events/hazptr.h

diff --git a/include/trace/events/hazptr.h b/include/trace/events/hazptr.h
new file mode 100644
index 000000000000..1eed4c9fd682
--- /dev/null
+++ b/include/trace/events/hazptr.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM hazptr
+
+#if !defined(_TRACE_HAZPTR_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_HAZPTR_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(hazptr_waiter_enqueue,
+
+	TP_PROTO(void *addr),
+
+	TP_ARGS(addr),
+
+	TP_STRUCT__entry(
+		__field(void *, addr)
+	),
+
+	TP_fast_assign(
+		__entry->addr = addr;
+	),
+
+	TP_printk("addr=%p", __entry->addr)
+);
+
+#endif /* _TRACE_HAZPTR_H */
+
+#include <trace/define_trace.h>
diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 4784df78be4e..16f6e2acaf87 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -19,6 +19,10 @@
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/hazptr.h>
+EXPORT_TRACEPOINT_SYMBOL_GPL(hazptr_waiter_enqueue);
+
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
 static DEFINE_MUTEX(hazptr_phase_lock);	/* Protect the list phase flip. */
@@ -411,6 +415,7 @@ static void hazptr_synchronize_queued(void *addr)
 
 	mutex_lock(&hazptr_scan.lock);
 	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	trace_hazptr_waiter_enqueue(addr);
 	if (!READ_ONCE(hazptr_scan.wakeup)) {
 		WRITE_ONCE(hazptr_scan.wakeup, true);
 		swake_up_one(&hazptr_scan.wq);
-- 
2.43.0

