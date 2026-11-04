Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811478;
	b=BIumY6JYOpW1S7kBY2/CigEtliaSqjqsM3ULITQ4BYZaMoBjt3JbhsXAFxjzJmu+l5P/
	 iIVIe2Wq49oKVLXROz74yuj4RVwwuAs/LlFPpKlXxwAs5rsE2n4QPMr6epfSSQJoYrM1o
	 X3rkd+TM5fQ+qCtVWKAZhcQIywyhGYCRR/1knQsuiAGHg/HqxP91lxCpK3dLdSenFo3Cy
	 AXs3PPm75ksLKVCYAK+UdBi/od1JpLgS4rJJ6fYNjtxVkyKgQBMiNWGIHM3TqQV2+CjG5
	 p5wRrKg7K54zhKaGin4X0UA/WMLszqAlBlEiMcQjVFvE7lVdCzB+JdFMXZUjGQ1mpVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
	b=SJujy0hilucJtC9i4mgzPjPZpS2NXIsRMmVSKyjWcAckAqP09I/WiqC5tKPvXTbYoq4F
	 8Y1WKo5bu9rlS4bnpDkt+FVu6rRtpTDlRulwivdnIsOBTYnA08pnP2m1Ne4K+ACBQEJ01
	 dqQlxL1qW4SoVlr91s7WRqQ7GFqJvryJVY7FogBu1mH/byvLYL6f4cIYfl8YXHgj0bwbW
	 NdOflSK6dLhilg1F4RUc+trV4jcKEgLgUw7SuWeGPuRr1DG/kfnHplmQ/PwLqp1PyGorq
	 GBl+nDNW6smmX1I3CBhZ7jreAXX4n/mjoYXDcaSbFVfJIRmaZPw1YW8y1hVAM1LE/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpDOW6AD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D84606D802
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D84606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpDOW6AD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so1230856eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811477; x=1794416277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=lpDOW6ADYu851lyuivuLo7QwlZhzKTNs3PLF10Rp8myOxE5BpOBWhjm7Q4MqLXHeCx
         J52PFqv0AaxfoECHtzUpZMoovnjGHZgtZkxUez8M9SYQzp1jWB3MSam8LxY2TDtwtYM4
         i3YsZK1YrUlfkTefb9OYyeuUQ2dajq19tol+OtKNoLQ+MTKFu1lkw68gpHISoAjLNrX5
         GeRbxOyi04N5JeHjXQ+yP+UlpAEd/NKnQVYCH+cBYLKUSrSb3q/aJt4+3rxkSRyjQBnC
         YQ/20uVwMzwVNPsexHWcF+BUwyqNK40THR9TTrc2B1//qZ3wuMYu1M/+MQKh2WT/05Xl
         Q+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811477; x=1794416277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=E9xhiJ/kOVeHce//6Sv2upi8xvGJ4/YqkKVSNUAQCGpTqVOXK5KqwAAPmguMzPUtMT
         zOJJHRSRmDW2DJELvV0ljZDzS+NkoW8/SeeUcz1IDdiZMNU5Tv8o16ZJjqQ3d0mEfLWi
         Ty3N7Bt+lAHV7opU+fw0mcYMkdUWiYSO5oxYW8Mr2RFE/s7nyzzfSHdwQp4bcv+7nDcy
         UMQa09a66n2PkvKwqI3knWyKv7BmfoScT8ZykQCDBd6yCvQZSHzoOqMNQlsw5rthABH1
         NSFDc3beoQHf76OkOtLS79VdlBzyNVvWbwkOVmfu9+Ir7XswuV8UewVgJ202M1t1UG5H
         8RLA==
X-Forwarded-Encrypted: i=1; AKwUvBwHOoj8Ayy588QGMBKTEf470AOl0Y2YI/cAs8MAxIzrzpSlVD/ZgYAgn5AIKXa63hTUcweuHrhGDSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u1gYnFcbb5ivcNeWrn69y7psR/CJ9dtoBydw4kD2WPlWXTl2M
	Mx8wBAuTHArNriGT6+HytSXPZK14qQXWsxQ2CHbu/tSLDtIC1Cj4GFKT
