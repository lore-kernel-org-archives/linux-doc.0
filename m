Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60263BB57
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 00:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787788890; cv=none; b=uOa1h0FAjAofFo/K5JDGdFrxAZQQQw+ybGKHx7bTE+PqItBYZxSMqSUoMpMbj6pLka2Q3xA2xsN3qNqWFbmfPVTwNOz+bMDSXapuYng+DYlLeH6nHwrm+L1kTO+/VKV+ObVcjP2nCd72c795/ku5dq5yn8v4jI0SwW1lYoBbcco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787788890; c=relaxed/simple;
	bh=XUuVkeuHqR1GX+VjgItAzBy0YPvIAS4Vt+bJE3oHTbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQ0IsFe8YIFKUndKPFDrUvHYMIa2oYwXBIoDYAZ2K6tJ0DrAMFI7arWecj/ZGmLhlvSplhAdBMmlV0pdzgJvtRko+Vq95489TskM7HWiWPfOMH2JNhg5wipduqVodB3+yTuOjYRiguQgNagBg1kQzvYyUMYX3XkU05S+c8mBQm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hbVXq+p3; arc=none smtp.client-ip=91.218.175.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hbVXq+p3"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XUuVkeuHqR1GX+VjgItAzBy0YPvIAS4Vt+bJE3oHTbs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787788885; v=1; x=1788393685;
 b=hbVXq+p3vvZ/bv03D8XVaMVaKcCjj94LDNhmNuanzFKpLpKa9B7S32L2GNK8U/th9lBZhe97
 7RoV8cdM7SrkCT23gg7u17loa1GhNyU8GtFnybA9Ifbyh0YvjVoxcOVK+MTL+3QU7ELNoMw0LHz
 xB8Hd/zPZf6/Cbj2E7kaNVNs=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from dragon-master.speedport.ip (2003:fc:df23:7abd:c598:7cec:94a0:927b)
	by smtp.migadu.com with ESMTPS id b1219fff9c3ac5a3;
	Thu, 27 Aug 2026 00:01:25 +0000
X-Mizu-Trace-ID: b1219fff9c3ac5a3
X-Migadu-Flow: FLOW_OUT
From: Md Haris Iqbal <haris.iqbal@linux.dev>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Md Haris Iqbal <haris.iqbal@linux.dev>
Subject: [RFC for-next 0/3] block: delay support for error injection
Date: Thu, 27 Aug 2026 02:01:12 +0200
Message-ID: <20260827000115.128093-1-haris.iqbal@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Error injection can only fail a bio today.  This adds a delay_us option so
that a rule can hold a bio back first, to model a slow device.

The delay happens above the driver, so it is invisible to the I/O
statistics and never reaches the blk-mq timeout handler or SCSI error
handling.  What it does exercise is the code waiting above the block
layer: io_uring cancellation, hung task detection, and filesystem or
userspace timeouts.

Two things are worth a look.  A delayed bio is resubmitted below the
injection hook, so the rules are not applied to it again and it can never
pick up a status from another rule.  And holding a bio back reorders it
against bios submitted later, which breaks sequential write ordering on
zoned devices.  Both are documented in patch 3.

Patch 1 is a prep cleanup.  It moves the rejection of an unknown status
tag into the parser, because patch 2 makes a rule without a status valid.

Tested in a VM.

Md Haris Iqbal (3):
  block: reject unknown status tags in error injection rules
  block: allow error injection rules to delay bios
  Documentation: block: document error injection delays

 Documentation/block/error-injection.rst |  56 ++++++++-
 block/blk-core.c                        |  13 +-
 block/blk.h                             |   1 +
 block/error-injection.c                 | 154 +++++++++++++++++++++---
 4 files changed, 201 insertions(+), 23 deletions(-)

-- 
2.53.0

