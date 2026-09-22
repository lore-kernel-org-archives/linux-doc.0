Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4174F3EC8
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061007; cv=none; b=u4r+Pn5GgcZ4+kel6gPG/JDwtLIFlWLtrZwc31+9py/whnyraQuDhNRVHnZqKvdoOrc1Ez2eS4VPTcTrTTLPPel9s8DC3C8zdcGW5jbYDzbkne/nzI/+GtsYDs5dpwYoX3IZ/pOcy5IoRdf6wav5KXBarvE9E+snxrbefzmOX9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061007; c=relaxed/simple;
	bh=IT4Omxoh3UL/os4MBcvDO0Y3uwCbEQ/6SyGtTM/wD+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yj8CT5xhhhkO1aVDdA0mHSMcfQypnEpo/osNgOhUE7VkyeLneJydVO4oF30gMd4Eoqt78w3gNkM14c12cZoHKjnW4zc1m/DKSFXk2XxLAQzO1J+vxueI6cXgLvmcBWddbn7yj6IjTdqAUUg7U/uhpBOdWEewo5jrZu2bCjhtEUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yp5YMgxX; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yp5YMgxX"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so1649215a91.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 00:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061005; x=1790665805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6nOkseLD4E1uvlk7kwNFkZGEal1mrhs8j7yziX25N0=;
        b=Yp5YMgxX9CYvhky9D6dAN4YK1p9JHW++s5+DVfDoeJueUsfWlEhSkXkcZ/CLrBnXOZ
         rjeZRA8zVPJsidXFHGRy3F8ujH2SMX/+4ty5p2fTITtHMaS2RZGUjampVJpNeImv91Cd
         tBMDhWB0wpJ5Hrq15gi4JetzN3Y9AiuCKMvGdNO6vL4QkMXDolD3fqm1eXzXkJ1pQqEQ
         FjWH2eBytgqlq0w9z1rnmYM9jI0otm5qFJh8TvSp+iR1cWg59jbEwg/9+S2NK43vYaAj
         5lXTo1zQbgFBQQ4GLemYfAo4C1LXj6i4tK1qz5yxtqBqcFjQwSfHsucb/N9eWwQG3QJ2
         ub2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061005; x=1790665805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6nOkseLD4E1uvlk7kwNFkZGEal1mrhs8j7yziX25N0=;
        b=HiOrGlBQdrpij0Lgx/b2By00qABb5atPXTgvbkI29UillIiEHZ81bSlSfqylN/UxJF
         jGe3JiUVm/75gViM03oBWp3PU/Hu3Qm9o9GXa/f7Y8ka7qWskY5c1xClKBNY9BSj3uqy
         OhlVWOOylCFNYwJ+uUCuw4+FSNNKls+3nTRJavRXnxpoaZPKL34GoWcSSCKsnahYU+3K
         TAy6zr+B1gxWpYidCQeFnU8lnrOVmM/Y237bYa818Wt8TGrvT2IrxTUcpE+yhzPgR7K4
         vK3XVTLpwXErLDc6+eRSzSLJDI5zmaA24vMf2gg9Nil6wnEmq/gYNKz219/5pgztjE/o
         c4Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzoxBQi6tzds+aN/WobVNaYgnfweoWVySgpeqJEjjzvpKiVruXWqz4GF3IepLVkAdYKj4puq+BzP6o=@vger.kernel.org
X-Gm-Message-State: AFuF++lHRV5r2H3TCruDe8aslT3iNdTpm4uWyiqo0isOsFhq57YCzzXm
	UFmQTdNSmMcgmXMURm1NvGjA+kyontGAGTUy6Drs17v+gK9eOZTFQYiP
X-Gm-Gg: AYBFou3ruovEEGLXfiwKckjXXGiSN5cZ58TVoVGHdrlalusm2enXQTiZtJ0/RoWHX6O
	TdUy++P5XGvN5oGc1l28h4OflDdIi5wrbMbN0tX+9VrwgvyNepmHceesFHhuz8HnQdyCcmgKqAZ
	xcz+b+vF1iTyU1Kasmuu3vkaaWPs67sgm9/zAeDQ1GRVH1bk+WW219p7wgi2RHpfiIsOh+Rve0a
	1sH6sOlxzsBByFWrMbF7u0HgRPtuN13rOO7456NmpGWQIo2W+hDIDY+vuvyKm7CiPB2nGa5aJKT
	CkTQnESbbD5AmjuEhcqnpvZ7ZTF/qb333931pSGhHJ0e2x5fxd+vhckedlVIUsdS6svp7IRikON
	5530kOdNMhCKJqVfEkzLRN+Oon2KXfSFi729jXGZ8X82lTrhNsMLUiVgpMJMPhV8SmOOr4onkq6
	bBX/cjFcoJfCXXn8peHCCc+weESRnsI1DcuD7k5/rFKtFmI+2ZCiCjnshmvZ7tGSkgf9RJPRkTX
	ewLCnhng18gFnCVgg==
X-Received: by 2002:a17:90b:5404:b0:3a0:2900:f577 with SMTP id 98e67ed59e1d1-3a07324277emr253812a91.51.1790061004682;
        Tue, 22 Sep 2026 00:10:04 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm3079414a91.7.2026.09.22.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:10:04 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com
Cc: akiyks@gmail.com,
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
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: [RFC/WIP PATCH 0/4] hazptr: add shared scan path and lockdep use case
Date: Tue, 22 Sep 2026 15:09:46 +0800
Message-ID: <20260922070950.4173245-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This RFC/WIP extends the current v3 hazptr implementation [1] and
adapts the lockdep use case from Boqun Feng's earlier hazptr series [2]
to the current hazptr API.

[1] https://lore.kernel.org/all/20260919000056.3132131-26-paulmck@kernel.org/
[2] https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/

The lockdep conversion replaces the expedited RCU wait in
lockdep_unregister_key() with hazptr_synchronize() for dynamic-key
lookups.

The series also adds a shared-scan kthread for concurrent
hazptr_synchronize() callers, rcuscale support, and an LKMM test
for the acquire-before-scan ordering.

I tested the lockdep path on a 96-CPU ARM64 KVM guest with Boqun's
original mq workload [2]. With a multiqueue virtio-net device
(`-device virtio-net-pci,mq=on,vectors=6`), tc mq add/del x100
completed in 850 ms with hazptr and 860 ms with expedited RCU.
The rmmod workload similarly showed no measurable difference
(1360 ms vs. 1380 ms over 10 runs). There were no crashes or hangs
in these tests.

This is still RFC/WIP. I would appreciate feedback on the shared-scan
design and the lockdep conversion.
 
Kunwu Chan (4):
  hazptr: add shared-scan kthread
  locking/lockdep: use hazptr to wait for dynamic key lookups
  rcuscale: add hazptr scale type
  Documentation/litmus-tests: add hazptr acquire-before-scan test

 .../hazptr/hazptr-acquire-before-scan.litmus  |  49 ++++
 kernel/hazptr.c                               | 274 ++++++++++++++++++
 kernel/locking/lockdep.c                      |  30 +-
 kernel/rcu/rcuscale.c                         |  65 ++++-
 4 files changed, 407 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

-- 
2.43.0

