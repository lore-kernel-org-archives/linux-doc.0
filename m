Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A414CEE45
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961006; cv=none; b=R51+SiV0Je3Ar20HxPVScM9ci2N+BifNht0dSH3TaNLxAoQ35NLpnS0ZGY36enKYk92x1IEefGJpL3chcVLNHkkdauWyTVzU/Yo0reGzfaHdvO4MSJdZoDF/dpvq29fWG4ER5ToBcKGMthg1eXYOSOd5QRMQKXoHU4883llFZz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961006; c=relaxed/simple;
	bh=9wEbN2n5LQFaWEnfgc/fjcdj12CgL82mEepIN/jxNKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAlmhceu3OWHrP0LvTKG7IjCIwvxnXVORJ7Q6YQ35XyyQvKE3BlxsB5QJpQSPCgVgEe/IU4tqX4HYAUjc2d0hfgXDeWA/ia64pSxeeiwyDS2JDyjlSj/I4ep097q1ingyKMf3wQxa1IzH3USBAZ3uBPmUHNgVDUEzQQoqlwggpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dalPDMRq; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dalPDMRq"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso97822a91.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960998; x=1791565798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=dalPDMRqF/pTMZKC7gM+vbuuHhe+AzE9gT3Z6UtI20aEydFwMb2S3ppM8uHDc4kq67
         H/5HHerSCV+pGQ6iNfXLUDLrmLvI9zQHbE+D8F14nVDrMeZZ76mjeF4RYasyIGFuyHjc
         bJZ1eRwSeTr09fQyXxUTfGaW9GEcX6NrqQb7BXe9o/VWo1heh6veKHTWuc+bb6y1XWeT
         7ieFI9GptxE5VYBmWMT3+gdABLWqRDSPcE3jmT4m/e1sxCTm8dgYz59rAb3+fi01bSTh
         4/1sIBX8Mogz+e84NsEJZy107IZm5s5lIh0jrd5wCH0gpKTXZ4JHAut6q0afhEaOaJdZ
         +ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960998; x=1791565798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=H9iFAbuniLB/316v/V1HJjXUCa7UDkNqFqdlW6AewXvmeLaSxx3IYr6ioITy4oxLdV
         /eOpO3xKCJw6W5Qh1BGo/qVop4Y7vy80buHo5KyTEInYKvpQJKKPBuU5mSEBtlDVre68
         Qdd7tFKwmLuEs90v/f43SuB1yJkvWzb6twVMnqfrG4pIPtgjuPF5zmbs+cXYhhsXglbw
         PcDhtG+EDixiQE8zZh1BxxdxGOHrpY7rMfTF3hNJuM+ze6pp69vfN6P0HcYIyPgGg3IP
         uBnLGVqPa3oGTEFE6QkveP3Ex+q0nEUb++0oACIxz9Qmo7xY3EpdzGsTSfzVNKJSoFjw
         MRoA==
X-Forwarded-Encrypted: i=1; AKwUvByDyw7U0UxD5GaIMthZr3j/FbjVYY97SFtV0rKsRamlF1yFz6aW7N7/q9t3q4pq1fJumlbP6URe/ZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoyLYOPn6PNvbJ9U1d7IkFZWAdcc2Lor5SLx3NHrh2povzDHjN
	KVOhffKNtMjHCx52nZHW6+MtcLNhFVNf08KyOQXwmVUR1rUa7vLe4qZX
X-Gm-Gg: AYBFou3a136hsPiG0ZEZWjJDZ+P9kgMI04NzFrzcUtm8teNm2ISh11Mt69tRYYz6xl1
	5y0zVAHCq8wY7DAG4Cn1UCZa6eJlxRbyNnCxxropKvN3pd4+v+z7KbBvQQUf61qGqNSr7ipZU/P
	ntiAouJIG6PLiAIi10Suml+5ogKhI8I00/66bPwJptWx/0IVtpXEeRFpYn5q6EpcoHd5fvRtkHF
	U/2q5jInbX02+xxrDlpLePC6zVf8fx+f72mtpdWUTxnsZG57N4TNPE8GbcUO7j6YmCAOjfoHNca
	dD5C3Y6pR80T4hOGMQoYOlpfOJAeg+tNws18NcPpbnj6tggYbtBz6w+kY3BygOVgUqX6frxxFE3
	2lnLdYiCmX0s1JHsl1CF33CTN7hV3n1Jrd7TPKH0lxZmc0Xei0KnqdyF1v00evbPuqBZsNG0w14
	3SYXHWpocwzNR0CcUP2l7E4pA67zfquPvGBlu47Q9NvjW8OZJi4ZXwgJE/ermCznIvyBNoGiThb
	KRkzKaDWr8LDQlxIw==
X-Received: by 2002:a17:90b:39ac:b0:3a4:a7eb:1da7 with SMTP id 98e67ed59e1d1-3a6ce7f8bcbmr2920094a91.42.1790960997498;
        Fri, 02 Oct 2026 10:09:57 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:09:57 -0700 (PDT)
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
Subject: [PATCH RFC v2 05/15] hazptr: add debug option to force the acquire slow path
Date: Sat,  3 Oct 2026 01:08:37 +0800
Message-ID: <20261002170847.3653663-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a debug option that makes hazptr_acquire() always enter
__hazptr_acquire(), even when a per-CPU slot is available.

This allows the slow path, including its lock acquisition, to be
exercised by lockdep-heavy workloads.  It also lets hazptrtorture
exercise the slow path without requiring the per-CPU slots to be
exhausted.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h   |  3 ++-
 kernel/rcu/Kconfig.debug | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 275cbe54b075..4ee02d23abc9 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -245,7 +245,8 @@ void *hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	ctx->acquire_cpu = smp_processor_id();
 	ctx->acquire_caller = _THIS_IP_;
 #endif
-	if (unlikely(slot->addr))
+	if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH) ||
+	    unlikely(slot->addr))
 		return __hazptr_acquire(ctx, addr_p);
 	WRITE_ONCE(slot->addr, READ_ONCE(hazptr_wildcard));	/* Store B */
 
diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 7c3c6017b266..3a2e9d7f58f8 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -265,4 +265,14 @@ config HAZPTR_DEBUG
 
 	  Say Y here if you want to enable those assert, N otherwise.
 
+config HAZPTR_ACQUIRE_FORCE_SLOWPATH
+	bool "Force hazard-pointer acquire into the slow path"
+	depends on DEBUG_KERNEL
+	default n
+	help
+	  Make hazptr_acquire() always enter __hazptr_acquire().
+	  This is useful for testing slow-path locking, especially
+	  with lockdep.  It also lets hazptrtorture exercise the slow
+	  path without filling the per-CPU slots.
+
 endmenu # "RCU Debugging"
-- 
2.43.0

