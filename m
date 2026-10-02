Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F8501291
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961017; cv=none; b=d8t6Garf0IDgZlpHJUaI6XrITeVD8NavjGVk8mPNjdV4OzWRhtpnokKcFnJztmbZR0SdBTzuj1bDmiGh1eQY+WKcug9vJ2yNMnLSu+fdBPTF9VyR20th6kNsC0YCT/Jy2eb0FVEPs8ZM+uNxADRCvhzLBJnl80TMDqHc8roGrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961017; c=relaxed/simple;
	bh=qSkRi8XlT4WUuuM/Vrnlxa70Aiw5xHXCcH5kKxR3bV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/CVRjWTSpFg4pPv9Qjj68lGc6Ae5sO0S5mG85aN2H2bxRlw701blryuk6W0044RGPw6kr3Ax65TH2vGdx1BNPkIOm1R5dS7ahNb/vE+As7W9HYtjJ23NrjUm5WMSOpXA811pjmQdhxm7qjAGGGydgQvlxzZyQIfqF5hDkREOGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNNhhxi+; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNNhhxi+"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6d9baf76bso668395a91.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961008; x=1791565808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdf2Dycggm4mT6sPheIXdhrke0YZJhuYFMLF05Xnp3s=;
        b=MNNhhxi+/9V9cBpSzrQ9rBUps92aDYFjhe4ajkPoz7rBNWRHx9SUVUM3Jjl3EmknDE
         LJArFrEOqpNWBD3gNM3u1083or6Oy6Ufp4YeZ628XudtUIri2nxGwONHW3Rr7eXQlAH8
         7IlasPHjm52GV1ylWvkeeYMKId4daxOgHLoIg80h2sMdS6RuTxGGXGYvw2hbi3De4o3S
         I1C2UdEdHgUcw0pWoMTfvIN5l312iBEkfZE8ju/MFTEvCkKk7O8oDsr9vuknlxKCmRok
         bl/M19KGiCWwnqfwKTKvtJBNLCEaUyApH2vR2vHcMP4Fx3hYnk5Sp6z/y2zPaTFNAloZ
         LLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961008; x=1791565808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdf2Dycggm4mT6sPheIXdhrke0YZJhuYFMLF05Xnp3s=;
        b=ZIls8qsX1ciwMxAus4wwfhUda8Va7mGAqnidedWOvtodYP/KCjQ0wVGePzJM6sngOr
         VPvKjASrwGjCVbf7VnDp4XhQshBlXpbUNY1VcXXUnfofd/R6Mf1g9gm7UInxWdY8TMUT
         +zmOYivax0COA8yhiqQVX4PNt78BQ7+uai2BTgGKhed/M8/j4Ed658ZK2Yv53rzrIQ1W
         MGLqHTAq4AVYumYBz7jJbAy/zrOkLhmV7mhotwj+jNw+RewcpoXWo1WSySx+//kyEaLQ
         kHg0GOkCx1p6hfFsEhqWJXXj7d/brJuADDUBFDcgmH3hX4TAZWtOoICMb2NcM3neRIPf
         YV9w==
X-Forwarded-Encrypted: i=1; AKwUvBwV8k/bjIzV3O1RakYc1m2vi0v9Ce1b0Kbxy6jnm5l8vD0yBCDTlDPlRAl3e5RgqbTSu5Pp9VtJhIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRJchDSCyJTsuZoUt/KYHgD3RYTS+xqEenxLEun/HLvywalpKB
	EfPoLtjWAwf1As2SXnoC/aRS6EE+ewASZhRahA/MNcxw76LKfixMYs5i
X-Gm-Gg: AYBFou2jXifovMaGJ8xBnaXPpKElywrK2p8QBNeLUHFHkWh8EzZ1Es9DfPQqK6Jmo7T
	idr7qPreWi/4kxBfJg8ejsNO3/nolT2kuahfTog6Np94rseCY+xb/Ok9qbPVwtLEje/WcIxezBA
	gHws4kCae4MOYdcSPyvGE8QznvaL3foqFz5STdKE47MsrnE7uKOHI0YkSF3JWyF4v2+IsjcSCLR
	YINH0O4fDQ3EbpAviwbXwzjksq7I0V6G4/qbj//V7KwSwkLskn7Wel1B3yo6Zs0qKp6cn1KN/n9
	i8i76MZ/L8CxWI+zjEs0GyKN6fcX0tjuZgXJ2vv9hl51VbNlAfkKCDKj7mluj5xbWZCESGDs+0p
	xvjkhKLs+hMpVACqVoUOgKrFBvoyE6nuvOFzyGUbuZxsCKR8JOan7yD4FPfj6OG/DBKtSHozMKp
	ryd3zvNl0WVthnzjvURclwu/tsk8f01y/k+giZy5JfsbDEs/NrXBnT461nH3WoADRB5A5ovYD7q
	e7mMdUG2/SoiF1nNQ==
X-Received: by 2002:a17:90b:134e:b0:3a4:aa26:21c7 with SMTP id 98e67ed59e1d1-3a6ceae5a45mr3036272a91.25.1790961007656;
        Fri, 02 Oct 2026 10:10:07 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:07 -0700 (PDT)
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
Subject: [PATCH RFC v2 06/15] hazptr: elide redundant first drain pass
Date: Sat,  3 Oct 2026 01:08:38 +0800
Message-ID: <20261002170847.3653663-7-kunwu.chan@gmail.com>
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

