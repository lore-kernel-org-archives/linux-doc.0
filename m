Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811580;
	b=XRwm560MFbw01jfgyn3RBHfm74Z8PPdt+aGay/2ilCWbdMGUHuheAKHLl5lUfKkcp0jo
	 aGEkYw/maqmU+eFCx0VRax+lOuxoRZ+9hx7Q2LUN1839Q6OCUSi2G/soPuuJgrU7/qR0z
	 AiOJ/ojk7FPFClHsYGddB4ITLXgJmNC8mi4ulwCu52Y0CfoukULwFm58GkR0JZkQMArUq
	 JTK/vQkDvRiBs+roz2lIjw6UL/uBv15Ybhj5mkzwIRSAO5Q0AKCw5d9v6Dub4xoaBITnk
	 TsmnT8Vh1bQcq6VWhq4e7ftddh4I4WphL5oFIH6OoHnhU0a7yge+noWQ398nT/I6mZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
	b=uvkYfCfWtltn0J8l2r0YShBTph4S03zEsXeSowhVCjKkb1YM8EJ7/9J4b4lVcF2nRgeR
	 X7E0Y5Vk34jYjZSunyV2ud921mRpYMKWyZoaAUyV+Aay+/2JOrrIBEicZtS/MJYMRnHd2
	 JJgA2TlRbu21uMab88Dau7nV/9UYTDZ19siLe4X4YvGTr3I/tcXyat07a+k63kjYbEzIn
	 lAG6OOEMyIxetgmRuijlAdCU+rGG90vzxr9AQXsYml6IGDFzmIHwysI8WylP/C/ZxrcCY
	 8jaOhjrcTtlXXx7svWQe3+xAplSrfwAWkZYSlrf3N+SLjzg5H1KE40IU3qFXIt6LBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrse6usq;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A887606EE98
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A887606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrse6usq
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so1233369eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811578; x=1794416378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
        b=jrse6usqBnrS+soUkCyFUg2F1RMgHEti6okHxkqcz8eXjyjL6hgO59HYse6SKdGg4S
         gmhsRH2BukszB3rE1G+ljKLc9MeAFdzPhVvn5ghI+cUZOEDZs49P6E2pUJcqypTcVo/e
         1p7oN0C8hNpdiiAZd58xsCRac5ExecZ8JbUWVaS9of6d8ewtNoh5E3iDr7qbTZgNyWoy
         MeYxDmBgMk8kqfKyiKGEAfj7Qe+JJRsN1N8Kn1C9hjexqAgVvQOobQZU0tiyHNyixf53
         j4xZoXo9nnFkK/q07aUOVg953ppzvaadCtW0T/zZajLGlqoa98FxyjdY3WwZXW4+j8BO
         3tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811578; x=1794416378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
        b=ClDFlC+pNskkS8mqXXCjPocckB0rmLm5YxaSTDW2q0P+GmMjj+in+T5zRZT8o2swvY
         ZGAAYxuN/XEe1trmQrCVur3vGUVrhNL7dEDLx7bbwjb/xrbregCI4mq3WoCfl6PgDbIB
         IW/YMVsO0c18jvFdgoeqDQ64JX1wItgRaxASQmiQUG0dZnambIDWOECbvxy6tTjDy71t
         qb/QyWwvZ0jOp1GmzrOYWZPFDImKVuojTBfFTrFrIxquuRkeNveIduX7OzoHdLLlgtyS
         u7peV71qBjDMwAUn+sk6aRvJXASKXYr4KOs5pcOKNu7a5GKM6VcHASP+Ipmz6/YZ3CZn
         rSww==
X-Forwarded-Encrypted: i=1; AKwUvBwr9iQE1NVj6vOZNOaTO4RuY4e0NqVBwMSnLz3ktFO+rtyRmBCs6LOigvN1vACX6tB2V4JT+BYGv+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hQRaRV1rPw2nwp/PnvC2qyzeWsQ4ReZyaSUlTWfthMxKO3nhG
	xzUpcr5O7mHMwq5Sf0/Rl9w6R+Hxclv68hmw53qok+8Gi/duQJ6b7hTy
