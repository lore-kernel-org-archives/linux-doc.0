Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811367;
	b=5RI3jzbe6BXT5UXqLZJzu0p2NAp8QGH33rK1b1ObKBg/55BRKevIDfrgFPyUxXJs1i3P
	 M1MwBYQxtiXvLe7oulwgs0rXLwyaeEHVqpxnUxsZxNmn7C+U9gHuhKTRMQk1GEMv7dWVb
	 RB8wS1uQb8DXX8j0ntgYplpDCo0O2m4woOIR5sp7/1HmY3vExNetQ10qWII+l8iSgATog
	 o7QhVCnysM9bUm4QGdKqdnnD9hF9KqnQ0rM7fLvo4fjWl5SQj3xRsRLCX6elKU7h9tG0A
	 +VhuyLHHHIwoZ1hxOaGRM/MwJeuNAxOoJ8MG/auSkmRZ+vootA4AQOUoVsHDSsz7NXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
	b=jJon36h1l78FfaaPrmlPFZ5/i2YndpRujm1UUTuaRXs0dL1a334M9noP6GZrHe8h4MAs
	 W0Cit0cVeEeL4WI0/UqeIfbHy5Xu5Fkjj8Cb5aU2L5SPi2KZx2yiY+QrA/sDIJYGwCILK
	 +364jx60qFqknyd03u50XqYQx946IsOpq89PXcvZ2HC5H64c4jBgMbinlcxRZpjEiMlMU
	 XD6qy6mPxZfYrvXK0HcfcjlM1TTZLqOWqX40bt+s622L1VrqTzl7SMAgc7lA8+XVjWV3G
	 u/8by8rMKITmy8DP5gdfJ+F1nwtmGcPpzts9QMeYsRPC5ZRvMmT9zqu0itYFzQtPVOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGUkONor;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71572606A336
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71572606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGUkONor
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a18fc7a38so2023520eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811366; x=1794416166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=UGUkONorfwM+zbVj6eSQLZ/CtHpB5o6WUk5r6DRCTGw9BsZ3jYHEXXgAeUMXpdkKHw
         rOZh0cr3KpIP5HIpA47NNa2SvdgBzVZO9ouBTKR1uZ7I/v8x7qERHplfE42RZ9WkV9rA
         WhTMYE7yMWjkIdRnqeFALhk6GGbkABiCkQLU/LhORN/exgEintJBo2+52BvPekR5iiCg
         JaiaFNJVcOrSF5SWDQcIfnWQzeik44hR0n1dwFRYF1zMjcPvRGBJLcLTj5Qezw261wSm
         VRmyrgJiAM2eYvZ3x5IdrrkO1UP6/IpCBNjSbQFnbFoLKEC4WWZ2HEP12RSgYhlCsYXq
         akpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811366; x=1794416166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=fLEpq3kLP6+xH2Nlj3haTgs2HqMc11BMwh7vltG6PP7SStD2acgDcWYTcB1uPFYy1T
         oTywrHnm4pjiq0bWwQwlPou7ELOpITL+fRm1k8Mzc4fjHoX04TqJc7pzJJqqtdM31rdi
         qU3AsY1T/n1usQHZCM6+/QdYaecjnYT799tXqdxVgyukBFykUXxVIGUhrg0R4yEIGDsL
         NTW2zUzERzYkSkWTMF4KHRaw+IiEMQgpdf1JN7dXMlDngEVtPuRSzuIpBiEejr4ljHGu
         V7XAbrWw7X0jydbn3FqVddPtz56zlLeyo9At0mdxgH/0ZRqswarI3r3z2U5ecPXjMR0D
         Ah4w==
X-Forwarded-Encrypted: i=1; AKwUvBwYBg7wFoTIwhphGypugxeAwJERAiB9s9xWm4mtlAfcZ9yjRP2qZZWepEpjOHM9jT9dLdKrPC39rFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dt1a74+K6xyhGfaFlyVXqcxLcTPlFJfIKZ4EusrQcolIRh3vd
	6+Mw52PQ1WdBgcBawaMuhGAKAN5WjhuwFx08fqYwt3Yn8UfNfSu231/1
X-Gm-Gg: AYBFou2egQdYnn52slNAaUDmoXMVrdBKWkZzsS5c3ObfeTj5lzJyNRor/zfKWlAzsCN
	hLc2sQpPy4RwbX0457fNDP7ZhVApCDMIBTR9MEwQ7t3sPjOkO4DKmbjnNz6KvFt33SNSHuAKN7S
	WgSbNEIVEP//0xY+rc7BWmWyoAk4mLbqN/pOtAw4lICrOYbsUuN1LcoRVUGSlmKKcQdWxikNM7U
	u5cPhvFrB7SSMVtZvyvv/yTeznqIQDx8+aXtS/qPNYjTr/mn2oIByWLHMYUlKh+K3AhNF0gvRRp
	ztaAYmdOGjwWKk27R54qouRBFmM2qxRwM0E0aJ1qJclXRNfYqscwTOMI7D2Cybr5+rq7FpGAv/8
	mLsAEw+oxC1W0bHnzfc2L75lmqPHK9n8DaG6fhwahzt3E3Vf5fS+aiNTvKnyCmIRTApEH0TBkCq
	FTuLX2Q2EowCblBnBIw1ORMA/Q+D5mGibMQkhwX6DgWlwo9C4D9GUyWgl4tjz4e/fyS8Vbm4JTW
	m3SS/SezXWqQcy1pyOOkuYv8wQQXPBMhDDLe4taUeKmqdBd6CVa1HafXEGKoi5oGQ76oZlSkfOr
	+BkN5IlX01XRm8LJ4OSbAToPKVKVQT8gpaBvaQQ=
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr26391236eec.28.1793811366010;
        Wed, 04 Nov 2026 08:56:06 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:05 -0800 (PST)
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
Subject: [PATCH 05/28] Documentation/litmus-tests: Add hazptr wildcard-flip escape test
Date: Thu,  5 Nov 2026 00:54:23 +0800
Message-ID: <20261104165504.2430480-6-kunwu.chan@gmail.com>
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

Add a three-process litmus test for the in-flight wildcard window
of the single-pass scan: a straggling acquire which published the
old wildcard after the final walk cannot still load the
unpublished object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
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