X-Gm-Gg: AYBFou3hrKGDRC9Js0vVDW+aUlc4kfnPMi8AtB99b25rxX39ARSWlRdINrGUT9+xTFX
	IOziFSTLjkAackWGGV314HGbu7QPUjO6vyo8NVQ4kKduXRRBGZ+4FISbYoeE5W29KlwAWWEMVBw
	Akt/35pnTRlvWHwl4ai+NlP/RkoNz8p7LOr5iOL3c5LB5G4Tc83X1BQORER2a9QCjJS3GoyQK7s
	c+X1xzPnZ5CHZlTK0Ccy6CGvhP1iM4GxjQAKCxOB+3RrH2VtU+lQefZT9TOTy/07JOUtlk3WQy1
	qhdlZVrKdCXPVVddfTF6hNWrVncAtB+TsRNOmysfEIwcF4j6gohgtF47alBobwB4J5uIaswY1az
	pqHVB3+4ZgGbH8Rt0becWdUQ1KJueG07SL+iEmNpCqDZbNWbkqtSk/lZML4I06yzDsYCtr72QQ2
	b5kyn+r39xMSZignqXpIiCmdZ1EQGu3b1uuQC2QIiYbd1pVXq0OiWNedXjfvy59Gm2rgxsf/sVf
	bf9XMZZiec1WTwgnSlEvzP9CUT7PqYikaHbbdbBhhY919TdvR+MZl43CrhhXusjPgeSyd/YtN+y
	sCYVBy0guSJi5bqHRhS3O7wXZXwI68mUCBsipGdfiPfZ7q6YszjKwIGCU7MY
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr24088619eec.20.1793811476479;
        Wed, 04 Nov 2026 08:57:56 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:55 -0800 (PST)
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
Subject: [PATCH 17/28] Documentation/litmus-tests: Add hazptr drain resnapshot-slot-race test
Date: Thu,  5 Nov 2026 00:54:35 +0800
Message-ID: <20261104165504.2430480-18-kunwu.chan@gmail.com>
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

Model the marker consumption race between the resnapshot
recovery path and a reader release: only one path may consume
the drain_gen marker (the cmpxchg in the implementation).  The
Sometimes result confirms the race window exists
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 +++
 .../hazptr-drain-resnapshot-slot-race.litmus  | 36 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index daab126e45a2..02c26d6bea50 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -115,3 +115,7 @@ hazptr-drain-engage-wildcard.litmus
     Test the drain engage's wildcard defer: an engage that reads a
     slot holding a wildcard (an in-flight slow-path acquire) must
     not complete for the target address.
+
+hazptr-drain-resnapshot-slot-race.litmus
+    Test the marker consumption race between the resnapshot recovery
+    path and a reader release: only one path may consume the marker.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
new file mode 100644
index 000000000000..699cbf0e3d7a
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
@@ -0,0 +1,36 @@
+C hazptr-drain-resnapshot-slot-race
+
+(*
+ * Result: Sometimes
+ *
+ * Models the marker consumption race between the resnapshot
+ * recovery path (P0) and a reader release (P1).  The shared
+ * slot_gen represents drain_gen; only one path may consume
+ * the marker (cmpxchg in the implementation).
+ *
+ * The Sometimes result confirms the race window exists; the
+ * cmpxchg ensures only one of the release hook, resnapshot,
+ * or unchain path decrements backup_outstanding.
+ *)
+
+{
+	slot_addr = 3;
+	slot_gen = 1;
+}
+
+P0(int *slot_addr, int *slot_gen)
+{
+	int r0;
+
+	r0 = READ_ONCE(*slot_addr);
+	if (r0 != 3)
+		WRITE_ONCE(*slot_gen, 0);
+}
+
+P1(int *slot_addr, int *slot_gen)
+{
+	WRITE_ONCE(*slot_addr, 0);
+	smp_store_release(slot_gen, 0);
+}
+
+exists (0:r0=3 /\ slot_gen=0)
-- 
2.43.0

