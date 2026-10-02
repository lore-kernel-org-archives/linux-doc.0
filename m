Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E733503BDA
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961079; cv=none; b=dVh23Rzn8zboYwylUc+EIHUCpCH2ZXQ731Fe9MfJOmVugaenXjhRNJOFEtrhzf5/ScbINf389pB/m7qjlPQNwM3f3VbulVF77x1ElD/hWIiPzxilwrLMcZFyJ6KoURnvtRzwocoZEmX/ghd2NgN0IRLY5D9RKZ5p5NUo/ZTNSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961079; c=relaxed/simple;
	bh=VRRvq3zLEbjKyIt2UhIB5bfMCL6WQ+2ygOmVvN1KkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+Uzxaa/5Rv/cZ46aihXdOA2cQlvUmL4/9hZSZTt81aHgLBQboyeDj451FhA6fLGlaECFRzE0YD7CJAm/p9IjhTWQym2I2PeEa4+VB3BSYbg4B1zzTMFJSzrxnQcd1tUInNMydBnBrifhO9svCeReAXps6XYYWwoSPzRSvEET/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjohda+U; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjohda+U"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2d42b972bso27101275ad.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961072; x=1791565872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=Yjohda+U1LkmX0Sv2EzS1S2PbXcFm5y0bSnamZN6vV9B1c3KNTldFwVK7f/CayVn6c
         bz4phj6mU+CJ1mHCMoY7WwOZerDeCIPe6YFXyW+t+5Fw3JTnJ/ZAFIasxMsuXUz4Jr1A
         qELy5swnfLQX+kOVoAWV7WBMpP9xFGcJcEyjHemphVM98rnDY4Vb1fLILV39fDJ9pvEy
         ElRGYOk4db43DOH6isQb+2H0LNcswEJtUFop3UXgMvEMeLJp0GJj4fR4TtAwT2MTgdUA
         Ir8yxDNV40A8y8288bo2F0QcW+CGrz8tGZcF1yJSVq0j4VmCZrIYwbMwwEP3bugSEEPp
         imcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961072; x=1791565872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=sXQ4jZzcn9CNSGPZ4pA+dKrn9UpvmAl8nA/9YuZqQS3Z76D3JN40fl6gtZCVzAYZiW
         CdU/ET81du8j0/kkesk0TZ1jT+mtmbsbvdRzfOjMyB+effF447yS5xdhRTjzP0XUkfI3
         AAEwbgYdbelfvNMM3GNXIyx1z5YWsErpuzZTgt35/hLgrXWnU3pNOq/DzjqGnh3bHdtD
         BtAWhJjK4jPe5bTEwmrbcI91n3Nq0cMxliHUYmopcmDVom3S+UPPrc86Gc+lm07xOJ+Q
         /kbS2g4rFiMzuH3eC7lEMvs9eJ3F86G+oHlhB2HDxSAc78b19ZS1gX+FXzHb0oFePN9B
         Vt+g==
X-Forwarded-Encrypted: i=1; AKwUvBz9rxKSHiXWqzuhp9yfekmbC3KCkPb83R8HIxa3ebpgwcAKxaDr+rIZ9vXZlYRs3hOxG8FE+FayFmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlJz6B1hJkxcWU23dEkeRaiDDuzxmP6cIDQRPiQNCsii/lskkO
	8iJSJpn6cOvGG3NxhNW7zN4bkifLd9Py23Lv09GBbDKRSU/s1/YNiAs7
X-Gm-Gg: AYBFou3NaZzWXBBQxM3k0HHe8ALn7kGOirHmXqREeWiv7PwnsNWMxBNfLw/SFak83q/
	qIcIFGqOrZi1E/9O7dMxSXb7dYF1xYaQpQALkSvCPAupL2dF/lAbjYQqbTBks0t7a3K5VYzK1/B
	v4EACvlDLTr917sk1bQJ3fZZipg0BkTri0PLugPGW59VyD9b+d3OUbQGEaCHw2dacfCx50SG9Iz
	+JAciqJbOCdd3ijSuQaXJgZqvMqkxfSb2o5h1d8R5xIV1JJYLnm6XrtiMl14lo0FVS/dovCYUvd
	8pbyjx3titrXoSzPPAjFbDcHatlPOzosKDGrj+Z57v2pJYNeeiU2U5wJYbZm3wQbPeP11O7SCaT
	+HAxseeEYLN6nkzvD7dD91VUU6PKyhiFlPDkWCus5kCDJ9pypXVTBGLqtCPLcl4EdR8GCwsn0/Z
	zkN+jait2ozpQ7L09Qk/5tTixQMB7ErL18P1CggP3ysMWajJeATKbN+5K55Vjd3lPmGzEF3edc+
	RQeesr4xmJKO1EOAHfhtpc00Cdn
X-Received: by 2002:a17:90b:1dce:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3a6ce959345mr2938832a91.25.1790961071827;
        Fri, 02 Oct 2026 10:11:11 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:59 -0700 (PDT)
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
Subject: [PATCH RFC v2 11/15] Documentation/litmus-tests: add hazptr acquire-before-scan test
Date: Sat,  3 Oct 2026 01:08:43 +0800
Message-ID: <20261002170847.3653663-12-kunwu.chan@gmail.com>
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

Add an LKMM test for the hazard-pointer publication protocol used
by the lockdep conversion.

The test checks that a scan cannot miss a hazard-pointer
publication while the reader still observes the pre-unpublish
pointer.  The smp_mb() pair provides the required ordering.

This covers the resolved-publication case.  The in-flight wildcard
window of the wildcard-flip scan is covered by
hazptr-wildcard-flip-escape.litmus.

Verified with herd7: Never 0 3.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
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

