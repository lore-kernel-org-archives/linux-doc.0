Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47064A2A42
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550205; cv=none; b=Mhd2jt7tlL6JPrx4VddnboRI/eHeWaAjMCRxjt1/gSGiYnrQzrsWa0TU6ZLWXu9j5KXvTBRuoZnb88Y+NG/PH/9Xk83UM82GAEiaPs+4eQWQjxP/JgO9sVw0thuBZ+DHG0pFtdzsObYfklSJxRI4y4vsWpRGP5ZWNbFaoJpYsoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550205; c=relaxed/simple;
	bh=Cv3GiW+cUXijnfwKcWCdwib/ps1bMkQSsnmAAjeLFWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbwlr85xsYBWFdQdWGS6TPsACR6xanBgR8bPZWy+Qkh9MrOK76fzmGmIvU9o2tdJkchMzJmO3Gd70AccBqjpoRYYbW1ficW0zw1JL+BbLuG2bLSTXwjbtnIXhh/YdLMF+cM+pD6mMyzj+/4d39d/hUbCtxPjfpre+r+V/rvX4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiUnKXYo; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiUnKXYo"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b350c6920so698925a91.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550187; x=1790154987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzRkWt2VZCbdlSo+rjm4taEDOl7SYR+tdxu2b2xJF3M=;
        b=EiUnKXYo0rdaIa80f2HpK6o0H48HCzzvBQ1eIZACtQybu9ybiEj6WQRgv3ncJnT3SR
         ppUXRtCCZYoVVhVXWZd1efkoin/yMZuMG9lsShc/Pz2JVkFIoFsL85nS/+1VnJZAwvGd
         xd19boCLPxKrZrjJzvPsgS5Jw6+JzH89IvCX12n6qD5Vlkke0qapkNca/H8Lt6gvUh7B
         1panIRkCnlybLoe716JegaFEgWERu79g0mxu9qrQLKUO234/9L+av+dsy1hmSAfYGaAQ
         FxOEgxvoasqCIIMi9psSusaLn5iQTOFQ7J7ScznSymV+yxD+t9ZgCjwOqaAjCPy/PvnU
         M1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550187; x=1790154987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzRkWt2VZCbdlSo+rjm4taEDOl7SYR+tdxu2b2xJF3M=;
        b=p1rf7dbxOWpqXs85K8Psq/gTXOOcrPxR2bss5H6GPmAl7OAvtbkRP+qy6QPG13IksR
         rE4EDiKX7cQHZYMcRiHeKWN3XaMPTF2WwNUDS4ihxog9b41ENg5bFyNxBRkt76OchJUC
         NOoXoEgHtuORmolSScis1VzRMQit/NJrrjJLazTShnff4VGQb+9FR01LDWiffbXLk4GQ
         lVdMy2afO+ZndoI4iLGHokFFYweKmB6FX+bZC1299IlxTVDpEnqqnSt1ckiMTLjp3ucH
         Io4hdxQJOEvmrzVzH5PxuC/0dlFL1ZEkB1hua7mmAPp59QBrElL8sx8PF/r0I3V9ieF5
         50MA==
X-Gm-Message-State: AFuF++n7QQvrqX+0kZ5PYCeuHBSa1LMTFsHGo9qC+t5zxO6ABGLa0lKv
	qqM1o+Ou5h3MO/ntsy2uOy1wkR6CRV4CAjIhoLSmC6E35qjNPH2WItq7
X-Gm-Gg: AYBFou3CyB9LIfDTBswrOvPxTtMfcpla5wF6PsvYLCm5+4xHLr64Od+NFHz4l2jGjZ0
	/lOWSdO+CIHkpsCix0Yn4d+DQJgsVB2R8RrXObHZ+mIxxSrtdhNCfBx7DSrcD2ii4eGa7RfXvI+
	yPrabbaG6RHpsQBOtrzpSdT3w2eekZ8eIF/cCYoRiDfDbSqrPgyiCKm1KKLMXPWMd2myh8Swo8l
	n74+3Rv+qGpdrErbwS9MOsqryHGvXr1+wwmZbu1Y0RXtPIOee8Pq+MLIflGTLSiIpQ1Z23hD6NA
	ofDxWHJ4ObiTubW5MODWLS+hPdBFVdr8NGR3rGMXf9krX/4gKKXvuOHHTTEMZEOHht59/989cjQ
	8GrlZbyYlcFznyvNjI4mRxYSgEoN/h5U31HplpRMuDTroImOLLYyULBq3l5jd3gED9kVCteKeim
	Z5AizRtw8iEugD/IrBQrfFJXpRulIuXDrCTmXNPCp2lTWaWHHQ2VX/3C+TI6L+U5hFZ9rfNC2Qk
	RyNsg/SM3Ts9a6Pwg==
X-Received: by 2002:a17:90b:4ecf:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39e1e49a802mr4752714a91.16.1789550186814;
        Wed, 16 Sep 2026 02:16:26 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19a2c2dcsm1414916a91.0.2026.09.16.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:16:26 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	corbet@lwn.net,
	akiyks@gmail.com,
	luc.maranget@inria.fr,
	j.alglave@ucl.ac.uk,
	dhowells@redhat.com,
	npiggin@gmail.com,
	boqun@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	parri.andrea@gmail.com,
	stern@rowland.harvard.edu
Cc: linux-doc@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v4 0/2] Documentation/litmus-tests: Add SRCU fastpath litmus tests
Date: Wed, 16 Sep 2026 17:16:11 +0800
Message-ID: <20260916091613.78352-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the SRCU fastpath litmus tests from
tools/memory-model/litmus-tests/ to Documentation/litmus-tests/srcu/,
as suggested by Paul McKenney.

This series splits the two litmus-test patches from the earlier
[PATCH 00/13] srcu: Round out atomic SRCU support series:
https://lore.kernel.org/rcu/20260907075829.2073224-1-kunwu.chan@linux.dev/

The two tests verify the memory ordering required by the reader-free
synchronize_srcu_atomic() fastpath: the grace-period anchor must be
ordered before the per-CPU lock-counter scan.

Patch 1 verifies that the anchor-before-scan ordering forbids a reader
from being missed by the scan, while patch 2 shows that reversing the
ordering permits the problematic outcome.

Changes in v4:
- Remove the smp_mb() and critical-section write from P1, 
  keep litmus tests minimal, as pointed out by Akira Yokosawa.
- v3: https://lore.kernel.org/all/20260912024225.2872265-1-kunwu.chan@gmail.com/

Changes in v3:
- Add a critical-section write after the smp_mb() in P1 of both
  litmus tests, so the barrier properly models the lock-increment
  to critical-section ordering in __srcu_read_lock().  The smp_mb()
  was previously vacuous because P1 had no subsequent memory access.
  Suggested by Akira Yokosawa.
- Adjust indentation of the SRCU entries in litmus-tests/README.
-v2: https://lore.kernel.org/all/20260912024225.2872265-1-kunwu.chan@gmail.com/

Changes in v2:
- Use a filter for the P0 scan result, as suggested by Paul McKenney.

Tested with herd7 7.58 using linux-kernel.cfg.

Kunwu Chan (2):
  Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
  Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test

 Documentation/litmus-tests/README             | 19 +++++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 55 +++++++++++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 52 ++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

-- 
2.43.0

