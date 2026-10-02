Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0125013C9
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961040; cv=none; b=NuE2utfXGgPv1ZUD4fsEY6U9JmB9LFXrWmk2Ar/xbVmoYyxGMJrI3MePLfrByAtA1PzcQwK2O0QkTMEidzdSDeH2iEW9UYErAeF/0thtOhQ7jszmG9qwZPa1zKhhFpFoD+D8nkxJhraoKw+KKSMD3w2wBRGJlC5knE8Y7g4xw+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961040; c=relaxed/simple;
	bh=efWEPmj0Vc93yD7ksoAs6CSfVahXXbn88QWzVR/N9r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzhLR2L4h/WVQnDX3vFpeVnhSNPAl6A0SgogIOxgRVyoUbdGWs2nlv7jatqN+oabnQBn1z+Ube52EOUQ2iAcrG1Fl1B41jrJMguiitqGVYIwekXE1bC7Q7ThVhL14npV8S8aValM0QPN4l4F+L3P6JejHLGImudZMmWA7ogayuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc9hwhi/; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc9hwhi/"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e4c841e9bdso1520225ad.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961030; x=1791565830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aHGH1btHKyA9bPipQiTAK39EsUtmJmoqAt6kx41g10=;
        b=Zc9hwhi/muWpKPb1YQkRv8j3Lrxz8qHYxUikCn/vBZfDAga5Wfy6Bs323IcaMvkAlS
         uzFxtE0O/KKs3AHvUu4F+bxkBfoN230osEkRbt8rtVZbCXMzDwXY6Y9ikeKjfoXVxSZ/
         QWM1d+bYreYbQhAbZQbuOjOw/k4iEskLszWcXcoZNDs4otuZI/GjJlvECtwUvcMol3QT
         Tt6GBI/rYsNEChdK5Y0VTw9geNjQIr7E8W6I3XEP70hnIslyxCugqDb8LhsTS7vFwpDt
         Ue2cj4aiYboVa8od+cbZrNIgPWXqLQJ7JB6qreoGgRgjSCg9YurBUpC1u1d1iEzr4jpA
         gQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961030; x=1791565830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aHGH1btHKyA9bPipQiTAK39EsUtmJmoqAt6kx41g10=;
        b=I8xe0nS++kHLiCCWiiqKR8Z6a0qnGIyggt+15PMm6Z7OVFIv85g0aCFmlU0Tha0WR9
         qq2Dw7cejrZb2yUDmv7OpJiqwOF5TkNqmqjHeP7CMQO7NiYqED9FV04qBgBrwABF/rRU
         VsBecn6vCAwPUJBZ+S5asht7OUBJQGPoDjRzdUyMTJhv2STeLWndezvsm0EAf9qdJYTj
         vj0SUoHYI7+npPTTy5t+9XrkrogVueCaMYk8HYHyHAKeC659FaRzkF8AeiMXSJnrR1d9
         gTYd9/8kMKgSUibX1sPTa2btT+3/OeSlNDg8r6wDUFP4kO0HTvpDrgOn2Ypt5Fwnl7Zy
         TLFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkVDCERx66Usk06+VJrxgBxVrx+FI7igcjETBmQRT4+426N8Z2KEmVLVdn+cNAGVj7B7lZchUeLM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOzuUbWyZCgvj+FOpVUKbYh5O11MDhYnDYpuLYsYUa04pqPA8q
	C9qLP6WtPu8RuSZcp7mk7dn4AV92556kURiTHuIrp0wNacLNwhQ682uB
X-Gm-Gg: AYBFou2KI4dHWLGjJz/G0yHyP59T5rBEgoDzGR8OQI6BepmDOxB8Mmw0YMrmBvf35ZB
	rpr5CRF/hZ0G6rcEZenwDL9Qfy2Uw12SbPFmYyp8rhNpCrHS0V9c/c175ntZtUDuUdT2059tlSw
	CiB6/PHyVFNYTQRPIT9xrsZhUpN/KaD7fPlb/c7frAxzXEHlKXy5fc3bZmbcI5Q2XOPDAfwjTVH
	8RwrKy3QiJ1pMcmcB3IKaKqTszbxFiZ73JPx+mp0FOKVVi2JUPyYjogpi5RcDnXMuJy8YIhXFMP
	I2o6SWph7iMlML3p0xe3ncKkV282LXgLQUNgdesTut58iOyalF0Dz7jsikuPWhFQhenLcDNqLmA
	V0FQM0SG5AB20oumg3Ca+4kPZV416Rjmc8uvlcT7BjMMwTkMnBN1r5Rn/EiJ4AIxZfMGiy3BTW/
	NVAAalfwR1TlMjAS4v0b2iSIKIIiQ5i7mbdQgNvpafyxdMQGYkaIGc14dE20R7n90kQC9bI9RqH
	Wpo2JRRszCwPPCrUQ==
X-Received: by 2002:a17:90a:d2c8:b0:3a2:b70b:9cc3 with SMTP id 98e67ed59e1d1-3a6ce5a1ad5mr3213022a91.8.1790961029453;
        Fri, 02 Oct 2026 10:10:29 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:29 -0700 (PDT)
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
Subject: [PATCH RFC v2 08/15] locking/lockdep: use hazptr to wait for dynamic key lookups
Date: Sat,  3 Oct 2026 01:08:40 +0800
Message-ID: <20261002170847.3653663-9-kunwu.chan@gmail.com>
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

lockdep_unregister_key() waits for is_dynamic_key() callers with
synchronize_rcu_expedited(), which requires system-wide coordination.
Make is_dynamic_key() protect the hash bucket with a hazard pointer
and use hazptr_synchronize() to wait for traversals of that bucket.

The hash bucket returned by keyhashentry() has a stable address, so
it can be used as the hazptr synchronization target.  Keep the key
hashlist lifetime RCU-based with hlist_del_rcu() and call_rcu().

Protect the traversal with the hazptr scoped_guard() added earlier
in this series.

This adapts the lockdep use case from Boqun Feng's shazptr series
to the current hazptr API.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c56a7f91d72e..d1ce5ace7fbf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1280,14 +1281,19 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
 	hash_head = keyhashentry(key);
 
-	rcu_read_lock();
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
-		if (k == key) {
-			found = true;
-			break;
+	{
+		struct hazptr_ctx ctx;
+		void *bucket = hash_head;
+
+		scoped_guard(hazptr, &ctx, &bucket) {
+			hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
+				if (k == key) {
+					found = true;
+					break;
+				}
+			}
 		}
 	}
-	rcu_read_unlock();
 
 	return found;
 }
@@ -6683,11 +6689,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
 	 *
 	 * Some operations like __qdisc_destroy() will call this in a debug
 	 * kernel, and the network traffic is disabled while waiting, hence
-	 * the delay of the wait matters in debugging cases. Currently use a
-	 * synchronize_rcu_expedited() to speed up the wait at the cost of
-	 * system IPIs. TODO: Replace RCU with hazptr for this.
+	 * the delay of the wait matters in debugging cases. Replace the
+	 * expedited RCU wait with hazptr_synchronize().
 	 */
-	synchronize_rcu_expedited();
+	hazptr_synchronize(keyhashentry(key));
 }
 EXPORT_SYMBOL_GPL(lockdep_unregister_key);
 
-- 
2.43.0

