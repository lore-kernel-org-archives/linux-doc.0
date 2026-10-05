Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3E44F55BB
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220631; cv=none; b=FigvQfvOqlp+I7Af9ePM2vofTwDjs29bCJOKY/W+vbkmSYWjiWdeeRuNs8qXMiCkggJZRBoIgctdxc52i/npk9UylaFpreQZka/Hh0NOFMr6nLC56unUr3oPDf7n13Z39J+FG/UHCzqtFsPGvmAIqZcuAWmKGrGa6ftRDQ90zl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220631; c=relaxed/simple;
	bh=qSkRi8XlT4WUuuM/Vrnlxa70Aiw5xHXCcH5kKxR3bV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h16bHZUaCyBrk1umYzAMGO8hA3RoWvtCX7/g5wuSh4evaD+QQWe1ZIIgDjISp71JttfP9nw/cAUbEaSxcdIir0J1PuLDwfj87z54eLcE72NqyhFrAdKr70pcjU5+lLlzWQbjfrkVCe7VfUjNSJDSvqymi4Io3Nuvdz6uxO9zkmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaloghTp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaloghTp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1423272a91.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220629; x=1791825429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdf2Dycggm4mT6sPheIXdhrke0YZJhuYFMLF05Xnp3s=;
        b=ZaloghTpme6lwdDuJficWeiRQ3uXolA+P2wbeidCD2xxCgyMi9oCq2INMnDLZJUek2
         9Em+3UL4sJUgRhB5STMKCWxf9GvORO5cPgoHOMQuSORmdhRpMR9i8JLkg+zCdkOaGm5B
         2IlIAm2+6NO5iolLBaVn4vcPJ80U/uFuXELgwh6m6Q+fgGvqkI8wM5un7TFTY7P8juaz
         CU3vL346gPuzwa4F1zMxANmtut4d6n3vNq+Aq9krtmVOs0OrR9JyOAud3nhXQ71Weba/
         YLSus2wqXzBXF3jkni1+RBNz6kYfLwOEWm1yONbQyI6d6dYFwETDDwRVxXC8Q5pJgsIp
         f0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220629; x=1791825429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdf2Dycggm4mT6sPheIXdhrke0YZJhuYFMLF05Xnp3s=;
        b=WRg7Nd/6vBSvS6ireLdjoHnz165rfG2knjqbxcapu7VqXn6wXRHV9YJwoc+GYdJeUp
         qInmXlOeOIEa5J1NPzgfQYjwG+Tyq5miJjj4PBucKs2lnq1ARwegvP7J8H/87CTnN5iu
         GCZPDMJr239anbFYE6YNqtW2Nye8chJkYoZE4Lo2XYRH7Jzv0FtAYiRMeeyFk8fWuwIj
         LCjfcJAM322SsCA6z8CgdDMHrQzzpxHM1wSSmmB1HCYHDJqeZlJUOqJrGa9O4UiFOJBb
         hw7STzgbzWSDbQ9V1ZP31oYMcUBUob7rywolhlgj5GvyuIRjWO9m0Fphi6FkCuVFeeky
         kbtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDwtl66jfc3tGtM8owRYG+sWJpHyz32znYTTdpmHwujLZllTH8YglqJmqqbi60wEC94tBrYMSCWFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpWu2rGdbwzG1hi7cN/oZp0hiMaSxx3rxtRdiMx5QoMtsG8DYd
	kiYP3wybXyg+hVCeMnzBts+ss9Qo3U8UKe7JJvN6/inja5erY0hsqrNI
