Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811377;
	b=BtF+DshSd9XvoyI2Vyxkd4pVvCe3dsUmW3AdxIHB9n0xDaeqzq7dCcy5uQ4vKP0imEaM
	 C+8lBvfAxWXp/UDNWN/Z+n2ip1GttOKi+YjG9S8DYpaR0PiLw8KK/Xj+95uaNzucOjD+9
	 ex6Pbhcwbn7Q+TFvb/IL60A2PD4LgOzN+B3pmGHW1DUqSCxjjPCSJtoTotGEBUPksCf9F
	 0BJfBvnt2jdWEvSALe/6L0jQjscI+LJVCaFoRHv5hWJouA73R6zJjSkVnbloQ7INvjMJQ
	 BP/yR2B5I83ziacRRuKr8xn+4ClAP3xIfvnhTsAONjBwT4gonyM/dW53b2pfUcuvfjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nKRyKe5HAwN5rnftg1fZEx1NjIirnpES4D9l2YLy3Hc=;
	b=uVPwkOBnnnFV6bsW29UI1FVtZhzbjKQyGPZ+HeHI9fE65t29kezG4aboYkuLdXgFE7lp
	 Pu3iai0pZvxLszSPWbadZ3lGlmKPAhlSJ6xs8vfPomr4vEYrxc9kQPoBssdPjsCzmatsT
	 cbI+tESbgOoDNIHh+vDA8ZA4m1w+La8jS1JUji2ROSytmM59nfviVve3OUiWS7QhU1PxU
	 W91TCWGWNUlztvEdGs30YX9Yww71LUUh96NhTWIYUtPLnQsGy2wslAORhQWoTdtZXeYn+
	 gI5ILdSdnyFg+7ZAKzr6d9n3KybE1GMwzC6vbVNMtmqWkccQylagXm7nu2zYC7iAk5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJx8CYfD;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F157606D802
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F157606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJx8CYfD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so918466eec.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811376; x=1794416176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKRyKe5HAwN5rnftg1fZEx1NjIirnpES4D9l2YLy3Hc=;
        b=HJx8CYfDIWJR5BxeLKAMWOYvIZbEog2kUXnrtJDRdSpUfdmh0HmTSZ19XuvWLXrCAe
         Ky0i5oMjyTdDQEQi/vWkK7LRip7d0uc22R2FwngdRvNmVlH/BrjpALMLN37dEdQI05BR
         qWg6LOJlanVMuZ3EEIj4K1+hiJy5rPEstLhpVNZD4crGuuwmzechnuz8MK7pYnU0mnDC
         RPut3X2Iik9HLYXsIPq+9uxxAKsWBv/wIZbfkvNzPtTlqQWfialaDUaamzNlZcOO0dqk
         yZ35EIhmitWCvoDair+nYT7gGgqD97EiaPStAb4/gM6Hy4brt9vcDlHdzBnZNwf6OUU3
         39dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811376; x=1794416176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKRyKe5HAwN5rnftg1fZEx1NjIirnpES4D9l2YLy3Hc=;
        b=t22XgcSH6XWFATqyiRn7YI8jFz9opnbEOarxw++lGjrLyI3bAEV9vg6GSvWAKwEG/N
         xIxSDcpfi3GhAqR8QcSf0VVFfh7Js28tarQ2oQliYo+6Qbev4ayp689cy2PdH83BpjQk
         67H4H8hCsX3hS4B1lvWg8uzsALASnD1VUl5BuUvJufwiE4rYZm7zjzL/LMol0SfBxING
         rpnFCNTAEPjdpOhbkJuzG8Jg158uLBfWx8Bemlae7peehxVUlNZXZN9NqgHoXECbiNzW
         Ok+Q8vI35RUuXFmebhcdjq3gzBHz3jvwSRt0nNqWRmDAjk2Bfa758EooNyaNBX6z76Uu
         ziuw==
X-Forwarded-Encrypted: i=1; AKwUvBzELjWH9FlI4CWaAE0CQw0ZkcuqFpJwzQJ5tAqjfoMEtAhsEFHb0VG7PqdM5g58pPJJJqeUhu2iOkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZsXzPfRPQJHiM4DqxVAwQoqhM2sIBP5Uk19rSLY8AfYVBmC1T
	NvZ56LgAUG5Pc13D5CaBDPMNSER9dE7DIq5qMACLWUrDQvPAOiuj2A6b
