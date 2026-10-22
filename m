Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684440;
	b=KUn1mY15EoJHw4qXqBYDds+R/bxzwN1Lr5k/TY3A3kuPyXqe9PtVzq831DwbMrHDB/RB
	 5NKAKXqHd+dtYp3JgwCbqGOrAXD4+rCCOWWFMNLUiUIQOuxYi0obfQtBappjRSwdXpLpN
	 rmvwxM0VQrEwu6IxAmaiO05MXar6ZfGAEnjJtbQzTDSVzIu4VGpV31TO+yQwclw0zIwK6
	 tFi+qeG6ADnzFIeZ98wYdrth3rMo1roBkda3QbJU/uNsjnbUdOJQTjTYREq/2QS4E51kM
	 XgB8hhxSYAcc1gyKBAmrpJutG5KPBf4b2ooDmmH1MTWlYYOips9/SL4NWVqYrEnRX4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FfwESk2+W5GLOfREmJ4jIQRgAZiuRjaWD2FZlMqIe78=;
	b=gUA4DTAWSpqYLbwLroAkC5zhLfeovbHe4Ua0/e1SDDHhzZ+dxfg7i6hXj5fvkSi580ct
	 21VxXiCPG+SW1szOLODtLiidW43To2Xn6ssZXXz/3iIdTxWU00KUt+nw5KxGFcnS14z4C
	 2AF08RYuCctWavp8oohuwSw5zgbCnD1eWplW9Sc5wYy7aJ3yRDaqG+lsNan4UkpGr9K9m
	 g9vamy2rFqYPZ3+QhwnbpO9vrP3tW5WxD2ZWnaw12q9d8DEUmRcrP8nNO6bnaxEhlxGRK
	 n64UCAqmFz7vP7GH2cdBJylfF/enUp48qphOVZ4sz+tdD6Zfw5AIHZbfuKpG7YdhDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=m9SVDhSn;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C3606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=m9SVDhSn
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso4051a91.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792684440; x=1793289240; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfwESk2+W5GLOfREmJ4jIQRgAZiuRjaWD2FZlMqIe78=;
        b=m9SVDhSnWSK4l4Z9dSxELOHxlCPprWaFt8lUduOKmcjypU/xP4G4fDnFiLsjEVb1bD
         Be2J8T+T24MOv4uYgLd+cn72qdYW8OEXPZ27oI+l+Kpe4MFjTho2zEIT+WdgiMsdzk6e
         FSUzR0EFHrJ6Aai67Tx+JFOxMuHEwhesVco0NgV9uwM6L/kxyHfFL1Ygvgj1SNyB2m7j
         lt9R+f0/THeR+FXoXL7lPT5cWXzd0E21KYuoarFshJ3MJHeGhFrLHfQtjgeSKrlCbQEw
         bnCeglp/+b5x0SMQ5/pPHQhQvFFkrElRxCVowzQSKJ9S4KJDlbK/gPY4b51TRSRPAZ5T
         rvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684440; x=1793289240;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfwESk2+W5GLOfREmJ4jIQRgAZiuRjaWD2FZlMqIe78=;
        b=I/cWfwM7+4KgzQzDAvt+lv+UcYDYeHWzQUubwy9oghpsbY3w2i+fxPSbyzgq2PBb2J
         mCD/9+DFb+qedI4SxFGQODSJzBArPWWdUr6xWnaFxoYBG2vc2tV3P8XsP+Jp/DIo0qKW
         wslRgUqB3va2Jo6ILZPkWLIZOusWO9UxiPK/Ktks3Lx7vGd73F4ZllThu7W3foMdDHwN
         CVzGPXumn9q/c35/LjbKlIndwQSPDTk6meW6nH2StQrlrMEN4GDmugZPNXKgukMKtW9W
         y/QsH1GiUjk3vESx4Lvda3R+Cx1uXWNrucWELsZlK/aA9oxBXe/oTjHNhxLVRvq4Isit
         rsAQ==
X-Forwarded-Encrypted: i=1; AKwUvBya47jxH1QKrfsJaD3hBMqB2+KVezmo9BVuCrkvTGkf2aSL2G46HLNwfHq4zaAFig+caivYzkGGhOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI4s512YBA9fXcgT058zVvfzKJmS4GAUnPrhI8DRKG1tTOcZ/3
	j3kRSYyd9BvynrszV4DkFQmNRO5PlmvvSihe/23C+quJhH4n+xnW8CGNqcTRWqiJet/xRbwSu0C
	YgSiEUcrQ9A==
X-Received: from plti3.prod.google.com ([2002:a17:902:6ac3:b0:2e5:e061:9f9f])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:258b:b0:3a4:f8da:2478
 with SMTP id 98e67ed59e1d1-3ad86f3c4b6mr4324356a91.29.1792684439331; Thu, 22
 Oct 2026 08:53:59 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:53:33 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022155352.1293020-1-wfelipe@google.com>
Subject: [PATCH 0/3] workqueue: expose per-workqueue stats in debugfs
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

struct pool_workqueue already tracks runtime counters in pwq->stats[],
pwq->total_in_flight, and pwq->nr_active, but reading them currently
requires tools/workqueue/wq_monitor.py with drgn and kernel DWARF
debuginfo.

This series:
- Preserves pwq->stats[] in wq->retired_stats[] when unbound pwqs are
  released so cumulative per-workqueue counters do not go backwards.
- Exposes per-workqueue stats via /sys/kernel/debug/workqueue/stats so
  they can be read directly on systems without drgn or debuginfo.
- Updates wq_monitor.py to include wq->retired_stats[] and report a
  'queued' column alongside 'infl'.

Wilson Felipe Pereira (3):
  workqueue: preserve pwq->stats[] when unbound pwqs are released
  workqueue: expose per-workqueue stats in debugfs
  tools/workqueue: report queued items and retired stats in
    wq_monitor.py

 Documentation/core-api/workqueue.rst |  47 +++++++-----
 kernel/workqueue.c                   | 105 +++++++++++++++++++++++++++
 tools/workqueue/wq_monitor.py        |  24 +++++-
 3 files changed, 155 insertions(+), 21 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog

