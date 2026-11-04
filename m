Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811405;
	b=rx4Vo2lLjmuB86m78JHt7Tw8DoU2CqKfZIHx2SctzuFUD4sZ4ZUq7RNTl4GAj8o4vQ70
	 Abw8ntQ9y6YICkL/BpFdAmk2BSu99EQVfyJ9zMjj+cFDQWNQvh8lzbWpmDiHD/XWGlHVb
	 wAE/Qe4FgDoAXRcKtVDqcHprODsDDti0WK7he4bLjTqC0oxy7zzWbm3SSZET9LL0q+oVV
	 IoNHD8aRx6TVfEGToDt2Tjvf5j81hJ1r4BbvUWo2KaAOkeMwZUwYJ0jxN+OjO4YsjpJMR
	 eJbBJyX146aOsPMOcpGjlqMqSxG32845ScT0WntNjfR+FMdyl+thlVdg/xgudGf5l1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
	b=3mThlHuPjGLWea6JgEOIyAix5EOwHRgJmZjWGi6i1pVplpWvxSXIgVo00nw8JmtgxP4q
	 kB5PMK5HR/Dj8QzSW673uB/mahjHDcF4/WDvKuMHZ5V1NlxU9tpEdwzWTH5MtWkvi5SFq
	 r/3KTdtQx3X79gYGj5of0FfXQKxJCDiXmsD5p7yd6rjFUwxNu0KHeUEUUb53tNvg7T2R7
	 apjijfJoW3r+UJMftO9msrKaviA3sUSFQ5g5TfFRApcyZb3Wc3SayD07opmwuDymGJOrc
	 NLthW3eUy7LNIy0Z8ZWw/DPUgALHCdU5T81ecGKsDICnMwi3m6VLmn8gUXMGfoQR8cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fE8WH1MK;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A249606D804
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A249606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fE8WH1MK
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so1229011eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811403; x=1794416203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=fE8WH1MKci4/tbOVBnJedYZrGTpUWQYU6L/1iUfnHKTUHhPapsG5ksuKHGAOT0+Bul
         d/z+dGRxCJ6aamcS0zzHgcwDJ4MdPZWqjDLr2gnttF6MZhzB2QHkR7BVrMWu+yuGWJGQ
         IxhmUZCVKxbCWS2ZDY2bXZq0SMCPMiZpxg7n3hu/lOfaAvfXIKTrbdcgrBS9ZfFUVPPU
         dce4azDrVK9nu70VUB9+o0C/rGPtu3O0JwvR2EbeLw1mVBViSDmD3QruVjqeIPbbKtma
         8ZQ/vQ4iY4whe4/9hwWcx6tOOnyEubAyxtgnmfbAuvrSlFsSucoq5Qgv+UgLhx9So5Da
         E1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811403; x=1794416203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=1K78GT+BId9ex7RO5yvaqqOsgTbPfHpguo4jZrBkiloc6IbcZBS2sW08Y6rfe3Jb1k
         r/IqEyhm7ugC6Dm0zL/yziFh/QstBKOUVLDau2HEhOtWTQlUDXzOa1B6LqOu6KMXVpsn
         jLrfUaDuS+j4NVY4W7QVE5FWXOHQiN1VmtoY+LW49bUZvRnxYtBBuBPCMOqq2cB+xLQO
         lEYLd7DR0qknCjTtXbSoBcwo6uFIsF0Q+jF7t238CqFkf6ZVb0+u6cIihDXGhhLETXdc
         rLuJNFYYAXBWb+zhQDJUL93bsEhvo/fGqSJhISFnzU5DYsRPyLBsOPfZztGKCDe/WLNt
         Y5dg==
X-Forwarded-Encrypted: i=1; AKwUvBxiPNl13t64k7IBwFj4d3/Q2+uHXD4oFKwmyma0YdjKh8PMjWq2VrvgH4/1zWju+EO52OS3NsIzqQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GNEyERZ+u5Wpk1sePaFNXHZShEg6JrIsAf0vNDoaxXHw9zim/
	FAe2d0bmYSTxz6hC/+hB7dLOwTonQnCg70aHVb3EaG8bNHvVgryWmY3/
X-Gm-Gg: AYBFou1Y6vkx7aae0VFWO1Djm44veJU5QeL8pqOv4o4ZdTVM8gszZiGY2T+cEm22GJK
	LPUvgHBFYvNM3zybQ0vQJL2c4Sn9qUDQbk6sKz8kf+HfgVJMO9kNPr219CvXInpebTQbvE9ZJ6W
	stbDK1Aexmrxh3jCL0z6jk8lqcfB2MZYPpn+452EaVl/27go3MfO3Jr08Iu1boicjVZPxKDExt7
	ipgDcJFRR7SRSMOT68IM621uFO/tAkohDGTTyQpvU9OexiN7Y8Cp84GaBM/XDjlB+kTHpRjjTJV
	BJe8liQXUV0fdRF14Jv4jfqyFe28EIyWx6KZEkSmGnoHyUFBzIQxgN50DDJRrwjqiyIgTB/mTgH
	II2uUbbMBPnHwBUOsL0gk2iQUYbKBrODQ0OX+6ZweIPdIYHXHGIqRoFAC6+p+tsZwoGfnw/m9TO
	h2UPquopec7AtvNA0+ssJjh/bBAIAF68fxYW1+WUOMUbBdTuZLdJYlz4qQhmHDtiiPkvsPYV5MR
	K6PzfZD+iDxFxPzzj6huUmN3YAEyz4/wtUFywRAVpX3SCd8839PEXtIxRwVZScBINTIDaI8O5fu
	bCr4kEQ1Rly6mqV3t7vf6xisgqp+skzwQ/bxoFc=
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr24794481eec.17.1793811402488;
        Wed, 04 Nov 2026 08:56:42 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:41 -0800 (PST)
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
Subject: [PATCH 09/28] hazptrtorture: Add READERS4 and READERS0 torture configs
Date: Thu,  5 Nov 2026 00:54:27 +0800
Message-ID: <20261104165504.2430480-10-kunwu.chan@gmail.com>
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

Add READERS4 and READERS0 configs to cover reader-active and
reader-free synchronize paths.

Both use the PREEMPT baseline and hazptr-stack torture type,
with four readers for READERS4 and no readers for READERS0.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
 4 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
new file mode 100644
index 000000000000..f5564c218902
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=0
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
new file mode 100644
index 000000000000..0d0df3f7dca4
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=4
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