X-Gm-Gg: AYBFou3HL+tKPRJSytx8BOHcuMbNkZodsxdaIRB6WUS2uOujd9LoeVXTuUFWkuY8pVg
	z/ZOWZbDQw4I1fi0JlCmkzrUDTonWcSvRKzg9aMf+Nv0RkG8iLQ0eyZWFDiXTMga/v1NDoGpfzX
	tMjoq5uf/p8FapEj/jb+oKpErimn99+Vi8Os6n9HKDwqEMHDtnQPEVVDSg7qJCdU94Hgryi1Sg4
	jdZfSlQ2cLxLt/VHLLG+BiqdMlE5fmlsvvcv69PYapUZKv86sW6Pk7KhlxFvQydHC70Fe6mN3lP
	Mgs+QFATqAVlzxmq5zZbRdIDKOyW7GH3UyLONHIvN7YUts8ErpjCJHKWxqvOKhDlsJL/P1ueslG
	eDfNcbiIQMdGXfOrmXE8J+kBF3oFycZ8Cr8tP6LsgJSjIi9tFdgoK3LlOYJtNBvNDips4bgxpu9
	/Jf4GfMG0kMZMZR/MXSLbwcnQSgItuNp1KktVz5rBG3Ck0GGkGp7TrsqApvb/ihXzzQ53EOIVsW
	lVU3DQhr2u5yuCktPLbtJLXRwIGUfY6uKETRSU03iHduer0mDIV9uZvJhsksQK3mRqX+dhXZ/dG
	absxBT9ZdP7kmRp8ZEMNB2/ujMlRElBJGpIdaZM=
X-Received: by 2002:a05:7301:781:b0:36c:a351:fb31 with SMTP id 5a478bee46e88-36de5f6fa87mr70409eec.7.1793811375449;
        Wed, 04 Nov 2026 08:56:15 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:14 -0800 (PST)
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
Subject: [PATCH 06/28] Documentation/litmus-tests: Add hazptr acquire-before-scan test
Date: Thu,  5 Nov 2026 00:54:24 +0800
Message-ID: <20261104165504.2430480-7-kunwu.chan@gmail.com>
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

Add a two-process litmus test for the hazard-pointer publication
protocol: the reclaimer unpublishes the pointer, executes smp_mb(),
then scans; the reader publishes the hazard pointer, executes
smp_mb(), then loads the pointer.  The smp_mb() pair forbids the
reclaimer from missing the publication while the reader still
observes the pre-unpublish pointer.

This is the publication protocol used by the lockdep
is_dynamic_key()/lockdep_unregister_key() conversion.

Verified with herd7: Never 0 3.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 Documentation/litmus-tests/README             | 13 ++++++
 .../hazptr/hazptr-acquire-before-scan.litmus  | 45 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 4d4ec9c6f2cc..c2bf20fa4092 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -97,3 +97,16 @@ SRCU-fastpath-scan-before-anchor.litmus
     period, violating the SRCU grace-period guarantee.  See
     SRCU-fastpath-anchor-before-scan.litmus for the opposite
     ordering.
+
+
+hazptr (/hazptr directory)
+--------------------------
+
+hazptr-acquire-before-scan.litmus
+    Test the resolved-publication ordering between hazard-pointer
+    publication and the scan.
+
+hazptr-wildcard-flip-escape.litmus
+    Test the in-flight wildcard window of the single-pass wildcard-flip
+    scan: a straggling acquire that published the old wildcard after
+    the final walk cannot still load the unpublished object.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
new file mode 100644
index 000000000000..6dc13830c07c
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
@@ -0,0 +1,45 @@
+C hazptr-acquire-before-scan
+
+(*
+ * Result: Never
+ *
+ * The reclaimer unpublishes the pointer, executes smp_mb(), then
+ * scans the hazard-pointer slot.  The reader publishes the
+ * protected address, executes smp_mb(), then loads the pointer.
+ *
+ * The smp_mb() pair forbids the reclaimer from missing the
+ * publication while the reader still observes the pre-unpublish
+ * pointer.
+ *
+ * This is the publication protocol used by the lockdep
+ * is_dynamic_key()/lockdep_unregister_key() conversion.
+ *
+ * This models the resolved-publication case.  The in-flight
+ * wildcard window of the wildcard-flip scan is covered by
+ * hazptr-wildcard-flip-escape.litmus.
+ *)
+
+{
+int ptr = 1;
+int hp = 0;
+}
+
+P0(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*ptr, 0);	/* Unpublish. */
+	smp_mb();
+	r0 = READ_ONCE(*hp);	/* Scan. */
+}
+
+P1(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*hp, 1);	/* Publish. */
+	smp_mb();
+	r0 = READ_ONCE(*ptr);	/* Load pointer. */
+}
+
+exists (0:r0=0 /\ 1:r0=1)
-- 
2.43.0

