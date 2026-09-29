Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BCB53FD27
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695497; cv=none; b=G/lYl4zxrgx4WCzbcfxurCoqTZkd3VcQtsXFASUKa8vi4nWDuWjAOLcZ7Le9i4j2umpmdWw/SlEoeXQlv96t+BfkyAF/b2xHjNJojaTqH3h6MPUfTH2BFzZzGO0oF3PiZmUA+dvnT6X7MQ8xizwrts4B7K1HxY12+KL25jm0qjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695497; c=relaxed/simple;
	bh=IsUrqnbkBzqR9+V+q6y0qSUhzMpi5uygr2LDVgI+dKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jyJvse8kCX5vG4jJXHhZ5FHbkraCfGgPF1mlXyKi5dTYuE7+bGw5c8KG7BY3hgHpmadd8bufCsc4EFys8K1UUKRoiBJv1Fx82MUANoubBjXHOSNNOKNpXj/F65IbaHl/N1TFKDyFVatOrIgW2F7XP4ytOYI8+bwiNv9cHkOW5lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pM2yYYNk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pM2yYYNk"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so36844635ad.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695486; x=1791300286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4HlWCQVM32D4igNgCi92CyfQ5gH0706BFceUvI6QYz0=;
        b=pM2yYYNkhXD5wTImR6XmXHCoeXAMjdXO2hVtIQq9S6Vx7dg1UZvvHYqNQ7pO3AVCav
         O3JT50G4fBj7tZMVRQpK1hbmR+GOnG7/v8eiEBE7hNqrkcq9ZbgUJCupR1p3j0qhgrHT
         V+XMis0jHl99xUmYSHmbc7Ds68V3to0Zn1s4kChyHPWHrqaMDvAHxJdMcqv48WpOzdFc
         51F4/RW9cwr42+NjM0uktWUeMh66xDhMJMLwgfa02k76i++fsgPUAb4GwNuBrAfp+3Rn
         espGnphha/L1PS8buRw+CWfVInHxYbs7enGAlViSUFhtvxC2TEvwgBc48Uqze+CH4Qiw
         f0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695486; x=1791300286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HlWCQVM32D4igNgCi92CyfQ5gH0706BFceUvI6QYz0=;
        b=G/QCBKbm9icIbOBzE6bqX9WQQgitE8xGo+UV6Ag2GKB3NqVxLYnMiLMf4qurxu/7EJ
         Hqlg0KCRtP79NZL/Ez2LHIs7+30+Y/dRJ0GKpY33bri3KZwihfIXDsy0nLwZr/r//f8x
         gh78dQmI7pGQene34dFQV8pOmh0gmmThO+e4rcsqLVYJoX6zjiR44xz1Hv65nJrc7+sh
         HCqTXbKA80fqOHjV+iN5/OL4Zmgr6cSqo6ybGsLqGp6fMXbGHR7DP6/mL5KUYqVhpFOn
         ILsNV+Jzv8BHyafThcOGKCSZtraCdSW40BjwIFnsdKDPYLKPjPeZ3CpN0wWL8f/Re2Hc
         DfKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMhgcpgAmxtIEKOQH/b4cH9zlbquWqEgmRnudWyoj5GmZRd4o3o2QH4Mc84w2ZclT9VyKW6wvNQHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3N5zHG6O6r+PDnNXN7fZs+NBB9Sb7WTmuMAexFig39UwexNKu
	TALvckoEYhjsQrCsqOrvcr3Eg5Ilu9lxsfbp9lQrD31xlC/vHZR2+Znu