X-Gm-Gg: AYBFou28FFGYGmoNHS10APCReb4zythKZ+wkMbHyypRAt7IOqp1GfPEbnOV/chudgjy
	Ps5A6UoV5EkciePAK+Gnai3gDVNxBk8jB2kATSnLdtrNSkpJK9awUulza1nbaWJ0hCAaFf/fuG0
	FK82qsydEFDr/dzCyDI+z8xvN0kcFweAWpI7ZNfW1mNdwGwfcoVTokSwNYypZoxb+DPPZ4QIy4j
	gVr9fT5ZntIO7wnVh47fjlF2xjjHQmjHDAK1gXPU45gDOz3n2cZI6SCmLibJtmYo7dV7nLU5FS2
	dPap9Yk15bPGzRpCpCJeQugiuGSXkBtr9Va9qJNxgKGYxrzyo5mJ30f7nx7cqpNIWwoXEQzWaBl
	pO4JPmLCdq8K+gZBF5Vlfh4OiWFMa2A8bQ8aZ/rANAT4gbBJv6JuCxTgMQMBDFoELT3nHEPW0OU
	Pjm3pTpQrvnw6L5gVN32qh5HAaEcXLxg0g3cA9XfYYDNjmHQToNKNInqvToZhHzpthYofJkaWO+
	aHPwN5xxe7FuBKJIyxHj/Cws9wq/bqTIaFdwtClTtRAzSap7y4lyo1eekV98e2oY0GWyup3pSGV
	06Rz1p1+Dg6wv/Z3nlFrqks36hKMFWYWnOX2iJnfIIP/PwMQoxEVnDz69ip8
X-Received: by 2002:a05:7301:fae:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-36a424596c7mr24456857eec.23.1793811577443;
        Wed, 04 Nov 2026 08:59:37 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:36 -0800 (PST)
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
Subject: [PATCH 28/28] Documentation/litmus-tests: Add hazptr bloom wildcard-hole test
Date: Thu,  5 Nov 2026 00:54:46 +0800
Message-ID: <20261104165504.2430480-29-kunwu.chan@gmail.com>
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

Test the wildcard-deferral of the shared-scan Bloom walk: a
slow-path acquire that published a wildcard to an overflow-list
slot cannot be missed by the kthread's post-wildcard slot read.
Verified with herd7: Never 0 6.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  7 +++
 .../hazptr/hazptr-bloom-wildcard-hole.litmus  | 49 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 79b0634ddb13..561319404126 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -111,6 +111,7 @@ hazptr-wildcard-flip-escape.litmus
     scan: a straggling acquire that published the old wildcard after
     the final walk cannot still load the unpublished object.
 
+
 hazptr-drain-engage-wildcard.litmus
     Test the drain engage's wildcard defer: an engage that reads a
     slot holding a wildcard (an in-flight slow-path acquire) must
@@ -127,3 +128,9 @@ hazptr-drain-safety.litmus
 hazptr-drain-generation-visibility.litmus
     Test the drain generation ordering: a release hook that observes
     the new drain address also observes the new generation.
+
+hazptr-bloom-wildcard-hole.litmus
+    Test the wildcard-deferral of the shared-scan Bloom walk: a
+    slow-path acquire that published a wildcard to an overflow-list
+    slot cannot be missed by the kthread's post-wildcard slot read
+    (completion is deferred until the wildcard resolves).
diff --git a/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus b/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus
new file mode 100644
index 000000000000..28a2bc1206c7
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus
@@ -0,0 +1,49 @@
+C hazptr-bloom-wildcard-hole
+
+(*
+ * Result: Never
+ *
+ * Wildcard handling in the shared-scan Bloom walk: a slow-path
+ * acquire publishes HAZPTR_WILDCARD (Store B) to an overflow-list
+ * slot before loading the target pointer (Load A) and publishing the
+ * real address (Store C).  The scan kthread observes the wildcard
+ * (r2=2, its walk loop keeps waiting) and defers completion
+ * decisions; the model captures the final post-wildcard slot read
+ * (r0) that gates completion.
+ *
+ * P0 models the kthread's post-wildcard read: it must not complete
+ * the waiter based on a slot value observed before the reader's
+ * Load A.  P1 is the slow-path reader.
+ *
+ * Question: can the kthread's post-wildcard slot read (r0) miss the
+ * reader's Store C while the reader's Load A still saw the old
+ * pointer (1:r1=1)?  The smp_mb() between Store B and Load A, paired
+ * with the kthread waiting out the wildcard before its final
+ * load-acquire, forbids it: Never.
+ *)
+
+{
+	slot = 2;
+	head = 1;
+}
+
+P0(int *slot, int *head)			/* scan kthread */
+{
+	int r0;
+	int r2;
+
+	r2 = smp_load_acquire(slot);		/* walk sees wildcard... */
+	r0 = smp_load_acquire(slot);		/* ...waits, reads again */
+}
+
+P1(int *slot, int *head)			/* slow-path reader */
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 2);			/* Store B: wildcard */
+	smp_mb();
+	r1 = READ_ONCE(*head);			/* Load A */
+	WRITE_ONCE(*slot, 1);			/* Store C: real address */
+}
+
+exists (0:r0=0 /\ 0:r2=2 /\ 1:r1=1)
-- 
2.43.0

