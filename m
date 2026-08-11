Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786D361640
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 07:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433941; cv=none; b=Xr7y15oJfYeyEVuXNV4ILgpoi1wUXXcQRE5OxgD3RKFMUpt2dkfYY4QRNN3lLQDKrQrdt+VS7qdJPwvEHp6CxcRQumhGgpbm0Krgf+HoCgMpqEv+TrHPZWt1eB1YtzLt+cTC6s6+wRoJMj4g+EGAeQzxzYmmS8FyfjKr65zLsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433941; c=relaxed/simple;
	bh=rLzaCjogbM/rS5QXfEYGajKNnaF6LhXssfHv10KJ2KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLq4+HSWWeqf0+eM+xGBK6odyWO+5VikGDr1ZfXjttDmv9SptKNXmRsMaLPAX2Dukx16wMnGmiYdtddH5YCJU5UkvS+jVPRKcSKZHZmHhV1nPOCTCLidvf9HKARvAuCyRKJj4cvDvWxy3Z1k/8nd95LJ7Mmk9CxqoilcaOvCy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZxMyAktr; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZxMyAktr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786433937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTzgZzOhKmtV8LPmJ78nxtRroXhLGBisuTEvdtTgazM=;
	b=ZxMyAktryu+1x5XXHSq69ai7DKCUlYXDUqkQJHYqNVZrhzBLxYrBV0DwgJdXB049aMDeXv
	qNNAPzcj6eKJHRFYLtOIGknDgHhx3r4oj716bzf4f4b7vrmxCzmTkw0JUU3furWGpCn+oi
	bPtEjFmw3izaNgDJWTrz/tGXxKERMOg=
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org,
	corbet@lwn.net
Cc: rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	arighi@nvidia.com,
	yphbchou0911@gmail.com,
	jpiecuch@google.com,
	ihor.solodrai@linux.dev,
	suzhidao@xiaomi.com,
	luoliang@kylinos.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 1/2] Documentation: sched_ext: fix events sysfs path and show_state example
Date: Tue, 11 Aug 2026 15:38:00 +0800
Message-ID: <20260811073801.342165-2-cui.tao@linux.dev>
In-Reply-To: <20260811073801.342165-1-cui.tao@linux.dev>
References: <20260811073801.342165-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Tao Cui <cuitao@kylinos.cn>

The events file is under the scheduler's sysfs kobject
(/sys/kernel/sched_ext/root/events for the root scheduler), not the
nonexistent "<scheduler-name>/events" path. Also add the missing "aborting"
line to the scx_show_state.py example.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 Documentation/scheduler/sched-ext.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index ad2fff3c0593..dd4853762426 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -93,13 +93,13 @@ scheduler has been loaded):
     # cat /sys/kernel/sched_ext/enable_seq
     1
 
-Each running scheduler also exposes a per-scheduler ``events`` file under
-``/sys/kernel/sched_ext/<scheduler-name>/events`` that tracks diagnostic
-counters. Each counter occupies one ``name value`` line:
+Each running scheduler exposes an ``events`` file under its sysfs kobject
+(``/sys/kernel/sched_ext/root/events`` for the root scheduler) that tracks
+diagnostic counters. Each counter occupies one ``name value`` line:
 
 .. code-block:: none
 
-    # cat /sys/kernel/sched_ext/simple/events
+    # cat /sys/kernel/sched_ext/root/events
     SCX_EV_SELECT_CPU_FALLBACK 0
     SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE 0
     SCX_EV_DISPATCH_KEEP_LAST 123
@@ -153,6 +153,7 @@ detailed information:
     switching_all : 1
     switched_all  : 1
     enable_state  : enabled (2)
+    aborting      : 0
     bypass_depth  : 0
     nr_rejected   : 0
     enable_seq    : 1
-- 
2.43.0

