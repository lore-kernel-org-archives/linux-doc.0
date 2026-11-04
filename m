Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811534;
	b=BwqKeoeClSMKCB7RWpxw7noU4zbKjaF3oKmWVmLKj/youHJjse6ZSXgifCF2aKLOjgUf
	 2ju/VgUc1JeLYXwajUiGfnXdUOci2nE4iDZBvpS9AR6GOtSEHUMTHh1/P/gnOPfDN8HjN
	 sYpj2YKDXOigSSeYY6A5mf9s/5Xui0aQtTXhdvMqEXMPUlmGq4UujQ296A45GETbxwout
	 Q77yyBOBY+bl08Yd1oly15Ft9N9avh9oZBsLVa+gcVQnA3eoWw3tgmCLu4uowkOb2TccB
	 DsteFZOBsQgVs8FfjhPYLIkb6lDyRZmDSGi12VaDLFXhzTRH/LHRsYvMxeKz3o56l5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
	b=JzdmIVaLBgcrbJYxC3+eQa+gmA/JymzgzmpgsJDGYDxphPQroPIaMc3LcgnfjNklHsEe
	 yKm5KpIUV2rt9a/26zh0l3uyE9NCnCo/AikGJz/58W8EUt7HAistAYrXw/KoVyuyfMgyF
	 Hg7PrZtAH5KoNcRHUQhsIeKfCkAUR2x63CH0vfo8FWFiV71kwQo44SRc/atgV4S8xssnY
	 fCzK1Kp/ls4XoBdZks1meOjQfD9eFAqQHJDCFiav9Kw64YDr5EaVztfWFikIxiUnhIOyq
	 lsr26W83g+UkEAbR1trctIBz7d+ieSGW49diHy7/yuPdwEvh/nTsnT9/Wbz20GzycdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANygCtmE;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC7606EE98
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FEC7606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANygCtmE
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535a54bed9so1232302eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811532; x=1794416332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=ANygCtmEabL2DlL1vQlsQM2V0AtBPyADMKMlCJWmID9fbbwmQs5upuFgx6EU3yvhKo
         6caM3e2hkkYO5GJr7HHs+Js9ExbyddYDzxIlemrd8dAXA7Zu9APdFA1UHE8diifgdk8a
         lmdBb0VWG5nNoMzfJrINFe2jSCYp+laLzbezywwABqXJTWGEic2IdMbDjiSu5RV0+CVJ
         eIqDGjL4iNpOnsFQO7sePrDbbe2pzXFrEn6oNowXFyvwpyOWoIVbsF52+leys0IMgc2l
         DNaM0njeFmPb1ZBzxYZ6tHpA5QdzerC11YzE4j+NaXlXjJhySqwp7mgr6wcLnzJmPe3C
         ukow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811532; x=1794416332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=bwjD3JYfY8E+H/YDHr2DScP37GExPTb+gINvWJS28aapH/qXM7B5nil0QKDsyK/pX0
         hRa6jX76jrotPB3ktwuLPYBCmQPkwieNx8CAkoFgrIx4Pu8bgwSlahTM2tTxqgSY9ph1
         mi+Nn7xG21ARgX0Kgzu+pCoQS19QOpSHjIU8Ec2I42Q19upM2J0TDIMYmGgf2yoSCsyE
         rHNOO+2NBbxicyjGPgjRZuLCV6nn27f/7jxe6E9itsplNkxGetOb7drWXYO3DSZUuBKd
         Tr6lghrik6QMscwHFAgDUiSgIfWSCpdipUBROdNaOC02re2NbZ/kn/FgyV8EoWLJ/eqZ
         X42Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+NCGQr1dElqn70TsnE+0yOvtrN/QtyFIbaX+CumtkHgzJDGTnCsK6SOSN8XM5Dvc6JQtFc1fpOw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xtfS0qA5RtPLqyb7opwca10HSllnTXPsXR4hsTMILk3JDkG6U
	Ada1YG0bWiuR7hmSS7+UNKbmWjtRvfb1ZTrHJPF4HKvmoKRL3nvMrxR/
