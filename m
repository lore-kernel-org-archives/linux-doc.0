Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092152FE21
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220755; cv=none; b=R5j6pnoDfN5YUHjImLPy5h6q58IACXIv0+LNEbTgCwu0MTEq5WHHcmu/+cTeorfQNqD6YVCjk3rU9WK7GZ+s4/59Zg7rSwbvt48ydCJbGuHAyJ5UaiK4oUR39EIiQ2l0gXQiqWnCw+zfFyKEVEbiE2c6yEe85Msv/8AunaGA6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220755; c=relaxed/simple;
	bh=c7ckEYnsoc8lY6bepSRx0MX3kspdeIxVPo6r8T3T7fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZywJSHldxgb/0z0bnGRXFi6/PaZIiwwDO97iYeEKffPZOLtE9rRoKX7nHFGfyf3qF2qkV+IRsj0OKzf4/JSqsZbZH66zv+DU9E/U3t+CxsWbjiagRKjnoBoHdCewLi2wrvALFQTfeEjB6Mjhp/dXVxL3OvwXyETgB/9Wzk7f9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUhBm3MM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUhBm3MM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1634143a91.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220752; x=1791825552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=VUhBm3MMwSAr3JXiNpbJLPQZtkxrcavHSAy+rhL1SU2EqJkGe7/11Aq61Stl5tMg+1
         0I7qV6wFwhtXqN38dw5WfLYEZX/g3q555fbwUlKxNGcspP0pyxHDaPrU9S2d4RQBSEiH
         iNChQCn49uF0RkqZUFJbmaNH4O0kKV/MYpsUP8POdjhHHJopsHkHasRnV8wT1o5Sy5vm
         q616Npj3CEelMqfFsNQwNdF3y1DVWiISFtoCrt2nA+4p2/cMZV5z9CgvbuOlNZjqdeRR
         edLr5a+dC2jAlW/c5ahprno3I4GN5dPxlQAMLOOapSdGsRu51Hcpia0EO4v+TlIlmyPU
         3XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220752; x=1791825552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=tXFABeSt784feuqRJc5KSKjECNHLcKKRFY9kB+ZXHT4C5D2s7tj3z8dvY6qwxdap52
         Hf5NgrNDc/ZC27fah2JOQ05IVytLfTI7xCMFtyU2W8v6qTgsfw/XF6ubeLLTYydeCZ5O
         Kn308W1bKnO8S9a2u4OTLZ5cQ8sfPxq5cDVfDIy7h+bq1uUGWmvQ/+FrFQEGbO7qe4kL
         1/wQMVN6BV7NNAR0GGu17ozocVOdN6K+y3vQ1btGga64T0VbljZhF5C6fWOvK74qPw3p
         7BCwIGrC15jULhg6FFR57GmrhSEJ2STjYPDtjUivVEiz8NEgSnZPdttB+7AkYxkHtgxe
         SHvA==
X-Forwarded-Encrypted: i=1; AKwUvBxuT5A3ptnnAO3AFKinQHv9TkSzlP4CPi+3ghJ/YExtq8hohCeSy4wZaNt79z28js/q44mG1POZE44=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbIrboNDzcrb3xyPGOzll+fO84m9kJez9qYlXczKAYBWaQbnUQ
	otDNdnKFWaKspavR6pbqJKfsgTUhgMjQD2uBdrCe2DviBapEbUGmAJr/
X-Gm-Gg: AYBFou1DUd0+9O+su4wu8sbAdonAjmfTlBe4VAeqlo8fNmCGNHtJMazhCesF8jcu/f/
	QRlq9LUcIXFpfFQ9Jn8fPWTRUHhJG94Umdww793cAin10bk7eEdxq9m6qAnWKF7p533XQzgV7ZN
	Q272Hv/oHRcalD0CXzffVSKRIL7s4jiHEFWT3T7r4DagBCosGngmnmrVhT3RxA86FCbUAghZSPt
	V7ZNlKJnIcg+2IuuIMTqGxOio0QUO1s8lVMDMTPdGr1PS0k9Bm63i9X6ZsK0Xn9bRtrKj5Vy4z2
	pnL/t9R1K9O4sgCs7AKTzxT+4erpRAF4lsZ5RDd4ringZhlhBoskTWqBRy0pnLF4Pc88SQwQ36L
	bop3UcNYgKlho4ezQ/7mHbbFaV29598GcilPtEiZmtaYi963G+PChl/1C3f4l2FWOo3iJHsqvOD
	IFMtvsw2bzROC1+RjCfizi03qtoUkyanPmUQquwQRYN+gKRwOcTGo0oDUyJQW9VnnF2beB6RAMO
	UFinWL3ssJre3B4IT0ckXEtVtG0AHc=
X-Received: by 2002:a17:90b:3c07:b0:3a7:9adb:2a0e with SMTP id 98e67ed59e1d1-3a79adb32ecmr5763152a91.33.1791220752112;
        Mon, 05 Oct 2026 10:19:12 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:19:11 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 14/15] hazptrtorture: add 128- and 256-CPU configs
Date: Tue,  6 Oct 2026 01:15:28 +0800
Message-ID: <20261005171529.1378809-15-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPU128 and CPU256 configs for hazptr-stack torture testing.

These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/hazptr/CFLIST   |  2 ++
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 5 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 1826be30c066..90ef09b0e654 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -4,3 +4,5 @@ READERS0
 READERS4
 SLOWPATH
 LOCKDEP
+CPU128
+CPU256
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
new file mode 100644
index 000000000000..079b463607e8
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
new file mode 100644
index 000000000000..b00a984977f3
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=256
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

