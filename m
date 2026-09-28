Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17834402B
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598381; cv=none; b=BGMdNyaWrbrhTGBmTLgTBy1mNuX+XCfx3MXGy+BVlNWs9NiZ+4KBl63I+QuKwLGAQ74sFnIWCXIMZki37ClAyiYZizdlkKBggS2W4a4GqJKOiFg6Y9Zxh+3dU4ckdF8p3gys/1yQREGsfmvtFKqd8scmWFw3Q+8k5aM57gsWL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598381; c=relaxed/simple;
	bh=oz+qnBneuNzgbgcPeVN/yZFP9YuMrQDJ//Xl7DWeReo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pDrwy08qtTLcg/bHg69X/toqLdxY4RR4jD9aTWKkTUheqRt6SJ6BxRKPDXVURmU0EXinFZVVqaKTSgaQL+WZRMkezpJjw/VLVCmDOIojmwmSCEaWAVsXiw/4TjW6xnaRdGIODcgK4fYcy+FCqRxgN29Q1tRIaKfCXEUNr+3JkKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/XgSONT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/XgSONT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so13800405ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790598379; x=1791203179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUjbO+I4hM4lCPUnf5SJ9NB/2+aftjjp44Cv82ayP0Q=;
        b=m/XgSONTEwxPmWu9uY2rh/c1mYIdTb6sYJP1Kj+HoOV1YyCsrHglRHbVZezImybIuG
         kglqEJeiJLVrsmIYp5MlWSSMJMaoM0UfQbpHOBCUh5Kz/uVGqusALgy2Qwvd6DT+X4Sb
         4CFeNoo8YZpoVLTZjM5mfrdpqiYRerMvTXg2cJ3/sxulFohI71lcEuu+amtUoSmT02JK
         /mHeA9Jd02vB8kE+syIm0EKDVJCAzgZU7VWGHoJtz/Yws6hwMeqlR8rtv995dpoBMhBZ
         sQaOVFaiw6SkoUWpt9erif/cnGEX3LJ43H33TUNOliaQKUxlqFHrZIuss2Ab4mmLm3GH
         24gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598379; x=1791203179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUjbO+I4hM4lCPUnf5SJ9NB/2+aftjjp44Cv82ayP0Q=;
        b=2jxdxDNVjE1ymJkVe/8mrXapgiznQxCicdugIrDPhX2IKjnpSFDtLE9ydh0JaqIxxu
         rUSDfrRdiPTsNDmBhNq2YWKDQrIIQhKWX4MPI5xWQM+1hvP3EWCRXoPYBX8+1QmJQY1J
         Sp2FF9Qtdj+QQSbz0o+7mtcnbBim77iU1cQUkS1W5UMw+Jpwp3WoHcLyRE42IA32ZyyQ
         hLDTe6dADztABjYlQKbUGGV8K9bZBn5E9qy5iuhPVgBFBYCMkgvHDicIdTL3lEgE+cBN
         iJS76BCUAdJ51fOwqdLKhHpPMWml4OVyicbHmqQMu32MYCCKHMESJnZxK7WO6ma2JKMe
         Kq1w==
X-Forwarded-Encrypted: i=1; AKwUvBxgDHv/NpcKFjI1VpwRRtU6h0qyFY06tdRtnUHk5jyjf4quyM7ePiTfpO5CSee791UTUb7EkH3G6Tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZAZJNVUiG8R1hzrVdUDgvzSmI9ndc231caS/dZyfLdD6drRmL
	ReVRora/YWY3oUreZlCnqTyCvnJ0fMfmPhRUKC59P+F8NBU8BOdCUIIW
X-Gm-Gg: AYBFou0jWdvCJFUWbu6C686SxBpkzbSRVlRTIaUWVlycaRvqGubw+p8N51tW+1MG7ZY
	52kkjhOUcPFOq1M/N4ekvRBHCYfIqxc3BgtfblOX0P8eW0IzgyJC2Xdy5Pslq/2vok2JonYOGN+
	n5bVKlAj0cYrtU8XXsw9FU2Hjcv6jvZTBEivHeutHa3H49DNtZo8U0rIPr+671cRGKPstWRe8c8
	ntSzO28l6Jk+JfD4tBtVrG59RUCy1z93Y2c/WSULfSYfRTfPaB09SGCy19PFqvoFElsQpESI5pw
	faqEK+r9K2zCDXSlQ5/OJizszgxYNSfJQm3ZPmDcV5/XDVF3CpvEVDdNiN40Boc+kUTFP36+OHq
	sULU5bJlfLLoi1bB0d7xCowdEmrTxBMr2jaNIbxgTbkFiEM+xPh59MACvHEqvLdVfSUZWLAPvlR
	VTb/lwO43tf8OkB9Mi7QC6z9920Zp+f/DwBWNz0m62fdGSfhyKd81v+M0Mfyug2jrnzQg12pgur
	bIFN5KjfOT7gGHFNZSotJSOJxiwMYY+vSjcDi2lZBtwknoxBw24IqUM8Ra4GP6d2iVWjxSHbyzB
	Th/kxzR4v13Co3jY+xXa
X-Received: by 2002:a17:903:26cb:b0:2df:34c0:7302 with SMTP id d9443c01a7336-2df7e3a01c3mr67555875ad.39.1790598379324;
        Mon, 28 Sep 2026 05:26:19 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2006-1fb9-8409-0195-705e-5b47.dynamic-ip6.hinet.net. [2001:b011:2006:1fb9:8409:195:705e:5b47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc951sm40485615ad.8.2026.09.28.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:26:18 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] rbtree: fix rb_add_augmented_cached() descent and exercise rb_add*() helpers in rbtree_test
Date: Mon, 28 Sep 2026 20:26:08 +0800
Message-Id: <20260928122611.336351-1-s921975628@gmail.com>
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
users insert nodes for years now.  Patches 1 and 3 make the test use the
helpers where the helper does exactly what the test did, so the helpers
themselves get covered.

Converting the cached augmented test exposed the cost of the
"suboptimal" propagate-from-parent path in rb_add_augmented_cached():
2-3% on a Raspberry Pi 4 and 5-7% on an x86-64 KVM guest on the
augmented insert+delete benchmark, against the documented
update-on-the-way-down pattern.  Patch 2 adds a ->merge() callback to
struct rb_augment_callbacks and uses it during the descent, which gets
the helper to parity before the test starts relying on it.
sched/eevdf, its only user, supplies the callback from its existing
per-field helpers; the resulting kernel boots and runs on the Pi.

The augmented invariant checks pass at every step.

Yiwei Lin (3):
  rbtree_test: use rb_add() and rb_add_cached() for the basic tests
  rbtree: update augmented data on the way down in
    rb_add_augmented_cached()
  rbtree_test: use rb_add_augmented_cached() for the cached augmented
    test

 Documentation/core-api/rbtree.rst | 27 ++++++++++++--
 include/linux/rbtree_augmented.h  | 40 +++++++++++++++++---
 kernel/sched/fair.c               | 13 ++++++-
 lib/rbtree_test.c                 | 62 +++++--------------------------
 4 files changed, 80 insertions(+), 62 deletions(-)

-- 
2.34.1