X-Gm-Gg: AYBFou0apPDMBiLNKa82cEPECApyIReeUDO8HERikzfpI+r/Sm3sr2Zh2HDWkKD0g/z
	2/eNpZI55i6W7Vg4dkj/HDTa9lIg617Phj/z7fWaQ/BCp4Y8XBDo7Ud04R3pLBUtGsNz3gbj613
	QbsSeUUbFmP+5VKv6Bk5kw9MjRu+8SuKtr5ogHAIu5Mfu0fRs6gz7WCPFsn9meZsF4jjKJSqy85
	rBZiwBOG3VykOUcFGiS2WDS458MojLjEOgwVqCgnsV4Mj087ot1O5Aj+excXFvXpbw38TC6q5b/
	UUdZ3Zlafm/4i0NDaHNx714jH4SomDcUF5DKcZXmph8v0V4Jgq3UwFMgbPGMk6wGWS17Cl91OHb
	OBr/ZR3TW70jx9FmdXYUV3TG1AM+GMhjyG39T6TtpFAc9kFPFdbl/Oay7/P+bpPIjd40YXjW1rp
	AKHOjdbNbhYLF7yzzOsJSlh++iK0DkY7e7gY35WBsEmFzkH2yIQ565dcSod4+ysCLVtwEcfYwSA
	2zM2qmWLPZNwYiiyJc3zb9W+h9mwL2toy+rDhCMHYn00eZVdtOzmcr8X0unNpa/uIM/0einBr1F
	hJxXOve0QO+glqL1JUCj
X-Received: by 2002:a17:903:3c4e:b0:2e2:cc2d:b84a with SMTP id d9443c01a7336-2e2cc2dbb2cmr15210305ad.41.1790695486117;
        Tue, 29 Sep 2026 08:24:46 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2005-5b75-0412-f652-3152-53f1.dynamic-ip6.hinet.net. [2001:b011:2005:5b75:412:f652:3152:53f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm59762255ad.83.2026.09.29.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:24:45 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jon Maloy <jmaloy@redhat.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] rbtree: declare augmented callbacks per field, fix rb_add_augmented_cached() descent
Date: Tue, 29 Sep 2026 23:24:35 +0800
Message-Id: <20260929152439.91443-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rbtree_test open-codes the insertion of every flavour of rbtree it
exercises, while the generic rb_add*() helpers have been the way most
users insert nodes for years now.  Patches 1 and 4 make the test use the
helpers where the helper does exactly what the test did, so the helpers
themselves get covered.

Patch 2 is Peter's RB_AUG() rework from the v1 thread: each augmented
field is described by its per-node value, its aggregate member and how
two aggregates combine, and the template derives every callback from
that, per field and in a local; RB_DECLARE_CALLBACKS_MULTI() goes
away, RB_DECLARE_CALLBACKS_MAX() becomes a one-line wrapper and its
RBCOMPUTE is renamed RBVALUE.  One change on top of what was posted:
the third argument is a fold(a, b) rather than a "replace?" compare,
which keeps the same register-local recompute, lets sums and counts be
expressed, and replaces RB_MIN/RB_MAX with the existing min()/max().

Converting the cached augmented test exposed the cost of the
"suboptimal" propagate-from-parent path in rb_add_augmented_cached(),
2-12% on the augmented insert+delete benchmark against the documented
update-on-the-way-down pattern.  Patch 3 adds a ->merge() callback to
struct rb_augment_callbacks, derived from the RB_AUG() list, and uses
it during the descent, which gets the helper to parity before the test
starts relying on it.

checkpatch has plenty to say about the RB_FOR_EACH() machinery in
patches 2 and 3 (unused macro arguments, values without parentheses);
all of it is inherent to the token-pasting dispatch, as for __MAP() in
linux/syscalls.h.  The tools/ copy of rbtree_augmented.h is left alone.

v1: https://lore.kernel.org/r/20260928122611.336351-1-s921975628@gmail.com

Changes since v1:
- New patch 2: Peter's per-field RB_AUG() templates, taking a fold
- ->merge() is derived from the RB_AUG() list instead of being a new
  template argument; the propagate-from-parent removal is now patch 3
- Numbers re-measured on the final code, on the Pi and on x86

Peter Zijlstra (Intel) (1):
  rbtree: declare augmented callbacks per field with RB_AUG()

Yiwei Lin (3):
  rbtree_test: use rb_add() and rb_add_cached() for the basic tests
  rbtree: update augmented data on the way down in
    rb_add_augmented_cached()
  rbtree_test: use rb_add_augmented_cached() for the cached augmented
    test

 Documentation/core-api/rbtree.rst |  27 ++++-
 include/linux/rbtree_augmented.h  | 192 +++++++++++++++++++++---------
 kernel/sched/fair.c               |  70 ++---------
 lib/rbtree_test.c                 |  62 ++--------
 net/tipc/name_table.c             |   7 +-
 5 files changed, 179 insertions(+), 179 deletions(-)

-- 
2.34.1