X-Gm-Gg: AYBFou1bbdSuImXI7KVA/9Esr9fg4qOUgz61fDb/cjTfZoCf3aBL8CPWA7FMQgd6DBg
	JY78PiXsSbzTlZJUwNvq+Ttsrn7ObZlPfVNBecsM8QzLk7O0ITM1c7VRjKng14lFPrSa9qMQqoy
	9gjcA6uXe4YcgUJWDaC9s0PtaiEq2foderDI+6YvaNp7GKKj3xulHVL3FpF89ll189L6fYNtaQj
	3sG0lzQ7YiGT6fqTNWXqbk9jT5OYUXfzwBpQXUPNTcCnNAzwMbwX8WNMMHDqHA47yiwFTAc4SUk
	r8R338A+5NpS7QjvAOy5lUHMPGldKsxiyS7G7Cl0u5EG3s8V39r2m5m8jdZeEr9WgPyI0iKfeDn
	4vY1O9sH9PTIPDecQpW+lNIyjACnFFZBaR62+Hi9m/GUftexAWe7hR/kaDCxfVnE5GnsoklE8mk
	JeHLQK8tyxLYGGU+RuD/CQsyVO4civmAFeuWbiyczCHV6wQRQGJPliPsqJzkFUADcBXc7n/3S4Z
	1TQEObEoEFTSk2gS54rVFg7oNI3Jg==
X-Received: by 2002:a17:90b:5870:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3a832f2f5e2mr1648236a91.53.1791220628556;
        Mon, 05 Oct 2026 10:17:08 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:08 -0700 (PDT)
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
Subject: [PATCH RFC v3 06/15] hazptr: elide redundant first drain pass
Date: Tue,  6 Oct 2026 01:15:20 +0800
Message-ID: <20261005171529.1378809-7-kunwu.chan@gmail.com>
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

Each scan cycle drained both wildcard generations: the
unpublished "other" generation (pass 1) and the pre-flip current
generation (pass 2).  Pass 1 is not needed for correctness, so
flip the wildcard first and drain only the old generation while
building the Bloom filter.

An acquire that read the old wildcard before the flip may publish
it into its slot after the drain has passed that slot.  Such a
straggling acquire cannot have loaded the pre-unpublish pointer;
see the following LKMM test for the ordering argument.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 799784f698ed..86336f229f57 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -365,24 +365,19 @@ static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
 }
 
 /*
- * Wait until no per-CPU slot or overflow-list slot holds @wc.
- * Callers must ensure that the wildcard value in use by new acquires
- * differs from @wc, so that the set of slots holding @wc only
- * shrinks, which guarantees forward progress.
- */
-static void hazptr_drain_wildcard(void *wc)
-{
-	while (hazptr_scan_walk(wc, NULL))
-		cond_resched();
-}
-
-/*
- * Move pending waiters to ->scanning and perform a two-phase
- * wildcard scan shared by all waiters.
+ * Move pending waiters to ->scanning, flip the wildcard, then
+ * drain the old generation while collecting observed addresses
+ * into the Bloom filter.  New acquires use the new generation,
+ * so old-generation slots normally only drain.
+ *
+ * An acquire that read the old wildcard before the flip may
+ * publish it after the scanner has passed its slot, but cannot
+ * have loaded the pre-unpublish pointer.  See
+ * Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus.
  */
 static void hazptr_scan_do_cycle(void)
 {
-	void *scan_wildcard, *old_wildcard;
+	void *old_wildcard;
 	struct hazptr_waiter *w, *n;
 	LIST_HEAD(done);
 
@@ -397,16 +392,11 @@ static void hazptr_scan_do_cycle(void)
 		return;
 	}
 
-	/* Pass 1: drain the unpublished wildcard. */
-	scan_wildcard = flip_wildcard(READ_ONCE(hazptr_wildcard));
-	hazptr_drain_wildcard(scan_wildcard);
-
-	/* Flip so new acquires use the new generation. */
-	WRITE_ONCE(hazptr_wildcard, scan_wildcard);
-	old_wildcard = flip_wildcard(scan_wildcard);
+	old_wildcard = READ_ONCE(hazptr_wildcard);
+	WRITE_ONCE(hazptr_wildcard, flip_wildcard(old_wildcard));
 
 	/*
-	 * Pass 2: drain the old wildcard while collecting observed
+	 * Drain the old wildcard while collecting observed
 	 * addresses into the Bloom filter.
 	 */
 	while (hazptr_scan_walk(old_wildcard, &hazptr_scan.bloom))
-- 
2.43.0

