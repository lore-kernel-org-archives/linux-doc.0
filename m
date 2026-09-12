Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5837FF53
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180976; cv=none; b=EM6zfEASOmgYNuLNR4Hs+652KVhdLsQxbXABXszwMOfvZUp4RFW+cO+wVCf9aM6QPqLgrwk1+8Y0Ez7DpWv04ZqBxe1fAqt0XFkN9r2KCoxd+mfE1AtjvVY5vsvHL4LDPjRliDPBWk1WM+PWD9hIMFOLj/enxpQi/AQhP5+DaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180976; c=relaxed/simple;
	bh=yIOgwWYaZtGZFD7XRrXRqAp5oBf5PZvCJzw4s9fhOhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDdJ2uKVgW+7Dec8Cpv8CyoTRYrRz6/dQofAnhwew/lJawVJ0GCx1+9FF/ubc5Dkrkh4FytAtx5/pNp6nn4vvGl+r5vIe9PWsxoGbOAF/5CKpNk0jfoLYh5OuKzNxa3gCKrp+hUC+Mf5ZvF9W7Xuj+b0q17N+COBP1Sblgzgwhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQKxZZJa; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQKxZZJa"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so404420a91.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789180973; x=1789785773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDgCYCqvsV7FflkdMtZWp0g7e5LSxJ9jwQDT4UKWYqw=;
        b=fQKxZZJaeT55zMImLo4V2/E6W8ISr5bwzQ0q9ybMZcSqD0xakdrAwK/QoMoj+EftFb
         OnvG89pyEVrO0K1kksyQ8ZJENc3HLighoukj1K2glrbBsJNxN1Vkb34p5eLVVcRlKGBp
         LVhHW1EeLbSzF27KqusghsunFhn9Jv8n1Nq+XOGhjoDIbdmy4W7/Uez1HmD1VHgNek7p
         ql+vrdXniNJsAXnwliXPBoXVtAA8aeGHQxXX3j0T+K3dPwTdHGYYi8x+HfxhAAyXP/iB
         UGGkRDGpOhXGLv+dxftm5khBxjqIe51x2tsIkIYbqsQrjxpmVMZ02hd97RKg/JpPXuwR
         2b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180973; x=1789785773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDgCYCqvsV7FflkdMtZWp0g7e5LSxJ9jwQDT4UKWYqw=;
        b=RtODR5vM5TKbj6ewio53c+J7retvsYBUMeg87QsJg4Y6t+m4qO32gXJSxB0Wqwx6Gn
         GlbyQDPJavMOY91NUmvQ2ca1RkTOGCuZMAoOLdkNiBzIytFih0iRC+9Lqkus6/otu2qy
         mjVl4mlAVshg947HEwGumwu+86Kuvj365ORq/CbsizIOeOMGPGUIOojPA6TWMOVZGETW
         EmU9X0GT9SFsuUZVlgbtLFWSE9SBNa4zWRJx1pzPXZpRsBTfTutiYt0WxRHR0VlE73zW
         /BvsNgTxXw9aCGO2ALOLazqSCTnkjqXIHe9fBpgX5UfKkYe0BxcGAl24VjezKwaKyKUB
         qiVA==
X-Gm-Message-State: AFuF++k3/gz4O3SA+CCCsDloOhtKrYGrisA46Q6Wc4WDITKqCZgzSucw
	gm4HJlqHXwGMQOnxQXJ2k2T/7ztjshZmpfnZgVyEWV6ukirvC4mgox9/
