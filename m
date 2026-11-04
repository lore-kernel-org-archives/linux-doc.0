Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811413;
	b=0YbmzgeCtqghM86IV/Zyeq0dJt1SGJ/eBvDHBPcjB4dHLELN30tOny/3opHyB6fRBQhZ
	 o/G9szwg5RQ4VAuKIph9jFlENvU+muE0yAv+YEW2+pT2ueZ6tF+s0TwppCnsFFL7m92f3
	 ymu7txAQe/Chbpen5qGm1yD7D/iHb90ZWQukE5snulnMAfHT9BLF1QBNJsu1fykHLRpyo
	 sh3viOh44x8pFuMGVbaXP1i8kEIiEGLy4Y5d0Xz9RnlsbqcX/TDjM7W0uF3ytIBbnjZrd
	 Dx6tnw3bMaAz+YFZjCtuOrV8HBaLFCAsljRJ07FUHfM1yWpYu1Qc85GdjccCqoX3k2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
	b=GObY10wGhs0AERQzCXIHXiQXqRbTx1zwSPiLXEUCee2zTbBWl9lgVzafZPRNf32j9ffR
	 2u/BFJkeqNHL/8uBoBLt8EUzyG4ouF5v+5UjFs8Kzt1Ez64/B/wv9c7d2JwIHts4FpLM/
	 8/Y8tcHRH3kS5JXX0fTzZj9huV+5W2uczJKH9I7O8M4/STP2BKRmtWYEAziiGhL/LlgRl
	 tvFdo4rvd4+4SrF1+CjL23zBVc6J0iwOk2qq3PU2vKxfDujAKcF7K+4Qcp76GdB1yUg5K
	 PoYs0FaJ9vqW2YCbFWjdUs4ZT9tgz46QZtzw0pdBl7uohPOkGT0tJm3s2Ri4r9l1dpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCP9s8Vr;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF0606D818
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFF0606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCP9s8Vr
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36d6765756fso734513eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811412; x=1794416212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=kCP9s8VrCg/13i0ZvqMzZuUmktyH+GlFZ2KrzEozRxYNjxwtUFfqQ4YcRch8Qeyk6u
         Hyn0u3av8Oq/ekitd88yUopP0KS5X3nfx5bJN9XLDCihsS9/B+LmIOjoIg8kMGHp55AA
         itpmpYPOnoIXeErCCDxkUnG9ddysA9lPc9P+UN27efB2O7duIM4/z/uptdK27yKrupJl
         wGzjO2kl3X2ToG59tSS1CSXqYjRi2kMx/7bC8MIgy1Ghv4RO4R5aSoIy5zr5UcYM7Z0f
         APMXkid8qQKM47Pb5yXyT1eLecZbbRtPU2rV+l7kFLzHqUXv5g7AxolJjZR1ODawytlm
         oxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811412; x=1794416212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=zyvcKPwoTwM+HF0OZDlTx9+2QqWQqKW51shJu68fo9Zf/Fg7/naaIQ4jRZnYEuPfyD
         jwk/1lr546suHNvCJKxJKRHKpXNKwS3y0pwepGacEq3id0dJbIJGFPSb6h2sJGu7TC24
         9G+obWeS4/5vQHL4Q+vxxAxOQRlGo2e3SBuiD9WpcJBi4/V/j2ylgOdZXBCN5tVpdJPp
         WHSPa/ifMy5Bl5HzpOKt7i5255XPHd2OIyDL3JGaZ50pHOeQE0FilBrKKjfMTksTPTDA
         6FcMW9+0RewerZPcSu5gGH2/xqBI9K8cHcC6taYQ5jn3X3v6gVCU1ymMGoXEuTcG26f6
         Z1iw==
X-Forwarded-Encrypted: i=1; AKwUvBz/oYA6AtOims1XQipQ3xZhK0jSq0U2QFK0IhUxZieSdqfJENPZo+G7nMiNeIX0nWoy34MuiW18Y60=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WVluxWwrEBN6SQ3cX9HGc/SUSrQgtBeKSzYE7y2W/dsEBrrYs
	aDxKAI7Iahea4yyWiJn7YaJCBfoXDVtvNS0RY7qGEnruQnIJGGzFyZIQ
X-Gm-Gg: AYBFou3bDBsD9QCT9MgqgQoKXL45ko2wTc2qbaS0uwp+vn5X0AwG+SGepltkQaV0DsJ
	t+XOPhuya6UlDJ6/ZkUMW3RGGJIaIRr730fy1vooRQTxxLYuvycHh+jaqgLMLgcoYFsylmjWTuB
	GchwSwb0paGOLVspGTskVYD3kmGrG8j3t74xgtVXVdPTBiR3G58eDOmvxMyou6LAspzCsE3smz9
	jIR7aArZLl9jWmZdeWuFADvBlUtx8FpbdrWRW9SH7mkkqd0x8/4Jfafhsc76tweXjkqT1GCvDnB
	gSolf+N9I5z3r324jZ61r9a+qg+zPIkE2AVhJxHwsTG5Bye5lH88HkxBn1KTMRS/p+B9BJqS569
	ly87pFnmdA46ixV9lrjNnr2umDE+9XEQ2EqWmqTQvUYrNBA984P9VmjwGpV3hsJPKgIlh71GPUv
	Fwu6gDIL3tffBvKg3ryo0ybGxE7t5ZX8NKnAk4r4NUaiGkRxpzRaam25WpYVb00tfo0M2xTbZFd
	+hculTJbmcrCm2Xp0Y1J2QDebg13rkHuYb8kNqbVJQOSQK6EUF5iXKnLAPCVOxGPguFum/JZyhm
	KKMJQ6EILuz4r3IVO7UfhEIrG+Aopi4lzAtJKIk=
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr23827711eec.30.1793811411412;
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
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
Subject: [PATCH 10/28] hazptrtorture: Add 128- and 256-CPU configs
Date: Thu,  5 Nov 2026 00:54:28 +0800
Message-ID: <20261104165504.2430480-11-kunwu.chan@gmail.com>
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

Add CPU128 and CPU256 configs for hazptr-stack torture testing.
These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

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

