Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811496;
	b=hRwLpr1CyXPJCSGpzZxaSlCXcXFHHlKdELeHcn9CkdkWotwOWj0rKwHSpZYjDGPIXsnc
	 E6EOerqcbFjywhA6V8FLKpbVzU0jedq/WTnYbWCmqtR/yfxZ6WvQJfRDz3MOgddapndct
	 2k1ETN08OM7/N/XVKZpWP5IM/C2tpk0nqiPhSddyLVq2ZDhIw80tvkvJ8iOFl5prb0WZI
	 5l6QD8Yh14GBdJwWm3oQXFzpLr6bwpLkyuv5GFq8nvDwjoe5sNFMSM4wn+9lDYMlQmKc0
	 XTfaHd0UMilOk/hAposvTNFY0DL2G9k5xCul+om4wygV1qnXw5Dxxyav0c2qJKgO/Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
	b=cUGrLTmDsSsB6oZMw43nY5gmwYZXD9yHP7SuUhiVJW4UlwjUQsaExV864iA29YXw0U6/
	 qR6XokddlG/KOv58boqOVxwA2ndAbwaT31y+eVzgX8TsfgjQ1Yr8F8NMBVNjBaA/UWqkh
	 zxsUP6765EPrHAHpkORVMWI7Y5m968+U3YUKd+UGpwTyORZVzunBi78E568URqIni8zHH
	 LwfapoavGMgpVY1M3kT2dI1OUFZ1qfEXZacPfMmhzwSyRENAmnVThoKHxBE3Vxpd3NXsP
	 DOUzfaoWzpkWyjXbEHIwMm8UsfQQGjKo49cwV2y40o4bxtOGoP3+SfrOsbu6gk7E+Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNr3tUus;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0E606D81C
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D0E606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNr3tUus
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1364239eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811495; x=1794416295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=hNr3tUusaaErjUitu2I6XbppO/tHcSXKdcNOfa5cTRenOkzbAShzlYf+Vh6lhhHcnU
         tV0j2CjmKzhKKOb88naSBWlsm7UMSz+rFmaMbHHVVo52UBAQUQqzpBCnbhekDTbeMHdu
         m2HGm/OC5cbaC5EsFBwb01g0ztwO9qcrVtWW/Gy5r5WiqyNKkT4Fnrid+ZtOZGerKzfs
         i5yhjeAtyPa/dnKRefMUtTmhyXApUGDjfd1Rt/xYYyIFeKFYslG1vZ7fTtcF5bzZh99e
         yUQCBLmrELZusND1vAwkU7lxXMR4LlihbNcRhxjtalepwnGQ6X6xc8qKK1tJvFak4VpN
         STow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811495; x=1794416295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=rtcoyWoc2cp0Y0WxlcKh+giBpM3S4hYCIrF5IyNrzNC4TZdE+4kWDGCwNuOSsjbCgS
         X/sI3gyQJ3P4xs6VuE4JrTHR8QHNZiqX/O2V4geuSnH837XoMg4AYtJ8aUs1uEYz20Tx
         dtvggGqYRmDO9QTrA6CpAlkeG1hCkBUHyDWYfKTNbjZ5bims8DtL0H3wm2hj01qvGAsA
         vT/frgjfe29TCqOKv/b61uM03q3Pd8xUtOLK+OEbeW7t1XsWlnu12VDsZLBUqIvMg2Ya
         RaiTOmu0ey7rRM72g0+L6Z0J/3VwyFqRc6ND0J0lqJPgfTHUroN11v/n2R8jIpwTGOLx
         3Epg==
X-Forwarded-Encrypted: i=1; AKwUvBwKLfm4sCnjaHVMZCySAVj/9e0OPoKhUx3w7Pvzeyw4JWrvJaBTWYQctJ0oZY3pjbKobUAmnjxbua8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hPWJGRhKZOSv3rylRdwFc3iBsZ7KsV6SDmAifPhaBK/Dk4Sx/
	CADRpM92bsNPu2WHUBi++eQ04qVh3Jm0y44ffhHjftgRtC0TbY9wnPYw
