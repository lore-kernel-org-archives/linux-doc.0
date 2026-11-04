Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811505;
	b=ZExy5QtI6yEZtcXGgAjaHKDwaX/UX7rGELBOhBXe2XB+djyt37p6rQ7GCxsvXoZMGnnW
	 +mL4OpFUkrrB2LNL8qdqkExtq+CYb4efKtVwexRm9wBUTqquodWgRj2OR97YYNk3+6kRc
	 1A4wZLL/KC0UrQbAU5WAYaumjr+NQDLtBHHM7gpt8jJ1R82+pNZ1pKZBvfV7r58lPjhcF
	 hAguHdPfnydc1TXvt/aQ1oefNLb20QVxNQWmRiogFMSnNspTN70EMRMMFMRSyB09e2W1U
	 WW1mzD0usA1Z8DNxy2jgrxry+wsNXdBXb4muEgDGJXAhGPoGbisZ5KxfXKfHEgo86DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
	b=M9TFVgSuHtqb+Disk2kn4SU9eHmOEaY0iU8D0s8bVwszF8E8eRZ862QcIBQC4avOy289
	 8SzRMWhJ9F7LZstG/jIsHkUhUpl0/DF6+t8S7K/Cq3CbOpqDB2ZgwqgfvzRGFqKpPGiWp
	 fvaNzdV8d7Qh3S7ALpJFj9qCWfM14K9CK0mW7+EaTeS39ylDxFUrhkExXq9nENkZnzpIG
	 46Vt4nzU7G9PTXJ2GvqkRFB6J92wu6YIrgZ/ZcWNmhkqCNqYWUD0eNLvmjeFN5qy7dn4/
	 IeTrmjlVZsrrhAZokAD5S6EcLFWsfaU2JDLZBbVEayTNcxbM+39CS6XlhDAcK2ZWBbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4EEF2kO;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB41606D809
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB41606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4EEF2kO
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a1947498bso2159119eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811504; x=1794416304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=d4EEF2kOlJ9ZwT7ZAqTk4BEQB6KcUy0uA9+FyL4MbNN7Zu4rDZNZ0rp/SjEM1SHJ4i
         +t/vAUuu9SCQC3AYeOMIngo6oTmzHstQm5PfvbTiZo4E0zTT9V6oh0nnxsdi583LVoP9
         a7tSdg9pv18ePLJgUJJGIePmp4/HtLBlGIL4B4XqWh6wFW0yt6vcN7QL4y2SPKtHKdOU
         bs9e6FLPI+Lm9iDleUFUew9o5bRM5WOk+/D20EOyGWfHt0Q6311/IX/Ow+PfL0FIwOAS
         sJp03RdEH8YojNlrwn4RUuHSxdKSA/A8BAe5x43K6gSXTYuYOLC0EeO1Cb5cyDhrtx52
         4QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811504; x=1794416304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=bgKecne5DhjEEohF8GVABFeL9lTLIgA/F6J3OtCY2kBn2CEbEOswG+EoRAxOnApT60
         847GjVo/Qt1r1EVci7YGHiBuke9J/MImPRaGwBG9M44RasIanDWZDuQYvfetTlLk6ltt
         WTNdivnpuJhfX+vj0xZvXXdk9B08GWDJ9xoshbxO4A5TWcJJxumSlMjrINr6mPsNnMFJ
         23uov0hyUNRRMKtc0FvfER4wTwo4exQzs60G8hV9A7AFruFwZR5pQbsaw394PGhyyW89
         FkxIUkLRmByMdd9ZowITWxc8p3q1F8Z7flBGvIpL/zhZmcxbYNfenzmm17SKazyul0dS
         UeJg==
X-Forwarded-Encrypted: i=1; AKwUvBzz/upSomY/IwK5VhQzhDdxGNG6KHZVk97XnBBVioQZVjbXhSJdQmoQORilI6oytMv+RVg3z20ai0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VSrHSkRB0RIRsYxSHSruR10y/04f8mOCHr1TaSMrdjW12t1Y9
	/p1u4o5TgjUSoHEmMPWmkIzmjaP3o0BUSeCm0hwmNeIX3cYKFPvyxXNH
X-Gm-Gg: AYBFou3gzH7tFU0rZlcFpGPFP4qZCW2oULc/7HMQKMPbcu6EsMgLVaSxeYWNWk6R3u1
	y/NcYb0WSm5ZobyygrUkDXU5UFpSzskWMzay9bmZD9EMDn8dtqiHrANmxoW2zvY57szcOaJ9DEb
	TrHjDtBmNI31R0k/RYWyYHDkFcfMFrtdfA74YnNS7gE7n72PiP9zOo4jvSOETBF18HQVy2Ho4VB
	Q+S2jpfUp4bbPct9jYbo7+ytuoe+4xMcIx0kVexinzBSWb5ULYUqNga2lyfDgEGsPQqkGL0nj7e
	Sml1719+iXTswTYzLny8YhyegGLN6an7YcBFOB+xjd8InZ5TWdm3CmzhOTXKj78wUq1F1HkuybQ
	mioM9S4/jUUnAi7dfCPFkyqFjrUwrZU/qJQuBOlJH9E8NmlxQRjE2v7xamtunJ6w5dao5Qgnlcx
	aKiHBWwblp6WFmPiPDdd2HqzJOlBMzq8q4ImDn+h9C6zUXqQK9VX+x1cDo5MxmBJLcm6YwvlnHh
	Wbn9CCfSC1FBntAqeoXBM5Be+4vzuy2hTW83+QqxkvOZMnAwWcS7RXz2WIdzZ6JGcgfbPVEmhH/
	/tZzwNmTxanIQ5s+1lUiunPoUX83sTEQ9FfLimk=
X-Received: by 2002:a05:693c:87c2:20b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36a6ae52e67mr14054524eec.17.1793811503835;
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
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
Subject: [PATCH 20/28] locking/lockdep: Use hazptr to wait for dynamic key lookups
Date: Thu,  5 Nov 2026 00:54:38 +0800
Message-ID: <20261104165504.2430480-21-kunwu.chan@gmail.com>
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

Replace the system-wide synchronize_rcu_expedited() in
lockdep_unregister_key() with a hazptr_synchronize() scoped to
the per-key hash bucket.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef2..256f23a9041d 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1308,14 +1309,19 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
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
@@ -6717,11 +6723,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
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