X-Gm-Gg: AYBFou3UDolQibao/mGJ8KuNaOpFLsggWrCxT/m1p6zBlb/yKfy99cFOEvcfoHYuXu/
	KDT8jWmnnUgDxAEN9WfRH/Cr4rKKpBXSnBIFn0PE65fEk7ejXHp4ffWO/in72Cq6vVCRMMEmIWg
	Rigj2Yw8E4qMrSSypRVfooDX5yut+HpXe3lWaiu2LtBYcTNO9U5EaDD4Uh7NRoNhepUGbw4Ke9z
	EiwvSiWiPBRWlQKVyevrm+UmWC1yWE0Mhi74thd4TiZh/azfjQSjrD6u4/d8XfLJjpj1wVsSb/6
	PSnMboDRFskAhoxgGXxsYUulXxJXLctmVptar7Sjx/GO700U6+wE0ayMfZH78HGuiIeb0gFOvXn
	JkcjcO3LY+Zp/bErN4IcmIM4RH6Sq0XQtYubpYw0n5m1Hf/bcPfMxGYfvHlqnVKZYyQ+vohNN+i
	F3iYUiX2hTbfIBu5ycchnUz52rLdBKcqKu/3pM0M2D93dCPsIquD8W39U2CKhMEU7wyD/tdagG3
	mEDkpBfpTOtvBWgcVKCWlt9m+M/yHFeE6mAyv5ZkBMvAW8Rex8bfgUYKKxCtPWJQoNdRSGPdVt7
	fUh/rtvvh4XwGOIEf0IRKx2R12K08SJ1xeZz0PlVWDGHws6gwymfb6ZHuwZi
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr37599893eec.31.1793811531717;
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
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
Subject: [PATCH 23/28] rcuscale: Add hazptr scale type
Date: Thu,  5 Nov 2026 00:54:41 +0800
Message-ID: <20261104165504.2430480-24-kunwu.chan@gmail.com>
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

Add a hazptr scale type for per-writer hazptr_synchronize()
cost and per-reader hazptr_acquire()/hazptr_release() overhead.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 5659eaebc5c0..6e3e3f296f85 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -40,6 +40,7 @@
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
 #include <linux/sched/debug.h>
+#include <linux/hazptr.h>
 
 #include "rcu.h"
 
@@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
 #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
 
+#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
+
+#define HAZPTR_SCALE_NR_OBJS 8
+static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
+static atomic_t hazptr_scale_sync_idx = ATOMIC_INIT(0);
+
+struct hazptr_scale_state {
+	struct hazptr_ctx ctx;
+	void *addr;
+};
+static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
+
+static int hazptr_scale_read_lock(void)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+	int idx = smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
+	void *ptr = &hazptr_scale_obj[idx];
+
+	state->addr = hazptr_acquire(&state->ctx, &ptr);
+	return 0;
+}
+
+static void hazptr_scale_read_unlock(int idx)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+
+	hazptr_release(&state->ctx, state->addr);
+}
+
+static unsigned long hazptr_scale_completed(void)
+{
+	return 0;
+}
+
+static void hazptr_scale_sync(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static void hazptr_scale_sync_exp(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static struct rcu_scale_ops hazptr_scale_ops = {
+	.ptype		= 0,
+	.readlock	= hazptr_scale_read_lock,
+	.readunlock	= hazptr_scale_read_unlock,
+	.get_gp_seq	= hazptr_scale_completed,
+	.gp_diff	= NULL,
+	.exp_completed	= hazptr_scale_completed,
+	.sync		= hazptr_scale_sync,
+	.exp_sync	= hazptr_scale_sync_exp,
+	.name		= "hazptr",
+};
+
+#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
+#else
+#define HAZPTR_SCALE_OPS
+#endif
+
 static unsigned long rcuscale_seq_diff(unsigned long new, unsigned long old)
 {
 	if (!cur_ops->gp_diff)
@@ -1140,6 +1206,7 @@ rcu_scale_init(void)
 	static struct rcu_scale_ops *scale_ops[] = {
 		&rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
 		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

