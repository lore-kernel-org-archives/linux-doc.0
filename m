Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C35481255
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396808; cv=none; b=MHlJu4ty/M5sspzguJrNqBGdK4vsCKvRN40aMfZImvWXNdD/T+Ero+Gnvnt6OwmGVOjjeI9gYCHfdj3hHE2fjXixAzZyGB/sKe6otqwh2LKr21CsJSq0VsNC0WKOC22F4S8QGK2SllTnYCGuvwV0BCxJPg9cRaHwrQ5kLbrA78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396808; c=relaxed/simple;
	bh=OxFt4akoNsEexOq08kiv4ugMYoiwz392oGi34kiEw08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkPqhDHTt0PXe2Z770fXL0jGhCqpYFqnIrAhapF4JtTyMdO5YXuivGZCwG+eiUmcB6kQKJ+jA/wpRYttwUK8PWKaxEeBRJNn2oHHw7OibWHOCpUiC57O8XlCvorxj+SOQX3tuUCCr1/bG2zc5DmQcNAeVo+bN+BkDnIDQtRR71o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUPWXjlb; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUPWXjlb"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso1513510a12.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396805; x=1790001605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn6DJj3lF06ye8TRKy/PBnP78dAx6rrnR2CCLvj5EOE=;
        b=jUPWXjlbXyfnIsDWNG1k9Cge3aIMcHyHJSDyIte5jQCUXBFgyzUld1wBr1xZYCKvy+
         ioVW4sQyUcLxvEr5GGq5saR0wHyrEos2xv8xLwbC4NJN8jWoUG51mmC+xhxZv47heaZA
         MIxGGKdIoN9bjgS95P/UjJMVpzmV9yOxWS5UNKvdOFkHUov6cv2RiuWrmaFlbSgCIP+t
         5gjk3rFpOsoUnxXJNNwYvPWOjzqRcTqNmg2AJQHp8jA6kCR6U4sStl7qCU/OTLWHLrBU
         2XD2STkNEQHbM3XDgzTlasXMK6adcux94i67d5fAT2wWf/lYp0ExxfvepWh6RBfFLqxa
         yGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396805; x=1790001605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kn6DJj3lF06ye8TRKy/PBnP78dAx6rrnR2CCLvj5EOE=;
        b=Vb+m0akx8MmtxX0NR3AMCo7Tua386xcYdN9/lNJUOZgZYOk7saUmfmCecWHWx95TIp
         4FxXE984KwN7IS2MqUyTQNrVUqF+G9CRCywRy9v3Zz2YNHsNjeVZJKwOHZ2vosj7xhLt
         o3d8CTxw7euhWfTU20c2P/jqFSWOQx3oo5XYswvd9+9DcezIjVi/x0hHu5W0e3EQ2sE9
         8cRfThvV4FJy6bn3ecf017tNhoU+eJxciZYTUG1Pe9a80STvlUrgs7o+aQaa0CpCZbYA
         fWo4OJp/NgMYZoacarkO3QSdnQjhUarPzGsNmEnGDtyuQITmR7n/EqQikF3CuSq6KMvp
         vBxQ==
X-Gm-Message-State: AFuF++nxuYH5UW4K7cvWxvaS26fJu0uMTOTAa5EQDbv4U22zh/60surl
	b/HQJ2dVGBudbJX7mSlv5/cY6CTZpgcGFP+s3hVJaf2bgzBiK2dmxp+p
X-Gm-Gg: AYBFou2WDsHRjlUUpNsBDUDWDAb+PuG8lblTumZiNIIYcpNvdPYsyI2zgwnhUoinsSe
	EBd4zLodybTs/gJhi+GN9jauPurGVKMIW3dP7ybszORNBpbGvMu7C1AUDFuxvOaQ5Qyh9dPHk68
	WMG/oYzqqBX4Xmt95B9UJSGrsraLpnAB3GfcUST+noM9IUzQ5HwCMRh0L+XyYydgcdiFePFPV6s
	ce78Mh2lmeAF4jdQedG2VnybLGKJbf82cTIAodK4LwT+PfhSaVzRsatfN+c6+kofyhljVcW043z
	e9pBd8MQMJGGmAZ67r3ofjSOM9t7fCKkaAEmzCW6xYriP11ifVWQdgsPUkQQ8675YuSF+if3zOt
	IpCU21yfhcBNkM72RcGFCGiz+AQqdurR+dVBCsUUnt+MwB/USNcRAIRghyVd5/Qx3udfnf0OPR8
	7QcKVrim8RM41uVhULlu+G2ijgzWDMq4bLXPBrxx6FTjSLA1dj6ag6rOyIVuczYPy4gifwJrFeA
	AwRLC5EsV0DipZY9VgGbFdQVEnPJw==
X-Received: by 2002:a05:6a20:728e:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3db404486dfmr6684782637.1.1789396804818;
        Mon, 14 Sep 2026 07:40:04 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm5149444a12.22.2026.09.14.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:40:04 -0700 (PDT)
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
Subject: [PATCH v3 1/2] Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
Date: Mon, 14 Sep 2026 22:39:41 +0800
Message-ID: <20260914143943.1503066-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914143943.1503066-1-kunwu.chan@gmail.com>
References: <20260914143943.1503066-1-kunwu.chan@gmail.com>
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
increment and its smp_mb() from __srcu_read_lock(), which orders
the increment against subsequent critical-section access.  P2 models
an observer that sees the reader's increment before seeing the
anchor.

The outcome is forbidden by LKMM, and herd7 reports "Never".  See
SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
which permits this outcome.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../SRCU-fastpath-anchor-before-scan.litmus   | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus

diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
new file mode 100644
index 000000000000..e0492a4d8e07
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
@@ -0,0 +1,58 @@
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
+ * increment and its smp_mb() from __srcu_read_lock(), which orders the
+ * increment against subsequent critical-section access.  P2 models an
+ * observer that sees the reader's increment before seeing the anchor.
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
+P1(int *ctr, int *x)
+{
+	WRITE_ONCE(*ctr, 1);
+	smp_mb();
+	WRITE_ONCE(*x, 1);
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

