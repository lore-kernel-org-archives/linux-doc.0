Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9750129D
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961031; cv=none; b=QD5aMLM00P2JWjhf6joBFOzQULGhdWLKDeq2QNON1EY5rTgYdc4sX7sjPn7SU9yN03cThB9dElkZmcEO9l1YX1aKBonD6Uweiv6HvkdXNTDoq0mOv1IQWInWOLTKxAlgwqF5aBJgsdFi5FRVCmBgyOzVCJH10D3jI5+yntQIbss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961031; c=relaxed/simple;
	bh=+3MpZXZDrpG3qLkvzfnf9AFNVYrh8OCkchmfy1w7NKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEk+sIh9sRI+mQ9lRFXujrmIGFlbeBsBCi1PBDgFzSWqt0j9ZzC8moo1PyJJjs9dN5OlXsQZ13i0gWUn3PnHzYYEUpsocu+M2GRGLiGq3SnnwrVb8Qa4aDgX8yMmKIvFvC65KDsMzzTiAY74HIAsM53uHNN/AiLd2eQI5P7Gcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUGeeCcU; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUGeeCcU"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e300fa47a5so10662595ad.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961019; x=1791565819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=MUGeeCcUXiDbMAHxZ/HyZlqYCMmo1ZTm3sKrqlRw5cDpxTglM8LD3v7Hj6zLg/ZZ5y
         8x86JxX9c/SAFGzB8HVoFgUcNWFDSdrpaRzrPRZvNlttlvLC6IP/ifyAPwy0GfY/Rzdm
         UzvS9rX9HE2xYJnlYPATXqymU2I1t6sANqs7p36M1AyIos/41xVkKchlSPXzkwEOZF1P
         74TExR6xH4DJJlaXm0O56Pj0D10kWr5Byl61FPGfSSauon/6Oe0W8Kr1zkE+zFy9FQBl
         UUEhEpevoAO/RVD58Tz8hohKZvZic+ERB6izJkZK1Mnyd8/2roSmWo6ggBGT+Gkkr9h1
         O3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961019; x=1791565819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=sW6QR2mFjLqS/C0rivF8p5feXV9Cp/u4KqLRZRVSenbwqScL1v5NqTowRDxNZEwZ7q
         nHERGaAvNepjicjA57d5wGJlDvYyntJ14k6RqQDTnq8bFxybo0+50KIZycs4+9198NZm
         BbxNPhbdnYImp+Dw4wIlvqFeSV0hwR75N6ZkKV6IOh8H5b0zE8nvXXxWcMa/iBy2nFwx
         rmfDsywYZjYQ5PjS9Az201g/RT3z/H0/b1I4k8ZQa6Fqj36A7vBBBDSYzW8gTVauFRhX
         kK6xi3etdqyL2ubnDVtKSHUmqMlWWA75yXiRAFWrdpYg6zNxZfxz0iXJLkp/aLM9O47D
         aJfg==
X-Forwarded-Encrypted: i=1; AKwUvBwV9W0BLZSdnJoAJCezJiRBBPPhO9uLwxC7wrjHJpWJz0mopoNsijXftkMJ2Rb6WGhdCiGOXmcg8RA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHYPg60aeb6e4jXBRNdHNBKnefBD5ruJZ/v+Wy7gr6ITjuFYXM
	fLXhIHYG8vwJsg+gaZtgLNNsIXMzI4s4w54u98yw9IqyuhD1Li8hjGlj
X-Gm-Gg: AYBFou3dnxvnVnrWjjsHzgaUDFJQZWOd1WPuVQ9hh4Bggqfgr/3zeg0M3KrmKtd8WSB
	Ojrk2b8i7J+2BoExYdmhrF5XluW4cWNnK7ciheOjs18IMkrXgk7AJymZEVQDrYfqicUhQBDLLGp
	rSB2TlyZUpyyNzyMvcT8eV9J7vowHITmmnMWL/KrTcC22tB3rracH40bLKGoFSrBgfqkgohE1vb
	Eobct9/LGTCqSDkdNx7mA6m1mLj6m7IlJTvSz3W/bVGzsXpHjkNchtvpyM9uYSqdqV4Yv2N1W9m
	CL30eLSmKaBRao9SrzEgvPwI/mvGUtEVE8na8yz8nK7/zxQefjPNKRgGg6MUZS0fpG+ewINx3Rk
	MBRk21LFZuoQC9tR80/yP8HEZxaEaewD2V/zneP+xb3q8D69f+uGJI2/IMxHhMSB6CVlv9WAL4I
	8l68uPEpPhziONzgsNIB2hiZ8CX2NeglW0SxLulJhgdcj/pI7nzWfSfGTLHO7tCQ8miCoig8ke8
	SYVOi6tyom644vRig==
X-Received: by 2002:a17:90b:1dce:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3a6ce959345mr2937077a91.25.1790961018501;
        Fri, 02 Oct 2026 10:10:18 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:18 -0700 (PDT)
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
Subject: [PATCH RFC v2 07/15] Documentation/litmus-tests: add hazptr wildcard-flip escape test
Date: Sat,  3 Oct 2026 01:08:39 +0800
Message-ID: <20261002170847.3653663-8-kunwu.chan@gmail.com>
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

Add a three-process litmus test for the in-flight wildcard window
of the single-pass wildcard-flip scan.

P0 models hazptr_synchronize(): it unpublishes the object and
enqueues the waiter after its memory barrier.

P1 models the scan kthread: it picks up the waiter, flips the
wildcard, and performs the final hazard-pointer walk.

P2 models a straggling hazptr_acquire(): it reads and publishes
the old wildcard, then loads the object after its publication
barrier.

The forbidden outcome is that the final walk misses the
straggler's slot while the straggler still loads the unpublished
object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../hazptr/hazptr-wildcard-flip-escape.litmus | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
new file mode 100644
index 000000000000..de467bb82d20
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
@@ -0,0 +1,46 @@
+C hazptr-wildcard-flip-escape
+
+(*
+ * Result: Never
+ *
+ * Check that a straggling acquire which published the old
+ * wildcard after the final walk cannot still load the
+ * unpublished object.
+ *)
+
+{
+	int ptr = 3;
+	int hp = 0;
+	int wildcard = 1;
+	int enq = 0;
+}
+
+P0(int *ptr, int *enq)
+{
+	WRITE_ONCE(*ptr, 0);
+	smp_mb();
+	smp_store_release(enq, 1);
+}
+
+P1(int *enq, int *wildcard, int *hp)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(enq);
+	WRITE_ONCE(*wildcard, 2);
+	r2 = READ_ONCE(*hp);
+}
+
+P2(int *wildcard, int *hp, int *ptr)
+{
+	int r0;
+	int r3;
+
+	r0 = READ_ONCE(*wildcard);
+	WRITE_ONCE(*hp, r0);
+	smp_mb();
+	r3 = READ_ONCE(*ptr);
+}
+
+exists (1:r1=1 /\ 1:r2=0 /\ 2:r3=3)
-- 
2.43.0

