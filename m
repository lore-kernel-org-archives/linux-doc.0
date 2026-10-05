Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCAB4F798D
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220644; cv=none; b=IxPOzIEGxNAP3+toNe+L9N2682gxOWWTET9LnBdP4o/MK7tXyQfLiD7U5Cpl1eAfYGOq6G+JX0NHiCG8F0KOGYO/MSqp+rwp39qSZtE9dw3Ndyd6JXNm8ZVPrSMczN6zeN/R2YWm0rj59Tux/IySfpWpySQ58YZplRlnIyZo7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220644; c=relaxed/simple;
	bh=+3MpZXZDrpG3qLkvzfnf9AFNVYrh8OCkchmfy1w7NKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbW4htIqrA1wI3yr8/VUNHrBbjbVJ/xB//8udmJVzyw1LYZ8WSTvmMZ/4uaRcDu+ENwJZiJ9PXw8gLLdN3VNl3IHVLfN7Ise7+N35G8fao9wUMiaRXvHMJIc7y7dytVFNMwDqBO20hcH4Pr61YISTg5SkozjKkul7AnePQ81v4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Smt9EFxv; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Smt9EFxv"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e36so513439a12.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220642; x=1791825442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=Smt9EFxvekpVrMOMqaRC5TFTpCRG74WHzK5c6xcGumUvBjmUfPtWC8jJZ1kKJGBZeb
         L2m4RTt3eAqpw1RM0U7HrzSAnzSGVfxcpcyRvfGVH3fRpQYvWAplmT08ajhkuA6alUSJ
         BUgGV/o58GiXsdEnmehpVyiEG+o6OPlDh4G5uX86DnOtCzGzIKfi9tZ+gUnvq6Kx++5X
         bKQV3vX96eP71PymYYPR505GVRtITize85QI0vxpkUnEEaLlQoo4FBzPwnBISdIl9xxF
         jMrrSD/MsKMSlbSv9fe9rcBRDeTNGXZaw6Tuc06DTr9SIQzKKQcAS2wEgaR4R5oFG7Qd
         e54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220642; x=1791825442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=n/PxjmKZbqWIZ08TypdqzwzGdnPdbQwqagXrEE5lOrSQGNycty/RO9z6dUAbM4PVn2
         8bQAKTTtH48cfNjVz1CC9pjkJ3knQgFkcW7W99YLZMXYAbv4WXxQgB47GenOkpY/ruVR
         Kg9436sq16gezMlTgm/RVwZleNnrlDZb+lk4z85WMtoOvKkd5zWhPYFT9pex17Rsv7C9
         QNyIygDjeaYnrHyU4vdvEdV22Yp4WRP9NTd38E8Yl9ZqGAgE98qidwACvUEeC1mIKeKJ
         Bw+VbHFnyq0CE5FVcdhbRyTwzhaVyBJBC/ka+0koP7uefd6QvldGVuAHPFUQnZt2XmUu
         Z22Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOWlwdayFiwLtWgKMaL+xpMU/v/oCsIdCFd0z1/SFJ9ZGSWTXtNmR9+CKkxhbmX8LIbX1RMRGoWjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+bYPn2doW4EVc0Jfa4QftnMONUfQyz65KlNGjpNvFYRZHeyvA
	ak1SrmCan5nMcrIJM+bW+JJ725/o5VFVQ+dUBM5igeIYghb0SEUuP5Rd
X-Gm-Gg: AYBFou01/H5JM1tU6UuQuwDm1iZPuuf0Cu8SazziY7T43JssA2NS26erHdSRLXqlrHP
	nrpQWb0wsNTROsrPTePWIJb/7BuDv8aF9RCRa4N7UvW/cnL3bLfdz4cIH+vQ7HgTOkirfd9eanb
	gLnKGLGksUW1WKzGkKlA1/tv890bXk2p+3MQH0oGNj0F6rQyqp4Pvp5GX60S62JyutrwFsJYuf9
	Ree2nU7z4xGnYGOYXp9z1NCq7OOvKBOZbKZFExqPkUFQyLBJf6r4ExLYBZE3ILxAeoIqDAJXkv/
	BPXAYMJY5dezpwzvN6uY8b0WfVkTp8K3uYVLRfslvZcPRQU2lDWDvb+1DKRt9ny4+lsieLEdzNW
	AJu/Ra7bLyjWEBIsub/4/V6eYmFPeN5F+7VF08b6mRbZFCJQ7musLYobljK0deTKZBat8ld86ln
	cfaUNrJZmo0QBAZJdMz6hFidUs7I2u/lcPXEYRZF4NAhJ1LmDBkjS+l1rEMds/MuAbVYOwXBWSe
	oKS8K98e9rBgnZcqi4KH5scXyQwWQ==
X-Received: by 2002:a17:90b:4f84:b0:3a7:ee74:e8d2 with SMTP id 98e67ed59e1d1-3a7ee74eac6mr1974037a91.25.1791220641154;
        Mon, 05 Oct 2026 10:17:21 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:20 -0700 (PDT)
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
Subject: [PATCH RFC v3 07/15] Documentation/litmus-tests: add hazptr wildcard-flip escape test
Date: Tue,  6 Oct 2026 01:15:21 +0800
Message-ID: <20261005171529.1378809-8-kunwu.chan@gmail.com>
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