X-Gm-Gg: AYBFou3AoQrF3MgDPYHxXeaJ4q9ptV1bN0LpEEhdXhf87wI+HVAQYCGXf1vztXkEvLg
	LwHC2jWKuGgDV73WkSa+RClAVF01Jl+mgLc0G6NQ1V+yUguEZOLxF4v0kYkGqpv+EdpIDg0umRl
	WRvKld6YldnBstyXqxaF1OW/Su7izA6/VQQjoRJArrBTNQOyOLryKxwock++T6ZThnJWDnQpN+1
	JT1s6da6D3NFTqG9Zb6AbcRVcfaVgPadwbNydYqEalHoTZEK6QfbPDZtDxjnj8tZ1VWJBa9/Oux
	j3vnMRkVTEFRoUBrp23qJknhbHoWvVau1l5jHfNrVNbCnrLwjVCauM0SRV8WdlpmD100DET5MpK
	PhtZulIt2f5ROLqKVmKY7nb+Pa6ozuu489ej0mOVv7D7fkYvPeimuBdZm4zg65d/56lFjfF8aWK
	xTI0jR3DKWS7wxol/vYtYJoZnCXT2i1SfO1WHCQNtjKW+koffu6LRsFYePkOhClW5Rrssbf2OOH
	aWQT/A5lTPAx3J76qL/yQHed9e3i46ZsiWYAFDAevogPsDNZibDoZ5tnCAKYxSbIKtDsXnfZ7bB
	3JmvTWpLr6huIP3AqArtsIn44Tds9O//j/GHDZU=
X-Received: by 2002:a05:7301:fc81:b0:36c:d29e:668f with SMTP id 5a478bee46e88-36cd29e694cmr3306314eec.6.1793811494826;
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
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
Subject: [PATCH 19/28] Documentation/litmus-tests: Add hazptr drain generation-visibility test
Date: Thu,  5 Nov 2026 00:54:37 +0800
Message-ID: <20261104165504.2430480-20-kunwu.chan@gmail.com>
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

Prove that the drain engage's smp_mb() publication ordering is
correct: a release hook that observes the new drain address also
observes the new generation counter (herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr-drain-generation-visibility.litmus | 41 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 604c2c0025d9..79b0634ddb13 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -123,3 +123,7 @@ hazptr-drain-resnapshot-slot-race.litmus
 hazptr-drain-safety.litmus
     Test the engage snapshot race: the engage can miss an in-flight
     slow-path acquire, so completion must defer on wildcards.
+
+hazptr-drain-generation-visibility.litmus
+    Test the drain generation ordering: a release hook that observes
+    the new drain address also observes the new generation.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
new file mode 100644
index 000000000000..d5c1ca247d71
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
@@ -0,0 +1,41 @@
+C hazptr-drain-generation-visibility
+
+(*
+ * Result: Never
+ *
+ * Drain generation visibility: the engage publishes the
+ * generation counter before the drain address (separated by
+ * smp_mb()).  The release hook reads the address with
+ * smp_load_acquire().  If it observes the new address, the
+ * subsequent generation read must also observe the new value,
+ * so the cmpxchg compares against the correct round.
+ *
+ * If this were not the case, a release could read a stale
+ * generation (from the previous drain round) while the address
+ * already belongs to the new round, causing the cmpxchg to
+ * succeed against the wrong round's marker and falsely
+ * decrement the new round's backup_outstanding.
+ *)
+
+{
+	gen = 5;
+	addr = 0;
+}
+
+P0(int *gen, int *addr)
+{
+	WRITE_ONCE(*gen, 6);
+	smp_mb();
+	WRITE_ONCE(*addr, 1);
+}
+
+P1(int *addr, int *gen)
+{
+	int r0;
+	int r1;
+
+	r0 = smp_load_acquire(addr);
+	r1 = READ_ONCE(*gen);
+}
+
+exists (1:r0=1 /\ 1:r1=5)
\ No newline at end of file
-- 
2.43.0