X-Gm-Gg: AYBFou2b37a2/zqeMlQ4N4cthUUaiFtW4g1q6FzfGYaRCHniXDwbz+dQS+wNRdYQODX
	uYbkmRu6pUBW0lmhkDDwT8KLwf1rRNqPmFYMnXjbmrrBBNrOsjlYdNWRHZRVbfUb0/V9bR+WaHo
	VbzGdAiHJ2V3eRTlDAM5fI/68Bd632UWjsBz34HH29CT181vC6F5xykrMzpHGbmCumwwkq3PRZA
	z/j9KiMzx7HdCuqJ2j20NZQoqw8bzilEITEtW3P0UV5eSFthcBRLTCt7s+foLd84thYyhm3AnP8
	uZkYxvVvpRL8gah+zFXU4vJqw3Rpmi4ygI2r5MVX6Y4hc1VSlMMLuTpE+kvr+JzEW0+r/YUWnQ2
	5dTyBJqgat9VcIRttlR02cKBHgtieNlyoU7PgXWG+OqbcQltaVPriCsaKYeGG4YepWHaP0enieP
	D5VIJUOwIOFU4EmBBfclKn8TcKCed40W9pBvE0X8zRwrVmPHKksgiN5YVvRCLYBNubtJL9dEK77
	pmYnCFvpGxM6IcnFA==
X-Received: by 2002:a17:90b:1f8e:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39d9bd9917cmr13284613a91.8.1789180972076;
        Fri, 11 Sep 2026 19:42:52 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm7879099a91.6.2026.09.11.19.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:42:51 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	corbet@lwn.net,
	akiyks@gmail.com,
	luc.maranget@inria.fr,
	j.alglave@ucl.ac.uk,
	dhowells@redhat.com,
	npiggin@gmail.com,
	boqun@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	parri.andrea@gmail.com,
	stern@rowland.harvard.edu
Cc: linux-doc@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v2 1/2] Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
Date: Sat, 12 Sep 2026 10:42:24 +0800
Message-ID: <20260912024225.2872265-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912024225.2872265-1-kunwu.chan@gmail.com>
References: <20260912024225.2872265-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synchronize_srcu_atomic() may end its grace period immediately when
its scan of the per-CPU lock counters finds no readers.  Correctness
requires the grace-period anchor written by srcu_gp_start() to precede
the smp_mb() ordering the lock scan.  This ordering ensures that any
reader whose lock increment is missed by the scan cannot have
incremented its lock counter before the grace-period anchor, and
therefore cannot be a pre-existing reader of this grace period.

This litmus test models the key ordering between the grace-period
anchor and the lock counter scan, where "seq" models the
grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
smp_mb() and the lock scan.  P1 models the reader-side counter
increment, with the smp_mb() of __srcu_read_lock() following the
increment.  P2 models an observer that sees the reader's increment
before seeing the anchor.

The outcome is forbidden by LKMM, and herd7 reports "Never".  See
SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
which permits this outcome.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus

diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
new file mode 100644
index 000000000000..efa9c0c4e047
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
@@ -0,0 +1,57 @@
+C SRCU-fastpath-anchor-before-scan
+
+(*
+ * Result: Never
+ *
+ * The synchronize_srcu_atomic() fastpath may end its grace period
+ * immediately when its scan of the per-CPU lock counters finds no
+ * readers.  Correctness requires the grace-period anchor written by
+ * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
+ * This ordering ensures that any reader whose lock increment is missed
+ * by the scan cannot have incremented its lock counter before the
+ * grace-period anchor, and therefore cannot be a pre-existing reader
+ * of this grace period.
+ *
+ * This litmus test models the key ordering between the grace-period
+ * anchor and the lock counter scan, where "seq" models the
+ * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
+ * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
+ * smp_mb() and the lock scan.  P1 models the reader-side counter
+ * increment, with the smp_mb() of __srcu_read_lock() following the
+ * increment.  P2 models an observer that sees the reader's increment
+ * before seeing the anchor.
+ *
+ * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
+ * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
+ * which permits this outcome.
+ *)
+
+{}
+
+P0(int *seq, int *ctr)
+{
+	int r2;
+
+	WRITE_ONCE(*seq, 1);
+	smp_mb();
+	r2 = READ_ONCE(*ctr);
+}
+
+P1(int *ctr)
+{
+	WRITE_ONCE(*ctr, 1);
+	smp_mb();
+}
+
+P2(int *seq, int *ctr)
+{
+	int r3;
+	int r4;
+
+	r3 = READ_ONCE(*ctr);
+	smp_mb();
+	r4 = READ_ONCE(*seq);
+}
+
+filter (0:r2 = 0)
+exists (2:r3 = 1 /\ 2:r4 = 0)
-- 
2.43.0

